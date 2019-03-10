package com.roo.utils;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.annotation.Resource;

import org.apache.commons.configuration.Configuration;
import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;
import org.springframework.util.ResourceUtils;

import com.alibaba.fastjson.JSONObject;

public class RooCommonUtils {
	
	/*校验不为空*/
	public static String getJsonValue(JSONObject jsonObject , String key) {
		if(jsonObject == null || jsonObject.get(key) == null || jsonObject.get(key) == "") {
			return "";
		}
		return String.valueOf(jsonObject.get(key));
	}
	
	/*校验不为空，或空字符*/
	public static Boolean isEmptyJson(JSONObject jsonObject , String key) {
		if(jsonObject.get(key)==null || jsonObject.get(key)=="") {
			return true;
		}
		return false;
	}
	
	/*获取配置文件key列表*/
	public static List<String> getPropertiesKeyList(String propertiesUrl) throws ConfigurationException{
		List<String> keyList = new ArrayList<String>();
		
		//获取配置文件并加载
		/*Properties pps = new Properties();
		InputStream in = new BufferedInputStream(new FileInputStream(propertiesUrl));
		pps.load(in);*/
		
		//得到配置文件的名字
		/*Enumeration en = pps.propertyNames();
		while(en.hasMoreElements()) {
			keyList.add((String) en.nextElement());
		}*/
		
		Configuration config = null;
		config = new PropertiesConfiguration(propertiesUrl);
		Iterator<String> keys = config.getKeys();
		while(keys.hasNext()) {
			keyList.add(keys.next());
		}
		
		return keyList;
	}
	
	/*获取配置文件key列表*/
	public static List<String> getPropertiesValueList(String propertiesUrl) throws IOException{
		List<String> valueList = new ArrayList<String>();
		
		//获取配置文件并加载
		Properties pps = new Properties();
		InputStream in = new BufferedInputStream(new FileInputStream(propertiesUrl));
		pps.load(in);
		
		//得到配置文件的名字
		Enumeration en = pps.propertyNames();
		while(en.hasMoreElements()) {			
			String strKey = (String) en.nextElement();
			String strValue = pps.getProperty(strKey);
			valueList.add(strValue);
		}
		return valueList;
	}
	
	/*获取当前时间，存入数据库*/
	public static String getCurrentDate(){
		Date date = new Date();
		SimpleDateFormat Format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return String.valueOf(Format.format(date));
	}
	
	/*获取时间戳与2位随机数的连接数，当成主键*/
	/*public static int getCurrentTimestamp(){
		Random random=new Random();
		return Integer.parseInt(String.valueOf(System.currentTimeMillis())+String.valueOf(random.nextInt(100)));
	}*/
}
