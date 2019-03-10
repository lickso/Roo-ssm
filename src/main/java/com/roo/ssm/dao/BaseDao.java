package com.roo.ssm.dao;

import org.apache.ibatis.annotations.Param;

import com.roo.ssm.bean.User;

/**
 * @desc   构建dao基类接口
 * @author yangsheng
 * @param <T>
 * @date   2018-03-12
 */

public interface BaseDao<T> {
	
	public Object queryObjectByID(@Param("id")int id);
	
	/**
	 * @desc  数据对象添加
	 * @param object 添加对象
	 * @return 
	 */
	public int insert(Object object);
	
	
	/*public int deleteObjectByID(@Param("id")int id);*/
	/**
	 * @desc  根据主键查询对象
	 * @param sqlId 脚本主键
	 * @param id	主键
	 * @return Object 返回对象
	 */
	//public Object queryObjectByID(@Param("id")String id);
	
	/**
	 * @desc  根据主键查询相对应的对象
	 * @param sqlId
	 * @param id
	 * @param cls
	 * @return
	 */
	//public <T> T queryObjectByID(String sqlId, String id, Class<T> cls);
	
	
	/**
	 * @desc  根据主键更新
	 * @param sqlId 脚本主键
	 * @param object
	 * @return
	 */
	public int update(Object object);


}
