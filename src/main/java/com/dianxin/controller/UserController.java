package com.dianxin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.weaver.NewMemberClassTypeMunger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dianxin.common.CommonUtils;
import com.dianxin.common.PositionUtil;
import com.dianxin.model.bo.Area;
import com.dianxin.model.bo.Dept;
import com.dianxin.model.bo.StationCheck;
import com.dianxin.model.bo.StationRange;
import com.dianxin.model.bo.User;
import com.dianxin.model.vo.Gps;
import com.dianxin.model.vo.StationRangeVo;
import com.dianxin.service.CommonService;
import com.dianxin.service.UserService;
import com.sun.media.sound.ModelDestination;

@RequestMapping("/user")
@Controller
public class UserController {
	
	@Resource
	private UserService userService;
	
	@Resource
	private CommonService commonService;

	@RequestMapping("/userArea")
	public ModelAndView userArea(String area_id, String xiaoqu){
		ModelAndView mav = new ModelAndView();
		double plon = 120.15;
		double plat = 30.25;
		if (!CommonUtils.isEmptyString(xiaoqu)) {
			StationRangeVo vo = userService.getStationRangeVo(xiaoqu);
			if (vo != null && vo.getStation_name() != null) {
				for (StationRange range : vo.getRangeList()) {
					Gps gps = PositionUtil.gps84_To_Gcj02(range.getY(), range.getX());
					Gps bdgps = PositionUtil.gcj02_To_Bd09(gps.getWgLat(), gps.getWgLon());
					range.setLatitude(bdgps.getWgLat());
					range.setLongitude(bdgps.getWgLon());
				}
				plon = (vo.getMaxlon() + vo.getMinlon())/2;
				plat = (vo.getMaxlat() + vo.getMinlat())/2;
			}
			List<User> userList = userService.selectAllUser();
			mav.addObject("range", vo);
			mav.addObject("userList", userList);
			mav.addObject("area_id", area_id);
			mav.addObject("xiaoqu", xiaoqu);
		}
		List<Dept> areaList = commonService.selectDeptOne();
		mav.addObject("areaList", areaList);
		mav.addObject("plon", plon);
		mav.addObject("plat", plat);
		return mav;
	}
	
	@RequestMapping("/getStationCheck")
	@ResponseBody
	public String getStationCheck(String station_id){
		List<StationCheck> list = userService.selectByStationId(station_id);
		return JSON.toJSONString(list);
	}
	
	@RequestMapping("/saveStationCheck")
	@ResponseBody
	public String saveStationCheck(String station_id, String station_name, String user_id1, String user_name1
			, String user_id2, String user_name2, String user_id3, String user_name3){
		Map<String, Object> map = new HashMap<String, Object>();
		StationCheck check1 = userService.selectByStationIdAndSeq(station_id, "1");
		if (user_id1 != null && user_id1.length() > 0) {
			if (check1 == null) {
				check1 = new StationCheck();
				check1.setStation_id(station_id);
				check1.setStation_name(station_name);
				check1.setUser_id(user_id1);
				check1.setUser_name(user_name1);
				check1.setSeq("1");
				userService.insertStationCheck(check1);
			} else {
				check1.setUser_id(user_id1);
				check1.setUser_name(user_name1);
				userService.updateStationCheck(check1);
			}
		} else {
			if (check1 != null) {
				userService.deleteStationCheck(check1.getStation_id());
			}
		}
		
		StationCheck check2 = userService.selectByStationIdAndSeq(station_id, "2");
		if (user_id2 != null && user_id2.length() > 0) {
			if (check2 == null) {
				check2 = new StationCheck();
				check2.setStation_id(station_id);
				check2.setStation_name(station_name);
				check2.setUser_id(user_id2);
				check2.setUser_name(user_name2);
				check2.setSeq("2");
				userService.insertStationCheck(check2);
			} else {
				check2.setUser_id(user_id2);
				check2.setUser_name(user_name2);
				userService.updateStationCheck(check2);
			}
		} else {
			if (check2 != null) {
				userService.deleteStationCheck(check2.getStation_id());
			}
		}
		
		StationCheck check3 = userService.selectByStationIdAndSeq(station_id, "3");
		if (user_id3 != null && user_id3.length() > 0) {
			if (check3 == null) {
				check3 = new StationCheck();
				check3.setStation_id(station_id);
				check3.setStation_name(station_name);
				check3.setUser_id(user_id3);
				check3.setUser_name(user_name3);
				check3.setSeq("1");
				userService.insertStationCheck(check3);
			} else {
				check3.setUser_id(user_id3);
				check3.setUser_name(user_name3);
				userService.updateStationCheck(check3);
			}
		} else {
			if (check3 != null) {
				userService.deleteStationCheck(check3.getStation_id());
			}
		}
		
		map.put("code", 1);
		map.put("message", "保存成功");
		return JSON.toJSONString(map);
	}
	
	@RequestMapping("/userList")
	@ResponseBody
	public ModelAndView getUserList(HttpServletRequest request,Integer page, Integer page_size,String username,String mobile) {
		ModelAndView mav = new ModelAndView(); 
		if (page == null || page == 0) {
			page = 1;
		}
		if (page_size == null) {
			page_size = 10;
		}
		List<User> list = userService.findUserList(page, page_size,username,mobile);
		mav.addObject("list", list);
		mav.addObject("page", page);
		mav.addObject("page_size", page_size);
		return mav;
	}
	
	@RequestMapping("/userUpdate")
	@ResponseBody
	public ModelAndView userUpdate(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String stringid = request.getParameter("id");
		if(stringid != null && !stringid.equals("")) {
			Integer id = Integer.parseInt(stringid);
			User user = userService.getUserById(id);
			User u= userService.findGroupname(user.getViewgroupid());
			mav.addObject("user", user);
			mav.addObject("u", u);
		}
		return mav;
	}
	
	public String doUpdate(User user) {
		Map<String, Object> map = new HashMap<String, Object>();
		userService.updateUser(user);
		map.put("code", 1);
		map.put("message", "保存成功");
		return  JSON.toJSONString(map);
	}
	
	
	
	
}
