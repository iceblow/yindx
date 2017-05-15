package com.dianxin.controller.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.dianxin.model.bo.ProblemFlow;
import com.dianxin.model.vo.ProblemVo;
import com.dianxin.service.ProblemService;

@RequestMapping("/api/problem")
@Controller
public class ProblemApiController {

	@Resource
	private ProblemService problemService;
	
	@RequestMapping("/add")
	@ResponseBody
	public String addProblem(Integer user_id, ProblemVo problemVo){	
		Map<String, Object> result = problemService.addProblem(user_id, problemVo);

		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public String problemList(Integer page, Integer page_size,  Integer user_id){
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		int total = problemService.selectCountNotEnd(user_id);
		result.put("total", total);
		
		if (page == null || page < 1) {
			page = 1;
		}
		if (page_size == null || page_size.intValue() <= 0)
			page_size = 10;
		
		result.put("page", page);

		List<ProblemVo> list = problemService.pageQueryNotEnd(page, page_size, user_id);
		result.put("problem_list", list);
		
		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/listforcenter")
	@ResponseBody
	public String problemListForCenter(Integer page, Integer page_size, Integer area_id, Integer station_id, Integer user_id, String start_date, String end_date, Integer step){
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		int total = problemService.getPageQueryCount(area_id, station_id, user_id, start_date, end_date, step);
		result.put("total", total);
		
		if (page <= 1) {
			page = 1;
		}
		if (page_size.intValue() == 0)
			page_size = 10;
		
		result.put("page", page);

		List<ProblemVo> list = problemService.pageQuery(page, page_size, area_id, station_id, user_id, start_date, end_date, step);
		result.put("problem_list", list);
		
		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/detail")
	@ResponseBody
	public String problemDetail(Integer problem_id){
		
		ProblemVo problem = problemService.selectProblemById(problem_id);
		if (problem == null) {
			return new ApiResult("没有这条隐患记录").toString();
		}

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", "1");
		result.put("problem", problem);
		
		List<ProblemFlow> list = problemService.selectProblemFlow(problem_id);
		result.put("list", list);
		
		return JSON.toJSONString(result);
	}
	
	//12-通过 13-不通过 14-挂起 15-打回 16-处理
	@RequestMapping("/handle")
	@ResponseBody
	public String handleProblem(Integer user_id, Integer problem_id, Integer type, Integer owner_id, Integer receivetime,
			Integer resolvetime, String content, String imgs, String audio, String reason){
		
		ProblemVo problem = problemService.selectProblemById(problem_id);
		if (problem == null) {
			return new ApiResult("没有这条隐患记录").toString();
		}
		// 判断增加
		
		int code = problemService.handleProblem(user_id, problem_id, type, owner_id, receivetime, resolvetime, content, imgs, audio, reason, null);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("code", code);
		
		return JSON.toJSONString(result);
	}
}
