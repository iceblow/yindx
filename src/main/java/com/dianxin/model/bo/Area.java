package com.dianxin.model.bo;

import java.io.Serializable;

/**
 * 大区信息
 */
public class Area implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	//大区id
	private String area_id;
	
	//大区名称
	private String area_name;

	public String getArea_id() {
		return area_id;
	}

	public void setArea_id(String area_id) {
		this.area_id = area_id;
	}

	public String getArea_name() {
		return area_name;
	}

	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}
}
