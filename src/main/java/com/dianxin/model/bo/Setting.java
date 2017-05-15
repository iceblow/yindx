package com.dianxin.model.bo;

import java.io.Serializable;

public class Setting implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer setting_id;
	
	private String type;
	
	private Integer setting;

	public Integer getSetting_id() {
		return setting_id;
	}

	public void setSetting_id(Integer setting_id) {
		this.setting_id = setting_id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getSetting() {
		return setting;
	}

	public void setSetting(Integer setting) {
		this.setting = setting;
	}
}
