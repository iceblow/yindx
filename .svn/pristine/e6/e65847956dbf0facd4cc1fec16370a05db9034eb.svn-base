package com.dianxin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dianxin.dao.EwRemindMapper;
import com.dianxin.model.bo.EwDevice;
import com.dianxin.model.bo.Floor;

@Transactional(readOnly=true)
@Service
public class EwRemindService {

	@Resource
	private EwRemindMapper ewRemindMapper;
	
	//分页检查
	public int selectTotal(Integer user_id) {
		if (user_id == null || user_id.intValue() == 0) {
			return ewRemindMapper.selectTotal();
		} else {
			return ewRemindMapper.selectTotalByUserId(user_id);
		}
	}
	
	public List<EwDevice> pageQuery(Integer user_id, Integer page, Integer page_size) {
		Integer startIndex =  (page - 1) * page_size + 1;
		if (user_id == null || user_id.intValue() == 0) {
			return ewRemindMapper.pageQuery(startIndex , startIndex + page_size - 1);
		} else {
			return ewRemindMapper.pageQueryByUserId(user_id, startIndex , startIndex + page_size - 1);
		}
	}
	
	//楼层图片定位取得
	public Floor selectFloorByUUID(int type, String uuid) {
		if (type == 2) {
			return ewRemindMapper.selectFiredetectors(uuid);
		} else if (type == 3) {
			return ewRemindMapper.selectNonmonitor(uuid);
		} else if (type == 4) {
			return ewRemindMapper.selectEnvdetectors(uuid);
		} else {
			return null;
		}
	}
}
