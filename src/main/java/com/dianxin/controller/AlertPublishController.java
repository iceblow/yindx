package com.dianxin.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.dianxin.model.bo.Check;
import com.dianxin.model.bo.Dept;
import com.dianxin.model.bo.DeviceType;
import com.dianxin.model.bo.ProblemFlow;
import com.dianxin.model.bo.Route;
import com.dianxin.model.bo.RouteCateCheck;
import com.dianxin.model.bo.RouteFlow;
import com.dianxin.model.bo.Station;
import com.dianxin.model.bo.Template;
import com.dianxin.model.bo.User;
import com.dianxin.model.vo.ProblemVo;
import com.dianxin.service.CheckService;
import com.dianxin.service.CommonService;
import com.dianxin.service.ProblemService;
import com.dianxin.service.RouteService;
import com.dianxin.service.TemplateService;
import com.dianxin.service.UserService;

@RequestMapping("/alertPublish")
@Controller
public class AlertPublishController {

	@Resource
	private ProblemService problemService;
	
	@Resource
	private CommonService commonService;
	
	@Resource
	private UserService userService;
	
	@Resource
	private CheckService checkService;
	
	@Resource
	private RouteService routeService;
	
	@Resource
	private TemplateService templateService;
	
	@Resource
	private RouteService routeServicce;
	
	@RequestMapping("/reviewList")
	public ModelAndView reviewList(Integer page, Integer page_size, String area_id, String station_id, Integer user_id, String start_date, String end_date, String laststep){
		ModelAndView mav = new ModelAndView();
		if (page == null || page == 0) {
			page = 1;
		}
		if (page_size == null) {
			page_size = 10;
		}
		Integer step = CommonUtils.parseInt(laststep, 0);
		if (step == 0) {
			step = null;
		}
		if ("请选择".equals(start_date)) {
			start_date = null;
		}
		if ("请选择".equals(end_date)) {
			end_date = null;
		}
		int count = problemService.getPageReviewListCount(area_id, station_id, user_id, start_date, end_date, step);
		int total = (count + page_size - 1) / page_size;
		if (page > total) {
			page = total;
		}
		List<ProblemVo> list = problemService.pageReviewList(page, page_size, area_id, station_id, user_id, start_date, end_date, step);
		//List<Area> areaList = commonService.selectAllAreaList();
		List<Dept> dList = commonService.selectDeptOne();
		mav.addObject("page", page);
		mav.addObject("total", total);
		mav.addObject("list", list);
		mav.addObject("dList", dList);
		mav.addObject("laststep", laststep);
		mav.addObject("start_date", start_date);
		mav.addObject("end_date", end_date);
		return mav;
	}
	
	@RequestMapping("/reviewDetail")
	public ModelAndView reviewDetail(Integer id){
		ModelAndView mav = new ModelAndView();
		ProblemVo problem = problemService.selectProblemById(id);
		if (problem.getAudio() != null && problem.getAudio().indexOf(".") == -1) {
			problem.setAudio(null);
		}
		List<ProblemFlow> list = problemService.selectProblemFlow(id);
//		for (ProblemFlow flow : list) {
//			User user = userService.getUserById(flow.getHolderid());
//			if (user != null) {
//				flow.setUsername(user.getUsername());
//			}
//		}
		List<Dept> areaList = commonService.selectDeptOne();
		mav.addObject("problem", problem);
		mav.addObject("list", list);
		mav.addObject("areaList", areaList);
		return mav;
	}
	
	@RequestMapping("/review")
	@ResponseBody
	public String review(Integer id, String content, Integer status, Integer person, String receivetime, String resolvetime, Integer handletime){
		Map<String, Object> map = new HashMap<String, Object>();
		ProblemVo problem = problemService.selectProblemById(id);
		if (problem == null) {
			map.put("code", 0);
			return JSON.toJSONString(map);
		}
		Integer type;
		if (status == 0) {
			if (problem.getLaststep() == 10) {
				type = 13;
			} else if (problem.getLaststep() == 14) {
				type = 142;
			} else {
				type = 152;
			}
		}else{
			if (problem.getLaststep() == 10) {
				type = 12;
			} else if (problem.getLaststep() == 14) {
				type = 141;
			} else {
				type = 151;
			}
		}
		Integer receiveTime = null;
		Integer resolveTime = null;
		if( !CommonUtils.isEmptyString(receivetime)){
			receiveTime = CommonUtils.parseInt(receivetime, 0);
			resolveTime = CommonUtils.parseInt(resolvetime, 1);
		}
		
//		if (type == 12) {
//			//审核通过
//			//receivetime 必须
//			//resolvetime 必须
//			//person 必须
//			
//			
//		} else if (type == 13) {
//			//审核不通过
//			
//			
//			
//		} else if (type == 121) {
//			//接单
//			
//			
//		} else if (type == 141) {
//			
//		} else if (type == 151) {
//			//打回审核通过
//			//receivetime 必须
//			//person 必须
//			
//		}

		
		problemService.handleProblem(person, id, type, person, receiveTime, resolveTime, null, null, null, content, handletime);
		map.put("code", 1);
		return JSON.toJSONString(map);
	}
	
