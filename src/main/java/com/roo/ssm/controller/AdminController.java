package com.roo.ssm.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.roo.ssm.bean.Advertise_Carousel;
import com.roo.ssm.bean.Artdesign_Imgresource;
import com.roo.ssm.bean.Order;
import com.roo.ssm.bean.Order_Product;
import com.roo.ssm.bean.Product_Artdesign;
import com.roo.ssm.bean.Product_Cart;
import com.roo.ssm.bean.Product_Collection;
import com.roo.ssm.bean.User;
import com.roo.ssm.bean.User_Creditsoperate;
import com.roo.ssm.service.CreditsService;
import com.roo.ssm.service.OrderService;
import com.roo.ssm.service.Product_ArtdesignService;
import com.roo.ssm.service.UserService;
import com.roo.utils.HttpCommonUtil;
import com.roo.utils.LocalConstants;
import com.roo.utils.RooCommonUtils;
import com.roo.utils.SysConfig;

@Controller
@RequestMapping("admin")
public class AdminController extends BaseController {
	
	private static final transient Logger logger = Logger.getLogger(AdminController.class);
	
	@Autowired
	private User  user; 
	
	@Autowired
	private Product_Artdesign  product_Artdesign; 
	
	@Autowired
	private Order_Product  order_Product; 
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private Product_ArtdesignService product_ArtdesignService; 
	
	@Autowired
	private CreditsService creditsService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private Order order;
	
	@Autowired
	private User_Creditsoperate user_Creditsoperate;
	
	@Autowired
	private Product_Cart product_Cart;
	
	@Autowired
	private Product_Collection  product_Collection; 
	
	/*管理员登录*/
	@ResponseBody
	@RequestMapping(value = "/adminLogin" ,  headers = "Accept=application/json" , method ={RequestMethod.POST,RequestMethod.GET})
	public String adminLogin(HttpServletRequest request,HttpSession session) throws IOException {
		
		logger.info("进入登录认证");
		
		//获取前端json格式请求
		JSONObject reqJson = super.getInputObject(request);
		JSONObject rtnJson = new JSONObject();
		
		//获取前端请求参数
		String name = RooCommonUtils.getJsonValue(reqJson, "name");
		String password = RooCommonUtils.getJsonValue(reqJson, "password");
		
		/*user.setName(name);
		user.setPassword(password);*/
		
		//调用用户服务接口
		if(null == (user = userService.queryUserByName(name))) {
			logger.info("用户名不存在，清核实！");
			rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_FAIL);
			rtnJson.put(LocalConstants.RESP_SET.RESP_MSG, LocalConstants.RESP_SET.RESP_MSG_FAIL);
			rtnJson.put(LocalConstants.RESP_SET.RESP_DESC, LocalConstants.RESP_SET.RESP_DESC_LOGIN_USERNULL);
			//rtnJson.put(LocalConstants.RESP_SET.RESP_URL, LocalConstants.URL_SET.PURL_LOGIN);
			
			return String.valueOf(rtnJson);
		}else if(!password.equals(String.valueOf(userService.queryUserByName(name).getPassword()))) {
			logger.info("用户名或密码不正确，清核实！");
			rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_FAIL);
			rtnJson.put(LocalConstants.RESP_SET.RESP_MSG, LocalConstants.RESP_SET.RESP_MSG_FAIL);
			rtnJson.put(LocalConstants.RESP_SET.RESP_DESC, LocalConstants.RESP_SET.RESP_DESC_LOGIN_USERERROR);
			//rtnJson.put(LocalConstants.RESP_SET.RESP_URL, LocalConstants.URL_SET.PURL_LOGIN);
			
