package com.dianxin.service;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.dianxin.common.CommonUtils;
import com.dianxin.common.QueryResult;
import com.dianxin.dao.SettingMapper;
import com.dianxin.dao.StationMapper;
import com.dianxin.dao.UserMapper;
import com.dianxin.model.bo.Area;
import com.dianxin.model.bo.Station;
import com.dianxin.model.bo.User;
import com.dianxin.model.vo.ScoreVo;

@Service
public class QueryService {

	@Resource
	private StationMapper stationMapper;
	@Resource
	private UserMapper userMapper;
	@Resource 
	private SettingMapper settingMapper;
	
	public List<Area> getAllAreas(){
		return  stationMapper.selectAllAreaList();
	}
	
	public List<Station> getAllStations(){
		return stationMapper.selectAllStation();
	}
	
	public List<User> getAllUsers(){
		return userMapper.selectAllUser();
	}
	
	public List<Station> getStationByarea(String id){
		return stationMapper.selectAllStationList(id);
	}
	/**
	 * 积分查询页面
	 * @param ss_id
	 * @param station_id
	 * @param user_id
	 * @param start_time
	 * @param end_time
	 * @param type
	 * @param page
	 * @return
	 */
	public QueryResult<ScoreVo> findScoreListByQue(String ss_id, String station_id, Integer user_id,String start_time,String end_time,String type, Integer page){
		QueryResult<ScoreVo> result = new QueryResult<ScoreVo>();
		Map<String,Object> map = new HashMap<String,Object>();
		if(StringUtils.isEmpty(ss_id)){
			ss_id=null;
		}else{
			ss_id+="%";
		}
		if(StringUtils.isEmpty(station_id)){
			station_id = null;
		}
		Date s_date = null;
		if(StringUtils.isNotEmpty(start_time)){
			s_date = CommonUtils.getDateFormat(start_time, "yyyy-MM-dd");
		}
		Date e_date = null;
		if(StringUtils.isNotEmpty(end_time)){
			e_date = CommonUtils.getDateFormat(end_time, "yyyy-MM-dd");
		}
		Integer s_type = null;
		if(StringUtils.isNotEmpty(type)){
			s_type =CommonUtils.parseInt(type, -1);
		}

		List<ScoreVo> vos = settingMapper.selectUserScoreBySelecter(ss_id,station_id,user_id,s_date,e_date,s_type,(page-1)*10+1,page*10);
		if(vos==null){
			result.setDataList(vos);
			result.setTotal(0);
			return result;
		}
		long count = settingMapper.getUserScoreCount(ss_id,station_id,user_id,s_date,e_date,s_type);
		result.setDataList(vos);
		result.setTotal(count);
		return result;
	}
	
	
}
