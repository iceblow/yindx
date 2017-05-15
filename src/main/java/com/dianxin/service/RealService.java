package com.dianxin.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dianxin.common.BaiduMapTool;
import com.dianxin.dao.RealMapper;
import com.dianxin.dao.StationMapper;
import com.dianxin.dao.UserMapper;
import com.dianxin.model.bo.AefRecordFlow;
import com.dianxin.model.bo.Real;
import com.dianxin.model.bo.RealDetail;
import com.dianxin.model.bo.RealExp;
import com.dianxin.model.bo.Station;
import com.dianxin.model.bo.User;

@Transactional(readOnly=true)
@Service
public class RealService {

	@Resource
	private RealMapper realMapper;
	
	@Resource
	private StationMapper stationMapper;
	
	@Resource
	private UserMapper userMapper;
	
	//取用户相关未完成的数量
	public int selectCountNotEnd(Integer user_id) {
		return realMapper.selectCountNotEnd(user_id);
	}
	
	@Transactional(readOnly=false)
	public List<Real> pageQueryNotEnd(Integer page, Integer page_size, Integer user_id) {
		Integer startIndex =  (page - 1) * page_size + 1;
		Integer endIndex = startIndex + page_size - 1;
		
		List<Real> list =  realMapper.pageQueryNotEnd(startIndex , endIndex,  user_id);
		
		//百度地图转换
		List<String> stations = new ArrayList<String>();
		List<String> coods = new ArrayList<String>();
		for (Real real : list) {
			//谷歌地址
			if (real.getLoctype() == 0) {
				String station_id = real.getStation_id();
				if (stations.contains(station_id)) {
					//相同地址不需要处理
				} else {
					stations.add(real.getStation_id());
					coods.add(real.getLongitude() + "," + real.getLatitude());
				}
			}
		}
		
		//有经纬度需要转换
		if (coods != null && coods.size() > 0) {
			JSONArray json = BaiduMapTool.gpsToBaiduMap(StringUtils.join(coods, ";"));
			if (json != null) {
			
				for (int i = 0; i< stations.size() && i< json.size();i++) {
					
					JSONObject object = json.getJSONObject(i);
					if (object.isEmpty()) {
						continue;
					}
					Double longitude = object.getDouble("x");
					Double latitude = object.getDouble("y");
					
					String address = BaiduMapTool.getAddressByGps(longitude.toString(), latitude.toString());
					
					if (address != null) {
						
						//地址保存
						Station station = new Station();
						station.setStation_id(stations.get(i));
						station.setLatitude(latitude);
						station.setLongitude(longitude);
						station.setAddress(address);
						
						stationMapper.insertStationLocation(station);
					}
					
					for (Real real : list) {
						//谷歌地址
						if (real.getLoctype() == 0 && real.getStation_id().equals(stations.get(i))) {
							real.setAddress(address);
							real.setLatitude(latitude);
							real.setLongitude(longitude);
						}
					}
				}
			}
		}
		
		return list;
	}
	
	//取告警详细
	public RealDetail getRealDetail(String aefid) {
		RealDetail detail = realMapper.selectRealDetail(aefid);
		if (detail == null) return null;
		List<AefRecordFlow> flows = realMapper.selectFlowsById(aefid);
		detail.setFlow_list(flows);
		return detail;
	}
	
	//告警流程取得
	public List<AefRecordFlow> getRealFlows(String aefid) {
		return realMapper.selectFlowsById(aefid);
	}

	@Transactional(readOnly=false)
	public int handleReal(String aefid, Integer user_id, String content, String imgs, String audio) {
		RealDetail detail = realMapper.selectRealDetail(aefid);
		User user = userMapper.selectByPrimaryKey(user_id);
		if (detail == null || user == null) {
			return 0;
		}
		AefRecordFlow flow = new AefRecordFlow();
		flow.setRecordid(detail.getAefid());
		flow.setLaststep(11);
		flow.setHolderid(user.getUsername());
		flow.setTelephonenumber(user.getPhone());
		flow.setIsrecordfile(0);
		flow.setAestationid(detail.getStation_id());
		flow.setAlarmtemplateid(detail.getAlarmtemplateid());
		
		int code = realMapper.insertRealFlow(flow);
		if (code == 1) {
			
			//实时告警状态修改
			realMapper.updateAefRecord(aefid);
			
			//处理内容本地保存
			RealExp realExp = new RealExp();
			realExp.setAefid(aefid);
			realExp.setUser_id(user_id);
			realExp.setContent(content);
			realExp.setImgs(imgs);
			realExp.setAudio(audio);
			
			realMapper.insertRealExp(realExp);
		}
		return code;
	}
}
