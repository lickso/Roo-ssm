package com.roo.ssm.controller;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
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
import com.roo.ssm.bean.Advertise_Carousel;
import com.roo.ssm.service.OutShowService;

@Controller
@RequestMapping("outshow")
public class OutShowController extends BaseController {
	
	private static final transient Logger logger = Logger.getLogger(OutShowController.class);
	
	@Autowired
	private OutShowService outShowService;
	
	@Autowired
	private Advertise_Carousel advertise_Carousel;

	/*初始主页面-轮播显示*/
	@ResponseBody
	@RequestMapping(value = "indexCarouselShow" , method = RequestMethod.POST , headers = "Accept=application/json")
	public String indexCarouselShow(HttpServletRequest request) throws IOException {
		
		//获取前端json格式请求
		JSONObject reqJson = super.getInputObject(request);
		JSONObject rtnJson = new JSONObject();
		
		
		try {
			//返回广告数据列表给前端
			List<Advertise_Carousel> advertise_CarouselList = outShowService.queryAllAdvertise_Carousel();
			rtnJson.put("CarouselList", advertise_CarouselList);
			super.respOutObject(rtnJson);
		}catch(Exception e) {
			rtnJson.put("CarouselList", null);
			super.respOutObject(rtnJson);
		}
		return String.valueOf(rtnJson);
	}
	
}
