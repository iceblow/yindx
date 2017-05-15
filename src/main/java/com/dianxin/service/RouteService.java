package com.dianxin.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.dianxin.common.Consts;
import com.dianxin.dao.DeviceMapper;
import com.dianxin.dao.RouteMapper;
import com.dianxin.dao.SettingMapper;
import com.dianxin.dao.TemplateMapper;
import com.dianxin.dao.UserMapper;
import com.dianxin.model.bo.Category;
import com.dianxin.model.bo.DeviceType;
import com.dianxin.model.bo.Route;
import com.dianxin.model.bo.RouteCate;
import com.dianxin.model.bo.RouteCateCheck;
import com.dianxin.model.bo.RouteFlow;
import com.dianxin.model.bo.Setting;

@Transactional(readOnly=true)
@Service
public class RouteService {

	@Resource
	private RouteMapper routeMapper;
	
	@Resource
	private UserMapper userMapper;
	
	@Resource
	private SettingMapper settingMapper;
	
	@Resource
	private TemplateMapper templateMapper;
	
	@Resource
	private DeviceMapper deviceMapper;
	
	//添加巡检
	@Transactional(readOnly=false)
	public int addRoute(Integer user_id, Route route, List<Integer> categorys) {
		DeviceType deviceType =  deviceMapper.selectTypeById(route.getTypeid());
		if(deviceType!=null){
			route.setTypename(deviceType.getTypename());
		}else{
			route.setTypename("");
		}
		int code = routeMapper.insertRoute(route);
		if (code == 0) return 0;
		
		for (Integer category_id : categorys) {
			Category category = templateMapper.selectCategoryByCategoryId(category_id);
			if (category != null) {
				RouteCate cate = new RouteCate();
				cate.setRoute_id(route.getRoute_id());
				cate.setCategory_id(category_id);
				cate.setPid(category.getPid());
				
				routeMapper.insertRouteCate(cate);
			}
		}
		
		//巡检flow
		RouteFlow flow = new RouteFlow();
		flow.setRoute_id(route.getRoute_id());
		flow.setLaststep(route.getLaststep());
		flow.setHolderid(user_id);

		routeMapper.insertRouteFlow(flow);
		
		return code;
	}
	
	//取用户相关未完成的数量
	public int selectCountNotEnd(Integer user_id) {
		return routeMapper.selectCountNotEnd(user_id);	
	}
		
	public List<Route> pageQueryNotEnd(Integer page, Integer page_size, Integer user_id) {
		Integer startIndex =  (page - 1) * page_size + 1;
		Integer endIndex = startIndex + page_size - 1;
		List<Route> routeList = routeMapper.pageQueryNotEnd(startIndex , endIndex,  user_id);
		
		for (int i = 0; i < routeList.size(); i++) {
			Route route = routeList.get(i);
			
			//处理流程
			List<RouteFlow> flows = routeMapper.selectRouteFlow(route.getRoute_id());
			if (flows != null && flows.size() > 0) {
				
				RouteFlow flow = flows.get(flows.size() - 1);
				//未接单 11
				if (route.getLaststep() == 11) {
					Long time = flow.getCreatetime().getTime()/1000 - (new Date()).getTime()/1000 + route.getReceivetime() * 60;
					route.setCountdown(time);
				} else if (route.getLaststep() == 12) {
					//未处理
					Long time = flow.getCreatetime().getTime()/1000 - (new Date()).getTime()/1000 + route.getResolvetime() * 60;
					route.setCountdown(time);
				}
			}
		}
		
		return routeList;
	}
	
	public Route selectRouteById(Integer route_id) {
		Route route = routeMapper.selectRouteById(route_id);
		if (route == null) {
			return null;
		}
		
		//处理流程
		List<RouteFlow> flows = routeMapper.selectRouteFlow(route_id);
		if (flows != null && flows.size() > 0) {
			
			RouteFlow flow = flows.get(flows.size() - 1);
			if (route.getReceivetime() == null) {
				route.setReceivetime(1);
			}
			if (route.getResolvetime() == null) {
				route.setResolvetime(1);
			}
			//未接单 11
			if (route.getLaststep() == 11) {
				Long time = flow.getCreatetime().getTime()/1000 - (new Date()).getTime()/1000 + route.getReceivetime() * 60;
				route.setCountdown(time);
			} else if (route.getLaststep() == 12) {
				//未处理
				Long time = flow.getCreatetime().getTime()/1000 - (new Date()).getTime()/1000 + route.getResolvetime() * 60;
				route.setCountdown(time);
			}
			
			route.setRouteFlowList(flows);
		}
		
		//巡检分类
		List<RouteCate> routeCateList = routeMapper.selectRouteCate(route_id);
		route.setRouteCateList(routeCateList);

		return route;
	}
	
	//添加巡检
	@Transactional(readOnly=false)
	public int renewRoute(Route route) {
		Integer route_id = route.getRoute_id();
		route.setLaststep(11);
		route.setReceivestart(new Date());

		int code = routeMapper.insertRoute(route);
		if (code == 0) return 0;

		//巡检分类
		List<RouteCate> routeCateList = routeMapper.selectRouteCate(route_id);
		route.setRouteCateList(routeCateList);

		for (RouteCate cate : routeCateList) {
				cate.setRoute_id(route.getRoute_id());				
				routeMapper.insertRouteCate(cate);
		}
		
		routeMapper.updateRouteRenew(route_id);
		
		return code;
	}
	