	@RequestMapping("/adddanger")
	@ResponseBody
	public String addProblem(String latitude,String longitude,String title, String address, String topic, String receivetime, String resolvetime, Integer owner_id, HttpSession session, String pic_file, String pic_audio){	
		ProblemVo problemVo = new ProblemVo();
		problemVo.setTitle(title);
		problemVo.setAddress(address);
		problemVo.setLatitude(CommonUtils.parseDouble(latitude, 0.0));
		problemVo.setLongitude(CommonUtils.parseDouble(longitude, 0.0));
		problemVo.setTopic(topic);
		problemVo.setOwner_id(owner_id);
		problemVo.setReceivetime(CommonUtils.parseInt(receivetime, 0));
		problemVo.setResolvetime(CommonUtils.parseInt(resolvetime, 0));
		problemVo.setImgs(pic_file);
		if (pic_audio.indexOf(".") == -1) {
			pic_audio = null;
		}
		problemVo.setAudio(pic_audio);
		Integer user_id = (Integer) session.getAttribute(Consts.SESSION_LOGINID);
		if (user_id == null) {
			user_id = 0;
		}
		Map<String, Object> map =  problemService.addHouTaiProblem(user_id, problemVo);
		
		int code = (Integer) map.get("code");
		if (code == 1) {
			map.put("message", "新增成功");
		}
		return JSON.toJSONString(map);
	}
	
	@RequestMapping("/danger")
	public ModelAndView dager () {
		ModelAndView mav = new ModelAndView();
		List<Dept> areaList = commonService.selectDeptOne();
		mav.addObject("areaList", areaList);
		return mav;
	}
	
	@RequestMapping("/getDept2")
	@ResponseBody
	public String getDept2 (String id) {
		if("all".equals(id)){
			List<Dept> areaList = commonService.selectAllDept2();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", areaList);
			return JSON.toJSONString(map);
		}
		List<Dept> areaList = commonService.selectDept2(CommonUtils.parseInt(id, 0));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", areaList);
		return JSON.toJSONString(map);
	}
	
	@RequestMapping("/getUser")
	@ResponseBody
	public String getUser (String deptid) {
		if("all".equals(deptid)){
			List<User> areaList = commonService.getAllUser();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("user_list", areaList);
			return JSON.toJSONString(map);
		}
		List<User> areaList = commonService.getUserBydeptid(CommonUtils.parseInt(deptid, 0));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_list", areaList);
		return JSON.toJSONString(map);
	}
	
