package com.roo.ssm.controller;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.roo.ssm.bean.Artdesign_Imgresource;
import com.roo.ssm.bean.Product_Artdesign;
import com.roo.ssm.bean.User;
import com.roo.ssm.service.Product_ArtdesignService;
import com.roo.ssm.service.UserService;
import com.roo.utils.LocalConstants;
import com.roo.utils.RooCommonUtils;

@Controller
@RequestMapping("common")
public class CommonController extends BaseController {
	
	private static final transient Logger logger = Logger.getLogger(UserController.class);
	
	@Resource
	private User user;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private Product_ArtdesignService product_ArtdesignService;
	
	@Autowired
	private Product_Artdesign product_Artdesign;
	
	
	/*用户注册*/
	@RequestMapping(value = "/userRegister")
	public String userRegister(@RequestParam("name") String name,HttpServletRequest request,User user , Model model,HttpSession session,HttpServletResponse response) throws IOException {
		
		//获取前端json格式请求
		JSONObject reqJson = super.getInputObject(request);
		JSONObject rtnJson = new JSONObject();
		
		
		user.setState("1");
		
		logger.info(user.getName());
		logger.info(name);
		
		//调用服务，业务处理
		int sqlRtnCode;
		try{
			sqlRtnCode = userService.userRegister(user);
			if(1 == sqlRtnCode) {
				model.addAttribute(LocalConstants.RESP_SET.RESP_OUTOBJECT, user); 
				rtnJson.put(LocalConstants.RESP_SET.RESP_CODE,LocalConstants.RESP_SET.RESP_DESC_REGISTER_SUCCESS_CODE);
				rtnJson.put(LocalConstants.RESP_SET.RESP_MSG,LocalConstants.RESP_SET.RESP_DESC_REGISTER_SUCCESS);
			}else {
				rtnJson.put(LocalConstants.RESP_SET.RESP_CODE,LocalConstants.RESP_SET.RESP_DESC_REGISTER_FAIL_CODE);
				rtnJson.put(LocalConstants.RESP_SET.RESP_MSG,LocalConstants.RESP_SET.RESP_DESC_REGISTER_FAIL);
			}
		}catch(Exception e){
			logger.info("错误信息："+String.valueOf(e));
			rtnJson.put(LocalConstants.RESP_SET.RESP_CODE,LocalConstants.RESP_SET.RESP_DESC_REGISTER_FAIL_CODE);
			rtnJson.put(LocalConstants.RESP_SET.RESP_MSG,LocalConstants.RESP_SET.RESP_DESC_REGISTER_HASEXIST);
		}
				
		//返回处理结果
		logger.info("返回给前端的信息："+String.valueOf(rtnJson));
		
		session.setAttribute("user", user);
		
		return LocalConstants.PAGE_URL_SET.INDEX_PAGE;
	}
	
	
	/*用户登录*/
	@ResponseBody
	@RequestMapping(value = "/userLogin" ,  headers = "Accept=application/json" , method ={RequestMethod.POST,RequestMethod.GET})
	public String login(HttpServletRequest request,HttpSession session) throws IOException {
		
		logger.info("用户进入登录认证");
		
		//获取前端json格式请求
		JSONObject reqJson = super.getInputObject(request);
		JSONObject rtnJson = new JSONObject();
		
		//获取前端请求参数
		String name = RooCommonUtils.getJsonValue(reqJson, "name");
		String password = RooCommonUtils.getJsonValue(reqJson, "password");
		
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
	
	/*初始主页*/
	@ResponseBody
	@RequestMapping(value = "/index" , method = RequestMethod.POST , headers = "Accept=application/json")
	public String index(HttpServletRequest request) throws IOException {
		
		//获取前端json格式请求
		JSONObject reqJson = super.getInputObject(request);
		JSONObject rtnJson = new JSONObject();
		
		//组织返回前端参数，分块封装。。。
		
		
		try {
			
			//登录成功跳转到初始页面
			rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_SUCCESS);
			rtnJson.put(LocalConstants.RESP_SET.RESP_MSG, LocalConstants.RESP_SET.RESP_MSG_SUCCESS);
			rtnJson.put(LocalConstants.RESP_SET.RESP_URL, "common/index.action");
			
		}catch(Exception e) {
			
			//登录失败跳转到用户初始(登录)页面
			rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_FAIL);
			rtnJson.put(LocalConstants.RESP_SET.RESP_MSG, LocalConstants.RESP_SET.RESP_MSG_FAIL);
			rtnJson.put(LocalConstants.RESP_SET.RESP_URL, "common/index.action");
		}
		
