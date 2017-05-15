package com.dianxin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dianxin.common.CommonUtils;
import com.dianxin.common.Consts;
import com.dianxin.controller.api.ApiResult;
import com.dianxin.model.bo.Area;
import com.dianxin.model.bo.Check;
import com.dianxin.model.bo.CheckFlow;
import com.dianxin.model.bo.CheckResult;
import com.dianxin.model.bo.Dept;
import com.dianxin.model.bo.EwDevice;
import com.dianxin.model.bo.Problem;
import com.dianxin.model.bo.ProblemFlow;
import com.dianxin.model.bo.Real;
import com.dianxin.model.bo.RealDetail;
import com.dianxin.model.bo.Route;
import com.dianxin.model.bo.RouteCateCheck;
import com.dianxin.model.bo.RouteFlow;
import com.dianxin.model.bo.Station;
import com.dianxin.model.bo.User;
import com.dianxin.model.vo.ProblemVo;
import com.dianxin.service.CheckService;
import com.dianxin.service.CommonService;
import com.dianxin.service.ProblemService;
import com.dianxin.service.RouteService;
import com.dianxin.service.UserService;
import com.dianxin.service.WarningService;
import com.sun.org.apache.bcel.internal.generic.DADD;

@RequestMapping("/alertHandel")
@Controller
public class AlertHandleController {
	
	@Resource
	private ProblemService problemService;
	
	@Resource
	private CommonService commonService;
	
	@Resource
	private UserService userService;
	
	@Resource
	private RouteService routeServicce;
	
	@Resource
	private CheckService checkService;
	
	@Resource
	private WarningService warningService;

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
	 * @return
	 */
	@RequestMapping("/dangerList")
	public ModelAndView dangerList(Integer page, Integer page_size, Integer area_id, Integer station_id, Integer user_id, String start_date, String end_date, Integer laststep){
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
		if(area_id != null){
			List<Dept> depts = commonService.selectDept2(area_id);
			mav.addObject("depts", depts);
		}else{
			List<Dept> depts = commonService.selectAllDept2();
			mav.addObject("depts", depts);
		}
		if(station_id != null){
			List<User> users = commonService.getUserBydeptid(station_id);
			mav.addObject("users", users);
		}else{
			List<User> users = commonService.getAllUser();
			mav.addObject("users", users);
		}
		int count = problemService.getPageQueryCount(area_id, station_id, user_id, start_date, end_date, laststep);
		int total = (count + page_size - 1) / page_size;
		if (page > total) {
			page = total;
		}
		List<ProblemVo> list = problemService.pageQuery(page, page_size, area_id, station_id, user_id, start_date, end_date, laststep);
		List<Dept> areaList = commonService.selectDeptOne();
		mav.addObject("page", page);
		mav.addObject("total", total);
		mav.addObject("list", list);
		mav.addObject("areaList", areaList);
		mav.addObject("laststep", laststep);
		mav.addObject("start_date", start_date);
		mav.addObject("area_id", area_id);
		mav.addObject("station_id", station_id);
		mav.addObject("user_id", user_id);
		mav.addObject("end_date", end_date);
		return mav;
	}
	
