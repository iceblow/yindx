package com.dianxin.model.bo;

import java.io.Serializable;
import java.util.Date;

/**
 * 安防设备到期提醒
 * @author jianyongduan
 *
 */
public class EwDevice implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private int type;
	
	//过期时间
	private Date overdate;
	
	//过期状态 已过期显示‘已过期’
	// 未过期的显示离过期剩余时间
	private String info;
	
	//过期设备全称
	private String devicename_ex;
	
	//探头所在位置
	private String place;
	
	//设备uuid
	private String uuid;

	public Date getOverdate() {
		return overdate;
	}

	public void setOverdate(Date overdate) {
		this.overdate = overdate;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getDevicename_ex() {
		return devicename_ex;
	}

	public void setDevicename_ex(String devicename_ex) {
		this.devicename_ex = devicename_ex;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
}
