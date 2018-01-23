package com.example.demo.service;

import java.util.List;

import com.example.demo.util.PageUtils;
import com.example.demo.vo.JiLu;
import com.example.demo.vo.Ping;
import com.example.demo.vo.Shop;

public interface ShopService {

	List getUList(PageUtils pageUtil, String mohu, String pids, boolean haveGoods);

	Shop getlistById(String sid);

	void save(Shop shop);

	int getAllCount();

	List<Ping> getPingList();

	void add(JiLu jiLu);

	void updatePrice(int sid, double nowPrice);

	List<JiLu> getJiluList(int sid);

}
