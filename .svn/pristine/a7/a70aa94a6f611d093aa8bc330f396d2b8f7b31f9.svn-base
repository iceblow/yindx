package com.dianxin.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dianxin.common.CommonUtils;
import com.dianxin.common.Consts;
import com.dianxin.dao.ProblemMapper;
import com.dianxin.dao.RealMapper;
import com.dianxin.dao.SettingMapper;
import com.dianxin.dao.UserMapper;
import com.dianxin.model.bo.AefRecordFlow;
import com.dianxin.model.bo.Problem;
import com.dianxin.model.bo.ProblemFlow;
import com.dianxin.model.bo.ProblemMutli;
import com.dianxin.model.bo.Real;
import com.dianxin.model.bo.RealDetail;
import com.dianxin.model.bo.Setting;
import com.dianxin.model.bo.User;
import com.dianxin.model.vo.ProblemVo;

@Transactional(readOnly=true)
@Service
public class ProblemService {

	@Resource
	private ProblemMapper problemMapper;
	
	@Resource
	private UserMapper userMapper;
	
	@Resource
	private SettingMapper settingMapper;
	
	@Resource
	private RealMapper realMapper;
	
	//添加隐患
	@Transactional(readOnly=false)
	public Map<String, Object> addProblem(Integer user_id, ProblemVo problemVo) {
		Problem problem = new Problem();
		problem.setTitle(problemVo.getTitle());
		problem.setTopic(problemVo.getTopic());
//		problem.setCreatedate(problemVo.getCreatedate());
//		problem.setUpdatedate(problemVo.getUpdatedate());
		problem.setCreator(user_id);
		problem.setLaststep(10); //12-已通过
		problem.setIsend(0);
		problem.setSuspenddate(problemVo.getSuspenddate());
		problem.setAddress(problemVo.getAddress());
		problem.setLongitude(problemVo.getLongitude());
		problem.setLatitude(problemVo.getLatitude());
		
		//接单时间 解决时间
		Integer time = problemVo.getReceivetime();
		if (time == null || time == 0) {
			Setting setting = settingMapper.selectSettingByType(Consts.SETTING_PROBLEM_TIME);
			if (setting != null) {
				problem.setReceivetime(setting.getSetting());
			} else {
				problem.setReceivetime(24);
			}
		} else {
			problem.setReceivetime(problemVo.getReceivetime());
		}
		time = problemVo.getResolvetime();
		if (time == null || time == 0) {
			Setting setting = settingMapper.selectSettingByType(Consts.SETTING_PROBLEM_SOLVE);
			if (setting != null) {
				problem.setResolvetime(setting.getSetting());
			} else {
				problem.setResolvetime(24);
			}
		} else {
			problem.setResolvetime(problemVo.getResolvetime());
		}
		
		//选择派发者
		if (problemVo.getOwner_id() != null && problemVo.getOwner_id() > 0) {
			problem.setOwner_id(problemVo.getOwner_id());
			problem.setLaststep(11); //发起直接通过
		} else if (StringUtils.isNoneBlank(problemVo.getStation_id())) {
			//默认选择派送局站的情况
			List<User> users = userMapper.selectUserForStation(problemVo.getStation_id());
			if (users != null && users.size() > 0) {
				problem.setOwner_id(users.get(0).getId());
				problem.setLaststep(11); //发起直接通过
			}
		}

		int code = problemMapper.addProblem(problem);
		
		//添加隐患 图片 或者 音频
		if (StringUtils.isNotBlank(problemVo.getImgs())) {
			String[] imgArray = problemVo.getImgs().split(",");
			for (String imgurl : imgArray) {
				if (StringUtils.isNotBlank(imgurl)) {
					
					ProblemMutli mutli = new ProblemMutli();
					mutli.setProblem_id(problem.getProblem_id());
					mutli.setMediaType(0);
					mutli.setFileExt("");
					mutli.setFileUrl(imgurl);
					
					problemMapper.addProblemMulti(mutli);
				}
			}
		}
		//音频
		if (StringUtils.isNotBlank(problemVo.getAudio())) {
			
			ProblemMutli mutli = new ProblemMutli();
			mutli.setProblem_id(problem.getProblem_id());
			mutli.setMediaType(2);
			mutli.setFileExt("");
			mutli.setFileUrl(problemVo.getAudio());
			
			problemMapper.addProblemMulti(mutli);
		}
		
		//隐患流程追加发起记录
		ProblemFlow problemFlow = new ProblemFlow();
		problemFlow.setProblem_id(problem.getProblem_id());
		problemFlow.setLaststep(problem.getLaststep());
		problemFlow.setHolderid(user_id);
		
		//积分取得
		Setting setting = settingMapper.selectSettingByType(Consts.SETTING_FIND_PROBLEM);
		if (setting != null) {
			Integer score = setting.getSetting();
			if (score != null && score.intValue() != 0) {
				problemFlow.setScore(setting.getSetting());
				settingMapper.updateUserScore(user_id, score);
			}
		} else {
			problemFlow.setScore(0);
		}

		problemMapper.addProblemFlow(problemFlow);
		
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("code", code);
		result.put("problem_id", problem.getProblem_id());
		
		return result;
	}
	
