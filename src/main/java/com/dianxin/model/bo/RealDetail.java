package com.dianxin.model.bo;

import java.io.Serializable;
import java.util.List;

//实时告警详细字段
public class RealDetail extends Real  implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	//告警模板ID
	private Integer alarmtemplateid;
	
	//流程
	private List<AefRecordFlow> flow_list;

	public Integer getAlarmtemplateid() {
		return alarmtemplateid;
	}

	public void setAlarmtemplateid(Integer alarmtemplateid) {
		this.alarmtemplateid = alarmtemplateid;
	}

	public List<AefRecordFlow> getFlow_list() {
		return flow_list;
	}

	public void setFlow_list(List<AefRecordFlow> flow_list) {
		this.flow_list = flow_list;
	}
}