		return String.valueOf(rtnJson);
	}
	
	/*查询商品*/
	@RequestMapping(value = "/queryProuductByTitleOrDesc" , method = RequestMethod.GET)
	public String queryProuductByTitleOrDesc(HttpServletRequest request, Model model,HttpSession session,HttpServletResponse response) throws UnsupportedEncodingException{
		
		//获取前端参数keywords，pageNumber
		request.setCharacterEncoding("UTF-8");
		//String keywords = request.getParameter("keywords");
		String keywords = new String( request.getParameter("keywords").getBytes("ISO-8859-1"),"UTF-8");
		String pageNumber = request.getParameter("pageNumber");
		JSONArray rtnArr = new JSONArray();
		JSONObject rtnJson = new JSONObject();
		
		List<Product_Artdesign> product_ArtdesignList = null;
		List<Artdesign_Imgresource> artdesign_ImgresourceList = null;	
		if(pageNumber == null || pageNumber.equals("") || Integer.parseInt(pageNumber) <= 0) {
			product_ArtdesignList = product_ArtdesignService.queryProduct_ArtdesignByKeywordsAndPageNumber(keywords, 1);
			logger.info(product_ArtdesignList);
			if(!product_ArtdesignList.isEmpty()) {
				for(int i = 0;i<product_ArtdesignList.size();i++) {
					artdesign_ImgresourceList = product_ArtdesignService.queryArtdesign_ImgresourceByartdesignid(product_ArtdesignList.get(i).getId());
					logger.info(artdesign_ImgresourceList);
					rtnJson.put("id", product_ArtdesignList.get(i).getId());
					rtnJson.put("product_Artdesign", product_ArtdesignList.get(i));
					rtnJson.put("artdesign_ImgresourceList", artdesign_ImgresourceList);
					rtnArr.add(rtnJson);
				}
			}
		}else {
			product_ArtdesignList = product_ArtdesignService.queryProduct_ArtdesignByKeywordsAndPageNumber(keywords, Integer.parseInt(pageNumber));
			if(!product_ArtdesignList.isEmpty()) {
				for(int i = 0;i<product_ArtdesignList.size();i++) {
					artdesign_ImgresourceList = product_ArtdesignService.queryArtdesign_ImgresourceByartdesignid(product_ArtdesignList.get(i).getId());
					rtnJson.put("id", product_ArtdesignList.get(i).getId());
					rtnJson.put("product_Artdesign", product_ArtdesignList.get(i));
					rtnJson.put("artdesign_ImgresourceList", artdesign_ImgresourceList);
					rtnArr.add(rtnJson);
				}
			}
		}
		
		model.addAttribute(LocalConstants.RESP_SET.RESP_OUTOBJECT, rtnArr);
		logger.info(rtnArr);
		return LocalConstants.PAGE_URL_SET.SHOW_PRODLIST_PAGE;
	}
	
	/*展示商品*/
	@RequestMapping(value = "/showProd" , method = RequestMethod.GET )
	public String showProd(HttpServletRequest request, Model model,HttpSession session,HttpServletResponse response) throws Exception {	
		JSONObject rtnJson = new JSONObject();
		String id = new String( request.getParameter("id").getBytes("ISO-8859-1"),"UTF-8");
		
		Product_Artdesign  product_Artdesign = product_ArtdesignService.queryProduct_ArtdesignByid(Integer.parseInt(id));
		List<Artdesign_Imgresource> artdesign_ImgresourceList = product_ArtdesignService.queryArtdesign_ImgresourceByartdesignid(Integer.parseInt(id));
		rtnJson.put("id", id);
		rtnJson.put("product_Artdesign", product_Artdesign);
		rtnJson.put("artdesign_ImgresourceList", artdesign_ImgresourceList);
		
		model.addAttribute(LocalConstants.RESP_SET.RESP_OUTOBJECT, rtnJson);
		return "/WEB-INF/common/index/showProd";
	}
	
}
