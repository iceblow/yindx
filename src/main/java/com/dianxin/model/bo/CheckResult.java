package com.dianxin.model.bo;

import java.io.Serializable;
import java.util.List;

public class CheckResult implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer check_result_id;
	
	private Integer check_flow_id;
	
	private Integer check_id;
	
	private String content;
	
	private Integer result;
	
	private Integer problem_id;

	private Check check;

	public Check getCheck() {
		return check;
	}

	public void setCheck(Check check) {
		this.check = check;
	}

	public Integer getCheck_result_id() {
		return check_result_id;
	}

	public void setCheck_result_id(Integer check_result_id) {
		this.check_result_id = check_result_id;
	}

	public Integer getCheck_flow_id() {
		return check_flow_id;
	}

	public void setCheck_flow_id(Integer check_flow_id) {
		this.check_flow_id = check_flow_id;
	}

	public Integer getCheck_id() {
		return check_id;
	}

	public void setCheck_id(Integer check_id) {
		this.check_id = check_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getResult() {
		return result;
	}

	public void setResult(Integer result) {
		this.result = result;
	}

	public Integer getProblem_id() {
		return problem_id;
	}

	public void setProblem_id(Integer problem_id) {
		this.problem_id = problem_id;
	}
}
