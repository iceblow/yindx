package com.dianxin.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dianxin.common.CommonUtils;
import com.dianxin.common.Consts;
import com.dianxin.common.QueryResult;
import com.dianxin.controller.api.ApiResult;
import com.dianxin.model.bo.Area;
import com.dianxin.model.bo.Notice;
import com.dianxin.model.bo.Station;
import com.dianxin.model.vo.NoticeListVo;
import com.dianxin.model.vo.ProblemVo;
import com.dianxin.service.CheckService;
import com.dianxin.service.CommonService;
import com.dianxin.service.NoticeService;
import com.dianxin.service.ProblemService;
import com.dianxin.service.RouteService;
import com.dianxin.service.UserService;

@RequestMapping("/notice")
@Controller
public class NoteController {

	
	@Resource
	private NoticeService noticeService;
	
	public String checkVal(String val){
		if("请选择".equals(val)||"请输入".equals(val)){
			return "";
		}
		return val;
	}
	
	@RequestMapping("/lookList")
	public ModelAndView dangerList(String select, String start_date, String end_date,String type, Integer page){
		ModelAndView mav = new ModelAndView();
		select = checkVal(select);
		start_date = checkVal(start_date);
		end_date = checkVal(end_date);
		if(type==null||"请选择".equals(type)||"请输入".equals(type)){
			type = "0";
		}
		if("通知".equals(type)){
			type = "1";
		}
		if("学习".equals(type)){
			type = "2";
		}
		mav.addObject("select", select);
		mav.addObject("start_date", start_date);
		mav.addObject("end_date", end_date);
		mav.addObject("type", type);
		if (page == null || page <= 0) {
			page = 1;
		}
		mav.addObject("page", page);
		QueryResult<Notice> result = noticeService.selectNoticeBypage(select, start_date, end_date, type, page);
		int total=1;
		if(result.getTotal()>10){
			total=(int)result.getTotal()/10;
			if(result.getTotal()>total*10){
				total+=1;
			}
		}
		mav.addObject("total", total);
		mav.addObject("result", result);
		mav.setViewName("./notice/lookList") ;
		return mav;
	}
	
	@RequestMapping("/lookDetail")
	public ModelAndView lookDetail(HttpServletRequest req){
		String id = req.getParameter("id");
		ModelAndView mav = new ModelAndView();
		Notice n = noticeService.selectNoticeDetail(CommonUtils.parseInt(id, 0));
		mav.addObject("n", n);
		mav.setViewName("./notice/lookDetail") ;
		return mav;
	}
	
	@RequestMapping("/modifi")
	public ModelAndView modifi(HttpServletRequest req){
		String id = req.getParameter("id");
		ModelAndView mav = new ModelAndView();
		Notice n = noticeService.selectNoticeDetail(CommonUtils.parseInt(id, 0));
		mav.addObject("n", n);
		return mav;
	}
	
