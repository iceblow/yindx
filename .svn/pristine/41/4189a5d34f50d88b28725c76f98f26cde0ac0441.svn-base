package com.dianxin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dianxin.model.bo.Route;
import com.dianxin.model.bo.RouteCate;
import com.dianxin.model.bo.RouteCateCheck;
import com.dianxin.model.bo.RouteFlow;

//巡检
public interface RouteMapper {
	
	//巡检发布
	int insertRoute(Route route);
	int insertRouteCate(RouteCate cate);
	int insertRouteFlow(RouteFlow flow);
	
	//取用户相关未完成的数量
	int selectCountNotEnd(Integer user_id);
	List<Route> pageQueryNotEnd(@Param(value="startIndex")Integer startIndex, @Param(value="endIndex") Integer endIndex,@Param(value="user_id")Integer user_id);

	//巡检处理流程
	List<RouteFlow> selectRouteFlow(Integer route_id);
	
	Route selectRouteById(Integer route_id);
	
	//巡检分类
	List<RouteCate> selectRouteCate(Integer route_id);
	
	int addRouteFlow(RouteFlow routeFlow);
	
	int addRouteCheck(RouteCateCheck routeCateCheck);
	
	int updateRouteStep(@Param(value="route_id")Integer route_id,@Param(value="laststep")Integer laststep);
	
	int queryListCount(@Param(value="daqu") Integer daqu,
			@Param(value="xiaoqu")Integer xiaoqu,@Param(value="people")Integer people,@Param(value="state") Integer state, @Param(value="frequency") Integer frequency,@Param(value="start")String start,@Param(value="end") String end);
	
	int queryPublicListCount(@Param(value="daqu") String daqu,
			@Param(value="xiaoqu")String xiaoqu,@Param(value="people")String people,@Param(value="frequency") String frequency, @Param(value="start")String start,@Param(value="end") String end);
	
	List<Route> queryPublicList(@Param(value="startIndex")Integer startIndex, @Param(value="endIndex") Integer endIndex,@Param(value="daqu") String daqu,
			@Param(value="xiaoqu")String xiaoqu,@Param(value="people")String people,@Param(value="frequency") String frequency, @Param(value="start")String start,@Param(value="end") String end);
	
	
	List<Route> queryList(@Param(value="startIndex")Integer startIndex, @Param(value="endIndex") Integer endIndex,@Param(value="daqu") Integer daqu,
			@Param(value="xiaoqu")Integer xiaoqu,@Param(value="people")Integer people,@Param(value="state") Integer state, @Param(value="frequency") Integer frequency,@Param(value="start")String start,@Param(value="end") String end);
	
	
	List<RouteCateCheck> selectRouteCateCheckByFlowId(@Param(value="id")Integer id);
	
	List<RouteCateCheck> selectRouteCateCheckByPid(@Param(value="id")Integer id);
	
	RouteCate  selectRouteCateById(@Param(value="id")Integer id);
	
	//频次查找
	List<Route> selectRenewRoute();
	int updateRouteRenew(Integer route_id);
}
