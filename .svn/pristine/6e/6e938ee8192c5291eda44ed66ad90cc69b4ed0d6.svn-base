package com.dianxin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dianxin.dao.CheckMapper;
import com.dianxin.dao.DeptMapper;
import com.dianxin.dao.DeviceMapper;
import com.dianxin.dao.StationMapper;
import com.dianxin.dao.UserMapper;
import com.dianxin.model.bo.Area;
import com.dianxin.model.bo.Check;
import com.dianxin.model.bo.Dept;
import com.dianxin.model.bo.DeviceType;
import com.dianxin.model.bo.Station;
import com.dianxin.model.bo.StationRange;
import com.dianxin.model.bo.User;

@Transactional(readOnly=true)
@Service
public class CommonService {

	@Resource
	private StationMapper stationMapper;
	
	@Resource
	private DeptMapper deptMapper;
	
	@Resource
	private DeviceMapper deviceMapper;
	
	@Resource
	private CheckMapper checkMapper;
	
	@Resource
	private UserMapper userMapper;
	
	public List<Area> getAreaList(Integer user_id) {
		return stationMapper.selectAreaList(user_id);
	}
	
	public List<Station> getStationList(Integer user_id, String area_id) {
		return stationMapper.selectStationList(user_id, area_id);
	}
	public List<User> getUserBydeptid(Integer deptid) {
		return userMapper.selectUserByDept(deptid);
	}
	
	public List<User> getAllUser(){
		return userMapper.selectAllUser();
	}
	
	//局站范围
	public List<Station> selectStationRangeStaion() {
		return stationMapper.selectStationRangeStaion();
	}
	public List<StationRange> selectStationRangeList(String station_id) {
		return stationMapper.selectStationRangeList(station_id);
	}
	
	//查找部门列表
	public List<Dept> selectDeptList() {
		return deptMapper.selectDeptList();
	}
	
	public List<Area> selectAllAreaList() {
		return stationMapper.selectAllAreaList();
	}
	
	public List<Dept> selectDeptOne() {
		return deptMapper.selectDept1();
	}
	
	public List<Station> selectAllStationList(String area_id) {
		return stationMapper.selectAllStationList(area_id);
	}
	
	/**
	 * 获取设备类型
	 * @return
	 */
	public List<DeviceType> selectAllDeviceType(){
		List<DeviceType> devicelist = deviceMapper.selectTypeList();
		return devicelist;
	}

	public List<Check> selectPList() {
		return checkMapper.selectPList();
	}

	public List<Check> selectCheckByPid(Integer pid) {
		return checkMapper.selectCheckByPid(pid);
	}

	public List<DeviceType> selectTypeList() {
		return deviceMapper.selectTypeList();
	}
	
	public Dept selectDeptById(Integer id) {
		return deptMapper.selectDeptById(id);
	}
	
	public Dept getUserDept(Integer userid){
		return deptMapper.selectUserDept(userid);
	}
	
	public List<Dept> getChildDept(Integer deptid){
		return deptMapper.getChildDept(deptid);
	}
	
	public List<Dept> selectDept1(){
		return deptMapper.selectDept1();
	}
	
	public List<Dept> selectDept2(Integer deptid){
		return deptMapper.selectDept2(deptid);
	}
	
	public List<Dept> selectAllDept2(){
		return deptMapper.selectAllDept2();
	}
}
