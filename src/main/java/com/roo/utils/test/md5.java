package com.roo.utils.test;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class md5 {
	public static void main(String[] s) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		String pswd = "ys123456";
		MessageDigest md = MessageDigest.getInstance("MD5");
		byte[] messageByte = pswd.getBytes("utf-8");
		byte[] md5After = md.digest(messageByte);
		
		String md5StrAfter=new String(md5After);
		
		System.out.println(md5StrAfter);  
	}
}