			return String.valueOf(rtnJson);
		}
		
		//通过用户id确定用户角色id列表
		Set<Integer> roleidSet = userService.queryRoleIdByUserId(user.getId());
		Set<String> permissionUrlSet = new HashSet();
		if(roleidSet.isEmpty()) {
			//定义角色id列表
			Set<Integer> roleIdSet = new HashSet();
			roleIdSet.add(2);
			//通过用户角色id列表查询权限id列表
			Set<Integer> permissionIdSet = userService.queryPermissionIdByRoleId(roleIdSet);
			//通过用户权限id列表查询用户权限列表
			permissionUrlSet = userService.queryPermissionSetByPermissionIdSet(permissionIdSet);
		}else {
			//通过用户角色id列表查询权限id列表
			Set<Integer> permissionIdSet = userService.queryPermissionIdByRoleId(roleidSet);
			//通过用户权限id列表查询用户权限列表
			permissionUrlSet = userService.queryPermissionSetByPermissionIdSet(permissionIdSet);
		}
		
		//设置用户session
		session.setAttribute("user", user);
		session.setAttribute("name", name);
		session.setAttribute("roleList", new ArrayList<Integer>(roleidSet));
		session.setAttribute("permissionUrlList", new ArrayList<String>(permissionUrlSet));
		
		//登录成功跳转到初始页面
		rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_SUCCESS);
		rtnJson.put(LocalConstants.RESP_SET.RESP_MSG, LocalConstants.RESP_SET.RESP_MSG_SUCCESS);
		rtnJson.put(LocalConstants.RESP_SET.RESP_DESC, LocalConstants.RESP_SET.RESP_DESC_LOGIN_SUCCESS);
		//rtnJson.put(LocalConstants.RESP_SET.RESP_URL, "common/index.action");
		
		logger.info(String.valueOf(rtnJson));
		return String.valueOf(rtnJson);
		
	}
	
	//管理员注销
	@ResponseBody
	@RequestMapping(value = "/adminloginOut" , method ={RequestMethod.POST})
	public String adminloginOut(HttpServletRequest request,HttpSession session,Model model) throws IOException {
		JSONObject rtnJson = new JSONObject();
		
		//直接删除所以session数据
		try {
			session.removeAttribute("user");
			session.removeAttribute("name");
			session.removeAttribute("roleList");
			session.removeAttribute("permissionUrlList");
			rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_SUCCESS);
		}catch(Exception e) {
			rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_FAIL);
		}		
		
		return String.valueOf(rtnJson);
		
	}
	
	
	//管理员接单
	@ResponseBody
	@RequestMapping(value = "/adminCheck" , method ={RequestMethod.POST})
	public String userCheck(HttpServletRequest request,HttpSession session,Model model) throws IOException {
		
		//获取json请求参数
		JSONObject reqJson = super.getInputObject(request);
		JSONObject rtnJson = new JSONObject();
		JSONObject params = reqJson.getJSONObject("params");
		user = (User) session.getAttribute("user");
		int userId = 1;
		if(null != user) {
			userId = user.getId();
		}
		int id = params.getIntValue("id");
		order.setId(id);
		order.setState("6");
		int rtnCode = orderService.checkOrder(order);
		if(rtnCode == 1) {
			rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_SUCCESS);
		}else {
			rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_FAIL);
		}
		
		return String.valueOf(rtnJson);
//			return "/WEB-INF/common/index/personalPage";
	}
	
	//商品添加
	/*@ResponseBody
	@RequestMapping(value = "/addProduct" , method ={RequestMethod.POST})
	public String addProduct(HttpServletRequest request,HttpSession session,Model model,Product_Artdesign product_Artdesign) throws IOException {
		
		//获取json请求参数
		JSONObject reqJson = super.getInputObject(request);
		JSONObject rtnJson = new JSONObject();
		JSONObject params = reqJson.getJSONObject("params");
		
		int rtnCode = product_ArtdesignService.addProduct(product_Artdesign);
		
		if(rtnCode == 1) {
			rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_SUCCESS);
		}else {
			rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_FAIL);
		}
		
		return String.valueOf(rtnJson);
	}*/
	
	//商品添加
	/*@ResponseBody
	@RequestMapping(value = "/updtProduct" , method ={RequestMethod.POST})
	public String updtProduct(HttpServletRequest request,HttpSession session,Model model,Product_Artdesign product_Artdesign) throws IOException {
		
		//获取json请求参数
		JSONObject reqJson = super.getInputObject(request);
		JSONObject rtnJson = new JSONObject();
		JSONObject params = reqJson.getJSONObject("params");
		
		int rtnCode = product_ArtdesignService.updateProduct(product_Artdesign);
		
		if(rtnCode == 1) {
			rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_SUCCESS);
		}else {
			rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_FAIL);
		}
		
		return String.valueOf(rtnJson);
	}*/
}
