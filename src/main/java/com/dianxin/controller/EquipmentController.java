package com.dianxin.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dianxin.common.CommonUtils;
import com.dianxin.common.Consts;
import com.dianxin.controller.api.ApiResult;
import com.dianxin.model.bo.Area;
import com.dianxin.model.bo.Category;
import com.dianxin.model.bo.Dept;
import com.dianxin.model.bo.Device;
import com.dianxin.model.bo.DeviceType;
import com.dianxin.model.bo.Template;
import com.dianxin.model.vo.DeviceVo;
import com.dianxin.model.vo.TemplateCateVo;
import com.dianxin.model.vo.TemplateSubCateVo;
import com.dianxin.service.DeviceService;
import com.dianxin.service.TemplateService;

@RequestMapping("/equipment")
@Controller
public class EquipmentController extends BaseController{
	
	@Resource
	private DeviceService deviceService;
	
	@Resource
	private TemplateService templateService;
	
	@RequestMapping("templateList")
	public ModelAndView templateList(HttpServletRequest request,Integer page, Integer page_size,String name,String typeid){
		ModelAndView mv = new ModelAndView();
		if (page == null || page == 0) {
			page = 1;
		}
		if (page_size == null) {
			page_size = 10;
		}
		int count = templateService.queryListCount(name,typeid);
		int total = (count + page_size - 1) / page_size;
		if (page > total) {
			page = total;
		}
		List<Template> list = templateService.queryList(page, page_size,name,typeid);
		mv.addObject("page", page);
		mv.addObject("total", total);
		mv.addObject("list", list);
		mv.addObject("name", name);
		mv.addObject("typeid", typeid);
		List<DeviceType> deviceList = commonService.selectAllDeviceType();
		mv.addObject("deviceList", deviceList); 
		mv.addAllObjects(CommonUtils.getAllParams(request));
		return mv;
	}
	
	@RequestMapping("editTemplate")
	public ModelAndView editTemplate(Integer template_id){
		ModelAndView mv = new ModelAndView();
		if(template_id!=null){
			Template template = templateService.getTemplate(template_id);
			if(template!=null){
				List<Category> categorylist = templateService.getTemplateCate(template_id);
				mv.addObject("calist", categorylist);
			}
			mv.addObject("template", template); 
		}
		List<DeviceType> deviceList = commonService.selectAllDeviceType();
		mv.addObject("deviceList", deviceList); 
		return mv;
	}
	
	@RequestMapping("equipment")
	public ModelAndView equipment(HttpServletRequest request,Integer page, Integer page_size,String name,String ss_id,String station_id,String typeid){
		ModelAndView mv = new ModelAndView();
		if (page == null || page == 0) {
			page = 1;
		}
		if (page_size == null) {
			page_size = 10;
		}
		int count = deviceService.queryListCount(name,ss_id,station_id,typeid);
		int total = (count + page_size - 1) / page_size;
		if (page > total) {
			page = total;
		}
		List<DeviceVo> list = deviceService.queryList(page, page_size,name,ss_id,station_id,typeid);
		mv.addObject("page", page);
		mv.addObject("total", total);
		mv.addObject("list", list);
		List<Dept> dList = commonService.selectDeptOne();
		mv.addObject("dList", dList); 
		List<DeviceType> deviceList = commonService.selectAllDeviceType();
		mv.addObject("deviceList", deviceList); 
		mv.addAllObjects(CommonUtils.getAllParams(request));
		mv.addAllObjects(CommonUtils.getAllParams(request));
		return mv;
	}
	
	
	@RequestMapping("editAquipment")
	public ModelAndView editAquipment(Integer device_id){
		ModelAndView mv = new ModelAndView();
		if(device_id!=null){
			Device device = deviceService.getDeviceById(device_id);
			mv.addObject("device", device);
		}
		List<Area> areaList = commonService.selectAllAreaList();
		mv.addObject("areaList", areaList); 
		List<DeviceType> deviceList = commonService.selectAllDeviceType();
		mv.addObject("deviceList", deviceList); 
		return mv;
	}
	