	@RequestMapping("/dangerDetail")
	public ModelAndView dangerDetail(Integer id){
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
		mav.addObject("problem", problem);
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("/getstation")
	@ResponseBody
	public String getStation(String id){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Station> list = commonService.selectAllStationList(id);
		map.put("list", list);
		return JSON.toJSONString(map);
	}
	
	
	@RequestMapping("/getuserstation")
	@ResponseBody
	public String getUserStation(String id,HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		Integer userid = CommonUtils.parseInt(String.valueOf(session.getAttribute(Consts.SESSION_LOGINID)), 0) ;
		List<Station> list = commonService.getStationList(userid,id);
		map.put("list", list);
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
	 * @return
	 */
	@RequestMapping("/inspectionList")
	public ModelAndView inspectionList(HttpServletRequest request,Integer page, Integer page_size, String start_date, String end_date,Integer daqu,
			Integer xiaoqu,Integer shebei,Integer state,Integer frequency){
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
		if(daqu != null){
			List<Dept> depts = commonService.selectDept2(daqu);
			mav.addObject("depts", depts);
		}else{
			List<Dept> depts = commonService.selectAllDept2();
			mav.addObject("depts", depts);
		}
		if(xiaoqu != null){
			List<User> users = commonService.getUserBydeptid(xiaoqu);
			mav.addObject("users", users);
		}else{
			List<User> users = commonService.getAllUser();
			mav.addObject("users", users);
		}
		int count = routeServicce.queryListCount(daqu,xiaoqu,shebei,state,frequency,start_date,end_date);
		int total = (count + page_size - 1) / page_size;
		if (page > total) {
			page = total;
		}
		List<Route> list = routeServicce.queryList(page, page_size,daqu,xiaoqu,shebei,state,frequency,start_date,end_date);
//		for (Route route : list) {
//			route.setDaqu(commonService.selectAllAreaById(route.gets));
//		}
		//daqu
		List<Dept> dList = commonService.selectDeptOne();
//		List<Area> areaList = commonService.selectAllAreaList();
		List<Dept> areaList = commonService.selectDeptOne();
		for (Route l : list) {
			for (Dept area : areaList) {
				if(l.getSs_id() != null && CommonUtils.parseInt(l.getSs_id().trim(), 0)-area.getDeptid() == 0 ){
					l.setDaqu(area.getDeptname());
					List<Dept> li = commonService.selectDept2(CommonUtils.parseInt(l.getSs_id().trim(), 0));
					for (Dept s : li) {
						if(l.getStation_id() != null && CommonUtils.parseInt(l.getStation_id().trim(), 0)-s.getDeptid() == 0){
							l.setXiaoqu(s.getDeptname());
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
		mav.addObject("page", page);
		mav.addObject("total", total);
		mav.addObject("list", list);
		mav.addObject("areaList", areaList);
		mav.addObject("dList", dList);
		mav.addObject("daqu", daqu);
		mav.addObject("xiaoqu", xiaoqu);
		mav.addObject("state", state);
		mav.addObject("people", shebei);
		mav.addObject("start_date", start_date);
		mav.addObject("end_date", end_date);
		mav.addAllObjects(CommonUtils.getAllParams(request));
		return mav;
	}
	@RequestMapping("/checkList")
	public ModelAndView checkList(HttpServletRequest request,Integer page, Integer page_size, String start_date, String end_date,String area_id,String bumen,String zhixing){
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
		if(StringUtils.isNotEmpty(area_id)){
			List<Dept> depts = commonService.selectDept2(CommonUtils.parseInt(area_id, 0));
			mav.addObject("depts", depts);
		}else{
			List<Dept> depts = commonService.selectAllDept2();
			mav.addObject("depts", depts);
		}
		if(StringUtils.isNotEmpty(bumen)){
			List<User> users = commonService.getUserBydeptid(CommonUtils.parseInt(bumen, 0));
			mav.addObject("users", users);
		}else{
			List<User> users = commonService.getAllUser();
			mav.addObject("users", users);
		}
		
		String deptname = null;
		Dept department = commonService.selectDeptById(CommonUtils.parseInt(bumen, 0));
		if (department != null) {
			deptname = department.getDeptfullname();
		}
		List<Integer> ids = new ArrayList<Integer>();
		if (zhixing == null || zhixing.length() == 0) {
			List<User> userlist = userService.getUserByDept(CommonUtils.parseInt(bumen, 0));
			if (userlist != null && userlist.size() > 0) {
				for (User user : userlist) {
					ids.add(user.getId());
				}
			}
		}
		//判断执行人和二级部门是否为空
		if(StringUtils.isEmpty(bumen)&&StringUtils.isEmpty(zhixing)&&StringUtils.isNotEmpty(area_id)){
			List<Dept> depts = commonService.getChildDept(CommonUtils.parseInt(area_id, 0));
			if(depts!=null&&depts.size()!=0){
				for(Dept d:depts){
					List<User> userlist = userService.getUserByDept(d.getDeptid());
					if (userlist != null && userlist.size() > 0) {
						for (User user : userlist) {
							ids.add(user.getId());
						}
					}
				}
			}
		}
		
		int count = checkService.queryListCount(deptname,start_date,end_date,zhixing,ids,area_id);
		int total = (count + page_size - 1) / page_size;
		if (page > total) {
			page = total;
		}
		List<CheckFlow> list = checkService.queryList(page, page_size,deptname,start_date,end_date,zhixing,ids,area_id);
		for (CheckFlow l : list) {
			if(l != null){
				if(l.getUser_id() != null){
					User user = userService.getUserById(l.getUser_id());
					if(user != null){
						l.setUsername(user.getUsername());
						l.setDeptname(user.getDeptname());
					}
				}
			}
		}
		List<Dept> areaList = commonService.selectDeptOne();
		mav.addObject("page", page);
		mav.addObject("areaList", areaList);
		mav.addObject("total", total);
		mav.addObject("list", list);
		mav.addObject("people", bumen);
		mav.addObject("zhixing", zhixing);
		mav.addObject("start_date", start_date);
		mav.addObject("end_date", end_date);
		mav.addObject("area_id", area_id);
		mav.addAllObjects(CommonUtils.getAllParams(request));
		return mav;
	}
	
	@RequestMapping("/actualList")
	public ModelAndView actualList(Integer page, Integer page_size, String area_id, String xiaoqu, Integer user_id, String start_date, String end_date, String laststep){
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
		if(StringUtils.isNotEmpty(area_id)){
			List<Dept> depts = commonService.selectDept2(CommonUtils.parseInt(area_id, 0));
			mav.addObject("depts", depts);
		}else{
			List<Dept> depts = commonService.selectAllDept2();
			mav.addObject("depts", depts);
		}
		if(StringUtils.isNotEmpty(xiaoqu)){
			List<User> users = commonService.getUserBydeptid(CommonUtils.parseInt(xiaoqu, 0));
			mav.addObject("users", users);
		}else{
			List<User> users = commonService.getAllUser();
			mav.addObject("users", users);
		}
		List<Integer> ids = new ArrayList<Integer>();
		//判断人检查人或二级部门为空
		if(user_id==null&&StringUtils.isEmpty(xiaoqu)&&StringUtils.isNotEmpty(area_id)){
			List<Dept> depts = commonService.getChildDept(CommonUtils.parseInt(area_id, 0));
			if(depts!=null&&depts.size()!=0){
				for(Dept d:depts){
					List<User> userlist = userService.getUserByDept(d.getDeptid());
					if (userlist != null && userlist.size() > 0) {
						for (User user : userlist) {
							ids.add(user.getId());
						}
					}
				}
			}
		}
		
		if (user_id == null ) {
			List<User> userlist = userService.getUserByDept(CommonUtils.parseInt(xiaoqu, 0));
			if (userlist != null && userlist.size() > 0) {
				for (User user : userlist) {
					ids.add(user.getId());
				}
			}
		}
		
		int count = problemService.getPageActualListCount(area_id, xiaoqu, user_id, start_date, end_date, step,ids);
		int total = (count + page_size - 1) / page_size;
		if (page > total) {
			page = total;
		}
		List<Real> list = problemService.pageActualList(page, page_size, area_id, xiaoqu, user_id, start_date, end_date, step,ids);
		List<Real> reals = new ArrayList<Real>();//获取最后执行人的集合
		for(Real r:list){
			Real rs = problemService.getActualFinaUser(r.getAefid());
			if(rs!=null){
				r.setUsername(rs.getUsername());
			}	
			reals.add(r);
		}
		List<Dept> areaList = commonService.selectDeptOne();
		mav.addObject("page", page);
		mav.addObject("total", total);
		mav.addObject("list", reals);
		mav.addObject("areaList", areaList);
		mav.addObject("laststep", laststep);
		mav.addObject("start_date", start_date);
		mav.addObject("end_date", end_date);
		mav.addObject("area_id", area_id);
		mav.addObject("xiaoqu", xiaoqu);
		mav.addObject("user_id", user_id);
		mav.setViewName("./alertHandel/actualList");
		return mav;
	}
	
	@RequestMapping("/actualDetail")
	public ModelAndView actualDetail(String id){
		ModelAndView mav = new ModelAndView();
		RealDetail detail = problemService.getRealDetail(id);
		mav.addObject("detail", detail);
		mav.setViewName("./alertHandel/actualDetail");
		return mav;
	}
	
	@RequestMapping("/deptUser")
	@ResponseBody
	public String deptUser(String id){
		Map<String, Object> map = new HashMap<String, Object>();
		List<User> list = userService.getUserByDept(CommonUtils.parseInt(id, 0));
		map.put("list", list);
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
	@RequestMapping("/checkDetail")
	public ModelAndView checkDetail(Integer id){
		ModelAndView mav = new ModelAndView();
		CheckFlow checkFlow = checkService.selectCheckFlowById(id);
		List<CheckResult> checkResults = checkService.selectCheckResultByCheckFlowId(id);
		for (CheckResult c : checkResults) {
			if(c.getCheck_id() != null){
				Check check = checkService.selectCheckByCheckResultId(c.getCheck_id());
				if(check != null){
					c.setCheck(check);
				}
			}
		}
		mav.addObject("checkFlow", checkFlow);
		mav.addObject("checkResults", checkResults);
		return mav;
	}
	@RequestMapping("/advanceList")
	public ModelAndView advanceList(HttpServletRequest request,Integer page, Integer page_size, String start_date, String end_date,String daqu,
			String xiaoqu,String shebei){
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
		int count = warningService.queryListCount(daqu,xiaoqu,shebei,start_date,end_date);
		int total = (count + page_size - 1) / page_size;
		if (page > total) {
			page = total;
		}
		List<EwDevice> list = warningService.queryList(page, page_size,daqu,xiaoqu,shebei,start_date,end_date);
		//List<Dept> areaList = commonService.selectDeptOne();
		List<Area> areaList = commonService.selectAllAreaList();
		mav.addObject("page", page);
		mav.addObject("total", total);
		mav.addObject("list", list);
		mav.addObject("areaList", areaList);
		mav.addObject("daqu", daqu);
		mav.addObject("xiaoqu", xiaoqu);
		mav.addObject("shebei", shebei);
		mav.addObject("start_date", start_date);
		mav.addObject("end_date", end_date);
		mav.addAllObjects(CommonUtils.getAllParams(request));
		return mav;
	}
	
	@RequestMapping("/advanceDetail")
	public ModelAndView advanceDetail(String id,Integer type){
		ModelAndView mav = new ModelAndView();
		mav.addObject("id", id);
		mav.addObject("type", type);
		return mav;
	}
	
	@RequestMapping("/dealProblem")
	@ResponseBody
	public ApiResult dealProblem(Integer id){
		ApiResult apiResult = new ApiResult();
		Problem problemVo = problemService.selectById(id);
		if(problemVo != null){
			problemVo.setLaststep(16);
			problemService.updateProblemVo(problemVo);
			apiResult.setMessage("解决成功！");
		}else {
			apiResult.setMessage("解决失败！");
		}
		return apiResult;
	}
	
	
}