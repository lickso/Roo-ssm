package com.roo.ssm.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
@RequestMapping("user")
public class UserController extends BaseController {
	
	private static final transient Logger logger = Logger.getLogger(UserController.class);
	
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
	
	//用户点击商品跳转到购物车
	@RequestMapping(value = "/orderconfirm" , method = RequestMethod.GET)
	public String productOrderconfirm(HttpServletRequest request, Model model,HttpSession session,HttpServletResponse response) throws UnsupportedEncodingException{
		JSONObject rtnJson = new JSONObject();
		
		//获取前端参数userId(session获取)，productId，number
		request.setCharacterEncoding("UTF-8");
		user = (User) session.getAttribute("user");
		int userId = 1;
		if(null != user) {
			userId = user.getId();
		}
		
		int productId = Integer.parseInt(String.valueOf(request.getParameter("productId")));
		int number = Integer.parseInt(String.valueOf(request.getParameter("number")));
		
		//根据用户id，查询地址信息
		Set<String> placeSet = userService.queryPlaceByUserIdSet(userId);
		
		//根据商品id，查询商品信息
		product_Artdesign = product_ArtdesignService.queryProduct_ArtdesignByid(productId);
		List<Artdesign_Imgresource> artdesign_ImgresourceList = product_ArtdesignService.queryArtdesign_ImgresourceByartdesignid(productId);
		List<String> placeList = new ArrayList<String>();
		placeList.addAll(placeSet);

		rtnJson.put("userPlaceList", placeList);
		rtnJson.put("product", product_Artdesign);
		rtnJson.put("artdesign_ImgresourceList", artdesign_ImgresourceList);
		rtnJson.put("number", number);
		
		logger.info(rtnJson);
		
		model.addAttribute(LocalConstants.RESP_SET.RESP_OUTOBJECT, rtnJson);
		return "/WEB-INF/common/index/orderconfirm";
	}	
	
