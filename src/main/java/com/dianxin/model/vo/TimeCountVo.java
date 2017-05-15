package com.dianxin.model.vo;

import java.io.Serializable;

public class TimeCountVo implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String time;
	
	private Integer count;

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
}
