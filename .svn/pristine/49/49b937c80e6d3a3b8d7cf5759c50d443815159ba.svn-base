package com.dianxin.model.bo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Notice implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	//公告序号
	private Integer notice_id;
	
	//标题
	private String title;
	
	//内容
	private String content;
	
	//展示图片url
	private String picurl;
	
	//类型
	private Integer type;
	
	//发布、下架状态
	private Integer status;
	
	//置顶状态
	private Integer settop;
	
	//发布时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdate;
	
	//发布者id
	private Integer holderid;
	
	//发布者
	private String holdername;
	
	//阅读次数
	private Integer readcount;

	public String getHoldername() {
		return holdername;
	}

	public void setHoldername(String holdername) {
		this.holdername = holdername;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Integer getNotice_id() {
		return notice_id;
	}

	public void setNotice_id(Integer notice_id) {
		this.notice_id = notice_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPicurl() {
		return picurl;
	}

	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getSettop() {
		return settop;
	}

	public void setSettop(Integer settop) {
		this.settop = settop;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public Integer getHolderid() {
		return holderid;
	}

	public void setHolderid(Integer holderid) {
		this.holderid = holderid;
	}

	public Integer getReadcount() {
		return readcount;
	}

	public void setReadcount(Integer readcount) {
		this.readcount = readcount;
	}
}