	@RequestMapping("/domodifi")
	@ResponseBody
	public ApiResult domodifi(HttpServletRequest request, HttpServletResponse response,Integer id,String title,Integer type,
			String content,String imgurl){
		ApiResult result = new ApiResult();
		try {
			Notice n = noticeService.selectNoticeDetail(id);
			n.setContent(content);
			n.setCreatedate(new Date());
			n.setPicurl(imgurl);
			n.setTitle(title);
			n.setType(type);
			int i = noticeService.modifi(n);
			
			if(i==1){
				result.setCode(1);
				result.setMessage("修改成功");
			}else{
				result.setCode(0);
				result.setMessage("修改失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.setCode(0);
			result.setMessage("修改失败");
		}
		
		
		return result;
	}
	
	
	@RequestMapping("/addnotice")
	public ModelAndView addnotice(HttpServletRequest req){
		String id = req.getParameter("id");
		ModelAndView mav = new ModelAndView();
		Notice n = noticeService.selectNoticeDetail(CommonUtils.parseInt(id, 0));
		mav.addObject("n", n);
		mav.setViewName("./notice/set") ;
		return mav;
	}
	
	
	@RequestMapping("/doaddnotice")
	@ResponseBody
	public ApiResult doaddnotice(HttpServletRequest request, HttpServletResponse response,String title,String type,
			String content,String imgurl){
		ApiResult result = new ApiResult();
		try {
			Integer holdId = (Integer)request.getSession().getAttribute(Consts.SESSION_LOGINID);
			String username = (String)request.getSession().getAttribute("username");
//			Integer holdId = 2;
//			String username = "编辑2";
			int i = noticeService.saveNotic(title,type,content,imgurl,holdId,username);
			
			if(i==1){
				result.setCode(1);
				result.setMessage("保存成功");
			}else{
				result.setCode(0);
				result.setMessage("保存失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.setCode(0);
			result.setMessage("保存失败");
		}
		
		
		return result;
	}
	
	@RequestMapping("/editaddnoticeimg")
	@ResponseBody
	public ApiResult editaddnoticeimg(HttpServletRequest request, HttpServletResponse response,String id,String img){
		ApiResult result = new ApiResult();
		try {
			int i = noticeService.editNoticePic(id, img);
			if(i==1){
				result.setCode(1);
				result.setMessage("修改成功");
			}else{
				result.setCode(0);
				result.setMessage("修改失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.setCode(0);
			result.setMessage("修改失败");
		}
		
		
		return result;
	}
	
	@RequestMapping("/settop")
	@ResponseBody
	public ApiResult settop(HttpServletRequest request, HttpServletResponse response,String id){
		ApiResult result = new ApiResult();
		try {
			int i = noticeService.updataNoticeSettop(CommonUtils.parseInt(id, 0), 1);
			if(i==1){
				result.setCode(1);
				result.setMessage("置顶成功");
			}else{
				result.setCode(0);
				result.setMessage("置顶失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.setCode(0);
			result.setMessage("置顶失败");
		}
		
		
		return result;
	}
	
	@RequestMapping("/deletetop")
	@ResponseBody
	public ApiResult deletetop(HttpServletRequest request, HttpServletResponse response,String id){
		ApiResult result = new ApiResult();
		try {
			int i = noticeService.updataNoticeSettop(CommonUtils.parseInt(id, 0), 0);
			if(i==1){
				result.setCode(1);
				result.setMessage("置顶成功");
			}else{
				result.setCode(0);
				result.setMessage("置顶失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.setCode(0);
			result.setMessage("置顶失败");
		}
		return result;
	}
	
	@RequestMapping("/delnotice")
	@ResponseBody
	public ApiResult delnotice(HttpServletRequest request, HttpServletResponse response,String id){
		ApiResult result = new ApiResult();
		try {
			int i = noticeService.deletenotice(CommonUtils.parseInt(id, 0));
			if(i==1){
				result.setCode(1);
				result.setMessage("置顶成功");
			}else{
				result.setCode(0);
				result.setMessage("置顶失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.setCode(0);
			result.setMessage("置顶失败");
		}
		return result;
	}
	
	@RequestMapping("/changestatus")
	@ResponseBody
	public ApiResult changestatus(HttpServletRequest request, HttpServletResponse response,Integer id,Integer status){
		ApiResult result = new ApiResult();
		try {
			int i = noticeService.updataNoticeStatus(id, status);
			if(i==1){
				result.setCode(1);
				result.setMessage("操作成功");
			}else{
				result.setCode(0);
				result.setMessage("操作失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.setCode(0);
			result.setMessage("操作失败");
		}
		return result;
	}
	
//	public ApiResult doaddnotice1(HttpServletRequest request, HttpServletResponse response,String title,String type,
//			String content,@RequestParam("filedata") CommonsMultipartFile... filedata){
//		ApiResult result = new ApiResult();
//		try {
//			CommonsMultipartFile file = filedata[0];
//			String url = noticeService.saveFile(file);
//			Integer holdId = (Integer)request.getSession().getAttribute("id");
//			String username = (String)request.getSession().getAttribute("username");
//			int i = noticeService.saveNotic(title,type,content,url,holdId,username);
//			
//			if(i==1){
//				result.setCode(1);
//				result.setMessage("保存成功");
//			}else{
//				result.setCode(0);
//				result.setMessage("保存失败");
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			result.setCode(0);
//			result.setMessage("保存失败");
//		}
//		
//		
//		return result;
//	}
}
