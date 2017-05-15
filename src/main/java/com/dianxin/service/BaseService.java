package com.dianxin.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dianxin.dao.RouteMapper;
import com.dianxin.dao.SellerMapper;
import com.dianxin.model.bo.Seller;

@Transactional(readOnly=true)
@Service
public class BaseService {

	@Resource
	protected SellerMapper sellerMapper;
	
	@Resource
	protected RouteMapper routeMapper;
	
	public Seller testQuery() {
		// TODO Auto-generated method stub
		return sellerMapper.selectByPrimaryKey(1);
	}
	
	
}
