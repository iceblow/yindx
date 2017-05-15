package com.dianxin.service;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.dianxin.common.CommonUtils;
import com.dianxin.common.QueryResult;
import com.dianxin.dao.NoticeMapper;
import com.dianxin.model.bo.Notice;
import com.dianxin.model.vo.NoticeListVo;

@Transactional(readOnly=true)
@Service
public class NoticeService {

	public final static int every_page = 10;
	
	@Resource
	private NoticeMapper noticeMapper;

	//查找置顶的通知
	public  List<NoticeListVo> selectBannerList() {
		return noticeMapper.selectBannerList();
	}
	
	//查找最新的3条
	public List<NoticeListVo> selectTipsList() {
		return noticeMapper.selectTipsList();
	}
	
	//分页检查
	public int selectTotal(Integer type) {
		return noticeMapper.selectTotal(type);
	}
	public List<NoticeListVo> pageQuery(Integer type, Integer page, Integer page_size) {
		Integer startIndex =  (page - 1) * page_size + 1;
		return noticeMapper.pageQuery(type, startIndex , startIndex + page_size - 1);
	}
	
	//查找详细
	@Transactional(readOnly=false)
	public Notice selectNoticeDetail(Integer notice_id) {
		noticeMapper.updataNoticeRead(notice_id);
		return noticeMapper.selectNoticeDetail(notice_id);
	}
	
	//添加
	@Transactional(readOnly=false)
	public int addNotice(Notice notice) {
		return noticeMapper.addNotice(notice);
	}
	
	//上架 下架
	@Transactional(readOnly=false)
	public int updataNoticeStatus(Integer notice_id, Integer status) {
		return noticeMapper.updataNoticeStatus(notice_id, status);
	}
	
	//置顶 取消置顶
	@Transactional(readOnly=false)
	public int updataNoticeSettop(Integer notice_id, Integer settop) {
		return noticeMapper.updataNoticeSettop(notice_id, settop);
	}
	
	//置顶 取消置顶
	@Transactional(readOnly=false)
	public int deletenotice(Integer notice_id) {
		return noticeMapper.deletenotice(notice_id);
	}
	/**
	 * 通过查询条件获取公告
	 * @param selectVal
	 * @param start_time
	 * @param end_time
	 * @param page
	 */
	public QueryResult<Notice> selectNoticeBypage(String selectVal,String start_time,String end_time,String type,int page){
		if(page<1){
			page=1;
		}
		Map<String,Object> map = new HashMap<String,Object>();
		if(StringUtils.isNotEmpty(selectVal)){
			map.put("selectVal", "%"+selectVal+"%");
		}
		if(StringUtils.isNotEmpty(start_time)){
			map.put("start_time", CommonUtils.getDateFormat(start_time, "yyyy-MM-dd"));
		}
		if(StringUtils.isNotEmpty(end_time)){
			map.put("end_time", CommonUtils.getDateFormat(end_time, "yyyy-MM-dd"));
		}
		map.put("type", Integer.parseInt(type));
		map.put("start", (page-1)*every_page+1);
		map.put("end", page*every_page);
		List<Notice> list = noticeMapper.selectByInfo(map);
		QueryResult<Notice> result = new QueryResult<Notice>();
		result.setDataList(list);
		long total = noticeMapper.getCount(map);
		result.setTotal(total);
		return result;
	}
	
	@Transactional(readOnly=false)
	public int saveNotic(String title,String type,String content,String url,Integer useid,String username){
		Notice notice = new Notice();
		notice.setContent(content);
		notice.setCreatedate(new Date());
		notice.setHolderid(useid);
		notice.setHoldername(username);
		notice.setPicurl(url);
		notice.setReadcount(0);
		notice.setSettop(0);
		notice.setStatus(0);
		notice.setTitle(title);
		notice.setType(CommonUtils.parseInt(type, 0));
		try {
			int i = noticeMapper.addNoticePer(notice);
			return i;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}
	@Transactional(readOnly=false)
	public  int editNoticePic(String id,String img){
		try {
			int i = noticeMapper.updataNoticeImgUrl(CommonUtils.parseInt(id, 0), img);
			return i;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
	@Transactional(readOnly=false)
	public String saveFile(CommonsMultipartFile file){
		
		try {
			byte[] b = file.getBytes();
			String path = CommonUtils.getLocationPath();
			CommonUtils.checkPath(path);
			String myFileName = file.getOriginalFilename();
			int index = myFileName.lastIndexOf(".");
			String extension = "";
			if (index > 0) {
				extension = myFileName.substring(index, myFileName.length());
			}
			String filename = CommonUtils.getTimeFormat(new Date(), "yyyyMMddhhmmssSSS") + "_"
					+ (int) (Math.random() * 100) + extension;
			OutputStream out = new FileOutputStream(path + filename);
			out.write(b);
			out.flush();
			out.close();
			return path + filename;
		} catch (Exception e) {
			
		}
		return null;
	}
	
	public int modifi(Notice no){
		int  i = noticeMapper.updataNoticeBySelecter(no);
		return i;
	}
}
