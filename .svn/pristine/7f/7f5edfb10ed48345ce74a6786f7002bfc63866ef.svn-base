package com.dianxin.controller.api;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.dianxin.model.bo.Notice;
import com.dianxin.model.vo.NoticeListVo;
import com.dianxin.service.EwRemindService;
import com.dianxin.service.NoticeService;
import com.dianxin.service.ProblemService;
import com.dianxin.service.RealService;
import com.dianxin.service.RouteService;

@RequestMapping("/api")
@Controller
public class NoticeApiController {

	@Resource
	private NoticeService noticeService;
	
	@Resource
	private ProblemService problemService;
	
	@Resource
	private EwRemindService ewRemindService;
	
	@Resource
	private RouteService routeService;

	@Resource
	private RealService realService;
	
	@RequestMapping("/home/banner")
	@ResponseBody
	public String homeBanner(){
		
		List<NoticeListVo> banner_list = noticeService.selectBannerList();
		List<NoticeListVo> tips_list = noticeService.selectTipsList();

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		if (banner_list != null && banner_list.size() > 0) {
			result.put("banner_list", banner_list);
		}
		if (tips_list != null && tips_list.size() > 0) {
			result.put("tips_list", tips_list);
		}

		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/home/statistics")
	@ResponseBody
	public String homeStatistics(Integer user_id){

		HashMap<String, Object> data= new HashMap<String, Object>();
		//实时
		int real = realService.selectCountNotEnd(user_id);
		data.put("real", real);
		
		//预警
		int ewremind = ewRemindService.selectTotal(user_id);
		data.put("early", ewremind);

		//巡检
		int route = routeService.selectCountNotEnd(user_id);
		data.put("route", route);
		
		//隐患
		int problem = problemService.selectCountNotEnd(user_id);
		data.put("problem", problem);

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		result.put("data", data);
		
		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/notice/list")
	@ResponseBody
	public String noticeList(Integer type, Integer page, Integer page_size){
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		int total = noticeService.selectTotal(type);
		result.put("total", total);
		
		if (page <= 1) {
			page = 1;
		}
		if (page_size.intValue() == 0)
			page_size = 10;
		
		result.put("page", page);

		List<NoticeListVo> list = noticeService.pageQuery(type, page, page_size);
		result.put("notice_list", list);
		
		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/notice/detail")
	@ResponseBody
	public String noticeDetail(Integer notice_id){
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		
		Notice notice = noticeService.selectNoticeDetail(notice_id);
		result.put("notice", notice);
		
		return JSON.toJSONString(result);
	}
}
