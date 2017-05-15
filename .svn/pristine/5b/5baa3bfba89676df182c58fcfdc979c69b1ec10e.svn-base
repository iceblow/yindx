package com.dianxin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dianxin.common.CommonUtils;
import com.dianxin.common.Consts;
import com.dianxin.controller.api.ApiResult;
import com.dianxin.model.bo.User;
import com.dianxin.service.UserService;

@RequestMapping("/manage/")
@Controller
public class IndexController extends BaseController{
	
	@Resource
	private UserService userService;
	
	@RequestMapping("/")
	public String index(){
		return "common/login";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		int admin_id = CommonUtils.parseInt(String.valueOf(session.getAttribute(Consts.SESSION_LOGINID)), 0);
		if (admin_id != 0) {
			session.invalidate();
		}
		
		return "common/login";
	}
	//文件上传
	@RequestMapping("/imgupload")
	@ResponseBody
	public String uploadFile(@RequestParam(value="file", required=true)MultipartFile file, HttpServletRequest request) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		try {
			if (file != null) {
				String myFileName = file.getOriginalFilename();
				if (StringUtils.isNotBlank(myFileName)) {
					byte[] b = file.getBytes();
					String savePath = CommonUtils.getTimeFormat(new Date(), "yyyyMMdd");
					String path = CommonUtils.properties.getProperty("uploadFilePath")  + savePath;
					// 定义上传路径
					CommonUtils.checkPath(path);
					int index = myFileName.lastIndexOf(".");
					String extension = "";
					if (index > 0) {
						extension = myFileName.substring(index, myFileName.length());
					}
					String filename = CommonUtils.getTimeFormat(new Date(), "yyyyMMddhhmmssSSS") + "_"
							+ (int) (Math.random() * 100) + extension;
					OutputStream out = new FileOutputStream(path  + File.separator + filename);
					out.write(b);
					out.flush();
					out.close();
					result.put("code", "1");
					result.put("fileUrl", CommonUtils.properties.getProperty("fileRootUrl") + savePath + "/" + filename);
					return JSON.toJSONString(result);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("code", "0");
			return JSON.toJSONString(result);
		}
		result.put("code", "0");
		return JSON.toJSONString(result);
	}

	@RequestMapping("/login")
	@ResponseBody
	public String login(String loginid, String password,HttpSession session){
		
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
		session.setAttribute(Consts.SESSION_LOGINID, user.getId());
		session.setAttribute("username", user.getUsername());
		//加入扩展表
		userService.insertExpUser(user.getId());
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		result.put("user", user);

		return JSON.toJSONString(result);
	}
}
