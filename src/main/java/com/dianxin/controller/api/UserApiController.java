package com.dianxin.controller.api;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.dianxin.common.CommonUtils;
import com.dianxin.model.bo.User;
import com.dianxin.model.vo.DistributionVo;
import com.dianxin.model.vo.HistoryVo;
import com.dianxin.model.vo.ScoreVo;
import com.dianxin.model.vo.StatisticsVo;
import com.dianxin.service.SettingService;
import com.dianxin.service.UserService;

@RequestMapping("/api/user")
@Controller
public class UserApiController {

	@Resource
	private UserService userService;
	
	@Resource
	private SettingService settingService;
	
	@RequestMapping("/login")
	@ResponseBody
	public String login(String loginid, String password){
		
		if (StringUtils.isBlank(loginid)) {
			return new ApiResult("请输入登录账号").toString();
		}
		if (StringUtils.isBlank(password)) {
			return new ApiResult("密码不能为空").toString();
		}
		
		User user = userService.getUserByLoginid(loginid);
		if (user == null) {
			return new ApiResult("账号不存在").toString();
		} else if (!password.equals(user.getPassword())) {
			return new ApiResult("登录密码不正确").toString();
		}
		
		//加入扩展表
		userService.insertExpUser(user.getId());
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		result.put("user", user);

		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/info")
	@ResponseBody
	public String userInfo(Integer user_id){
		
		User user = userService.getUserById(user_id);
		if (user == null) {
			return new ApiResult("该用户不存在").toString();
		}
		
		//加入扩展表
		userService.insertExpUser(user.getId());
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		result.put("user", user);

		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/updateAvatar")
	@ResponseBody
	public String updateAvatar(Integer user_id, String avatar){
		
		if (StringUtils.isBlank(avatar)) {
			return new ApiResult("请上传用户头像").toString();
		}

		User user = userService.getUserById(user_id);
		if (user == null) {
			return new ApiResult("账号不存在").toString();
		}

		int code = userService.updateUserAvatar(user_id, avatar);
		if (code == 1) {
			user.setAvatar(avatar);
		}
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", code + "");
		result.put("user", user);

		return JSON.toJSONString(result);
	}
	
	
	@RequestMapping("/updatePassword")
	@ResponseBody
	public String updatePassword(Integer user_id, String password_old, String password_new){
		User user = userService.getUserById(user_id);
		if (user == null) {
			return new ApiResult("账号不存在").toString();
		}  else if (!user.getPassword().equals(password_old)) {
			return new ApiResult("原密码输入不正确").toString();
		}
		
		int code = userService.updateUserPassword(user_id, password_new);
		return new ApiResult(code).toString();
	}

	@RequestMapping("/score/list")
	@ResponseBody
	public String userScoreList(Integer user_id, Integer page, Integer page_size){
		if (page == null || page < 1) {
			page = 1;
		}
		if (page_size == null || page_size.intValue() == 0)
			page_size = 10;
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		int total = settingService.selectUserScoreHistoryCount(user_id);
		result.put("total", total);
		
		if (page <= 1) {
			page = 1;
		}
		if (page_size.intValue() == 0)
			page_size = 10;
		
		result.put("page", page);

		List<ScoreVo> list = settingService.pageQueryUserScoreHistory(user_id, page, page_size);
		result.put("score_list", list);
		
		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/history/list")
	@ResponseBody
	public String userHistoryList(Integer user_id, Integer page, Integer page_size){
		if (page == null || page < 1) {
			page = 1;
		}
		if (page_size == null || page_size.intValue() == 0)
			page_size = 10;
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		int total = userService.selectUserHistoryCount(user_id);
		result.put("total", total);
		
		if (page <= 1) {
			page = 1;
		}
		if (page_size.intValue() == 0)
			page_size = 10;
		
		result.put("page", page);

		List<HistoryVo> list = userService.pageQueryUserHistory(user_id, page, page_size);
		result.put("alarm_list", list);
		
		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/statistics")
	@ResponseBody
	public String statistics(Integer user_id, String start_time, String end_time, Integer deptid){

		//时间处理
		Date time1 = CommonUtils.getDateFormat(start_time + " 00:00:00", "yyyy-MM-dd HH:mm:ss");
		Date time2 = CommonUtils.getDateFormat(end_time + " 23:59:59", "yyyy-MM-dd HH:mm:ss");
		if (time1 == null || time2== null)
			return new ApiResult("查询时间不正确").toString();
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");

		StatisticsVo statisticsVo = userService.statistics(user_id, deptid, time1, time2);
		result.put("statistics", statisticsVo);
		
		return JSON.toJSONString(result);
	}
	
	
	@RequestMapping("/distribution")
	@ResponseBody
	public String distribution(Integer user_id, Double longitude1, Double longitude2,
			Double latitude1, Double latitude2){

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");

		List<DistributionVo> list = userService.selectAlarmForMap(user_id, longitude1, longitude2, latitude1, latitude2);
		result.put("alarm_list", list);
		
		return JSON.toJSONString(result);
	}
	
}
