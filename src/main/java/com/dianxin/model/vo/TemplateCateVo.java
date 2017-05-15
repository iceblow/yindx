package com.dianxin.model.vo;

import java.util.List;

public class TemplateCateVo {
	
	private Integer id;
	
	private String pname;
	
	private List<TemplateSubCateVo> subcates;
	
	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public List<TemplateSubCateVo> getSubcates() {
		return subcates;
	}

	public void setSubcates(List<TemplateSubCateVo> subcates) {
		this.subcates = subcates;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

}
