package com.dianxin.controller.api;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.dianxin.common.CommonUtils;
import com.dianxin.common.Consts;
import com.dianxin.model.bo.Area;
import com.dianxin.model.bo.Category;
import com.dianxin.model.bo.Dept;
import com.dianxin.model.bo.Station;
import com.dianxin.model.bo.StationRange;
import com.dianxin.model.bo.User;
import com.dianxin.service.CommonService;
import com.dianxin.service.TemplateService;
import com.dianxin.service.UserService;

@RequestMapping("/api/common")
@Controller
public class CommonApiController {
	
	@Resource
	private CommonService commonService;

	@Resource
	private UserService userService;
	
	@Resource
	private TemplateService templateService;
	

	
	@RequestMapping("/getTemplateCate")
	@ResponseBody
	public String getTemplateCate(){
	
		List<Category> list = templateService.getTemplateCate(1);
		
		return JSON.toJSONString(list);
	}
	
	@RequestMapping("/getArea")
	@ResponseBody
	public String getArea(Integer user_id){
		List<Area> list = commonService.getAreaList(user_id);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		result.put("area_list", list);

		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/getStation")
	@ResponseBody
	public String getStation(Integer user_id, String  area_id){
		List<Station> list = commonService.getStationList(user_id, area_id);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		result.put("station_list", list);

		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/getExecutor")
	@ResponseBody
	public String getExecutor(Integer user_id, String  station_id){
		List<User> list = userService.getUserForStation(station_id);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		result.put("user_list", list);
		
		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/getDept")
	@ResponseBody
	public String getDept(){
		List<Dept> list = commonService.selectDeptList();
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		result.put("dept_list", list);

		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/getDept1")
	@ResponseBody
	public String getDept1(){
		List<Dept> list = commonService.selectDept1();

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		result.put("dept_list", list);

		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/getDept2")
	@ResponseBody
	public String getDept2(Integer deptid){
		List<Dept> list = commonService.selectDept2(deptid);

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		result.put("dept_list", list);

		return JSON.toJSONString(result);
	}
	
//	public Dept getUserDept(Integer userid){
//		return deptMapper.selectUserDept(userid);
//	}
//	
//	public List<Dept> getChildDept(Integer deptid){
//		return deptMapper.getChildDept(deptid);
//	}
	
	@RequestMapping("/getStationByGps")
	@ResponseBody
	public String getStationByGps(Double longitude, Double latitude){

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		
		List<Station> stations = commonService.selectStationRangeStaion();
		
		for (Station station : stations) {
			List<StationRange> ranges = commonService.selectStationRangeList(station.getStation_id());
			
			boolean ret = CommonUtils.isPtInPoly(ranges, longitude, latitude);
			
			if (ret) {
				result.put("station", station);
				break;
			}
		}

		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/getDeptUser")
	@ResponseBody
	public String getDeptUser(Integer deptid){
		List<User> list = userService.getUserByDept(deptid);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		result.put("user_list", list);

		return JSON.toJSONString(result);
	}
	
	//文件上传
	@RequestMapping("/upload")
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
}
