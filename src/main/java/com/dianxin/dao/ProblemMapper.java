package com.dianxin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dianxin.model.bo.Problem;
import com.dianxin.model.bo.ProblemFlow;
import com.dianxin.model.bo.ProblemMutli;
import com.dianxin.model.vo.ProblemVo;

public interface ProblemMapper {
	
	//添加隐患
	int addProblem(Problem problem);
	
	//添加隐患 图片 或者 音频
	int addProblemMulti(ProblemMutli problemMutli);
	
	//隐患处理
	//suspendtime挂起时,传入挂起时间
	int updateProblemStep(@Param(value="problem_id")Integer problem_id, @Param(value="laststep")Integer laststep,
			@Param(value="owner_id")Integer owner_id, @Param(value="suspendtime")Integer suspendtime);
	
	/**
	 * 隐患分页列表
	 * @param area_id 大区id
	 * @param station_id 局站id
	 * @param user_id 执行人id
	 * @param start_date 查询开始时间
	 * @param start_date 查询结束时间
	 * @param step 当前状态
	 * @return
	 */
	List<ProblemVo> pageQuery(@Param(value="startIndex")Integer startIndex, @Param(value="endIndex") Integer endIndex,
			@Param(value="area_id")Integer area_id, @Param(value="station_id")Integer station_id, @Param(value="user_id")Integer user_id,
			@Param(value="start_date")String start_date, @Param(value="end_date")String end_date,
			@Param(value="step")Integer step);
	int getPageQueryCount(@Param(value="area_id")Integer area_id, @Param(value="station_id")Integer station_id, @Param(value="user_id")Integer user_id,
			@Param(value="start_date")String start_date, @Param(value="end_date")String end_date,
			@Param(value="step")Integer step);
	
	//隐患详细取得
	Problem selectProblemById(Integer problem_id);
	List<ProblemMutli> selectProblemMutli(Integer problem_id);
	
	//取用户相关未完成的数量
	int selectCountNotEnd(Integer user_id);
	List<ProblemVo> pageQueryNotEnd(@Param(value="startIndex")Integer startIndex, @Param(value="endIndex") Integer endIndex,@Param(value="user_id")Integer user_id);
	
	//隐患处理流程
	List<ProblemFlow> selectProblemFlow(Integer problem_id);
	int addProblemFlow(ProblemFlow problemFlow);
	
	
	//审核列表页
	List<ProblemVo> pageReviewList(@Param(value="startIndex")Integer startIndex, @Param(value="endIndex") Integer endIndex,
			@Param(value="area_id")String area_id, @Param(value="station_id")String station_id, @Param(value="user_id")Integer user_id,
			@Param(value="start_date")String start_date, @Param(value="end_date")String end_date,
			@Param(value="step")Integer step);
	int getPageReviewListCount(@Param(value="area_id")String area_id, @Param(value="station_id")String station_id, @Param(value="user_id")Integer user_id,
			@Param(value="start_date")String start_date, @Param(value="end_date")String end_date,
			@Param(value="step")Integer step);
	
	int updateProblemTime(Problem problem);
}