	//添加隐患
	@Transactional(readOnly=false)
	public Map<String, Object> addHouTaiProblem(Integer user_id, ProblemVo problemVo) {
		Problem problem = new Problem();
		problem.setTitle(problemVo.getTitle());
		problem.setTopic(problemVo.getTopic());
//		problem.setCreatedate(problemVo.getCreatedate());
//		problem.setUpdatedate(problemVo.getUpdatedate());
		problem.setCreator(user_id);
		problem.setLaststep(12); //12-已通过
		problem.setIsend(0);
		problem.setSuspenddate(problemVo.getSuspenddate());
		problem.setAddress(problemVo.getAddress());
		problem.setLongitude(problemVo.getLongitude());
		problem.setLatitude(problemVo.getLatitude());
		
		//接单时间 解决时间
		Integer time = problemVo.getReceivetime();
		if (time == null || time == 0) {
			Setting setting = settingMapper.selectSettingByType(Consts.SETTING_PROBLEM_TIME);
			if (setting != null) {
				problem.setReceivetime(setting.getSetting());
			} else {
				problem.setReceivetime(24);
			}
		} else {
			problem.setReceivetime(problemVo.getReceivetime());
		}
		time = problemVo.getResolvetime();
		if (time == null || time == 0) {
			Setting setting = settingMapper.selectSettingByType(Consts.SETTING_PROBLEM_SOLVE);
			if (setting != null) {
				problem.setResolvetime(setting.getSetting());
			} else {
				problem.setResolvetime(24);
			}
		} else {
			problem.setResolvetime(problemVo.getResolvetime());
		}
		
		//选择派发者
		if (problemVo.getOwner_id() != null && problemVo.getOwner_id() > 0) {
			problem.setOwner_id(problemVo.getOwner_id());
			problem.setLaststep(11); //发起直接通过
		} else if (StringUtils.isNoneBlank(problemVo.getStation_id())) {
			//默认选择派送局站的情况
			List<User> users = userMapper.selectUserForStation(problemVo.getStation_id());
			if (users != null && users.size() > 0) {
				problem.setOwner_id(users.get(0).getId());
				problem.setLaststep(11); //发起直接通过
			}
		}

		int code = problemMapper.addProblem(problem);
		
		//添加隐患 图片 或者 音频
		if (StringUtils.isNotBlank(problemVo.getImgs())) {
			String[] imgArray = problemVo.getImgs().split(",");
			for (String imgurl : imgArray) {
				if (StringUtils.isNotBlank(imgurl)) {
					
					ProblemMutli mutli = new ProblemMutli();
					mutli.setProblem_id(problem.getProblem_id());
					mutli.setMediaType(0);
					mutli.setFileExt("");
					mutli.setFileUrl(imgurl);
					
					problemMapper.addProblemMulti(mutli);
				}
			}
		}
		//音频
		if (StringUtils.isNotBlank(problemVo.getAudio())) {
			
			ProblemMutli mutli = new ProblemMutli();
			mutli.setProblem_id(problem.getProblem_id());
			mutli.setMediaType(2);
			mutli.setFileExt("");
			mutli.setFileUrl(problemVo.getAudio());
			
			problemMapper.addProblemMulti(mutli);
		}
		
		//隐患流程追加发起记录
		ProblemFlow problemFlow = new ProblemFlow();
		problemFlow.setProblem_id(problem.getProblem_id());
		problemFlow.setLaststep(problem.getLaststep());
		problemFlow.setHolderid(user_id);
		
		//积分取得
		Setting setting = settingMapper.selectSettingByType(Consts.SETTING_FIND_PROBLEM);
		if (setting != null) {
			Integer score = setting.getSetting();
			if (score != null && score.intValue() != 0) {
				problemFlow.setScore(setting.getSetting());
				settingMapper.updateUserScore(user_id, score);
			}
		} else {
			problemFlow.setScore(0);
		}

		problemMapper.addProblemFlow(problemFlow);
		
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("code", code);
		result.put("problem_id", problem.getProblem_id());
		
		return result;
	}
	
