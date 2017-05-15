package com.dianxin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/manage/")
@Controller
public class ManagerController {

	@RequestMapping("/pandect/pandect")
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView();
		mv.addObject("", "");
		mv.setViewName("/pandect/pandect");
		return mv;
	}
}
