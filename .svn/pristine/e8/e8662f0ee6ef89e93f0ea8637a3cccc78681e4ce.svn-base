package com.dianxin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dianxin.model.bo.Device;
import com.dianxin.model.bo.DeviceType;
import com.dianxin.model.vo.DeviceVo;

public interface DeviceMapper {
	
	//取设备类型列表
	List<DeviceType> selectTypeList();
	
	DeviceType selectTypeById(String typeid);

	void addDevice(Device device);
	
	void updateDevice(Device device);
	
	void delDevice(Integer device_id);
	
	List<DeviceVo>  queryList(@Param(value="startIndex")Integer startIndex, @Param(value="endIndex") Integer endIndex,
			@Param(value="name")String name,@Param(value="ss_id")String ss_id,
			@Param(value="station_id")String station_id,@Param(value="typeid")String typeid);
	
	int queryListCount(@Param(value="name")String name,@Param(value="ss_id")String ss_id,
			@Param(value="station_id")String station_id,@Param(value="typeid")String typeid);
	
	Device getDeviceById(Integer device_id);
}
