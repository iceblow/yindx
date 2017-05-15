package com.dianxin.controller.api;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.dianxin.model.bo.EwDevice;
import com.dianxin.model.bo.Floor;
import com.dianxin.service.EwRemindService;

@RequestMapping("/api/ewremind")
@Controller
public class EwRemindApiController {

	@Resource
	private EwRemindService ewRemindService;
	
	@RequestMapping("/list")
	@ResponseBody
	public String ewRemindList(Integer user_id, Integer page, Integer page_size){
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		int total = ewRemindService.selectTotal(user_id);
		result.put("total", total);
		
		if (page <= 1) {
			page = 1;
		}
		if (page_size.intValue() == 0)
			page_size = 10;
		
		result.put("page", page);

		List<EwDevice> list = ewRemindService.pageQuery(user_id, page, page_size);
		result.put("remind_list", list);
		
		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/detail")
	@ResponseBody
	public String ewRemindDetail(int type, String uuid){
		Floor floor = ewRemindService.selectFloorByUUID(type, uuid);
		if (floor == null) {
			return new ApiResult("没有楼层定位信息").toString();
		}
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		result.put("floor", floor);
		
		return JSON.toJSONString(result);
	}
}
