package com.roo.ssm.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.roo.utils.LocalConstants;

public class BaseController {
	private static final transient Logger logger = Logger.getLogger(BaseController.class);
	
	/*字符串格式入参获取*/
	public String getInputString(HttpServletRequest request){
		
		BufferedReader br=null;
		String reqStr = "";
		try {
			request.setCharacterEncoding("UTF-8");
			br = new BufferedReader(new InputStreamReader( request.getInputStream(),"utf-8"));
			String line = null;
		    StringBuilder sb = new StringBuilder();
		    while((line = br.readLine())!=null){
	            sb.append(line);
	        }
		    reqStr = String.valueOf(sb);
		    logger.info("核心请求的入参：" + String.valueOf(sb));
		}catch (UnsupportedEncodingException e) {
			logger.info("请求入参编码异常！");
			e.printStackTrace();
		}catch (IOException e) {
			logger.info("io流异常！");
			e.printStackTrace();
		}finally {
			try {
				if(null != br) {
					br.close();
				}
			} catch (IOException e) {
				logger.info("关闭读取流失败！");
				e.printStackTrace();
			}
		}
        logger.info("核心请求的地址：" + String.valueOf(request.getRequestURL()));
        
        return reqStr;
	}
	
	/*json格式入参获取*/
	public JSONObject getInputObject(HttpServletRequest request){
		
		BufferedReader br=null;
		String reqStr = "";
		try {
			request.setCharacterEncoding("UTF-8");
			br = new BufferedReader(new InputStreamReader( request.getInputStream(),"utf-8"));
			String line = null;
		    StringBuilder sb = new StringBuilder();
		    while((line = br.readLine())!=null){
	            sb.append(line);
	        }
		    reqStr = String.valueOf(sb);
		    logger.info("核心请求的入参：" + String.valueOf(sb));
		}catch (UnsupportedEncodingException e) {
			logger.info("请求入参编码异常！");
			e.printStackTrace();
		}catch (IOException e) {
			logger.info("io流异常！");
			e.printStackTrace();
		}finally {
			try {
				if(null != br) {
					br.close();
				}
			} catch (IOException e) {
				logger.info("关闭读取流失败！");
				e.printStackTrace();
			}
		}
        logger.info("核心请求的地址：" + String.valueOf(request.getRequestURL()));
        
        return (JSONObject) JSON.parse(reqStr);
	}
	
	/*返回给接口*/
	public String respOutObject(JSONObject respJson){
		JSONObject respOutJson = new JSONObject();
		try{
			respOutJson.put(LocalConstants.RESP_SET.RESP_CODE,LocalConstants.RESP_SET.RESP_CODE_SUCCESS);
			respOutJson.put(LocalConstants.RESP_SET.RESP_MSG,LocalConstants.RESP_SET.RESP_MSG_SUCCESS);
			respOutJson.put(LocalConstants.RESP_SET.RESP_OBJECT,respJson);
		}catch(Exception e) {
			respOutJson.put(LocalConstants.RESP_SET.RESP_CODE,LocalConstants.RESP_SET.RESP_CODE_FAIL);
			respOutJson.put(LocalConstants.RESP_SET.RESP_MSG,LocalConstants.RESP_SET.RESP_MSG_FAIL);
			respOutJson.put(LocalConstants.RESP_SET.RESP_OBJECT,new JSONObject());
		}
		logger.info("返回给前端的参数为：：" + String.valueOf(respOutJson));
		return String.valueOf(respOutJson);
	}
	
	
	
}
