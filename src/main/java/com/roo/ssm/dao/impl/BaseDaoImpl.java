package com.roo.ssm.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.roo.ssm.dao.BaseDao;


/**
 * @desc   构建dao基类实现类
 * @author yangsheng
 * @date   2018-03-12
 */
public class BaseDaoImpl implements BaseDao{
	
	private SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	//数据对象添加
	public int insert(Object object) {
		return getSqlSession().insert("insert", object);
	}
	
	//根据主键id查询数据对象
	public Object queryObjectByID(int id) {
		return getSqlSession().selectOne("queryObjectById", id);
	}
	
/*	@SuppressWarnings("unchecked")
	public List<T> queryAllObject(T t) {  
        List<T> list = getSqlSession().selectList("queryAllObject");  
        return list;   
    } */ 
	
	/*@Override
	public Object queryObjectByID(String id) {
		return getSqlSession().selectOne("queryObjectById", id);
	}*/

	/*@SuppressWarnings("unchecked")
	public <T> T queryObjectByID(String sqlId, String id, Class<T> cls) {
		return (T) getSqlSession().selectOne(sqlId, id);
	}*/

	/*public int insert(String sqlId, Object object) {
		return (Integer) getSqlSession().insert(sqlId, object);
	}*/
	
	public int update(Object object) {
		return getSqlSession().update("update", object);
	}

	/*public int deleteObjectByID(String sqlId, Object object) {
		return getSqlSession().update("updateObject", object);
	}*/

	

	/*@Override
	public Object queryObjectByID(String sqlId, String id, Class cls) {
		// TODO Auto-generated method stub
		return null;
	}
*/
	/*@Override
	public Object queryObjectByID(String sqlId, String id, Class cls) {
		// TODO Auto-generated method stub
		return null;
	}*/

	
}
