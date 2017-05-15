package com.dianxin.controller.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.dianxin.model.bo.Route;
import com.dianxin.model.bo.RouteCateCheck;
import com.dianxin.model.bo.RouteFlow;
import com.dianxin.model.bo.User;
import com.dianxin.service.RouteService;
import com.dianxin.service.UserService;

@RequestMapping("/api/route")
@Controller
public class RouteApiController {
	
	@Resource
	private RouteService routeService;
	
	@Resource
	private UserService userService;
	
	@RequestMapping("/list")
	@ResponseBody
	public String routeList(Integer page, Integer page_size,  Integer user_id){
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		int total = routeService.selectCountNotEnd(user_id);
		result.put("total", total);
		
		if (page <= 1) {
			page = 1;
		}
		if (page_size.intValue() == 0)
			page_size = 10;
		
		result.put("page", page);

		List<Route> list = routeService.pageQueryNotEnd(page, page_size, user_id);
		result.put("route_list", list);
		
		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/detail")
	@ResponseBody
	public String routeDetail(Integer route_id){
		
		Route route = routeService.selectRouteById(route_id);
		if (route == null) {
			return new ApiResult("没有这条巡检记录").toString();
		}
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		result.put("route", route);

		List<RouteCateCheck> routeList = new ArrayList<RouteCateCheck>();
		List<RouteFlow> list = routeService.selectRouteFlow(route_id);
		for (RouteFlow flow : list) {
			User user = userService.getUserById(flow.getHolderid());
			if (user != null) {
				flow.setUsername(user.getUsername());
				flow.setDeptname(user.getDeptname());
			}
			List<RouteCateCheck> r = routeService.selectRouteCateCheckByFlowId(flow.getRoute_flow_id());
			routeList.addAll(r);
		}
		result.put("routeCheckList", routeList);
		result.put("flowList", list);
		
		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/handle")
	@ResponseBody
	public String handleRoute(Integer user_id, Integer route_id, Integer type, String handle){
		//12-接单,13处理
		Route route = routeService.selectRouteById(route_id);
		if (route == null) {
			return new ApiResult("没有这条巡检记录").toString();
		}
		int code = routeService.handleRoute(user_id, route_id, type, handle);
	
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", code + "");
		result.put("route", route);
		
		return JSON.toJSONString(result);
	}
}
