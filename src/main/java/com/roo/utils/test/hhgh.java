package com.roo.utils.test;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

public class hhgh {
	
	
	@SuppressWarnings("null")
	public static void main(String[] args) {
//		List<Integer> orderProductList = new ArrayList<Integer>() ;
//		orderProductList.add(1);
//		orderProductList.add(1);
//		System.out.println((int)orderProductList.get(0));
		
		int kj = 1526646097;
		
		// 精确到毫秒
        // 获取当前时间戳
        System.out.println(System.currentTimeMillis());
        System.out.println(Calendar.getInstance().getTimeInMillis());
        System.out.println(new Date().getTime());
        System.out.println(System.currentTimeMillis()/3600 + "h" );
        
        Random random=new Random();
        for(int i=0;i<100;i++) {
        	
        	System.out.println(random.nextInt(100));
        }
	}
}
