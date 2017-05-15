package com.dianxin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dianxin.model.bo.Area;
import com.dianxin.model.bo.Station;
import com.dianxin.model.bo.StationCheck;
import com.dianxin.model.bo.StationRange;

public interface StationMapper {
	
	//根据user_id取所有的县市区域
	List<Area> selectAreaList(Integer user_id);
	
	//根据区域id取局站
	List<Station> selectStationList(@Param(value="user_id")Integer user_id, @Param(value="area_id")String area_id);

	//取局站范围gps（用来判断点是否在范围）
	List<Station> selectStationRangeStaion();
	List<StationRange> selectStationRangeList(String station_id);
	
	List<Area> selectAllAreaList();
	
	//获取所有小区(局站)
	List<Station> selectAllStation();
	
	List<Station> selectAllStationList(@Param(value="area_id")String area_id);
	
	//局站百度GPS保存
	int insertStationLocation(Station station);
	Station selectStationLocation(String station_id);
	
	List<String> getAllStationRangeId();
	
	String getStationRangeNameById(String station_id);
	
	List<StationCheck> selectByStationId(String station_id);
	
	StationCheck selectByStationIdAndSeq(@Param("station_id") String station_id, @Param("seq") String seq);
	
	int insertStationCheck(StationCheck check);
	
	int updateStationCheck(StationCheck check);
	
	int deleteStationCheck(String station_id);
	
	Double getMaxLonOfRange(String station_id);
	
	Double getMaxLatOfRange(String station_id);
	
	Double getMinLonOfRange(String station_id);
	
	Double getMinLatOfRange(String station_id);
}
