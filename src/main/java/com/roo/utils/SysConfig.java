package com.roo.utils;

import org.apache.commons.configuration.Configuration;
import org.apache.commons.configuration.PropertiesConfiguration;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;

public class SysConfig {
	
	private static final transient Logger logger = Logger.getLogger(SysConfig.class);
	public static Configuration config = null;
	static {
		try {
			logger.info("加载系统配置文件！！");
			config = new PropertiesConfiguration("config/system/system.properties");
		} catch (Exception e) {
		}
	}

	public static String getPropertiesStr(String key) {
		return config.getString(key);
	}

	public static int getPropertiesNum(String key) {
		try {
			return config.getInt(key);
		} catch (Exception e) {
			return -1 ;
		}
		
	}

	public static Boolean getPropertiesBoolean(String key) {
		try {
			return config.getBoolean(key);
		} catch (Exception e) {
			return false ;
		}
	}

	public static void main(String[] args) {
		String tableName = getPropertiesStr("server_ip");// URL
		System.out.println("============" + tableName);
	}
}
