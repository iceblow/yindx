package com.dianxin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dianxin.common.CommonUtils;
import com.dianxin.common.QueryResult;
import com.dianxin.model.bo.Area;
import com.dianxin.model.bo.CheckFlow;
import com.dianxin.model.bo.Dept;
import com.dianxin.model.bo.EwDevice;
import com.dianxin.model.bo.Real;
import com.dianxin.model.bo.Route;
import com.dianxin.model.bo.Station;
import com.dianxin.model.bo.User;
import com.dianxin.model.vo.ProblemVo;
import com.dianxin.model.vo.ScoreVo;
import com.dianxin.service.CheckService;
import com.dianxin.service.CommonService;
import com.dianxin.service.ProblemService;
import com.dianxin.service.QueryService;
import com.dianxin.service.RouteService;
import com.dianxin.service.UserService;
import com.dianxin.service.WarningService;

@RequestMapping("/query")
@Controller
public class QueryController {

	@Resource
	private CommonService commonService;
	@Resource 
	private QueryService queryService;
	@Resource 
	private ProblemService problemService;
	@Resource 
	private WarningService warningService;
	@Resource
	private RouteService routeServicce;
	@Resource
	private CheckService checkService;
	@Resource
	private UserService userService;
	
	@RequestMapping("/integral")
	public ModelAndView dangerList(String ss_id, String station_id, Integer user_id,String start_time,String end_time,String type, Integer page){
		ModelAndView mav = new ModelAndView();
		if (page == null || page <= 0) {
			page = 1;
		}
		mav.addObject("ss_id", ss_id);	
		mav.addObject("station_id", station_id);
		mav.addObject("user_id", user_id);
		mav.addObject("start_time", start_time);
		mav.addObject("end_time", end_time);
		mav.addObject("type", type);
		mav.addObject("page", page);
		List<Station> stations = queryService.getAllStations();
		List<Area> areas = queryService.getAllAreas();
		List<User> users = queryService.getAllUsers();
		mav.addObject("stations", stations);
		mav.addObject("areas", areas);
		mav.addObject("users", users);
		QueryResult<ScoreVo> result = queryService.findScoreListByQue(ss_id, station_id, user_id, start_time, end_time, type, page);
		mav.addObject("result", result);
		int total=1;
		if(result.getTotal()>10){
			total=(int)result.getTotal()/10;
			if(result.getTotal()>total*10){
				total+=1;
			}
		}
		mav.addObject("total", total);
		
		return mav;
	}
	
	@RequestMapping("/getstation")
	@ResponseBody
	public List<Station> domodifi(String id){
		if(id==""){
			return queryService.getAllStations();
		}
		return queryService.getStationByarea(id);
	}
	
	@RequestMapping("/conditions")
	public ModelAndView conditions(String area_id, String xiaoqu, String user_id, String start_date, String end_date){
		ModelAndView mav = new ModelAndView();
		Integer userid = null;
		if(user_id != null){
			userid = CommonUtils.parseInt(user_id, 0);
		}
		List<Dept> areaList = commonService.selectDeptOne();
		//实时
		
		List<Integer> ids = new ArrayList<Integer>();
		//判断人检查用户id或二级部门为空
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
		//当用户id存在时,二级目录不判断
		if (user_id == null ) {
			List<User> userlist = userService.getUserByDept(CommonUtils.parseInt(xiaoqu, 0));
			if (userlist != null && userlist.size() > 0) {
				for (User user : userlist) {
					ids.add(user.getId());
				}
			}
		}
		
		int shiShiCount = problemService.getPageActualListCount(area_id, xiaoqu, userid, start_date, end_date, null,ids);
		List<Real> shiShilist = problemService.pageActualList(1, 10, area_id, xiaoqu, userid, start_date, end_date, null,ids);
		//预警
		int yuJingcount = warningService.queryListCount(area_id,xiaoqu,user_id,start_date,end_date);
		List<EwDevice> yuJinglist = warningService.queryList(1, yuJingcount,area_id,xiaoqu,user_id,start_date,end_date);
		//巡检
//		int xuJiancount = routeServicce.queryListCount(area_id,xiaoqu,user_id,null,null,start_date,end_date);
//		List<Route> xuJianlist = routeServicce.queryList(1, xuJiancount,area_id,xiaoqu,user_id,null,null,start_date,end_date);
//		for (Route l : xuJianlist) {
//			for (Dept area : areaList) {
//				if(l.getSs_id() != null && CommonUtils.parseInt(l.getSs_id().trim(), 0)-area.getDeptid() == 0 ){
//					l.setDaqu(area.getDeptname());
//					List<Dept> li = commonService.selectDept2(CommonUtils.parseInt(l.getSs_id().trim(), 0));
//					for (Dept s : li) {
//						if(l.getStation_id() != null && CommonUtils.parseInt(l.getStation_id().trim(), 0)-s.getDeptid() == 0){
//							l.setXiaoqu(s.getDeptname());
//						}
//					}
//				}
//			}
//			if(l.getOwner_id() != null){
//				User user = userService.getUserById(l.getOwner_id());
//				if(user != null){
//					l.setPeople(user.getUsername());
//					l.setDeptname(user.getDeptname());
//				}
//			}
//		}
		//隐患
//		int yinHuancount = problemService.getPageQueryCount(area_id, xiaoqu, userid, start_date, end_date, null);
//		List<ProblemVo> yinHuanlist = problemService.pageQuery(1, yinHuancount, area_id, xiaoqu,userid, start_date, end_date, null);
		//检查
//		int count = checkService.queryListCount(deptname,start_date,end_date,user_id,ids);
//		List<CheckFlow> list = checkService.queryList(page, page_size,deptname,start_date,end_date,zhixing,ids);
//		for (CheckFlow l : list) {
//			if(l != null){
//				if(l.getUser_id() != null){
//					User user = userService.getUserById(l.getUser_id());
//					if(user != null){
//						l.setUsername(user.getUsername());
//						l.setDeptname(user.getDeptname());
//					}
//				}
//			}
//		}
		mav.addObject("areaList", areaList);
		return mav;
	}
}
