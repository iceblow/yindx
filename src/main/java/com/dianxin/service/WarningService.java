package com.dianxin.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dianxin.dao.EwRemindMapper;
import com.dianxin.model.bo.EwDevice;
@Transactional(readOnly=true)
@Service("warningService")
public class WarningService {
	
	@Resource
	private EwRemindMapper ewRemindMapper;

	public int queryListCount(String daqu, String xiaoqu, String shebei, String start_date, String end_date) {
		if(StringUtils.isNotEmpty(daqu)){
			daqu = daqu+"%";
		}
		return ewRemindMapper.queryListCount(daqu,xiaoqu,shebei,start_date,end_date);
	}

	public List<EwDevice> queryList(Integer page, Integer page_size, String daqu, String xiaoqu, String shebei, String start_date, String end_date) {
		Integer startIndex =  (page - 1) * page_size + 1;
		Integer endIndex = startIndex + page_size - 1;
		if(StringUtils.isNotEmpty(daqu)){
			daqu = daqu+"%";
		}
		List<EwDevice> checkList = ewRemindMapper.queryList(startIndex , endIndex,daqu,xiaoqu,shebei,start_date,end_date);
		return checkList;
	}

}
