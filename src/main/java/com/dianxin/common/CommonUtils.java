package com.dianxin.common;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

import com.dianxin.model.bo.StationRange;
import com.dianxin.model.vo.AnalyseVo;
import com.dianxin.model.vo.YearAndCountVo;


public class CommonUtils {

	/**
	 * 读取配置文件
	 */
	public static Properties properties = new Properties();

	static {
		try {
			String path = "config.properties";
			InputStream inStream = CommonUtils.class.getClassLoader().getResourceAsStream(path);
			if (inStream == null) {
				inStream = CommonUtils.class.getClassLoader().getResourceAsStream("/" + path);
			}
			properties.load(inStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//工程访问路径
		public static String getWebRootUrl() {
			return properties.getProperty("webRootUrl");
		}
	/**
	 * @param date
	 * @param string
	 * @return
	 */
	public static String getTimeFormat(Date date, String string) {
		SimpleDateFormat sdFormat;
		if (StringUtils.isBlank(string)) {
			sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		} else {
			sdFormat = new SimpleDateFormat(string);
		}
		try {
			return sdFormat.format(date);
		} catch (Exception e) {
			return "";
		}
	}
	
	/**
	 * 检查路径是否存在，不存在则创建路径
	 * 
	 * @param path
	 */
	public static void checkPath(String path) {
		String[] paths = null;
		if (path.contains("/")) {
			paths = path.split(File.separator);
		} else {
			paths = path.split(File.separator + File.separator);
		}
		if (paths == null || paths.length == 0) {
			return;
		}
		String pathdir = "";
		for (String string : paths) {
			pathdir = pathdir + string + File.separator;
			File file = new File(pathdir);
			if (!file.exists()) {
				file.mkdir();
			}
		}
	}
	
	public class Point {  
        double x;  
        double y;
        
        public Point() {
        }
        
        public Point(Double longitude, Double latitude) {
			this.x = longitude.doubleValue();
			this.y = latitude.doubleValue();
		}
    }
	
	/** 
     * 返回一个点是否在一个多边形区域内 
     * 
     * @param mPoints 多边形坐标点列表 
     * @param point   待判断点 
     * @return true 多边形包含这个点,false 多边形未包含这个点。 
     */  
    public static boolean isPolygonContainsPoint(List<Point> mPoints, Point point) {  
        int nCross = 0;  
        for (int i = 0; i < mPoints.size(); i++) {  
            Point p1 = mPoints.get(i);  
            Point p2 = mPoints.get((i + 1) % mPoints.size());  
            // 取多边形任意一个边,做点point的水平延长线,求解与当前边的交点个数  
            // p1p2是水平线段,要么没有交点,要么有无限个交点  
            if (p1.y == p2.y)  
                continue;  
            // point 在p1p2 底部 --> 无交点  
            if (point.y < Math.min(p1.y, p2.y))  
                continue;  
            // point 在p1p2 顶部 --> 无交点  
            if (point.y >= Math.max(p1.y, p2.y))  
                continue;  
            // 求解 point点水平线与当前p1p2边的交点的 X 坐标  
            double x = (point.y - p1.y) * (p2.x - p1.x) / (p2.y - p1.y) + p1.x;  
            if (x > point.x) // 当x=point.x时,说明point在p1p2线段上  
                nCross++; // 只统计单边交点  
        }  
        // 单边交点为偶数，点在多边形之外 ---  
        return (nCross % 2 == 1);  
    }
    
    public static boolean isPolygonContainsStation(List<StationRange> mPoints, Double longitude, Double latitude) {
        int nCross = 0;
        for (int i = 0; i < mPoints.size(); i++) {  
        	StationRange p1 = mPoints.get(i);  
        	StationRange p2 = mPoints.get((i + 1) % mPoints.size());  
            // 取多边形任意一个边,做点point的水平延长线,求解与当前边的交点个数  
            // p1p2是水平线段,要么没有交点,要么有无限个交点  
            if (p1.getLatitude() == p2.getLatitude())  
                continue;  
            // point 在p1p2 底部 --> 无交点  
            if (latitude < Math.min(p1.getLatitude(), p2.getLatitude()))  
                continue;  
            // point 在p1p2 顶部 --> 无交点  
            if (latitude >= Math.max(p1.getLatitude(), p2.getLatitude()))  
                continue;  
            // 求解 point点水平线与当前p1p2边的交点的 X 坐标  
            double x = (latitude - p1.getLatitude()) * (p2.getLongitude() - p1.getLongitude()) / (p2.getLatitude() - p1.getLatitude()) + p1.getLongitude();  
            if (x > longitude) // 当x=point.x时,说明point在p1p2线段上  
                nCross++; // 只统计单边交点  
        }  
        // 单边交点为偶数，点在多边形之外 ---  
        return (nCross % 2 == 1);  
    }
  
    
    public static boolean isPtInPoly (List<StationRange> ps, double ALon , double ALat) {  
        int iSum, iCount, iIndex;  
        double dLon1 = 0, dLon2 = 0, dLat1 = 0, dLat2 = 0, dLon;  
        if (ps.size() < 3) {  
            return false;  
        }  
        iSum = 0;  
        iCount = ps.size();  
        for (iIndex = 0; iIndex<iCount;iIndex++) {  
            if (iIndex == iCount - 1) {  
                dLon1 = ps.get(iIndex).getX();  
                dLat1 = ps.get(iIndex).getY();  
                dLon2 = ps.get(0).getX();  
                dLat2 = ps.get(0).getY();  
            } else {  
                dLon1 = ps.get(iIndex).getX();  
                dLat1 = ps.get(iIndex).getY();  
                dLon2 = ps.get(iIndex + 1).getX();  
                dLat2 = ps.get(iIndex + 1).getY();  
            }  
            // 以下语句判断A点是否在边的两端点的水平平行线之间，在则可能有交点，开始判断交点是否在左射线上  
            if (((ALat >= dLat1) && (ALat < dLat2)) || ((ALat >= dLat2) && (ALat < dLat1))) {  
                if (Math.abs(dLat1 - dLat2) > 0) {  
                    //得到 A点向左射线与边的交点的x坐标：  
                    dLon = dLon1 - ((dLon1 - dLon2) * (dLat1 - ALat) ) / (dLat1 - dLat2);  
                    // 如果交点在A点左侧（说明是做射线与 边的交点），则射线与边的全部交点数加一：  
                    if (dLon < ALon) {  
                        iSum++;  
                    }  
                }  
            }  
        }  
        if ((iSum % 2) != 0) {  
            return true;  
        }  
        return false;  
    }
    
    public static Date getDateFormat(String date, String format) {
		if (isEmptyString(date))
			return null;
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		try {
			//System.out.println(sdf.parse(date));
			return sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
    
	public static boolean isEmptyString(String value) {
		if (value == null || value.length() == 0) {
			return true;
		}
		return false;
	}
	
	public static int parseInt(String string, int def) {
		if (isEmptyString(string))
			return def;
		int num = def;
		try {
			num = Integer.parseInt(string);
		} catch (Exception e) {
			num = def;
		}
		return num;
	}
	
	public static double parseDouble(String string, double def) {
		if (isEmptyString(string))
			return def;
		double num = def;
		try {
			num = Double.parseDouble(string);
		} catch (Exception e) {
			num = def;
		}
		return num;
	}
	
	/**
	 * 获取请求所有参数
	 * @param request
	 * @return
	 */
	public static Map<String,Object> getAllParams(HttpServletRequest request) {
		Map<String,Object> map = new HashMap<String,Object>();
		Enumeration paramNames = request.getParameterNames();
		while (paramNames.hasMoreElements()) {
			String paramName = (String) paramNames.nextElement();

			String[] paramValues = request.getParameterValues(paramName);
			if (paramValues.length == 1) {
				String paramValue = paramValues[0];
				if (paramValue.length() != 0) {
					map.put(paramName, paramValue);
				}
			}
		}
		return map;
	};
	
	//上传文件的目录
	public static String getLocationPath() {
		return properties.getProperty("uploadFilePath");
	}
	
	// 文件访问路径
	public static String getFileRootUrl() {
		return properties.getProperty("fileRootUrl");
	}
	
	public static List<YearAndCountVo> getAnalysList(List<AnalyseVo> list,boolean is,Integer istrue){
		Map<String, ArrayList> ss = null;
		if(list.size() > 0 && list.get(0).getMonth() == null){
			list.remove(0);
		}
		List<AnalyseVo> newList= new ArrayList<AnalyseVo>();
		if(is){
			
			Map<Integer,String > Key = new HashMap<Integer, String>();
			for (AnalyseVo analyseVo : list) {
				Key.put(analyseVo.getYear(), analyseVo.getYear().toString());
			}
			int []months = new int[]{1,2,3,4,5,6,7,8,9,10,11,12};
			for (Integer aKey : Key.keySet()) {
				for (int m : months) {
					AnalyseVo anTo = null;
					for (AnalyseVo a : list) {
						if(a.getYear() - aKey == 0 && a.getMonth() - m == 0){
							anTo = a;
						}
					}
					if(anTo != null){
						newList.add(anTo);
					}else{
						AnalyseVo newAn = new AnalyseVo();
						newAn.setCount(new BigInteger("0"));
						newAn.setMonth(m);
						newAn.setYear(aKey);
						newList.add(newAn);
					}
				}
			}
			ss = CommonUtils.sort(newList);
		}else{
			ss = CommonUtils.sort(list);
		}
		
		List<YearAndCountVo> ys = new ArrayList<YearAndCountVo>();
		int j = 0;
		Iterator it = ss.keySet().iterator();
		List<String> ysTo= new ArrayList<String>();
		while (it.hasNext()) {
			YearAndCountVo y = new YearAndCountVo();
			ArrayList list2 = ss.get(it.next());
			BigInteger [] count = new BigInteger[list2.size()];
			String [] month = new String[list2.size()];
			String  year = "";
			AnalyseVo s = (AnalyseVo) list2.get(0);
			year = s.getYear()+"";
			if(istrue == 0){
				ysTo.add(s.getYear()+"");
			}
			for (int i = 0; i < list2.size(); i++) {
				AnalyseVo sc = (AnalyseVo) list2.get(i);
				count[i] = sc.getCount();
				if(istrue > 0){
					ysTo.add(sc.getYear()+"年/"+sc.getMonth()+"月");
					month[i] = sc.getYear()+"年/"+sc.getMonth()+"月";
				}else{
					month[i] = sc.getMonth()+"月";
				}
			}
			y.setCount(count);
			y.setYear(year);
			y.setMonth(month);
			ys.add(y);
			j++;
		}
		String [] years = new String[ysTo.size()];
		for (int i = 0; i < years.length; i++) {
			years[i] = ysTo.get(i);

		}
		for (int i = 0; i < ys.size(); i++) {
			ys.get(i).setYears(years);
		}
		return ys;
	}
	public static Map<String, ArrayList> sort(List<AnalyseVo> list) {
		TreeMap tm = new TreeMap();
		for (int i = 0; i < list.size(); i++) {
			AnalyseVo s = (AnalyseVo) list.get(i);
			if (tm.containsKey(s.getYear())) {//
				ArrayList l11 = (ArrayList) tm.get(s.getYear());
				l11.add(s);
			} else {
				ArrayList tem = new ArrayList();
				tem.add(s);
				tm.put(s.getYear(), tem);
			}

		}
		return tm;
	}
}
