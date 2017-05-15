package com.dianxin.model.bo;

import java.io.Serializable;
import java.util.Date;

public class RouteCate implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer route_cate_id;
	
	private Integer route_id;
	
	private Integer category_id;
	
	private Integer pid;
	
	private Date createdate;
	
	private String category_name;
	
	private String pname;
	
	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getRoute_cate_id() {
		return route_cate_id;
	}

	public void setRoute_cate_id(Integer route_cate_id) {
		this.route_cate_id = route_cate_id;
	}

	public Integer getRoute_id() {
		return route_id;
	}

	public void setRoute_id(Integer route_id) {
		this.route_id = route_id;
	}

	public Integer getCategory_id() {
		return category_id;
	}

	public void setCategory_id(Integer category_id) {
		this.category_id = category_id;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
}
