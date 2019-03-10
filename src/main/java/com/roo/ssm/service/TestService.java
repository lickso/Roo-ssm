package com.roo.ssm.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class TestService {
	
	public ModelAndView loginTest(String loginUrl,String successUrl,String name,String pswd) {
		if(name == null || name.equals("")) {
			return new ModelAndView(loginUrl, "error", "check your name!");
		}
		if(pswd == null || pswd.equals("")) {
			return new ModelAndView(loginUrl, "error", "check your pswd!");
		}
		if(name.equals("ys")&&pswd.equals("1234")) {
			Map<String,Object> result = new HashMap<String,Object>();
			result.put("key1", "value1");
			result.put("key2", "value2");
			result.put("key3", "value3");
			return new ModelAndView(successUrl,"result",result);
		}				
		return new ModelAndView(loginUrl ,"error", "check your name or pswd!");
	}
	
	
}
