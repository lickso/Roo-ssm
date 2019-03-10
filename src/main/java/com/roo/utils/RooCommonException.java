package com.roo.utils;

import java.util.Map;

/**
 * @des    内部自定义错误
 * @author yangsheng
 *
 */
public class RooCommonException extends Exception {
	
	//异常参数
	public transient Map<String, Object> params;
	
	//异常编码
	public int exceptionCode;
	
	private static final long serialVersionUID = 1L;

	public RooCommonException() {
		this("Roo 平台内部异常");
	}

	public RooCommonException(String msg) {
		super(msg);
	}

	public RooCommonException(Throwable cause) {
		this("Roo 平台内部异常",cause);
	}

	public RooCommonException(String msg,Throwable cause) {
		super(msg,cause);
	}

	public int getExceptionCode() {
		return exceptionCode;
	}
	
	public void setExceptionCode(int exceptionCode) {
		this.exceptionCode = exceptionCode;
	}

}
