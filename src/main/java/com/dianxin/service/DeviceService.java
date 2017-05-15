package com.dianxin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dianxin.dao.DeviceMapper;
import com.dianxin.model.bo.Device;
import com.dianxin.model.vo.DeviceVo;

@Transactional(readOnly=true)
@Service
public class DeviceService {

	@Resource
	private DeviceMapper deviceMapper;
	
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED)
	public void addDevice(Device device){
		deviceMapper.addDevice(device);
	}
	
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED)
	public void updateDevice(Device device){
		deviceMapper.updateDevice(device);
	}
	
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED)
	public void delDevice(Integer device_id){
		deviceMapper.delDevice(device_id);
	}
	
	public int queryListCount(String name,String ss_id,String station_id,String typeid) {
		return deviceMapper.queryListCount(name,ss_id,station_id,typeid);	
	}
	
	public List<DeviceVo> queryList(Integer page, Integer page_size,String name,String ss_id,String station_id,String typeid) {
		Integer startIndex =  (page - 1) * page_size + 1;
		Integer endIndex = startIndex + page_size - 1;
		List<DeviceVo> routeList = deviceMapper.queryList(startIndex , endIndex,name,ss_id,station_id,typeid);
		return routeList;
	}
	
	public Device getDeviceById(Integer device_id){
		Device device = deviceMapper.getDeviceById(device_id);
		return device;
	}
	
}
