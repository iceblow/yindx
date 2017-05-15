package com.dianxin.controller.api;

import com.alibaba.fastjson.JSON;

public class ApiResult {
	
	//返回1是正常
	private Integer code;
	
	private String message;

	public ApiResult(){
	}
	
	public ApiResult(Integer code){
		this.code = code;
	}
	
	//异常时调用
	public ApiResult(String message) {
		if (message != null && message.length() > 0) {
			this.code = 0;
			this.message = message;
		}
	}
	
	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String toString() {
		return JSON.toJSONString(this);
	}
}
