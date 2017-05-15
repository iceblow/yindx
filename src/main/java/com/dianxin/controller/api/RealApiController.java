package com.dianxin.controller.api;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.dianxin.model.bo.Real;
import com.dianxin.model.bo.RealDetail;
import com.dianxin.service.RealService;

@RequestMapping("/api/real")
@Controller
public class RealApiController {

	@Resource
	private RealService realService;
	
	@RequestMapping("/list")
	@ResponseBody
	public String realList(Integer page, Integer page_size,  Integer user_id){
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		int total = realService.selectCountNotEnd(user_id);
		result.put("total", total);
		
		if (page== null || page <= 1) {
			page = 1;
		}
		if (page_size == null || page_size.intValue() == 0)
			page_size = 10;
		
		result.put("page", page);

		List<Real> list = realService.pageQueryNotEnd(page, page_size, user_id);
		result.put("real_list", list);
		
		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/detail")
	@ResponseBody
	public String realDetail(String aefid){
		
		RealDetail detail = realService.getRealDetail(aefid);
		if (detail == null) {
			return new ApiResult("没有这条实时告警记录").toString();
		}

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		result.put("real", detail);
		
		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/receive")
	@ResponseBody
	public String receiveReal(Integer user_id, String aefid) {
		return new ApiResult(1).toString();
	}
	
	@RequestMapping("/handle")
	@ResponseBody
	public String handleReal(Integer user_id, String aefid, String content, String imgs, String audio) {
		int code = realService.handleReal(aefid, user_id, content, imgs, audio);
		return new ApiResult(code).toString();
	}
}
