package com.dianxin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dianxin.dao.SettingMapper;
import com.dianxin.model.bo.Help;
import com.dianxin.model.bo.Setting;
import com.dianxin.model.vo.ScoreVo;

@Transactional(readOnly=true)
@Service
public class SettingService {

	@Resource
	private SettingMapper settingMapper;
	
	@Transactional(readOnly=false)
	public int feedback(Integer user_id, String content) {
		return settingMapper.insertFeedback(user_id, content);
	}
	
	//帮助中心
	public int selectHelpCount() {
		return settingMapper.selectHelpCount();
	}
	
	public List<Help> pageQueryHelp(Integer page, Integer page_size) {
		Integer startIndex =  (page - 1) * page_size + 1;
		Integer endIndex = startIndex + page_size - 1;
		
		return settingMapper.pageQueryHelp(startIndex , endIndex);
	}
	
	public Help selectHelpDetail(Integer help_id) {
		return settingMapper.selectHelpDetail(help_id);
	}

	@Transactional(readOnly=false)
	public int insertHelp(Help help) {
		return settingMapper.insertHelp(help);
	}
	
	//用户历史积分
	public int selectUserScoreHistoryCount(Integer user_id) {
		return settingMapper.selectUserScoreHistoryCount(user_id);
	}
	
	public List<ScoreVo> pageQueryUserScoreHistory(Integer user_id,Integer page, Integer page_size) {
		Integer startIndex =  (page - 1) * page_size + 1;
		Integer endIndex = startIndex + page_size - 1;
		
		return settingMapper.pageQueryUserScoreHistory(user_id, startIndex , endIndex);
	}

	public List<Setting> selectSetting() {
		return settingMapper.selectSetting();
	}

	public void updateSetting(String string, Integer setting) {
		settingMapper.updateSetting(string, setting);
	}
}
