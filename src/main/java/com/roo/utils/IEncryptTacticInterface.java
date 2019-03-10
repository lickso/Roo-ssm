package com.roo.utils;



/**
 * 加密策略接口
 * 
 * @author zhuzh
 *
 */
public interface IEncryptTacticInterface {
	/**
	 * 加密方法
	 * @param content 明文
	 * @param encrKey 加密秘钥Key 
	 * 					如果有的接口不需要秘钥，可传null
	 * @return 密文
	 */
	public String encode(String content,String encrKey) throws Exception;
	/**
	 * 解密方法
	 * @param content 密文
	 * @param decrKey 解密秘钥
	 *					 如果有的接口不需要秘钥，可传null
	 * @return 明文
	 */
	public String decode(String content,String decrKey) throws Exception;
	/**
	 * sign
	 */
	public String sign(String key,Object... contents) throws Exception;
}