	@RequestMapping("saveTemplate")
	@ResponseBody
	public ApiResult saveTemplate(HttpSession session,String name,String topic,String typeid,String templateCate,Integer template_id){
		ApiResult result = new ApiResult();
		try{
			List<TemplateCateVo>  catelist = JSON.parseArray(templateCate, TemplateCateVo.class);
			Template template = new Template();
			if(template_id!=null){
				template = templateService.getTemplate(template_id);
			}
			template.setTypeid(typeid);
			template.setTopic(topic);
			template.setName(name);
			int userid = CommonUtils.parseInt(String.valueOf(session.getAttribute(Consts.SESSION_LOGINID)), 0);
			template.setUpdate_id(userid);
			template.setUpdatedate(new Date());
			if(template_id!=null){
				templateService.updateTemplate(template);
			}else{
				template.setCreatedate(new Date());
				template = templateService.insertTemplate(template);
			}
			for(TemplateCateVo cate:catelist){
				Integer categoryid ;
				if(cate.getId()!=null&&cate.getId()>0){
					if(CommonUtils.isEmptyString(cate.getPname())){
						templateService.delCategoryById(cate.getId());
					}else{
						templateService.updateCategory(cate.getId(), cate.getPname());
					}
					categoryid = cate.getId();
				}else{
					Category category = new Category();
					if(CommonUtils.isEmptyString(cate.getPname())){
						String cname = " ";
						category.setName(cname);
					}else{
						category.setName(cate.getPname());
					}
					category.setTemplate_id(template.getTemplate_id());
					category = templateService.insetFirCategory(category);
					categoryid = category.getCategory_id();
				}
				for(TemplateSubCateVo scate:cate.getSubcates()){
					if(scate.getId()!=null&&scate.getId()>0){
						if(CommonUtils.isEmptyString(scate.getName())){
							templateService.delCategoryById(scate.getId());
						}else{
							templateService.updateCategory(scate.getId(), scate.getName());
						}
					}else{
						if(CommonUtils.isEmptyString(scate.getName())){
							String sname = " ";
							templateService.insetSecCategory(template.getTemplate_id(), sname, categoryid);
						}else{
							templateService.insetSecCategory(template.getTemplate_id(), scate.getName(), categoryid);
						}
						
						
					}
					
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			result.setMessage("保存操作失败!");
			result.setCode(0);
			return result;
		}
		result.setCode(1);
		return result;
	}
	
	@RequestMapping("saveAquipment")
	@ResponseBody
	public ApiResult saveAquipment(HttpSession session,Integer device_id,String address,String longitude,String latitude,String name,String topic,String ss_id,String station_id,String typeid,String imgs){
		ApiResult result = new ApiResult();
		int userid = CommonUtils.parseInt(String.valueOf(session.getAttribute(Consts.SESSION_LOGINID)), 0);
		Device device = new Device();
		if(device_id!=null){
			device = deviceService.getDeviceById(device_id);
		}
		device.setAddress(address);
		device.setImgs(imgs);
		device.setTopic(topic);
		device.setCreatedate(new Date());
		device.setUpdate_id(userid);
		device.setUpdatedate(new Date());
		device.setStation_id(station_id);
		device.setSs_id(ss_id);
		device.setTypeid(typeid);
		device.setName(name);
		device.setLatitude(CommonUtils.parseDouble(latitude, 0));
		device.setLongitude(CommonUtils.parseDouble(longitude, 0));
		device.setStatus(Device.state_use);
		try{
			if(device_id!=null){
				deviceService.updateDevice(device);
			}else{
				deviceService.addDevice(device);
			}
		}catch(Exception e){
			result.setMessage("保存操作失败!");
			result.setCode(0);
			return result;
		}
		result.setCode(1);
		return result;
	}
	
	@RequestMapping("delTemplate")
	@ResponseBody
	public ApiResult delTemplate(Integer template_id){
		ApiResult result = new ApiResult();
		try{
			if(template_id!=null){
				templateService.delCategory(template_id);
				templateService.delTemplate(template_id);
			}
		}catch(Exception e){
			result.setMessage("保存操作失败!");
			result.setCode(0);
			return result;
		}
		result.setCode(1);
		return result;
	}
	
	@RequestMapping("delAquipment")
	@ResponseBody
	public ApiResult delAquipment(HttpSession session,Integer device_id){
		ApiResult result = new ApiResult();
		try{
			if(device_id!=null){
				deviceService.delDevice(device_id);
			}
		}catch(Exception e){
			result.setMessage("保存操作失败!");
			result.setCode(0);
			return result;
		}
		result.setCode(1);
		return result;
	}
}
