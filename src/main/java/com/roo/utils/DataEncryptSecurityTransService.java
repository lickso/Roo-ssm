package com.roo.utils;

import org.slf4j.LoggerFactory;

/**
 * AES加密类
 * @author mengxudong
 * @version 1.0
 */
public class DataEncryptSecurityTransService implements IEncryptTacticInterface {

	public String decode(String arg0, String arg1) throws Exception {
		try {
			return new String(new String(EncryptionUtil.decode(EncryptionUtil.hex2byte(arg0), arg1.getBytes()),"UTF-8"));
		} catch (Exception e) {
//			logger.error("DataEncryptSecurityTrans encode found Exception:", e);
		}
		return null;
	}

	public String encode(String arg0, String arg1) throws Exception {
		try {
			return EncryptionUtil.byte2hex(EncryptionUtil.encode(arg0.getBytes(), arg1.getBytes()));
		} catch (Exception e) {
//			logger.error("DataEncryptSecurityTrans encode found Exception:", e);
		}
		return null;
	}

	public String sign(String arg0, Object... arg1) throws Exception {
		return null;
	}
	
	public static void main(String[] args) throws Exception {
		DataEncryptSecurityTransService test = new DataEncryptSecurityTransService();
		String input = "ys123456";
		String key = "asiainfo";
		try {
			//encodeInput加密后的参数
			String encodeInput = test.encode(input, key);
//			System.out.println(test.decode("EE28831D04592B6F8174CD09C2D5917B07DE6CAD95430FEE", "RooBusi"));
			System.out.println(encodeInput);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
