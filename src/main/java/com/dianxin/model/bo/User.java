package com.dianxin.model.bo;

import java.io.Serializable;

/**
 * 用户信息
 */
public class User implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	//序号 对应关联表 user_id
	private Integer id;

	//用户名称
	private String username;
	
	//登陆账号
	private String loginid;
	
	//原始密码（解密后）
	private String password;

	//性别 0：未定义 1：男性 2：女性
	private  Integer gender;

	//手机号码
	private String mobile;
	
	//电话号码
	private String phone;
	
	//用户角色ID CHAR(36)
	private String roleid;
	
	//用户角色名称
	private String rolename;

	//用户所在查看组ID
	private Integer viewgroupid;
	
	//用户所在部门ID
	private Integer deptid;
	
	//用户所在部门名称
	private String deptname;
	
	private String titlename;
	//扩充字段
	//头像url
	private String avatar;
	
	private String email;
	
	private String viewgroupname;
	
	//积分
	private Integer score;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getLoginid() {
		return loginid;
	}

	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public Integer getViewgroupid() {
		return viewgroupid;
	}

	public void setViewgroupid(Integer viewgroupid) {
		this.viewgroupid = viewgroupid;
	}

	public Integer getDeptid() {
		return deptid;
	}

	public void setDeptid(Integer deptid) {
		this.deptid = deptid;
	}

	public String getDeptname() {
		return deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getTitlename() {
		return titlename;
	}

	public void setTitlename(String titlename) {
		this.titlename = titlename;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getViewgroupname() {
		return viewgroupname;
	}

	public void setViewgroupname(String viewgroupname) {
		this.viewgroupname = viewgroupname;
	}
	
}
