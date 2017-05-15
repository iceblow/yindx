package com.dianxin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dianxin.dao.StationMapper;
import com.dianxin.dao.UserMapper;
import com.dianxin.model.bo.StationCheck;
import com.dianxin.model.bo.StationRange;
import com.dianxin.model.bo.User;
import com.dianxin.model.vo.DistributionVo;
import com.dianxin.model.vo.HistoryVo;
import com.dianxin.model.vo.StationRangeVo;
import com.dianxin.model.vo.StatisticsVo;
import com.dianxin.model.vo.TimeCountVo;
import com.sun.javafx.collections.MappingChange.Map;

@Transactional(readOnly=true)
@Service
public class UserService {

	@Resource
	private UserMapper userMapper;
	
	@Resource
	private StationMapper stationMapper;
	
	//登录用
	public User getUserByLoginid(String loginid) {
		return userMapper.selectByLoginid(loginid);
	}
	
	//加入扩展表
	@Transactional(readOnly=false)
	public int insertExpUser(Integer user_id) {
		int count = userMapper.getExpCountById(user_id);
		if (count == 0) {
			return userMapper.insertExpUser(user_id, "", 0);
		} 
		return 1;
	}
	
	//取用户详细用
	public User getUserById(Integer user_id) {
		return userMapper.selectByPrimaryKey(user_id);
	}
	
	//根据局站取用户
	public List<User> getUserForStation(String station_id){
		return userMapper.selectUserForStation(station_id);
	}
	
	//根据部门取用户
	public List<User> getUserByDept(Integer deptid){
		return userMapper.selectUserByDept(deptid);
	}
	
	//修改头像
	@Transactional(readOnly=false)
	public int updateUserAvatar(Integer user_id, String avatar) {
		int count = userMapper.getExpCountById(user_id);
		if (count == 0) {
			return userMapper.insertExpUser(user_id, avatar, 0);
		} else {
			return userMapper.updateUserAvatar(user_id, avatar);
		}
	}
	
	//修改密码
	@Transactional(readOnly=false)
	public int updateUserPassword(Integer user_id, String new_password) {
		return userMapper.updateUserPassword(user_id, new_password);
	}

	public User selectByLoginid(Integer owner_id) {
		return userMapper.selectByLoginid(owner_id.toString());
	}
	
    //用户历史记录
	public int selectUserHistoryCount(Integer user_id) {
		return userMapper.selectUserHistoryCount(user_id);
	}
	
	public List<HistoryVo> pageQueryUserHistory(Integer user_id,Integer page, Integer page_size) {
		Integer startIndex =  (page - 1) * page_size + 1;
		Integer endIndex = startIndex + page_size - 1;
		
		return userMapper.pageQueryUserHistory(user_id, startIndex, endIndex);
	}
	
	//统计
	public StatisticsVo statistics(Integer user_id, Integer deptid, Date start_time, Date end_time) {
		StatisticsVo statisticsVo = new StatisticsVo();

		// 实时告警处理统计
	  	int realStatistics  = userMapper.selectRealStatistics(user_id, deptid, start_time, end_time);
	  	statisticsVo.setReal(realStatistics);
	  	
	  	// 隐患按时完成
	  	int problemOntime  = userMapper.selectProblemOntime(user_id, deptid, start_time, end_time);
	  	statisticsVo.setProblem1(problemOntime);
	  	
	  	// 隐患未按时完成
	  	int problemOuttime  = userMapper.selectProblemOuttime(user_id, deptid, start_time, end_time);
	  	statisticsVo.setProblem2(problemOuttime);
	  
	   	// 巡检按时完成
	  	int routeOntime  = userMapper.selectRouteOntime(user_id, deptid, start_time, end_time);
	  	statisticsVo.setRoute1(routeOntime);

	   	// 巡检未按时完成
	  	int routeOuttime  = userMapper.selectRouteOuttime(user_id, deptid, start_time, end_time);
	  	statisticsVo.setRoute2(routeOuttime);
	  	
	  	List<TimeCountVo> list = userMapper.selectAlarmCount(user_id, deptid, start_time, end_time);
	  	statisticsVo.setAlarmCountList(list);
		
		return statisticsVo;
	}
	
	public List<DistributionVo> selectAlarmForMap(Integer user_id, 
			Double longitude1, Double longitude2,
			Double latitude1, Double latitude2) {
		return userMapper.selectAlarmForMap(user_id, longitude1, longitude2, latitude1, latitude2);
	}
	
	public StationRangeVo getStationRangeVo(String xiaoqu){
		StationRangeVo vo = new StationRangeVo();
		String station_name = stationMapper.getStationRangeNameById(xiaoqu);
		vo.setStation_id(xiaoqu);
		vo.setStation_name(station_name);
		List<StationRange> rangeList = stationMapper.selectStationRangeList(xiaoqu);
		vo.setRangeList(rangeList);
		if (rangeList != null && rangeList.size() > 0) {
			vo.setMaxlon(stationMapper.getMaxLonOfRange(xiaoqu));
			vo.setMaxlat(stationMapper.getMaxLatOfRange(xiaoqu));
			vo.setMinlon(stationMapper.getMinLonOfRange(xiaoqu));
			vo.setMinlat(stationMapper.getMinLatOfRange(xiaoqu));
		}
		return vo;
	}
	
	public List<User> selectAllUser(){
		return userMapper.selectAllUser();
	}
	
	public List<StationCheck> selectByStationId(String station_id) {
		return stationMapper.selectByStationId(station_id);
	}
	
	public StationCheck selectByStationIdAndSeq(String station_id, String seq) {
		return stationMapper.selectByStationIdAndSeq(station_id, seq);
	}
	
	public int insertStationCheck(StationCheck check) {
		return stationMapper.insertStationCheck(check);
	}

	public int updateStationCheck(StationCheck check) {
		return stationMapper.updateStationCheck(check);
	}
	
	public int deleteStationCheck(String station_id) {
		return stationMapper.deleteStationCheck(station_id);
	}

	public User selectByid(Integer owner_id) {
		return userMapper.selectByid(owner_id);
	}
	
	public List<User> findUserList(Integer page, Integer page_size,String username,String mobile) {
		Integer startIndex =  (page - 1) * page_size + 1;
		Integer endIndex = startIndex + page_size - 1;
		return userMapper.findUserList(startIndex, endIndex,username,mobile);
	}
	
	public User findGroupname(Integer viewgroupid) {
		return userMapper.findGroupname(viewgroupid);
	}
	
	public int updateUser(User user) {
		return userMapper.updateUser(user);
	}
}
