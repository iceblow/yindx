package com.dianxin.model.bo;

import java.io.Serializable;

public class DeviceType  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	//设备类型id
	private String typeid;
	
	//设备类型名称
	private String typename;

	public String getTypeid() {
		return typeid;
	}

	public void setTypeid(String typeid) {
		this.typeid = typeid;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}
}
