package com.dianxin.model.bo;

import java.io.Serializable;
import java.util.Date;

public class AefRecordFlow implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	
	//工单编号
	private String recordid;
	
	//状态
	private Integer laststep;
	
	//处理者名
	private String holderid;
	
	//处理者电话
	private String telephonenumber;
	
	//创建时间
	private Date createtime;
	
	//相关内容1
	//LASTSTEP=12(已挂起)、13(已解挂)、15(已撤销)时是原因描述 LASTSTEP=17(电话保障)时是录音文件路径
	private String createcontent;
	
	//相关内容2
	//LASTSTEP=17(电话保障)时是是否存在录音文件0：没有  1：有
	//LASTSTEP=12(已挂起)时表示挂起时间 单位小时
	private Integer isrecordfile;
	
	//局站id
	private String aestationid;
	
	//模板id
	private Integer alarmtemplateid;
	
	//电话录音索引
	private String soundindex;
	
	//增加附加字段
	//处理名称
	private String stepname;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRecordid() {
		return recordid;
	}

	public void setRecordid(String recordid) {
		this.recordid = recordid;
	}

	public Integer getLaststep() {
		return laststep;
	}

	public void setLaststep(Integer laststep) {
		this.laststep = laststep;
	}

	public String getHolderid() {
		return holderid;
	}

	public void setHolderid(String holderid) {
		this.holderid = holderid;
	}

	public String getTelephonenumber() {
		return telephonenumber;
	}

	public void setTelephonenumber(String telephonenumber) {
		this.telephonenumber = telephonenumber;
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

	public String getAestationid() {
		return aestationid;
	}

	public void setAestationid(String aestationid) {
		this.aestationid = aestationid;
	}

	public Integer getAlarmtemplateid() {
		return alarmtemplateid;
	}

	public void setAlarmtemplateid(Integer alarmtemplateid) {
		this.alarmtemplateid = alarmtemplateid;
	}

	public String getSoundindex() {
		return soundindex;
	}

	public void setSoundindex(String soundindex) {
		this.soundindex = soundindex;
	}

	public String getStepname() {
		return stepname;
	}

	public void setStepname(String stepname) {
		this.stepname = stepname;
	}
}
