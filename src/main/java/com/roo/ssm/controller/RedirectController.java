package com.roo.ssm.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.roo.ssm.bean.Product_Artdesign;
import com.roo.utils.HttpCommonUtil;
import com.roo.utils.LocalConstants;
import com.roo.utils.SysConfig;

@Controller
@RequestMapping("direct")
public class RedirectController {
	private static final transient Logger logger = Logger.getLogger(RedirectController.class);
	
	/*接入请求*/
	public JSONObject getInputObject(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("UTF-8");
        BufferedReader br = new BufferedReader(new InputStreamReader( request.getInputStream(),"utf-8"));
        String line = null;
        StringBuilder sb = new StringBuilder();
        while((line = br.readLine())!=null){
            sb.append(line);
        }
        logger.info("接口请求的地址：" + String.valueOf(request.getRequestURL()));
        logger.info("接口请求的入参：" + String.valueOf(sb));
        return (JSONObject) JSON.parse(String.valueOf(sb));
	}
	
	/*请求跳转注册页面*/
	@RequestMapping(value = "/userRegister")
	public String directUserRegister() throws Exception {		
		return "/WEB-INF/common/register";
	}
	
	/*请求跳转主页页面*/
	@RequestMapping(value = "/index")
	public String directIndex() throws Exception {		
		return "/WEB-INF/common/index/index";
	}
	
	/*请求跳转主页页面*/
	@RequestMapping(value = "/person")
	public String directPerson() throws Exception {		
		return "/WEB-INF/common/index/personalPage";
	}
	
	/*请求跳转加入购物车页面*/
	@RequestMapping(value = "/orderconfirm")
	public String directOrderconfirm() throws Exception {		
		return "/WEB-INF/common/index/orderconfirm";
	}
	
	/*转接请求*/
	public JSONObject sendPostMethod(String url, String encoding, String param,int connTime, int overTime) throws Exception {
		url = "http://" + SysConfig.getPropertiesStr("server_ip") + ":" + SysConfig.getPropertiesStr("server_port") + "/" + SysConfig.getPropertiesStr("project_name") + "/" + url ;
		logger.info("转接请求的地址："+url);
		logger.info("转接请求的参数："+param);
		logger.info("转接返回的参数："+HttpCommonUtil.sendPostMethod(url, encoding, param, connTime, connTime));
		
		return JSON.parseObject(HttpCommonUtil.sendPostMethod(url, encoding, param, connTime, connTime));
	}
	
	/*返回数据*/
	public String respOutObject(JSONObject respJson) throws IOException {
		JSONObject respOutJson = new JSONObject();
		try {
			respOutJson.put(LocalConstants.RESP_SET.RESP_CODE,LocalConstants.RESP_SET.RESP_CODE_SUCCESS);
			respOutJson.put(LocalConstants.RESP_SET.RESP_MSG,LocalConstants.RESP_SET.RESP_MSG_SUCCESS);
			respOutJson.put(LocalConstants.RESP_SET.RESP_OBJECT,respJson);
		}catch(Exception e){
			respOutJson.put(LocalConstants.RESP_SET.RESP_CODE,LocalConstants.RESP_SET.RESP_CODE_FAIL);
			respOutJson.put(LocalConstants.RESP_SET.RESP_MSG,LocalConstants.RESP_SET.RESP_MSG_FAIL);
			respOutJson.put(LocalConstants.RESP_SET.RESP_OBJECT,new JSONObject());
		}
		logger.info("接口返回的参数：" + respOutJson.toJSONString());
		return respOutJson.toJSONString();
	}
	
	/*请求地址处理*/
	public String getReqUrl(String url) {
		url=url.replace("http://",""); 
		String[] node = url.split("/");		
		url = node[node.length-2] + "/" + node[node.length-1];
		return url;
	}
	
	/*公共转接方法*/
	@RequestMapping(value = "/**" , method = RequestMethod.POST , headers = "Accept=application/json")
	@ResponseBody
	public String RooCommonReq(HttpServletRequest request ,HttpServletResponse response) throws Exception {
		
		//获取前端传过来的数据
		JSONObject reqJson = this.getInputObject(request);
		
		//使用公共地址处理方法
		String reqUrl = String.valueOf(request.getRequestURL());
		reqUrl = this.getReqUrl(reqUrl);
		
		//将数据透传到后端
		JSONObject result = this.sendPostMethod(reqUrl, "utf-8", String.valueOf(reqJson), 2000, 600000);
		
		//后台返回数据返还前端
		return this.respOutObject(result);
	}
	
}
