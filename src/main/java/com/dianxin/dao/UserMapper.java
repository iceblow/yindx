package com.dianxin.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dianxin.model.bo.User;
import com.dianxin.model.vo.DistributionVo;
import com.dianxin.model.vo.HistoryVo;
import com.dianxin.model.vo.TimeCountVo;
import com.sun.javafx.collections.MappingChange.Map;

public interface UserMapper {

	User selectByPrimaryKey(Integer id);

	//登录用，根据登录id 检索用户信息
    User selectByLoginid(String loginid);
    
    User selectByid(Integer loginid);
    
    //根据用户名 电话号码 反查用户信息
    User selectByName(@Param(value="username") String username, @Param(value="phone") String phone);
    
    //更新密码
    int updateUserPassword(@Param(value="id") Integer id, @Param(value="password") String password);
    
    //扩充表查找 判断是否添加到扩充表
    int getExpCountById(Integer id);
    
    //插入用户扩充表
    int insertExpUser(@Param(value="id") Integer id, @Param(value="avatar") String avatar, @Param(value="score") Integer score);
    
    //更新头像
    int updateUserAvatar(@Param(value="id") Integer id, @Param(value="avatar") String avatar);
    
    //更新头像
    int addUserScore(@Param(value="id") Integer id, @Param(value="scroe") Integer scroe);
    
    //查找局站的执行人 
    List<User> selectUserForStation(String station_id);

	//根据部门取用户
    List<User> selectUserByDept(Integer deptid);
    
    //用户历史记录
  	int selectUserHistoryCount(Integer user_id);
  	List<HistoryVo> pageQueryUserHistory(@Param(value="user_id")Integer user_id,@Param(value="startIndex")Integer startIndex, @Param(value="endIndex") Integer endIndex);

  	//统计
  	// 实时告警处理统计
  	int selectRealStatistics(@Param(value="user_id")Integer user_id, @Param(value="deptid")Integer deptid, 
  			@Param(value="start_time")Date start_time, @Param(value="end_time")Date end_time);
  	
  	// 隐患按时完成
  	int selectProblemOntime(@Param(value="user_id")Integer user_id, @Param(value="deptid")Integer deptid, 
  			@Param(value="start_time")Date start_time, @Param(value="end_time")Date end_time);
  	
  	// 隐患未按时完成
   	int selectProblemOuttime(@Param(value="user_id")Integer user_id, @Param(value="deptid")Integer deptid, 
   			@Param(value="start_time")Date start_time, @Param(value="end_time")Date end_time);
   	
   	// 巡检按时完成
   	int selectRouteOntime(@Param(value="user_id")Integer user_id, @Param(value="deptid")Integer deptid, 
   			@Param(value="start_time")Date start_time, @Param(value="end_time")Date end_time);
   	
   	// 巡检未按时完成
	int selectRouteOuttime(@Param(value="user_id")Integer user_id, @Param(value="deptid")Integer deptid, 
			@Param(value="start_time")Date start_time, @Param(value="end_time")Date end_time);
	
	List<TimeCountVo> selectAlarmCount(@Param(value="user_id")Integer user_id, @Param(value="deptid")Integer deptid, 
			@Param(value="start_time")Date start_time, @Param(value="end_time")Date end_time);
  	
	//地图分布
	List<DistributionVo> selectAlarmForMap(@Param(value="user_id")Integer user_id, 
			@Param(value="longitude1")Double longitude1, @Param(value="longitude2")Double longitude2,
			@Param(value="latitude1")Double latitude1, @Param(value="latitude2")Double latitude2);
	//查询所有用户
	List<User> selectAllUser();
	
	//条件查询用户
	List<User> findUserList(@Param(value="startIndex")Integer startIndex, @Param(value="endIndex") Integer endIndex,
			@Param(value="username")String username, @Param(value="mobile") String mobile);
	
	//查询组名
	User findGroupname(@Param(value="viewgroupid")Integer viewgroupid);
	
	//更新用户信息
	int updateUser(User user);
}
