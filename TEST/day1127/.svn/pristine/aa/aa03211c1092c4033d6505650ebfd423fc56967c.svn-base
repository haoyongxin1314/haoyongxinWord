package com.example.demo.controller;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ShopService;
import com.example.demo.util.PageUtils;
import com.example.demo.vo.JiLu;
import com.example.demo.vo.Ping;
import com.example.demo.vo.Shop;

@Controller
public class ShopController {
	
	public static DecimalFormat df = new DecimalFormat("##.##");
	
  @Autowired
  private ShopService service;
  
  @RequestMapping("tolist")
  public String tolist() {
	  
	  return "lists";
  }

  @RequestMapping("table")
  public String table(Model model) {
	  List<Ping> plist=service.getPingList();
	  model.addAttribute("plist", plist);
	  return "list";
  }
  
  @RequestMapping("list")
  @ResponseBody
  public Map<String,Object> list(int page,int rows,String mohu,String pids,boolean haveGoods) {
	   int TotalCount=service.getAllCount();
	   PageUtils pageUtil=new PageUtils(page+"", TotalCount, rows);
	   
	   List<Shop> list=service.getUList(pageUtil,mohu,pids,haveGoods);
	   
	   System.out.println(list);
	   Map<String,Object> map=new HashMap<String,Object>();
	   //加了分页之后，必须返回total ,total和rows固定写法
	   map.put("total", TotalCount);
	   map.put("rows", list);
	   
	  return map;
  }
  
  /**
   * "sid":sid,"nowPrice":nowPrice,"oldPrice":oldPrice
   * */
  @RequestMapping("savePrice")
  @ResponseBody
  public String savePrice(int sid,double nowPrice,double oldPrice) {
	  //第一步：新增记录表
	  double zhangfu=0.0;
	  zhangfu = (nowPrice-oldPrice)/oldPrice*100;
	  JiLu jiLu = new JiLu();
	  
	  jiLu.setSid(sid);
	  jiLu.setBeforeprice((int)oldPrice);
	  jiLu.setAfterprice((int)nowPrice);
	  jiLu.setZhangfu(Double.parseDouble(df.format(zhangfu)));
	  
	  service.add(jiLu);
	  
	  //第二步：修改商品表的价格
	  service.updatePrice(sid,nowPrice);
	  return "{\"success\":true}";//{"success":true}
  }
  @RequestMapping("getJiluList")
  @ResponseBody
  public List<JiLu> getJiluList(int sid) {
	  List<JiLu> plist=service.getJiluList(sid);
	  return plist;
  }
}
