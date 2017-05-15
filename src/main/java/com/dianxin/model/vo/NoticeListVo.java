package com.dianxin.model.vo;

import java.io.Serializable;

public class NoticeListVo  implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	//公告序号
	private Integer notice_id;
	
	//标题
	private String title;
	
	//展示图片url
	private String picurl;
	
	//类型
	private Integer type;

	private Integer readcount;
	
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

	public Integer getReadcount() {
		return readcount;
	}

	public void setReadcount(Integer readcount) {
		this.readcount = readcount;
	}
}
