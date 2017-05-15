package com.dianxin.model.bo;

import java.io.Serializable;
import java.util.Date;

public class Feedback implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer feedback_id;
	
	private String content;
	
	private Integer user_id;
	
	private Date updatedate;
	
	private String username;

	public Integer getFeedback_id() {
		return feedback_id;
	}

	public void setFeedback_id(Integer feedback_id) {
		this.feedback_id = feedback_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
}
