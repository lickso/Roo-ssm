package com.roo.shiro.core.intercpetor;

import java.io.OutputStreamWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.roo.utils.LocalConstants;
import com.roo.utils.SysConfig;


/**
 * @desc   登录拦截器
 * @author yangsheng
 * @date   2018-03-07
 */
public class LoginIntercpetor implements HandlerInterceptor{
	
	private static final transient Logger logger = Logger.getLogger(LoginIntercpetor.class);
	String url = "";
	
	//@ResponseBody
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
		url = request.getRequestURL().toString();
		
		String projectUrl = "http://" + SysConfig.getPropertiesStr("busi_server_ip") + ":" + SysConfig.getPropertiesStr("busi_server_port") + "/" + SysConfig.getPropertiesStr("busi_project_name")+"/";
		url = url.replace(projectUrl,"");
		logger.info("请求进入拦截器，请求地址："+url);

		
		
		//拦截器首先判断是否请求公共资源，是则放行，不是，一，session参数获取。二，则要求返回前台登录
		if("common".equals(url.split("/")[0])||"outshow".equals(url.split("/")[0])) {
			logger.info("请求的是公共资源，直接放行");
			
			/*out.flush();
            out.close();*/
			return true;
		}else if("direct".equals(url.split("/")[0])||"outshow".equals(url.split("/")[0])){
			logger.info("请求的是链接跳转，直接放行");
			
			/*out.flush();
            out.close();*/
			
			if(url.equals("direct/orderconfirm.action")) {
				
				/*response.setContentType("text/html;charset=UTF-8");
		        response.setCharacterEncoding("UTF-8");
		        OutputStreamWriter out=new OutputStreamWriter(response.getOutputStream());   
		        String msg="";
				
				msg = "请先到首页完成登录！";
	            msg=new String(msg.getBytes("UTF-8"));*/
	            
	            //out.append("");
	            
	            /*out.append("<meta http-equiv='Content-Type' content='text/html';charset='UTF-8'>");
	            out.append("<script>");
	            out.append("alert('"+msg+"');");
	            out.append("</script>");*/
	            
	            
	           /* out.write("<meta http-equiv='Content-Type' content='text/html';charset='UTF-8'>");
	            out.write("<script>");
	            out.write("alert('"+msg+"');");
	            out.write("</script>");*/
	            
//	            request.getRequestDispatcher(request.getContextPath()+"/direct/index.action").forward(request,response);
				
				
//	            response.sendRedirect(request.getContextPath()+"/direct/index.action");
	            
	            /*out.flush();
	            out.close();*/
	            
	            
	            
	            return true;
			}
			
			return true;
		}else {
			logger.info("请求的是非公共资源，需要session存入用户信息，角色，权限信息");
			
			HttpSession session = request.getSession();
			if(null == session) {
				logger.info("用户session信息为空，反馈信息给前端框架。。");
				
				try{ 
					response.setContentType("text/html;charset=UTF-8");
			        response.setCharacterEncoding("UTF-8");
			        OutputStreamWriter out=new OutputStreamWriter(response.getOutputStream());   
			        String msg="";
					
					msg = "请先到首页完成登录！";
		            msg=new String(msg.getBytes("UTF-8"));
		          
		            out.write("<meta http-equiv='Content-Type' content='text/html';charset='UTF-8'>");
		            out.write("<script>");
		            out.write("alert('"+msg+"');");
		            out.write("</script>");
		            out.flush();
		            out.close();
					
		            logger.info(request.getContextPath()+LocalConstants.PAGE_URL_SET.INDEX_PAGE+".jsp");
		            response.sendRedirect(request.getContextPath()+LocalConstants.PAGE_URL_SET.INDEX_PAGE+".jsp");
				    return false;  
				}catch (Exception e){  
				    e.printStackTrace();  
//				    response.sendError(500);
				    
				    //重新定向到500错误页面
//				    response.sendRedirect(LocalConstants.PAGE_URL_SET.ERROR_500_PAGE);
				    return false;  
				}  
				
				//session信息为空，直接跳转到初始登录页面
				//response.sendRedirect(LocalConstants.PAGE_URL_SET.INDEX_PAGE);
				//return false;
			}else {
				logger.info("用户session信息不为空，准备从session中读取信息。。");
				
				return true;
				
				
			}
		}
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,ModelAndView modelAndView) throws Exception {	
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)throws Exception {		
	}

}
