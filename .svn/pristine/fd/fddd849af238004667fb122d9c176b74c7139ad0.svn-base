package com.dianxin.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.dianxin.model.bo.Seller;
import com.dianxin.service.BaseService;
import com.dianxin.service.CommonService;


@Controller
public class BaseController {

	@Resource
	 BaseService baseService;
	
	@Resource
	CommonService commonService;

	@RequestMapping("/test")
	@ResponseBody
	public String test(){
		Seller seller = baseService.testQuery();
		return JSON.toJSONString(seller);
	}
		
}



