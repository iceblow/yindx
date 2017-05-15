package com.dianxin.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dianxin.model.bo.Setting;
import com.dianxin.service.SettingService;

@RequestMapping("/systemSetup")
@Controller
public class SystemController {
	@Resource
	private SettingService settingService;
	
	@RequestMapping("/time")
	public ModelAndView time(){
		ModelAndView mav = new ModelAndView();
		List<Setting> settings = settingService.selectSetting();
		for (Setting setting : settings) {
			mav.addObject(setting.getType(),setting.getSetting());
		}
		return mav;
	}
	@RequestMapping("/updateTime")
	public ModelAndView updateTime(Integer owner1,Integer owner2,Integer owner3,Integer route_time,Integer problem_time,Integer problem_solve){
		ModelAndView mav = new ModelAndView();
		settingService.updateSetting("OWNER1",owner1);
		settingService.updateSetting("OWNER2",owner2);
		settingService.updateSetting("OWNER3",owner3);
		settingService.updateSetting("ROUTE_TIME",route_time);
//		settingService.updateSetting("ROUTE_SOLVE",route_solve);
		settingService.updateSetting("PROBLEM_TIME",problem_time);
		settingService.updateSetting("PROBLEM_SOLVE",problem_solve);
		mav.setViewName("redirect:/systemSetup/time");
		return mav;
	}
	@RequestMapping("/integral")
	public ModelAndView integral(){
		ModelAndView mav = new ModelAndView();
		List<Setting> settings = settingService.selectSetting();
		for (Setting setting : settings) {
			mav.addObject(setting.getType(),setting.getSetting());
		}
		return mav;
	}
	@RequestMapping("/updateIntegral")
	public ModelAndView updateupdateIntegral(Integer find_problem,Integer solve_real,Integer solve_eaely,Integer solve_route,Integer solve_problem,
			Integer solve_check,Integer on_order,Integer over_order,Integer on_dispose,Integer over_dispose){
		ModelAndView mav = new ModelAndView();
		settingService.updateSetting("FIND_PROBLEM",find_problem);
		settingService.updateSetting("SOLVE_REAL",solve_real);
		settingService.updateSetting("SOLVE_EAELY",solve_eaely);
		settingService.updateSetting("SOLVE_ROUTE",solve_route);
		settingService.updateSetting("SOLVE_PROBLEM",solve_problem);
		settingService.updateSetting("SOLVE_CHECK",solve_check);
		settingService.updateSetting("ON_ORDER",on_order);
		settingService.updateSetting("OVER_ORDER",over_order);
		settingService.updateSetting("ON_DISPOSE",on_dispose);
		settingService.updateSetting("OVER_DISPOSE",over_dispose);
		mav.setViewName("redirect:/systemSetup/integral");
		return mav;
	}
	@RequestMapping("/password")
	public ModelAndView password(){
		ModelAndView mav = new ModelAndView();
		List<Setting> settings = settingService.selectSetting();
		for (Setting setting : settings) {
			mav.addObject(setting.getType(),setting.getSetting());
		}
		return mav;
	}
}
