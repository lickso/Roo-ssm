package com.roo.ssm.service; 
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.roo.ssm.bean.Advertise_Carousel;
import com.roo.ssm.bean.Shop;
import com.roo.ssm.bean.User;



    
  
public interface OutShowService {
	
	//查询首页轮播展示信息
	public List<Advertise_Carousel> queryAllAdvertise_Carousel();
	
	//主页店家信息展示
	public List<Shop> queryShopForInitShow(); 
	
} 