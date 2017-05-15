package com.dianxin.common;

import java.io.IOException;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class BaiduMapTool {
	
	//谷歌GPS,转换百度地图GPS
	private static String GEOCONV = "http://api.map.baidu.com/geoconv/v1/?coords=${coords}&ak=" + Consts.BAIDU_WEB_KEY + "&from=3";
	
	//百度地图反编码
	private static String GEOCODER = "http://api.map.baidu.com/geocoder/v2/?output=json&ak=" + Consts.BAIDU_WEB_KEY + "&location=${location}";
	
	public static JSONArray gpsToBaiduMap(String coords) {
//		try {
//			String gps = HttpRequest.do_get(GEOCONV.replace("${coords}", coords));
//			
//			JSONObject jsonObject = JSONObject.parseObject(gps);
//			int status = jsonObject.getIntValue("status");
//			if (status == 0) {
//				return jsonObject.getJSONArray("result");
//			}
//		} catch (IOException e) {
//			return null;
//		}
		return null;
	}
	
	public static String getAddressByGps(String longitude, String latitude) {
		try {
			String gps = HttpRequest.do_get(GEOCODER.replace("${location}", latitude + "," + longitude));
			
			JSONObject jsonObject = JSONObject.parseObject(gps);
			int status = jsonObject.getIntValue("status");
			if (status == 0) {
				JSONObject result = jsonObject.getJSONObject("result");
				return result.getString("formatted_address");
			}
		} catch (IOException e) {
			return null;
		}
		return null;
	}
	
	
}
