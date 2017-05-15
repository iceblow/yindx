package com.dianxin.model.bo;

import java.io.Serializable;
import java.util.Date;

public class RealExp implements Serializable {
	
	private static final long serialVersionUID = 1L;

	//工单编号
	private String aefid;
	
	//用户id
	private Integer user_id;
	
	//处理描述
	private String content;
	
	//图片urls
	private String imgs;
	
	//音频url
	private String audio;
	
	//创建时间
	private Date createdate;

	public String getAefid() {
		return aefid;
	}

	public void setAefid(String aefid) {
		this.aefid = aefid;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImgs() {
		return imgs;
	}

	public void setImgs(String imgs) {
		this.imgs = imgs;
	}

	public String getAudio() {
		return audio;
	}

	public void setAudio(String audio) {
		this.audio = audio;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
}
