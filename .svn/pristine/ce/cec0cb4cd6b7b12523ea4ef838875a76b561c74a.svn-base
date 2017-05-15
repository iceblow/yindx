package com.dianxin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dianxin.model.bo.Notice;
import com.dianxin.model.vo.NoticeListVo;

public interface NoticeMapper {
	
	//查找置顶的通知
	List<NoticeListVo> selectBannerList();
	
	//查找最新的3条
	List<NoticeListVo> selectTipsList();
	
	//查找详细
	Notice selectNoticeDetail(Integer notice_id);
	int updataNoticeRead(Integer notice_id);
	
	//添加
	int addNotice(Notice notice);
	
	//添加
	int addNoticePer(Notice notice);
	
	//上架 下架
	int updataNoticeStatus(@Param(value="notice_id")Integer notice_id, @Param(value="status")Integer status);
	
	//置顶 取消置顶
	int updataNoticeSettop(@Param(value="notice_id")Integer notice_id, @Param(value="settop")Integer settop);
	//删除
	int deletenotice(Integer id);
	
	//通过条件来修改
	int updataNoticeBySelecter(Notice no);
	
	//
	int updataNoticeImgUrl(@Param(value="notice_id")Integer notice_id, @Param(value="imgurl")String imgurl);
	
	//分页检查
	int selectTotal(Integer type);
	List<NoticeListVo> pageQuery(@Param(value="type")Integer type,@Param(value="startIndex")Integer startIndex, @Param(value="endIndex") Integer endIndex);
	
	//通过条件获取信息
	List<Notice> selectByInfo(Map<String,Object> map);
	//获取信息总数
	long getCount(Map<String,Object> map);
}
