package com.dianxin.model.bo;

import java.io.Serializable;

public class Floor implements Serializable {
	
	private static final long serialVersionUID = 1L;

	//楼层id
	private String floor_id;
	
	//楼层平面图定位信息（FD_POSX、FD_POSY
	private Double fd_posx;
	
	private Double fd_posy;
	
	//楼层图片
	private byte[] map;

	public String getFloor_id() {
		return floor_id;
	}

	public void setFloor_id(String floor_id) {
		this.floor_id = floor_id;
	}

	public Double getFd_posx() {
		return fd_posx;
	}

	public void setFd_posx(Double fd_posx) {
		this.fd_posx = fd_posx;
	}

	public Double getFd_posy() {
		return fd_posy;
	}

	public void setFd_posy(Double fd_posy) {
		this.fd_posy = fd_posy;
	}

	public byte[] getMap() {
		return map;
	}

	public void setMap(byte[] map) {
		this.map = map;
	}
}
