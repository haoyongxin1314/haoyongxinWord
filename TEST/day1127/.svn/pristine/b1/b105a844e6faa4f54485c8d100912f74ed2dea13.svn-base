package com.example.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ShopDao;
import com.example.demo.service.ShopService;
import com.example.demo.util.PageUtils;
import com.example.demo.vo.JiLu;
import com.example.demo.vo.Ping;
import com.example.demo.vo.Shop;
@Service
public class ShopServiceImpl implements ShopService{
    @Autowired
    private ShopDao dao;

	@Override
	public List getUList(PageUtils pageUtil, String mohu, String pids, boolean haveGoods) {
		// TODO Auto-generated method stub
		return dao.getUList(pageUtil,mohu,pids,haveGoods);
	}

	@Override
	public Shop getlistById(String sid) {
		// TODO Auto-generated method stub
		return dao.getlistById(sid);
	}

	@Override
	public void save(Shop shop) {
		// TODO Auto-generated method stub
		dao.save(shop);
	}

	@Override
	public int getAllCount() {
		// TODO Auto-generated method stub
		return dao.getAllCount();
	}

	@Override
	public List<Ping> getPingList() {
		// TODO Auto-generated method stub
		return dao.getPingList();
	}

	@Override
	public void add(JiLu jiLu) {
		// TODO Auto-generated method stub
		dao.add(jiLu);
	}

	@Override
	public void updatePrice(int sid, double nowPrice) {
		// TODO Auto-generated method stub
		dao.updatePrice(sid,nowPrice);
	}

	@Override
	public List<JiLu> getJiluList(int sid) {
		// TODO Auto-generated method stub
		return dao.getJiluList(sid);
	}
    
}
