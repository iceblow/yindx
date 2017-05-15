package com.dianxin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dianxin.model.bo.Check;
import com.dianxin.model.bo.CheckFlow;
import com.dianxin.model.bo.CheckResult;

public interface CheckMapper {
	
	List<Check> selectPList();
	
	List<Check> selectCheckByPid(Integer pid);
	
	//增加检查类别
	int insertPCheck(Check check);
	
	//增加检查小项目
	int  insertCheckItem(Check check);
	
	//修改名称
	int updateCheck(@Param(value="check_id") Integer check_id, @Param(value="name") String name);
	
	//删除检查项目 逻辑删除
	int deleteCheck(Integer check_id);
	
	//检查结果插入
	int insertCheckFlow(CheckFlow checkFlow);
	
	int insertCheckResult(CheckResult checkResult);

	List<CheckFlow> queryList(@Param(value="startIndex")Integer startIndex, @Param(value="endIndex") Integer endIndex,@Param(value="bumen")String bumen,@Param(value="start")String start,@Param(value="end") String end
			,@Param(value="zhixing") Integer zhixing,@Param("ids") List<Integer> ids,@Param(value="area_id")String area_id);

	int queryListCount(@Param(value="bumen")String bumen,@Param(value="start")String start,@Param(value="end") String end,@Param(value="zhixing") Integer zhixing,@Param("ids") List<Integer> ids,@Param(value="area_id")String area_id);
	
	CheckFlow selectCheckFlowById(Integer id);

	List<CheckResult> selectCheckResultByCheckFlowId(Integer id);

	Check selectCheckByCheckResultId(Integer check_id);

	List<Check> selectCheckByPidId(Integer check_id);
}
