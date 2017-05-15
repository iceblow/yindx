package com.dianxin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.dianxin.common.CommonUtils;
import com.dianxin.common.Consts;
import com.dianxin.dao.CheckMapper;
import com.dianxin.dao.SettingMapper;
import com.dianxin.model.bo.Check;
import com.dianxin.model.bo.CheckFlow;
import com.dianxin.model.bo.CheckResult;
import com.dianxin.model.bo.Setting;

@Transactional(readOnly=true)
@Service
public class CheckService {

	@Resource
	private CheckMapper checkMapper;
	
	@Resource
	private SettingMapper settingMapper;
	
	//取所以的检查项目
	public List<Check> getCheckList() {
		List<Check> checkList = checkMapper.selectPList();
		if (checkList == null) return null;
		
		for (Check check:checkList) {
			List<Check> items = checkMapper.selectCheckByPid(check.getCheck_id());
			check.setItems(items);
		}
		return checkList;
	}
	
	@Transactional(readOnly=false)
	public Check insertCheck(String name, Integer pid) {
		Check check = new Check();
		check.setName(name);
		int code;
		if (pid == null || pid.intValue() == 0) {
			code = checkMapper.insertPCheck(check);
		} else {
			check.setPid(pid);
			code = checkMapper.insertCheckItem(check);
		}
		if (code == 0) return null;
		return check;
	}
	
	@Transactional(readOnly=false)
	public int handleCheck(Integer user_id, String result, String address, Double longitude, Double latitude) {
		
		CheckFlow checkFlow = new CheckFlow();
		checkFlow.setUser_id(user_id);
		checkFlow.setAddress(address);
		checkFlow.setLongitude(longitude);
		checkFlow.setLatitude(latitude);
		checkFlow.setScore(0);
		Setting setting = settingMapper.selectSettingByType(Consts.SETTING_SOLVE_CHECK);
		if (setting != null) {
			Integer score = setting.getSetting();
			if (score != null && score.intValue() != 0) {
				checkFlow.setScore(score);
				settingMapper.updateUserScore(user_id, score);
			}
		}
		int code = checkMapper.insertCheckFlow(checkFlow);
		
		List<CheckResult> checklist = JSON.parseArray(result, CheckResult.class);
		
		for (CheckResult check : checklist) {
			check.setCheck_flow_id(checkFlow.getCheck_flow_id());
			checkMapper.insertCheckResult(check);
		}

		return code;
	}
	@Transactional(readOnly=false)
	public void updateCheck(int id, String title) {
		checkMapper.updateCheck(id, title);
	}

	public List<CheckFlow> queryList(Integer page, Integer page_size,String bumen,String start,String end,String zhixing,List<Integer> ids,String area_id) {
		Integer startIndex =  (page - 1) * page_size + 1;
		Integer endIndex = startIndex + page_size - 1;
		List<CheckFlow> checkList = checkMapper.queryList(startIndex , endIndex,bumen,start,end,CommonUtils.parseInt(zhixing, 0),ids,area_id);
//		for (int i = 0; i < routeList.size(); i++) {
//			Route route = routeList.get(i);
//			
//			//处理流程
//			List<RouteFlow> flows = routeMapper.selectRouteFlow(route.getRoute_id());
//			if (flows != null && flows.size() > 0) {
//				
//				RouteFlow flow = flows.get(flows.size() - 1);
//				//未接单 11
//				if (route.getLaststep() == 11) {
//					Long time = flow.getCreatetime().getTime()/1000 - (new Date()).getTime()/1000 + route.getReceivetime() * 60;
//					route.setCountdown(time);
//				} else if (route.getLaststep() == 12) {
//					//未处理
//					Long time = flow.getCreatetime().getTime()/1000 - (new Date()).getTime()/1000 + route.getResolvetime() * 60;
//					route.setCountdown(time);
//				}
//			}
//		}
//		return routeList;
		return checkList;
	}

	public int queryListCount(String bumen,String start_date,String end_date,String zhixing,List<Integer> ids,String area_id) {
		return checkMapper.queryListCount(bumen,start_date,end_date,CommonUtils.parseInt(zhixing, 0),ids,area_id);
	}

	public CheckFlow selectCheckFlowById(Integer id) {
		return checkMapper.selectCheckFlowById(id);
	}

	public List<CheckResult> selectCheckResultByCheckFlowId(Integer id) {
		return checkMapper.selectCheckResultByCheckFlowId(id);
	}

	public Check selectCheckByCheckResultId(Integer check_id) {
		return checkMapper.selectCheckByCheckResultId(check_id);
	}
	public List<Check> selectCheckByPidId(Integer check_id) {
		return checkMapper.selectCheckByPidId(check_id);
	}
	
	public void delCheck(Integer check_id){
		checkMapper.deleteCheck(check_id);
	}

}
