package com.dianxin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dianxin.model.bo.EwDevice;
import com.dianxin.model.bo.Floor;

public interface EwRemindMapper {
	
	int selectTotalByUserId(Integer user_id);
	List<EwDevice> pageQueryByUserId(@Param(value="user_id")Integer user_id, @Param(value="startIndex")Integer startIndex, @Param(value="endIndex") Integer endIndex);
	
	//分页检查
	int selectTotal();
	List<EwDevice> pageQuery(@Param(value="startIndex")Integer startIndex, @Param(value="endIndex") Integer endIndex);
	
	//楼层图片定位取得
	Floor selectFiredetectors(String uuid);
	Floor selectNonmonitor(String uuid);
	Floor selectEnvdetectors(String uuid);
	
	
	
	List<EwDevice> queryList(@Param(value="startIndex")Integer startIndex,@Param(value="endIndex") Integer endIndex,@Param(value="daqu") String daqu,
			@Param(value="xiaoqu")String xiaoqu, @Param(value="user_id")String user_id, @Param(value="start_date")String start_date, @Param(value="end_date")String end_date);
	
	
	int queryListCount(@Param(value="daqu") String daqu,
			@Param(value="xiaoqu")String xiaoqu, @Param(value="user_id")String user_id, @Param(value="start_date")String start_date, @Param(value="end_date")String end_date);
}