	//用户页面初始查询
	@SuppressWarnings("null")
	@RequestMapping(value = "/iniPersonalPage" , method = RequestMethod.GET)
	public String userCreditsQry(HttpServletRequest request, Model model,HttpSession session,HttpServletResponse response) throws UnsupportedEncodingException{
		JSONObject rtnJson = new JSONObject();
		
		//获取前端参数userId(session获取)，productId，number
		request.setCharacterEncoding("UTF-8");
		user = (User) session.getAttribute("user");
		int userId = 1;
		if(null != user) {
			userId = user.getId();
		}
		
		List<Integer> sumSet;
		
		//根据用户id，查询用户积分操作
		int userRemain = 0;
		sumSet = creditsService.queryOperatesumByUserId(userId);
		for(int creditsSum : sumSet) {
			userRemain += creditsSum;
		}
		
		//根据用户id，查询用户签到操作积分
		int signInCredits = 0;
		sumSet = creditsService.querySignInOperatesumByUserId(userId);
		for(int creditsSum : sumSet) {
			signInCredits += creditsSum;
		}

		rtnJson.put("userRemain", userRemain);
		rtnJson.put("signInCredits", signInCredits);
		
		
		//查询用户订单列表
		List<Map<String,Object>> outOrderList = new ArrayList<Map<String,Object>>();
		
		List<Order> orderList = orderService.queryOrderObjectByUserId(userId);
		
		if(!(null == orderList || orderList.size() == 0)) {
			for(Order order : orderList) {
				logger.info(String.valueOf(order.getId()));
				Map<String,Object> orderInfo = new HashMap<String,Object>();
				orderInfo.put("order", order);
				
				//通过order（订单号）查找工单产品信息
				List<Order_Product> orderProductList = new ArrayList<Order_Product>() ;
				orderProductList = orderService.queryOrderProductByOrderId(order.getId());
				
				//通过product（产品编号）查找产品图片资源,第一张
				if(null != orderProductList||orderProductList.size() != 0) {
					order_Product = orderProductList.get(0);
					
					List<Artdesign_Imgresource> imgSourceList = product_ArtdesignService.queryArtdesign_ImgresourceByartdesignid(order_Product.getProductid());
					orderInfo.put("showImg", imgSourceList.get(0).getUrl());
					
					orderInfo.put("title", product_ArtdesignService.queryProduct_ArtdesignByid(order_Product.getProductid()).getTitle());
				}
				
				outOrderList.add(orderInfo);
			}
			
		}
		rtnJson.put("outOrderList", outOrderList);
		
		//查询用户订单相关数量
		int  proceedCount = 0;
		int  completeCount = 0;
		
		proceedCount = orderService.queryOrderCountByUserId(userId, "1");
		completeCount = orderService.queryOrderCountByUserId(userId, "9");
		
		rtnJson.put("proceedCount", proceedCount);
		rtnJson.put("completeCount", completeCount);
		
		
		//查询用户购物车列表
		List<Product_Cart> product_CartList = product_ArtdesignService.queryProduct_CartListByUserId(userId);
		JSONArray jsonArray1 = new JSONArray();
		for(Product_Cart product_Cart : product_CartList) {
			JSONObject product_CartObject = new JSONObject();
			List<Artdesign_Imgresource> imgSourceList = product_ArtdesignService.queryArtdesign_ImgresourceByartdesignid(product_Cart.getProductid());
			product_Artdesign = product_ArtdesignService.queryProduct_ArtdesignByid(product_Cart.getProductid());
			product_CartObject.put("product_Collection", product_Collection);
			product_CartObject.put("product", product_Artdesign);
			product_CartObject.put("showImg", imgSourceList.get(0).getUrl());
			product_CartObject.put("number", product_Cart.getNumber());
			jsonArray1.add(product_CartObject);
		}
		rtnJson.put("product_CartList", jsonArray1);

		//用户收藏列表初始化展示
		List<Product_Collection> product_CollectionList = product_ArtdesignService.queryProduct_CollectionListByUserId(userId);
		JSONArray jsonArray = new JSONArray();
		for(Product_Collection product_Collection : product_CollectionList) {
			JSONObject productCollectionObject = new JSONObject();
			List<Artdesign_Imgresource> imgSourceList = product_ArtdesignService.queryArtdesign_ImgresourceByartdesignid(product_Collection.getProductid());
			productCollectionObject.put("product_Collection", product_Collection);
			product_Artdesign = product_ArtdesignService.queryProduct_ArtdesignByid(product_Collection.getProductid());
			productCollectionObject.put("product_Artdesign", product_Artdesign);
			productCollectionObject.put("showImg", imgSourceList.get(0).getUrl());
			jsonArray.add(productCollectionObject);
		}
		
		//将获取到的用户收藏集合处理成四四等分
		int a_length = jsonArray.size();
		int a_rest = a_length % 4;
		int a_sort = 0 == a_length ? a_length/4 : (0 == a_rest ? a_length/4:a_length / 4 + 1); 
		List<ArrayList<JSONObject>> coll = new ArrayList<ArrayList<JSONObject>>();
		
		for(int k= 0;k < a_sort;k++) {
			List<JSONObject>  b = new ArrayList<JSONObject>();
//			int b[] = new int[4]; 
			if(k != a_sort-1) {
				for(int j = 0,i=k*4;j<4;i++,j++) {
					b.add((JSONObject) jsonArray.get(i));
				}
				coll.add((ArrayList<JSONObject>) b);
			}else {
				if(a_rest == 0) {
					for(int j = 0,i=k*4;j<4;i++,j++) {
						b.add((JSONObject) jsonArray.get(i));
					}
					coll.add((ArrayList<JSONObject>) b);
				}else {
					for(int j = 0,i=k*4;j<a_rest;i++,j++) {
						b.add((JSONObject) jsonArray.get(i));
					}
					coll.add((ArrayList<JSONObject>) b);
				}
				
			}
			
			
		}
		
		
		rtnJson.put("product_CollectionList", coll);
		
		logger.info(rtnJson);
		
		model.addAttribute(LocalConstants.RESP_SET.RESP_OUTOBJECT, rtnJson);
		
		return "/WEB-INF/common/index/personalPage";
	}	
	
	
	//用户商品订购结算
	@ResponseBody
	@RequestMapping(value = "/orderPurchase" , method = RequestMethod.POST)
	public String productOrderPurchase(HttpServletRequest request, Model model,HttpSession session,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");    
		response.setCharacterEncoding("UTF-8");    
 
		JSONObject reqJson = super.getInputObject(request);
		JSONObject rtnJson = new JSONObject();
		
		int userId = 1;
		int orderid = 0;
		
		Map<String,Object> params = (Map<String, Object>) reqJson.get("params");
		List<Map<String,Object>> produceList = new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> ticketList = new ArrayList<Map<String,Object>>();
		int total=0,discount=0,realpay=0,userRemain=0; 
		if(null == params) {
			rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_FAIL);
			rtnJson.put(LocalConstants.RESP_SET.RESP_MSG, "提交信息为空");
			return String.valueOf(rtnJson);
		}else {
			produceList = (List<Map<String, Object>>) params.get("produceList");
			if(null == produceList || produceList.size() == 0) {
				rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_FAIL);
				rtnJson.put(LocalConstants.RESP_SET.RESP_MSG, "提交信息为空");
				return String.valueOf(rtnJson);
			}else {
				for(int i=0;i<produceList.size();i++) {
					Map<String,Object> purchaseObject = produceList.get(i);
					int productId =Integer.parseInt(String.valueOf(purchaseObject.get("productId")));
					int number =Integer.parseInt(String.valueOf(purchaseObject.get("number")));
					
					//根据商品id，查询商品资源信息
					Product_Artdesign  product_Artdesign = product_ArtdesignService.queryProduct_ArtdesignByid(productId);
					total += (product_Artdesign.getPrice() * number);
					discount += (product_Artdesign.getDiscount() * number);
				}
				ticketList = (List<Map<String, Object>>) params.get("ticketList");
				if(!(null == ticketList || ticketList.size() == 0)) {
					for(int i=0;i<ticketList.size();i++) {
						Map<String,Object> ticketObject = ticketList.get(i);
						int ticketId =Integer.parseInt(String.valueOf(ticketObject.get("ticketId")));
						int number =Integer.parseInt(String.valueOf(ticketObject.get("number")));
						
						//根据优惠劵id，查询优惠劵资源信息，暂未开发优惠劵指定为200
						discount += (200 * number);
					}
				}
			}
			realpay = total - discount;
			
