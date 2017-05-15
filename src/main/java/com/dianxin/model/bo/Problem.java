package com.dianxin.model.bo;

import java.io.Serializable;
import java.util.Date;

/**
 * 隐患
 */
public class Problem implements Serializable{
	
	private static final long serialVersionUID = 1L;

	// 序号
	private Integer problem_id;
	
	// 名称
	private String title;

	// 描述
	private String topic;

	// 创建时间
	private Date createdate;

	// 更新时间
	private Date updatedate;
	
	//创建者
	private Integer creator;

	// 当前工作流状态
	private Integer laststep;

	// 工单是否结束
	private Integer isend;

	// 工单挂起时间
	private Date suspenddate;

	// GPS地址
	private String address;

	// GPS经度
	private Double longitude;

	// GPS纬度
	private Double latitude;

	// 派发设备人
	private Integer owner_id;

	// 接单时间
	private Integer receivetime;

	// 解决时间
	private Integer resolvetime;
	
	//一共挂起的时间
	private Integer suspendtime;
	
	//接单开始时间
	private Date receivestart;
	
	//解决开始时间
	private Date resolvestart;

	private Integer status;

	public Integer getProblem_id() {
		return problem_id;
	}

	public void setProblem_id(Integer problem_id) {
		this.problem_id = problem_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
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

	public Integer getLaststep() {
		return laststep;
	}

	public void setLaststep(Integer laststep) {
		this.laststep = laststep;
	}

	public Integer getIsend() {
		return isend;
	}

	public void setIsend(Integer isend) {
		this.isend = isend;
	}

	public Date getSuspenddate() {
		return suspenddate;
	}

	public void setSuspenddate(Date suspenddate) {
		this.suspenddate = suspenddate;
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

	public Integer getOwner_id() {
		return owner_id;
	}

	public void setOwner_id(Integer owner_id) {
		this.owner_id = owner_id;
	}

	public Integer getReceivetime() {
		return receivetime;
	}

	public void setReceivetime(Integer receivetime) {
		this.receivetime = receivetime;
	}

	public Integer getResolvetime() {
		return resolvetime;
	}

	public void setResolvetime(Integer resolvetime) {
		this.resolvetime = resolvetime;
	}

	public Integer getCreator() {
		return creator;
	}

	public void setCreator(Integer creator) {
		this.creator = creator;
	}

	public Integer getSuspendtime() {
		return suspendtime;
	}

	public void setSuspendtime(Integer suspendtime) {
		this.suspendtime = suspendtime;
	}

	public Date getReceivestart() {
		return receivestart;
	}

	public void setReceivestart(Date receivestart) {
		this.receivestart = receivestart;
	}

	public Date getResolvestart() {
		return resolvestart;
	}

	public void setResolvestart(Date resolvestart) {
		this.resolvestart = resolvestart;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
}
