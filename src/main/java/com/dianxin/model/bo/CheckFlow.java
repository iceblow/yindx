package com.dianxin.model.bo;

import java.io.Serializable;
import java.util.Date;

public class CheckFlow implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Integer  check_flow_id;
	
	private Integer user_id;
	
	private String address;
	
	private Double longitude;
	
	private Double latitude;
	
	private Integer score;
	
	private Date createdate;

	private String deptname;
	//增加
	private String username;

	public String getDeptname() {
		return deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}

	public Integer getCheck_flow_id() {
		return check_flow_id;
	}

	public void setCheck_flow_id(Integer check_flow_id) {
		this.check_flow_id = check_flow_id;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
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

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
}
