package com.roo.utils;

import java.util.HashMap;
import java.util.Map;

public class LocalConstants {
	
	/*公共参数返回集合*/
	public static abstract interface RESP_SET {
		/*
		 * 框架返回key值
		 */
		String RESP_OUTOBJECT = "rtnObject";
		String RESP_CODE = "rtnCode";
		String RESP_MSG = "rtnMsg";
		String RESP_OBJECT = "object";
		String RESP_URL = "rtnUrl";
		String RESP_DESC = "rtnDesc";
		
		/*
		 * 框架返回编码
		 * 2-需要登录
		 */
		String RESP_CODE_SUCCESS = "1";
		String RESP_CODE_FAIL = "0";
		String RESP_CODE_NEED_LOGIN = "2";
		
		/*
		 * 框架返回值
		 */
		String RESP_MSG_SUCCESS = "成功";
		String RESP_MSG_FAIL = "失败";
		
		/*
		 * 登录相关返回信息
		 */
/*		String RESP_DESC_LOGIN_TIP_CODE = "请先进行登录";
		String RESP_DESC_LOGIN_SUCCESS_CODE = "登录成功";
		String RESP_DESC_LOGIN_USERNULL_CODE = "用户名不存在";		
		String RESP_DESC_LOGIN_USERERROR_CODE = "用户名或密码错误";*/
		String RESP_DESC_LOGIN_TIP = "请先进行登录";
		String RESP_DESC_LOGIN_SUCCESS = "登录成功";
		String RESP_DESC_LOGIN_USERNULL = "用户名不存在";		
		String RESP_DESC_LOGIN_USERERROR = "用户名或密码错误";
		
		/*
		 * 注册相关返回信息
		 */
		String RESP_DESC_REGISTER_HASEXIST_CODE = "2";
		String RESP_DESC_REGISTER_SUCCESS_CODE = "1";
		String RESP_DESC_REGISTER_FAIL_CODE = "0";
		String RESP_DESC_REGISTER_HASEXIST = "用户名已存在";
		String RESP_DESC_REGISTER_SUCCESS = "注册成功";
		String RESP_DESC_REGISTER_FAIL = "注册失败";		
	}
	
	/*项目页面地址*/
	public static abstract interface PAGE_URL_SET {
		
		
		String INDEX_PAGE = "/WEB-INF/common/index/index";
		String SHOW_PRODLIST_PAGE = "/WEB-INF/common/index/showProdList";
		String SHOW_PROD_PAGE = "/WEB-INF/common/index/showProd";
		
		String ERROR_500_PAGE = "/WEB-INF/common/error/500";
		String ERROR_404_PAGE = "/WEB-INF/common/error/404";
		String ERROR_ERROR_PAGE = "/WEB-INF/common/error/error";
	}
	
	/*请求地址集合*/
	public static abstract interface URL_SET {
		
		//登录
		/*String PURL_LOGIN = "common/userLogin.action";*/
		String PURL_LOGIN = "/WEB-INF/common/index/index";
		
	}
	
	private static final Map<String,String>  RESP_CODE = new HashMap<String,String>();
	static{
		RESP_CODE.put("0", "失败");
		RESP_CODE.put("1", "成功");
	}
	public static String getRespCode(String key) {
		return RESP_CODE.get(key);
	}
	
	public static abstract interface HEAD_PUB_INFO {
		String CHANNEL = "channelId";
		String STAFFID = "staffId";
	}
	
	public static abstract interface INTER_CS_INTERFACE_URL {
		
		String LOCAL_RHKF_SATISFY_SMS_URL = "rhkfsatisfysmsurl";		
		String LOCAL_KF_INTERFACE_URL = "kfopenplatformurl";
	}
	
	/*分页参数设置集合*/
	public static abstract interface PAGE_SET {
		
		//设置分页的大小为10
		int PAGE_SIZE = 10;
	}
	
	
	/*
	 * 展示设置集合
	 */
	public static abstract interface ADVERTISE_SET {
		
		//设置分页的大小为10
		int PAGE_SIZE = 10;
	}
	
	/**
	 *订单状态
	 *下单 1
	 *退单 2
	 *接单 3
	 *完成 4
	 *验收 5
	 *追加 6
	 *二次接单 7
	 *二次完成 8
	 */
}
