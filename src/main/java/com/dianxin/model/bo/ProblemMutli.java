package com.dianxin.model.bo;

import java.io.Serializable;
import java.util.Date;

public class ProblemMutli implements Serializable{
	
	private static final long serialVersionUID = 1L;

	// 序号
	private Integer problem_mutli_id;
	
	// 隐患id
	private Integer problem_id;

	//媒体类型
	private Integer mediaType;

	//媒体文件后缀名
	private String fileExt;
	
	//文件地址记录
	private String fileUrl;
	
	//创建时间
	private Date createdate;

	public Integer getProblem_mutli_id() {
		return problem_mutli_id;
	}

	public void setProblem_mutli_id(Integer problem_mutli_id) {
		this.problem_mutli_id = problem_mutli_id;
	}

	public Integer getProblem_id() {
		return problem_id;
	}

	public void setProblem_id(Integer problem_id) {
		this.problem_id = problem_id;
	}

	public Integer getMediaType() {
		return mediaType;
	}

	public void setMediaType(Integer mediaType) {
		this.mediaType = mediaType;
	}

	public String getFileExt() {
		return fileExt;
	}

	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
	}

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
}
