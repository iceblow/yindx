package com.dianxin.model.vo;

import java.io.Serializable;
import java.util.Date;

public class DeviceVo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	//设备id
	private Integer device_id;
	
	//设备类型id
	private String typeid;
	
	private String typename;
	
	//设备名称
	private String name;
	
	//GPS地址
	private String address;
	
	// GPS经度
	private Double longitude;

	// GPS纬度
	private Double latitude;
	
	//描述
	private String topic;
	
	//图片urls
	private String imgs;
	
	//区域id
	private String ss_id;
	
	private String ss_name;
	
	//局站id
	private String station_id;
	
	private String station_name;
	
	//责任人id
	private Integer user_id;
	
	//记录更新者ID
	private Integer update_id;
	
	//创建时间
	private Date createdate;
	
	//更新时间
	private Date updatedate;
	
	//状态
	private Integer status;

	public Integer getDevice_id() {
		return device_id;
	}

	public void setDevice_id(Integer device_id) {
		this.device_id = device_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getImgs() {
		return imgs;
	}

	public void setImgs(String imgs) {
		this.imgs = imgs;
	}

	public String getSs_id() {
		return ss_id;
	}

	public void setSs_id(String ss_id) {
		this.ss_id = ss_id;
	}

	public String getStation_id() {
		return station_id;
	}

	public void setStation_id(String station_id) {
		this.station_id = station_id;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public Integer getUpdate_id() {
		return update_id;
	}

	public void setUpdate_id(Integer update_id) {
		this.update_id = update_id;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getTypeid() {
		return typeid;
	}

	public void setTypeid(String typeid) {
		this.typeid = typeid;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getSs_name() {
		return ss_name;
	}

	public void setSs_name(String ss_name) {
		this.ss_name = ss_name;
	}

	public String getStation_name() {
		return station_name;
	}

	public void setStation_name(String station_name) {
		this.station_name = station_name;
	}
	
}
