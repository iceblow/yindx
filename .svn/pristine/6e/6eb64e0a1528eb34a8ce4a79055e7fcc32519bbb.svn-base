package com.dianxin.controller.api;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dianxin.model.bo.Check;
import com.dianxin.model.bo.CheckFlow;
import com.dianxin.model.bo.CheckResult;
import com.dianxin.service.CheckService;

@RequestMapping("/api/check")
@Controller
public class CheckApiController {
	
	@Resource
	private CheckService checkService;
	
	@RequestMapping("/list")
	@ResponseBody
	public String getCheckList(){
		List<Check> list = checkService.getCheckList();
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		result.put("check_list", list);

		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/handle")
	@ResponseBody
	public String handleCheck(Integer user_id, String result, String address, Double longitude, Double latitude){
		int code = checkService.handleCheck(user_id, result, address, longitude, latitude);
		return new ApiResult(code).toString();
	}
	
	@RequestMapping("/checkDetail")
	@ResponseBody
	public String checkDetail(Integer check_flow_id){
		List<Check> list = checkService.getCheckList();

		CheckFlow checkFlow = checkService.selectCheckFlowById(check_flow_id);
		List<CheckResult> checkResults = checkService.selectCheckResultByCheckFlowId(check_flow_id);
		for (CheckResult c : checkResults) {
			if(c.getCheck_id() != null){
				Check check = checkService.selectCheckByCheckResultId(c.getCheck_id());
				if(check != null){
					c.setCheck(check);
				}
			}
		}

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		result.put("checkFlow", checkFlow);
		result.put("checkResults", checkResults);
		result.put("check_list", list);

		return JSON.toJSONString(result);
	}
}
