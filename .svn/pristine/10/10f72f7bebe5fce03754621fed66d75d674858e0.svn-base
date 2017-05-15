package com.dianxin.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dianxin.model.bo.Help;
import com.dianxin.model.bo.Setting;
import com.dianxin.model.vo.ScoreVo;

public interface SettingMapper {
	
	List<Setting> selectSetting();
	
	Setting selectSettingByType(String type);
	
	int insertSetting(@Param(value="type")String type,@Param(value="setting") Integer setting);
	
	int updateSetting(@Param(value="type")String type,@Param(value="setting") Integer setting);
	
	//用户积分处理 增加积分
	int updateUserScore(@Param(value="user_id")Integer user_id,@Param(value="score") Integer score);
	
	//反馈
	int insertFeedback(@Param(value="user_id")Integer user_id,@Param(value="content") String content);
	
	//帮助中心
	int selectHelpCount();
	List<Help> pageQueryHelp(@Param(value="startIndex")Integer startIndex, @Param(value="endIndex") Integer endIndex);
	
	Help selectHelpDetail(Integer help_id);
	
	int insertHelp(Help help);
	
	//用户历史积分
	int selectUserScoreHistoryCount(Integer user_id);
	List<ScoreVo> pageQueryUserScoreHistory(@Param(value="user_id")Integer user_id,@Param(value="startIndex")Integer startIndex, @Param(value="endIndex") Integer endIndex);
	
	List<ScoreVo> selectUserScoreBySelecter(@Param(value="ss_id")String ss_id,@Param(value="station_id")String station_id,@Param(value="user_id")Integer user_id,
			@Param(value="start_time")Date start_time,@Param(value="end_time")Date end_time,@Param(value="type")Integer type,@Param(value="start")Integer start,@Param(value="end")Integer end);
	long getUserScoreCount(@Param(value="ss_id")String ss_id,@Param(value="station_id")String station_id,@Param(value="user_id")Integer user_id,
			@Param(value="start_time")Date start_time,@Param(value="end_time")Date end_time,@Param(value="type")Integer type);

	
}
