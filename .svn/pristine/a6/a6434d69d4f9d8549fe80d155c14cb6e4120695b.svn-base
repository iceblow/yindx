package com.dianxin.model.vo;

import java.io.Serializable;
import java.util.Date;

import com.dianxin.common.CommonUtils;

public class ScoreShVo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer type;//类型
	
	private String typename;
	
	private String title;
	
	private Date createtime;//
	
	private Integer score;
	
	private Integer holderid;//用户id 
	
	private Integer object_id;
	
	private Integer ss_id;
	
	private String ss_name;//大区
	
	private Integer station_id;
	
	private String station_name;//局站
	
	private String createdate;//创建时间  string
	
	private String username;//用户名
	
	private String deptname;//部门名

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
		if(type==0){
			this.typename="隐患发布";
		}
		if(type==1){
			this.typename="隐患处理";
		}
		if(type==2){
			this.typename="巡检处理";
		}
		if(type==3){
			this.typename="检查处理";
		}
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
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
		this.createdate = CommonUtils.getTimeFormat(createtime, "yyyy-MM-dd");
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

	public Integer getSs_id() {
		return ss_id;
	}

	public void setSs_id(Integer ss_id) {
		this.ss_id = ss_id;
	}

	public String getSs_name() {
		return ss_name;
	}

	public void setSs_name(String ss_name) {
		this.ss_name = ss_name;
	}

	public Integer getStation_id() {
		return station_id;
	}

	public void setStation_id(Integer station_id) {
		this.station_id = station_id;
	}

	public String getStation_name() {
		return station_name;
	}

	public void setStation_name(String station_name) {
		this.station_name = station_name;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getDeptname() {
		return deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	
	
}