	/**
	 * 隐患列表
	 * @param page
	 * @param page_size
	 * @param area_id
	 * @param station_id
	 * @param user_id
	 * @param start_date
	 * @param end_date
	 * @param step
	 * @param state 改成 frequency 频次
	 * @return
	 */
	@RequestMapping("/inspectionList")
	public ModelAndView inspectionList(HttpServletRequest request,Integer page, Integer page_size, String start_date, String end_date,Integer daqu,
			Integer xiaoqu,Integer shebei,Integer state,Integer frequency,HttpSession session){
		ModelAndView mav = new ModelAndView();
		if (page == null || page == 0) {
			page = 1;
		}
		if (page_size == null) {
			page_size = 10;
		}
		if ("请选择".equals(start_date)) {
			start_date = null;
		}
		if ("请选择".equals(end_date)) {
			end_date = null;
		}
		List<User> users = userService.selectAllUser();
		mav.addObject("owners", users);
		Integer userid = CommonUtils.parseInt(String.valueOf(session.getAttribute(Consts.SESSION_LOGINID)), 0) ;
		Dept dept = commonService.getUserDept(userid);
		if(dept!=null&&dept.getDeptlevel()==2){
			Dept parentdept = commonService.selectDeptById(dept.getParentdeptid());
			List<Dept> fdeptlist = new ArrayList<Dept>();
			fdeptlist.add(parentdept);
			List<Dept> sdeptlist = new ArrayList<Dept>();
			sdeptlist.add(dept);
			mav.addObject("fdeptlist", fdeptlist);
			mav.addObject("sdeptlist", sdeptlist);
			if(daqu == null){
				daqu = parentdept.getDeptid();
			}
			if(xiaoqu == null){
				xiaoqu = dept.getDeptid();
			}
		}else if(dept!=null&&dept.getDeptlevel()==1){
			if(daqu != null){
				daqu = dept.getDeptid();
			}
			List<Dept> childdeptlist = commonService.getChildDept(dept.getDeptid()); 
			List<Dept> fdeptlist = new ArrayList<Dept>();
			fdeptlist.add(dept);
			mav.addObject("fdeptlist", fdeptlist);
			mav.addObject("sdeptlist", childdeptlist);
		}

		//int count = routeServicce.queryPublicListCount(daqu,xiaoqu,shebei,state,start_date,end_date);

		int count = routeServicce.queryListCount(daqu,xiaoqu,shebei,state,frequency,start_date,end_date);

		int total = (count + page_size - 1) / page_size;
		if (page > total) {
			page = total;
		}

		//List<Route> list = routeServicce.queryPublicList(page, page_size,daqu,xiaoqu,shebei,state,start_date,end_date);

		List<Route> list = routeServicce.queryList(page, page_size,daqu,xiaoqu,shebei,state,frequency,start_date,end_date);
//		for (Route route : list) {
//			route.setDaqu(commonService.selectAllAreaById(route.gets));
//		}
		//daqu
		List<Area> areaList = commonService.getAreaList(userid);
		for (Route l : list) {
			for (Area area : areaList) {
				if(l.getSs_id() != null && l.getSs_id().equals(area.getArea_id()) ){
					l.setDaqu(area.getArea_name());
					List<Station> li = commonService.selectAllStationList(l.getSs_id());
					for (Station s : li) {
						if(l.getStation_id() != null && l.getStation_id().equals(s.getStation_id())){
							l.setXiaoqu(s.getStation_name());
						}
					}
				}
			}
			if(l.getOwner_id() != null){
				User user = userService.getUserById(l.getOwner_id());
				if(user != null){
					l.setPeople(user.getUsername());
					l.setDeptname(user.getDeptname());
				}
			}
		}
		//xiaoqu
//		List<Station> list = commonService.selectAllStationList(id);
//		List<User> list = userService.getUserForStation(station_id);
		List<Dept> dList = commonService.selectDeptOne();
		mav.addObject("daqu", daqu);
		mav.addObject("xiaoqu", xiaoqu);
		mav.addObject("page", page);
		mav.addObject("total", total);
		mav.addObject("list", list);
		mav.addObject("dList", dList);
		mav.addObject("state", state);
		mav.addObject("people", shebei);
		mav.addObject("start_date", start_date);
		mav.addObject("end_date", end_date);
		mav.addAllObjects(CommonUtils.getAllParams(request));
		return mav;
	}
	
	@RequestMapping("/inspection")
	public ModelAndView inspection (HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Integer userid = CommonUtils.parseInt(String.valueOf(session.getAttribute(Consts.SESSION_LOGINID)), 0) ;
		List<DeviceType> deviceList = commonService.selectTypeList();
		mav.addObject("deviceList", deviceList);
		Dept dept = commonService.getUserDept(userid);
		if(dept!=null&&dept.getDeptlevel()==2){
			Dept parentdept = commonService.selectDeptById(dept.getParentdeptid());
			List<Dept> fdeptlist = new ArrayList<Dept>();
			fdeptlist.add(parentdept);
			List<Dept> sdeptlist = new ArrayList<Dept>();
			sdeptlist.add(dept);
			mav.addObject("fdeptlist", fdeptlist);
			mav.addObject("sdeptlist", sdeptlist);
			String daqu = String.valueOf(parentdept.getDeptid());
			String xiaoqu = String.valueOf(dept.getDeptid());
			mav.addObject("daqu", daqu);
			mav.addObject("xiaoqu", xiaoqu);
		}else if(dept!=null&&dept.getDeptlevel()==1){
			String	daqu = String.valueOf(dept.getDeptid());
			mav.addObject("daqu", daqu);
			List<Dept> childdeptlist = commonService.getChildDept(dept.getDeptid()); 
			List<Dept> fdeptlist = new ArrayList<Dept>();
			fdeptlist.add(dept);
			mav.addObject("fdeptlist", fdeptlist);
			mav.addObject("sdeptlist", childdeptlist);
		}
		List<Dept> areaList = commonService.selectDeptOne();
		mav.addObject("areaList", areaList);
		return mav;
	}
	@RequestMapping("/check")
	public ModelAndView check () {
		ModelAndView mav = new ModelAndView();
		List<Check> checkList = commonService.selectPList();
		List<Check> checkLists = new ArrayList<Check>();
		for (Check c : checkList) {
			Check check =  new Check();
			List<Check> cc = commonService.selectCheckByPid(c.getCheck_id());
			check.setCheck_id(c.getCheck_id());
			check.setName(c.getName());
			check.setItems(cc);
			checkLists.add(check);
		}
		mav.addObject("checkList", checkLists);
		return mav;
	}
	@RequestMapping("/addCheck")
	@ResponseBody
	public String addCheck(String title,String id,String type){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Check check = null;
			if(CommonUtils.isEmptyString(id) && "0".equals(type)){
				check = checkService.insertCheck(title,null);
			}else if(!CommonUtils.isEmptyString(id) && "0".equals(type)){
				check = checkService.insertCheck(title, CommonUtils.parseInt(id, 0));
			}else if(!CommonUtils.isEmptyString(id) && "1".equals(type)){
				checkService.updateCheck(CommonUtils.parseInt(id, 0), title);
			}
			map.put("code", 0);
			if(check != null){
				map.put("checkid", check.getCheck_id());
			}else{
				map.put("checkid", 0);
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("code", 1);
		}
		return JSON.toJSONString(map);
	}
	
