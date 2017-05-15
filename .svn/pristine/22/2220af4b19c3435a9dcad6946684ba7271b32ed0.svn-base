package com.dianxin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dianxin.model.bo.AefRecordFlow;
import com.dianxin.model.bo.Real;
import com.dianxin.model.bo.RealDetail;
import com.dianxin.model.bo.RealExp;

//实时告警相关
public interface RealMapper {
	
	//取用户相关未完成的数量
	int selectCountNotEnd(Integer user_id);
	
	List<Real> pageQueryNotEnd(@Param(value="startIndex")Integer startIndex, @Param(value="endIndex") Integer endIndex,@Param(value="user_id")Integer user_id);

	//告警详细
	RealDetail selectRealDetail(String aefid);
	
	//告警处理流程
	List<AefRecordFlow> selectFlowsById(String aefid);
	
	//告警处理
	int insertRealFlow(AefRecordFlow flow);
	
	int updateAefRecord(String aefid);
	
	int insertRealExp(RealExp realExp);
	//实时列表
	int getPageActualListCount(
			@Param(value="area_id")String area_id, 
			@Param(value="xiaoqu")String xiaoqu, 
			@Param(value="user_id")Integer user_id, 
			@Param(value="start_date")String start_date,
			@Param(value="end_date")String end_date, 
			@Param(value="step")Integer step,
			@Param(value="ids")List<Integer> ids);
	
	List<Real> pageActualList(
			@Param(value="startIndex")Integer startIndex, 
			@Param(value="endIndex")Integer endIndex, 
			@Param(value="area_id")String area_id, 
			@Param(value="xiaoqu")String xiaoqu, 
			@Param(value="user_id")Integer user_id, 
			@Param(value="start_date")String start_date,
			@Param(value="end_date")String end_date, 
			@Param(value="step")Integer step,
			@Param(value="ids")List<Integer> ids);
	Real selectActualUserBYId(String aefid);
	RealDetail selectRealDetailById(String aefid);
}
