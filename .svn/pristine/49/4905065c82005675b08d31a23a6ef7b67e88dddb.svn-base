package com.dianxin.controller.api;

import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.dianxin.model.bo.Route;
import com.dianxin.service.RouteService;

@Component("routeTaskJob")
public class RouteTaskJob {

	@Resource
	private RouteService routeService;
	
	@Scheduled(cron = "0 0 0 * * ?")  
    public void routeFrequency() {  
        System.out.println("任务进行中。。。");  
        
        List<Route> routeList = routeService.selectRenewRoute();
        
        for (Route route : routeList) {

        	GregorianCalendar gc=new GregorianCalendar();
        	gc.setTime(route.getReceivestart());
        	
        	//频次 1-每天 2-每周 3-每月 4-每季 5-半年 6-每年
        	if (route.getFrequency() == 1) {
        		
        		int code  = routeService.renewRoute(route);
        		if (code == 0) {
        	        System.out.println(route.getRoute_id() + " 每天巡检记录再生失败");  
        		}
        	} else if (route.getFrequency() == 2) {
        		gc.add(3, 1);
        		
        		if (new Date().getTime() >= gc.getTime().getTime()) {

            		int code  = routeService.renewRoute(route);
            		if (code == 0) {
            	        System.out.println(route.getRoute_id() + " 每周巡检记录再生失败");  
            		}
        		}
        	} else if (route.getFrequency() == 3) {
        		gc.add(2, 1);
        		
        		if (new Date().getTime() >= gc.getTime().getTime()) {

            		int code  = routeService.renewRoute(route);
            		if (code == 0) {
            	        System.out.println(route.getRoute_id() + " 每月巡检记录再生失败");  
            		}
        		}
        	} else if (route.getFrequency() == 4) {
        		gc.add(2, +3);
        		
        		if (new Date().getTime() >= gc.getTime().getTime()) {

            		int code  = routeService.renewRoute(route);
            		if (code == 0) {
            	        System.out.println(route.getRoute_id() + " 每季巡检记录再生失败");  
            		}
        		}
        	} else if (route.getFrequency() == 5) {
        		gc.add(2, +6);
        		
        		if (new Date().getTime() >= gc.getTime().getTime()) {

            		int code  = routeService.renewRoute(route);
            		if (code == 0) {
            	        System.out.println(route.getRoute_id() + " 半年巡检记录再生失败");  
            		}
        		}
        	} else if (route.getFrequency() == 6) {
        		gc.add(1, +1);
        		
        		if (new Date().getTime() >= gc.getTime().getTime()) {

            		int code  = routeService.renewRoute(route);
            		if (code == 0) {
            	        System.out.println(route.getRoute_id() + " 每年巡检记录再生失败");  
            		}
        		}
        	}
        }
        
    }
}
