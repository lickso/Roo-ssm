package com.roo.ssm.dao; 

import java.util.List;

import com.roo.ssm.bean.Advertise_Carousel;

public interface Advertise_CarouselDao extends BaseDao{ 
	
	//查询首页轮播展示信息
	public List<Advertise_Carousel> queryAllAdvertise_Carousel();
	
}   