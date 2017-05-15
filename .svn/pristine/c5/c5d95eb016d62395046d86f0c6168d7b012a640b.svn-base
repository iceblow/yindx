package com.dianxin.common;

import java.io.Serializable;
import java.util.List;

/**
 * 分页查询封装类
 * @author wangcl
 *
 * @param <T>
 */
public class QueryResult<T> implements Serializable {

	private static final long serialVersionUID = 1L;
	private List<T> dataList;
	private long total;

	public QueryResult(){
		
	}
	
	public QueryResult(List<T> dataList, long total) {
		this.dataList = dataList;
		this.total = total;
	}

	public List<T> getDataList() {
		return dataList;
	}

	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "QueryResult [dataList=" + dataList + ", total=" + total + "]";
	}
}