	@Transactional(readOnly=false)
	public int handleRoute(Integer user_id, Integer route_id, Integer type, String handle){
		
		//12-接单 13-处理
		RouteFlow routeFlow = new RouteFlow();
		routeFlow.setRoute_id(route_id);
		routeFlow.setHolderid(user_id);
		routeFlow.setLaststep(type);
		routeFlow.setScore(0);
		//分数 处理
		if (type == Consts.ROUTE_COMPLETE) {
			Setting setting = settingMapper.selectSettingByType(Consts.SETTING_SOLVE_ROUTE);
			if (setting != null) {
				Integer score = setting.getSetting();
				if (score != null && score.intValue() != 0) {
					routeFlow.setScore(setting.getSetting());
					settingMapper.updateUserScore(user_id, score);
				}
			}
		}

		routeMapper.updateRouteStep(route_id, type);
		
		int code = routeMapper.addRouteFlow(routeFlow);
		//处理结果
		if (type == Consts.ROUTE_COMPLETE) {
			List<RouteCateCheck> checklist = JSON.parseArray(handle, RouteCateCheck.class);
			
			for (RouteCateCheck check : checklist) {
				check.setRoute_flow_id(routeFlow.getRoute_flow_id());
				Category ca = templateMapper.selectCategoryByCategoryId(check.getCategory_id());
				if(ca!=null){
					check.setPid(ca.getPid());
				}
				int co = routeMapper.addRouteCheck(check);
			}
		}
		
		return code;
	}
	
	//告警发布页面数量
		public int queryPublicListCount(String daqu, String xiaoqu, String people, String frequency,String start,String end) {
			return routeMapper.queryPublicListCount(daqu,xiaoqu,people,frequency,start,end);	
		}
		
		public List<Route> queryPublicList(Integer page, Integer page_size, String daqu, String xiaoqu, String people, String frequency,String start,String end) {
			Integer startIndex =  (page - 1) * page_size + 1;
			Integer endIndex = startIndex + page_size - 1;
			List<Route> routeList = routeMapper.queryPublicList(startIndex , endIndex,daqu,xiaoqu,people,frequency,start,end);
			for (int i = 0; i < routeList.size(); i++) {
				Route route = routeList.get(i);
				
				//处理流程
				List<RouteFlow> flows = routeMapper.selectRouteFlow(route.getRoute_id());
				if (flows != null && flows.size() > 0) {
					
					RouteFlow flow = flows.get(flows.size() - 1);
					//未接单 11
					if (route.getLaststep() == 11) {
						Long time = flow.getCreatetime().getTime()/1000 - (new Date()).getTime()/1000 + route.getReceivetime() * 60;
						route.setCountdown(time);
					} else if (route.getLaststep() == 12) {
						//未处理
						Long time = flow.getCreatetime().getTime()/1000 - (new Date()).getTime()/1000 + route.getResolvetime() * 60;
						route.setCountdown(time);
					}
				}
			}
			return routeList;
		}

	
	//取用户相关未完成的数量
		public int queryListCount(Integer daqu, Integer xiaoqu, Integer people, Integer state,Integer frequency,String start,String end) {
			return routeMapper.queryListCount(daqu,xiaoqu,people,state,frequency,start,end);	
		}
		
		public List<Route> queryList(Integer page, Integer page_size, Integer daqu, Integer xiaoqu, Integer people, Integer state,Integer frequency,String start,String end) {
			Integer startIndex =  (page - 1) * page_size + 1;
			Integer endIndex = startIndex + page_size - 1;
			List<Route> routeList = routeMapper.queryList(startIndex , endIndex,daqu,xiaoqu,people,state,frequency,start,end);
			return routeList;
		}

		public List<RouteFlow> selectRouteFlow(Integer id) {
			return routeMapper.selectRouteFlow(id);
		}

		public List<RouteCateCheck> selectRouteCateCheckByFlowId(Integer id) {
			List<RouteCateCheck> list = routeMapper.selectRouteCateCheckByFlowId(id);
			if (list == null) return null;
			for (RouteCateCheck r : list) {
				Category category = templateMapper.selectCategoryByCategoryId(r.getPid());
				if(category != null ){
					r.setName(category.getName());
				}
				if(r.getStatus() == 0){
					r.setState("未处理");
				}else if(r.getStatus() == 1){
					r.setState("正常");
				}else if(r.getStatus() == 2){
					r.setState("隐患");
				}
				Category child = templateMapper.selectCategoryByCategoryId(r.getCategory_id());
				if(child != null ){
					r.setChildName(child.getName());
				}
//				List<RouteCateCheck> items =  routeMapper.selectRouteCateCheckByPid(r.getRoute_check_id());
//				for (RouteCateCheck routeCateCheck : items) {
//					Category categoryTo = templateMapper.selectCategoryByCategoryId(routeCateCheck.getCategory_id());
//					routeCateCheck.setName(categoryTo.getName());
//					if(routeCateCheck.getStatus() == 0){
//						routeCateCheck.setState("未处理");
//					}else if(routeCateCheck.getStatus() == 1){
//						routeCateCheck.setState("正常");
//					}else if(routeCateCheck.getStatus() == 2){
//						routeCateCheck.setState("隐患");
//					}
//				}
//				r.setItem(items);
			}
			
			return list;
		}
		
		//频次查找
		public List<Route> selectRenewRoute() {
			return routeMapper.selectRenewRoute();
		}
}
