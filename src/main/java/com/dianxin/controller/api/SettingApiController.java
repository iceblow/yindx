package com.dianxin.controller.api;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.dianxin.model.bo.Help;
import com.dianxin.service.SettingService;

@RequestMapping("/api/setting")
@Controller
public class SettingApiController {

	@Resource
	private SettingService settingService;
	
	@RequestMapping("/feedback")
	@ResponseBody
	public String feedback(Integer user_id, String content){
		
		if (StringUtils.isBlank(content)) {
			return new ApiResult("反馈内容不能为空").toString();
		}
		
		int code = settingService.feedback(user_id, content);
		return new ApiResult(code).toString();
	}
	
	@RequestMapping("/help/list")
	@ResponseBody
	public String helpList(Integer page, Integer page_size){
		if (page == null || page < 1) {
			page = 1;
		}
		if (page_size == null || page_size.intValue() == 0)
			page_size = 10;
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		int total = settingService.selectHelpCount();
		result.put("total", total);
		
		if (page <= 1) {
			page = 1;
		}
		if (page_size.intValue() == 0)
			page_size = 10;
		
		result.put("page", page);

		List<Help> list = settingService.pageQueryHelp(page, page_size);
		result.put("help_list", list);
		
		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/help/detail")
	@ResponseBody
	public String helpDetail(Integer help_id){
		
		Help help = settingService.selectHelpDetail(help_id);
		if (help == null) {
			return new ApiResult("没有这条记录").toString();
		}
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		result.put("help", help);
		
		return JSON.toJSONString(result);
	}
}