	@RequestMapping("/delCheck")
	@ResponseBody
	public ApiResult delCheck(Integer id){
		ApiResult result = new ApiResult();
		try{
			if(id!=null){
				List<Check> check = checkService.selectCheckByPidId(id);
				if(check != null && check.size() > 0){
					result.setMessage("删除失败!请先删除小分类");
					result.setCode(0);
					return result;
				}
				checkService.delCheck(id);
			}
		}catch(Exception e){
			e.printStackTrace();
			result.setMessage("删除失败!");
			result.setCode(0);
			return result;
		}
		result.setCode(1);
		return result;
	}
	
	@RequestMapping("/type")
	@ResponseBody
	public String type(String id){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<Template> templates = templateService.selectTemplateByDeviceType(id);
			map.put("code", 0);
			map.put("templates",templates);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("code", 1);
		}
		return JSON.toJSONString(map);
	}
	@RequestMapping("/model")
	@ResponseBody
	public String model(String id){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<Category> categories = templateService.getTemplateCate(CommonUtils.parseInt(id, 0));
			map.put("code", 0);
			map.put("categories",categories);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("code", 1);
		}
		return JSON.toJSONString(map);
	}
	@RequestMapping("/addInspection")
	@ResponseBody
	public String addInspection(String title,String miaoshu,String daqu,String xiaoqu,String shebei,String type,String device,
			String pinci,String jiedan,String chuli,String itms,String longitude,String latitude,String address){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Route route = new Route();
			route.setName(title);
			route.setTopic(miaoshu);
			route.setCreatedate(new Date());
			route.setLaststep(10);	
			route.setIsend(0);
			route.setReceivetime(CommonUtils.parseInt(jiedan, 0));
			route.setResolvetime(CommonUtils.parseInt(chuli, 0));
			route.setSs_id(daqu);
			route.setStation_id(xiaoqu);
			route.setOwner_id(CommonUtils.parseInt(shebei, 0));
			route.setFrequency(CommonUtils.parseInt(pinci, 0));
			route.setAddress(address);
			route.setLatitude(CommonUtils.parseDouble(latitude, 0));
			route.setLongitude(CommonUtils.parseDouble(longitude, 0));
			route.setTypeid(type);
			List<Integer> ids = new ArrayList<Integer>();
			String[] id = itms.substring(0, itms.length() -1).split(",");
			for (String string : id) {
				ids.add(CommonUtils.parseInt(string, 0));
			}
			routeService.addRoute(0, route, ids);
			map.put("code", 0);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("code", 1);
		}
		return JSON.toJSONString(map);
	}
	
	@RequestMapping("/inspectionDetail")
	public ModelAndView inspenctionDetail(Integer id,Integer type){
		ModelAndView mav = new ModelAndView();
		Route route = routeServicce.selectRouteById(id);
		List<RouteCateCheck> routeList = new ArrayList<RouteCateCheck>();
		List<RouteFlow> list = routeServicce.selectRouteFlow(id);
		for (RouteFlow flow : list) {
			User user = userService.getUserById(flow.getHolderid());
			if (user != null) {
				flow.setUsername(user.getUsername());
				flow.setDeptname(user.getDeptname());
			}else{
				if(flow.getLaststep()==10){
					User u = userService.getUserById(route.getOwner_id());
					flow.setUsername(u.getUsername());
					flow.setDeptname(u.getDeptname());
				}
			}
			List<RouteCateCheck> r = routeServicce.selectRouteCateCheckByFlowId(flow.getRoute_flow_id());
			if(r != null && r.size() > 0){
				routeList.addAll(r);
			}
		}
		mav.addObject("route", route);
		mav.addObject("routeList", routeList);
		mav.addObject("list", list);
		mav.addObject("type", type);
		return mav;
	}
}
