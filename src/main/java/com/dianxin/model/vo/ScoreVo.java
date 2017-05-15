package com.dianxin.model.vo;

import java.io.Serializable;
import java.util.Date;

public class ScoreVo   implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer type;
	
	private String title;
	
	private Date createtime;
	
	private Integer score;
	
	private Integer holderid;
	
	private Integer object_id;
	
	private String ss_name;//大区
	
	private String station_name;//局站
	
	

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

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Integer getHolderid() {
		return holderid;
	}

	public void setHolderid(Integer holderid) {
		this.holderid = holderid;
	}

	public Integer getObject_id() {
		return object_id;
	}

	public void setObject_id(Integer object_id) {
		this.object_id = object_id;
	}

}