	//隐患分页列表取得
	public int getPageQueryCount(Integer area_id, Integer station_id, Integer user_id, String start_date, String end_date, Integer step) {
		return problemMapper.getPageQueryCount(area_id, station_id, user_id, start_date, end_date, step);
	}
	public List<ProblemVo> pageQuery(Integer page, Integer page_size, Integer area_id, Integer station_id, Integer user_id, String start_date, String end_date, Integer step) {
		Integer startIndex =  (page - 1) * page_size + 1;
		Integer endIndex = startIndex + page_size - 1;
		return problemMapper.pageQuery(startIndex , endIndex, area_id, station_id, user_id, start_date, end_date, step);
	}
	
	//隐患详细取得
	public ProblemVo selectProblemById(Integer problem_id) {
		Problem problem = problemMapper.selectProblemById(problem_id);
		if (problem == null) {
			return null;
		}
		
		ProblemVo problemVo = new ProblemVo(problem);
		List<ProblemMutli> mutlis = problemMapper.selectProblemMutli(problem_id);
		
		String  imgs = null;
		String audio = null;;
		if(mutlis != null && mutlis.size() > 0){
			for (ProblemMutli mutli : mutlis) {
				if (mutli.getMediaType() == 0) {
					if (imgs == null) {
						imgs = mutli.getFileUrl();
					} else {
						imgs += ",";
						imgs += mutli.getFileUrl();
					}
				} else if (mutli.getMediaType() == 2) {
					audio = mutli.getFileUrl();
				}
			}
		}
		problemVo.setImgs(imgs);
		problemVo.setAudio(audio);

		//接单处理 倒计时
		if (problemVo.getLaststep() == 11 || problemVo.getLaststep() == 12 || problemVo.getLaststep() == 151) {
			if(problemVo.getReceivestart() != null && problemVo.getReceivetime() != null){
				Long time = problemVo.getReceivestart() .getTime()/1000 - (new Date()).getTime()/1000 + problemVo.getReceivetime() * 60;
				problemVo.setCountdown(time);
			}
			
		} else {
			if(problemVo.getResolvestart()!=null&& problemVo.getResolvetime() !=null &&problemVo.getSuspendtime()!=null){
				Long time = problemVo.getResolvestart().getTime()/1000 - (new Date()).getTime()/1000 + problemVo.getResolvetime() * 60
						+ problemVo.getSuspendtime() * 60;
				problemVo.setCountdown(time);
			}
		}

		return problemVo;
	}

	//取用户相关未完成的数量
	public int selectCountNotEnd(Integer user_id) {
		return problemMapper.selectCountNotEnd(user_id);	
	}
	
	public List<ProblemVo> pageQueryNotEnd(Integer page, Integer page_size, Integer user_id) {
		Integer startIndex =  (page - 1) * page_size + 1;
		Integer endIndex = startIndex + page_size - 1;
		List<ProblemVo> problemVoList = problemMapper.pageQueryNotEnd(startIndex , endIndex,  user_id);
		
		for (int i = 0; i < problemVoList.size(); i++) {
			ProblemVo problemVo = problemVoList.get(i);

			//接单处理 倒计时
			//未接单 11 12 151
			if (problemVo.getLaststep() == 11 || problemVo.getLaststep() == 12 || problemVo.getLaststep() == 151) {
				Long time = problemVo.getReceivestart() .getTime()/1000 - (new Date()).getTime()/1000 + problemVo.getReceivetime() * 60 ;
				problemVo.setCountdown(time);
			} else {
				Long time = problemVo.getResolvestart().getTime()/1000 - (new Date()).getTime()/1000 + problemVo.getResolvetime() * 60
						+ problemVo.getSuspendtime() * 60;
				problemVo.setCountdown(time);
			}
		}

		return problemVoList;
	}
	