			//根据用户id，查询用户积分操作对象
			List<Integer> sumSet = creditsService.queryOperatesumByUserId(userId);
			for(int creditsSum : sumSet) {
				userRemain += creditsSum;
			}
			if(realpay > userRemain) {
				rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_FAIL);
				rtnJson.put(LocalConstants.RESP_SET.RESP_MSG, "用户积分不足");
				return String.valueOf(rtnJson);
			}else {
				
				//生成订单 order对象
				order.setUserid(userId);
				order.setTotal(total);
				order.setDiscount(discount);
				order.setRealpay(realpay);
				order.setOrdertime(String.valueOf(RooCommonUtils.getCurrentDate()));
				order.setState("1");
				
				int sqlRtnCode;				
				
				try{
					sqlRtnCode = orderService.insertOrderObject(order);
					orderid = sqlRtnCode;
					
					if(0 != sqlRtnCode) {
						logger.info("用户订单生成！");
						
						//用户订单明细生成
						int j = 0;
						for(int i=0;i<produceList.size();i++) {
							Map<String,Object> purchaseObject = produceList.get(i);
							int productId =Integer.parseInt(String.valueOf(purchaseObject.get("productId")));
							int number =Integer.parseInt(String.valueOf(purchaseObject.get("number")));
							
							//根据商品id，查询商品资源信息
							Product_Artdesign  product_Artdesign = product_ArtdesignService.queryProduct_ArtdesignByid(productId);
							
							order_Product.setOrderid(orderid);
							order_Product.setProductid(productId);
							order_Product.setAmount(number);
							order_Product.setPrice(product_Artdesign.getPrice());
							order_Product.setDes("用户订单商品实例生成");
							order_Product.setState("1");
							
							//用户订单明细生成
							sqlRtnCode = orderService.insertOrderProductObject(order_Product);
							logger.info("用户订单商品明细结果："+sqlRtnCode);
							j++;
						}
						
						if(j == produceList.size()) {
							logger.info("用户订单明细生成成功！");
							
							//生成积分操作明细
							user_Creditsoperate.setUserid(userId);
							user_Creditsoperate.setOperatesum(-realpay);
							user_Creditsoperate.setOperatetype("2");
							user_Creditsoperate.setDes("用户充值消耗积分"+realpay);
							user_Creditsoperate.setOperatedate(String.valueOf(RooCommonUtils.getCurrentDate()));
							user_Creditsoperate.setState("1");
							
							sqlRtnCode = creditsService.addUserCreditsOperateObject(user_Creditsoperate);
							if(sqlRtnCode == 1) {
								logger.info("用户商品积分明细生成！");
								logger.info("用户商品订购成功！");
								
								rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_SUCCESS);
				    			rtnJson.put(LocalConstants.RESP_SET.RESP_MSG, "成功下单");
				    			return String.valueOf(rtnJson);
							}else {
								logger.info("用户积分操作明细生成失败！");
								
								rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_FAIL);
								rtnJson.put(LocalConstants.RESP_SET.RESP_MSG, "用户积分操作明细生成失败");
								return String.valueOf(rtnJson);
							}
						}else {
							logger.info("用户商品订单明细生成失败！");
							
							rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_FAIL);
							rtnJson.put(LocalConstants.RESP_SET.RESP_MSG, "用户商品订单明细生成失败");
							return String.valueOf(rtnJson);
						}
					}else {
						logger.info("用户订单生成失败！");
						
						rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_FAIL);
						rtnJson.put(LocalConstants.RESP_SET.RESP_MSG, "用户订单生成失败");
						return String.valueOf(rtnJson);
					}
				}catch(Exception e){
					logger.info("用户下单失败！");
					
					rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_FAIL);
					rtnJson.put(LocalConstants.RESP_SET.RESP_MSG, "用户下单失败");
					return String.valueOf(rtnJson);
				}	
			}
		}
	}	
	
	//用户商品添加到购物车
	@ResponseBody
	@RequestMapping(value = "/addProductToCart" , method = RequestMethod.POST)
	public String addProductToCart(HttpServletRequest request, Model model,HttpSession session,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		JSONObject params = super.getInputObject(request);
		JSONObject rtnJson = new JSONObject();
		
		response.setContentType("text/html;charset=utf-8");    
		response.setCharacterEncoding("UTF-8");    
 
		//获取前端相关请求入参
		user = (User) session.getAttribute("user");
		int userId = 1;
		if(null != user) {
			userId = user.getId();
		}
//	    Map<String,Object> params = (Map<String, Object>) reqJson.get("params");
	    if(null == params) {
	    	rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_FAIL);
			rtnJson.put(LocalConstants.RESP_SET.RESP_MSG, "请求数据为空");
	    }else{
	    		//获取添加购物车商品信息
	    		int prouductId = null == params.get("productId")?0:Integer.parseInt(String.valueOf(params.get("productId")));
	    		int number = null == params.get("number")?0:Integer.parseInt(String.valueOf(params.get("number")));
	    		
	    		/*product_Cart.setAddtime(String.valueOf(new Date()));*/
	    		product_Cart.setNumber(number);
	    		product_Cart.setProductid(prouductId);
	    		product_Cart.setUserid(userId);
	    		product_Cart.setState("1");
	    		
	    		int rtnCode = 0;
	    			rtnCode = product_ArtdesignService.addProductToCart(product_Cart);
	    			if(rtnCode == 1) {
	    				rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_SUCCESS);
		    			rtnJson.put(LocalConstants.RESP_SET.RESP_MSG, "成功添加到购物车");
	    			}else {
	    				rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_FAIL);
		    			rtnJson.put(LocalConstants.RESP_SET.RESP_MSG, "添加到购物车失败");
	    			}
	    }
	    return String.valueOf(rtnJson);
	}	
	
	//用户积分签到
	@ResponseBody
	@RequestMapping(value = "/userCreditsSignIn" ,  headers = "Accept=application/json" , method ={RequestMethod.POST,RequestMethod.GET})
	public String userCreditsSignIn(HttpServletRequest request,HttpSession session) throws IOException {
		
		
		JSONObject rtnJson = new JSONObject();
		logger.info("用户进入积分签到");
		
		//获取前端相关请求入参
		user = (User) session.getAttribute("user");
		int userId = 1;
		if(null != user) {
			userId = user.getId();
		}
		
		//设置用户积分操作实例
		user_Creditsoperate.setUserid(userId);
		user_Creditsoperate.setOperatesum(20);
		user_Creditsoperate.setOperatetype("2");
		user_Creditsoperate.setState("1");
		user_Creditsoperate.setOperatedate(RooCommonUtils.getCurrentDate());
		user_Creditsoperate.setDes("用户签到获取积分");
		
		//调用用户服务接口
		int rtnCode = 0;
		rtnCode = creditsService.addUserCreditsOperateObject(user_Creditsoperate);
		if(rtnCode == 1) {
			logger.info("签到成功");
			rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_SUCCESS);
			rtnJson.put(LocalConstants.RESP_SET.RESP_MSG, LocalConstants.RESP_SET.RESP_MSG_SUCCESS);
		}else {
			logger.info("签到失败");
			rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_FAIL);
			rtnJson.put(LocalConstants.RESP_SET.RESP_MSG, LocalConstants.RESP_SET.RESP_MSG_FAIL);
		}
		
		return String.valueOf(rtnJson);
	}
	
	//用户商品收藏
	@ResponseBody
	@RequestMapping(value = "/userProductCollection" ,  headers = "Accept=application/json" , method ={RequestMethod.POST,RequestMethod.GET})
	public String userProductCollection(HttpServletRequest request,HttpSession session) throws IOException {
		
		JSONObject reqJson = super.getInputObject(request);
		JSONObject params = reqJson.getJSONObject("params");
		

		JSONObject rtnJson = new JSONObject();
		logger.info("用户进入商品收藏");
		
		
		
		//获取前端相关请求入参
		user = (User) session.getAttribute("user");
		int userId = 1;
		if(null != user) {
			userId = user.getId();
		}
		
		//商品id获取
//		int productId = Integer.parseInt(String.valueOf(request.getParameter("productId")));
		int productId = params.getIntValue("productid");
		
		//设置用户商品收藏操作实例
		product_Collection.setUserid(userId);
		product_Collection.setProductid(productId);
		product_Collection.setCollectiondate(RooCommonUtils.getCurrentDate());
		product_Collection.setState("1");
		
		int rtnCode = 0;
		rtnCode = product_ArtdesignService.addProduct_CollectionObject(product_Collection);
		
		if(rtnCode == 1) {
			logger.info("商品收藏成功");
			rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_SUCCESS);
			rtnJson.put(LocalConstants.RESP_SET.RESP_MSG, LocalConstants.RESP_SET.RESP_MSG_SUCCESS);
		}else {
			logger.info("商品收藏失败");
			rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_FAIL);
			rtnJson.put(LocalConstants.RESP_SET.RESP_MSG, LocalConstants.RESP_SET.RESP_MSG_FAIL);
		}
		
		return String.valueOf(rtnJson);
		
	}
	
	//订单商品明细展示，商品信息 +工作流信息
	@RequestMapping(value = "/OrderProductFlowByOrderId" ,  headers = "Accept=application/json" , method ={RequestMethod.POST,RequestMethod.GET})
	public String OrderProductFlowByOrderId(HttpServletRequest request,HttpSession session,Model model) throws IOException {
		
		JSONObject rtnJson = new JSONObject();
		logger.info("用户进入商品收藏");
		
		//获取前端相关请求入参
		user = (User) session.getAttribute("user");
		int userId = 1;
		if(null != user) {
			userId = user.getId();
		}
		
		//商品id获取
		int orderId = Integer.parseInt(String.valueOf(request.getParameter("orderId")));
		
		//通过工单id，查询工单商品
		List<Order_Product> orderProductList = orderService.queryOrderProductByOrderId(orderId);
		List<Object> rtnOrderList = new ArrayList<Object>();
		
		if(!(null == orderProductList||orderProductList.size() == 0)) {
			for(int i = 0;i<orderProductList.size();i++) {
				Map<String,Object> orderInfo = new HashMap<String,Object>();
				order_Product = orderProductList.get(i);
				product_Artdesign = product_ArtdesignService.queryProduct_ArtdesignByid(order_Product.getProductid());
				orderInfo.put("order_Product", order_Product);
				orderInfo.put("product_Artdesign", product_Artdesign);
				rtnOrderList.add(orderInfo);
				
			}
		}
		
		
		model.addAttribute(LocalConstants.RESP_SET.RESP_OUTOBJECT, rtnOrderList);
		
		//返回工单详情页
		return "/WEB-INF/common/index/orderDetailPage";
		
	}
	
	
	//用户注销
	@ResponseBody
	@RequestMapping(value = "/loginOut" , method ={RequestMethod.POST})
	public String loginOut(HttpServletRequest request,HttpSession session,Model model) throws IOException {
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
	
	//用户删除收藏
	@ResponseBody
	@RequestMapping(value = "/cancelCollection" , method ={RequestMethod.POST})
	public String cancelCollection(HttpServletRequest request,HttpSession session,Model model) throws IOException {
		//获取json请求参数
		JSONObject reqJson = super.getInputObject(request);
		JSONObject params = reqJson.getJSONObject("params");
		
		int productCollectionId = params.getIntValue("id");
		int productid = params.getIntValue("productid");
		
		
		
		logger.info(reqJson);
		
		JSONObject rtnJson = new JSONObject();
		
		user = (User) session.getAttribute("user");
		int userId = 1;
		if(null != user) {
			userId = user.getId();
		}
		
		product_Collection.setId(productCollectionId);
		product_Collection.setUserid(userId);
		product_Collection.setProductid(productid);
		
		int rtnCode = product_ArtdesignService.cancelCollectionObject(product_Collection);
		if(rtnCode == 1) {
			rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_SUCCESS);
		}else {
			rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_FAIL);
		}
		
		

		return String.valueOf(rtnJson);
	}
	
	
	//用户验收
	@ResponseBody
	@RequestMapping(value = "/userCheck" , method ={RequestMethod.POST})
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
		order.setState("5");
		
		int rtnCode = orderService.checkOrder(order);
		
		if(rtnCode == 1) {
			rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_SUCCESS);
		}else {
			rtnJson.put(LocalConstants.RESP_SET.RESP_CODE, LocalConstants.RESP_SET.RESP_CODE_FAIL);
		}
		
		return String.valueOf(rtnJson);
	}
}
