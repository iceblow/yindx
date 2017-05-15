package com.dianxin.model.bo;

import java.io.Serializable;
import java.util.Date;

public class ProblemFlow implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	// 序号
	private Integer problem_flow_id;
	
	// 隐患序号
	private Integer problem_id;
	
	private Integer laststep;
	
	private Integer holderid;
	
	private Date createtime;
	
	private String createcontent;
	
	private Integer isrecordfile;
	
	private String imgs;
	
	private String audio;
	
	private Integer score;
	
	private String username;
	
	private String full_deptname;

	public Integer getProblem_flow_id() {
		return problem_flow_id;
	}

	public void setProblem_flow_id(Integer problem_flow_id) {
		this.problem_flow_id = problem_flow_id;
	}

	public Integer getProblem_id() {
		return problem_id;
	}

	public void setProblem_id(Integer problem_id) {
		this.problem_id = problem_id;
	}

	public Integer getLaststep() {
		return laststep;
	}

	public void setLaststep(Integer laststep) {
		this.laststep = laststep;
	}

	public Integer getHolderid() {
		return holderid;
	}

	public void setHolderid(Integer holderid) {
		this.holderid = holderid;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public String getCreatecontent() {
		return createcontent;
	}

	public void setCreatecontent(String createcontent) {
		this.createcontent = createcontent;
	}

	public Integer getIsrecordfile() {
		return isrecordfile;
	}

	public void setIsrecordfile(Integer isrecordfile) {
		this.isrecordfile = isrecordfile;
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

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFull_deptname() {
		return full_deptname;
	}

	public void setFull_deptname(String full_deptname) {
		this.full_deptname = full_deptname;
	}
}