	//取隐患的处理流程
	public List<ProblemFlow> selectProblemFlow(Integer problem_id) {
		return problemMapper.selectProblemFlow(problem_id);
	}
	
//	10	特审
//	11	发起直接通过
//	12	通过
//	13	不通过
//	14	挂起
//	15	打回
//	16	解决
	//隐患处理
	
	@Transactional(readOnly=false)
	public int handleProblem(Integer user_id, Integer problem_id, Integer type, Integer owner_id, Integer receivetime,
			Integer resolvetime, String content, String imgs, String audio, String reason, Integer suspendtime){
		Problem problem = problemMapper.selectProblemById(problem_id);
		if(receivetime!=null||resolvetime!=null){
			if(receivetime!=null){
				problem.setReceivetime(receivetime);
			}
			if(resolvetime!=null){
				problem.setResolvetime(resolvetime);
			}
			problemMapper.updateProblemTime(problem);
		}
		
		//12-通过 13-不通过 14-挂起 15-打回 16-处理
		ProblemFlow problemFlow = new ProblemFlow();
		problemFlow.setProblem_id(problem_id);
		if (user_id != null) {
			problemFlow.setHolderid(user_id);
		}else{
			if(problem.getOwner_id() != null){
				problemFlow.setHolderid(problem.getOwner_id());
			}else{
				problemFlow.setHolderid(0);
			}
		}
		problemFlow.setLaststep(type);
//		if(handletime != null){
//			problemFlow.setIsrecordfile(handletime);
//		}
		problemMapper.updateProblemStep(problem_id, type, owner_id, suspendtime);

		problemFlow.setCreatecontent(content);
		problemFlow.setImgs(imgs);
		problemFlow.setAudio(audio);
		if (StringUtils.isNoneBlank(reason)) {
			problemFlow.setCreatecontent(reason);
		}
		problemFlow.setScore(0);
		// 分数 处理
		if (type == Consts.PROBLEM_COMPLETE) {
			Setting setting = settingMapper.selectSettingByType(Consts.SETTING_SOLVE_PROBLEM);
			if (setting != null) {
				Integer score = setting.getSetting();
				if (score != null && score.intValue() != 0) {
					problemFlow.setScore(setting.getSetting());
					if (user_id != null) {
						settingMapper.updateUserScore(user_id, score);
					}else{
						settingMapper.updateUserScore(problem.getOwner_id(), score);
					}
				}
			}
		}

		return problemMapper.addProblemFlow(problemFlow);
	}
	
	//审核列表页
	public int getPageReviewListCount(String area_id, String station_id, Integer user_id, String start_date, String end_date, Integer step) {
		return problemMapper.getPageReviewListCount(area_id, station_id, user_id, start_date, end_date, step);
	}
	public List<ProblemVo> pageReviewList(Integer page, Integer page_size, String area_id, String station_id, Integer user_id, String start_date, String end_date, Integer step) {
		Integer startIndex =  (page - 1) * page_size + 1;
		Integer endIndex = startIndex + page_size - 1;
		return problemMapper.pageReviewList(startIndex , endIndex, area_id, station_id, user_id, start_date, end_date, step);
	}
	
	//实时列表页
	public int getPageActualListCount(String area_id, String xiaoqu, Integer user_id, String start_date, String end_date, Integer step,List<Integer> ids) {
		return realMapper.getPageActualListCount(area_id, xiaoqu, user_id, start_date, end_date, step, ids);
	}
	
	public List<Real> pageActualList(Integer page, Integer page_size, String area_id, String xiaoqu, Integer user_id, String start_date, String end_date, Integer step,List<Integer> ids) {
		Integer startIndex =  (page - 1) * page_size + 1;
		Integer endIndex = startIndex + page_size - 1;
		return realMapper.pageActualList(startIndex , endIndex, area_id, xiaoqu, user_id, start_date, end_date, step,ids);
	}
	//找到实时最后操作人
	public Real getActualFinaUser(String id){
		return realMapper.selectActualUserBYId(id);
	}
	
	//实时详情
	public RealDetail getRealDetail(String aefid) {
		RealDetail detail = realMapper.selectRealDetailById(aefid);
		if (detail == null) return null;
		List<AefRecordFlow> flows = realMapper.selectFlowsById(aefid);
		detail.setFlow_list(flows);
		return detail;
	}
	
	public int updateProblemVo(Problem problemVo){
		return problemMapper.updateProblemTime(problemVo);
	}
	
	public Problem selectById(Integer problem){
		return problemMapper.selectProblemById(problem);
	}
}
