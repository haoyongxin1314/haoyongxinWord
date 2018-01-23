package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.util.PageUtils;
import com.example.demo.vo.JiLu;
import com.example.demo.vo.Ping;
import com.example.demo.vo.Shop;

@Mapper
public interface ShopDao {

	List getUList(@Param("page")PageUtils pageUtil,@Param("mohu")String mohu,@Param("pids")String pids,@Param("haveGoods")boolean haveGoods);

	Shop getlistById(String sid);

	void save(Shop shop);
	
	int getAllCount();

	List<Ping> getPingList();

	void add(JiLu jiLu);

	void updatePrice(@Param("sid")int sid, @Param("nowPrice")double nowPrice);

	List<JiLu> getJiluList(int sid);
      
}
