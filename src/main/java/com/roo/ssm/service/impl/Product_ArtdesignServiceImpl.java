package com.roo.ssm.service.impl; 
  
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.roo.ssm.bean.Artdesign_Imgresource;
import com.roo.ssm.bean.Product_Artdesign;
import com.roo.ssm.bean.Product_Cart;
import com.roo.ssm.bean.Product_Collection;
import com.roo.ssm.bean.User;
import com.roo.ssm.controller.UserController;
import com.roo.ssm.dao.Artdesign_ImgresourceDao;
import com.roo.ssm.dao.BaseDao;
import com.roo.ssm.dao.PermissionDao;
import com.roo.ssm.dao.Product_ArtdesignDao;
import com.roo.ssm.dao.Product_CartDao;
import com.roo.ssm.dao.Product_CollectionDao;
import com.roo.ssm.dao.Role_PermissionDao;
import com.roo.ssm.dao.UserDao;
import com.roo.ssm.dao.User_RoleDao;
import com.roo.ssm.service.Product_ArtdesignService;
import com.roo.ssm.service.UserService;
import com.roo.utils.LocalConstants;
 
@Service  
public class Product_ArtdesignServiceImpl implements Product_ArtdesignService {  
	private static final transient Logger logger = Logger.getLogger(Product_ArtdesignServiceImpl.class);
	
	@Autowired
	private Product_Artdesign product_Artdesign;
	
    @Autowired  
    private Product_ArtdesignDao product_ArtdesignDao;
    
    @Autowired  
    private Artdesign_Imgresource artdesign_Imgresource;
    
    @Autowired  
    private Artdesign_ImgresourceDao artdesign_ImgresourceDao;
    
    @Autowired  
    private Product_CartDao product_CartDao;
    
    @Autowired  
    private Product_CollectionDao product_CollectionDao;
    
    //根据关键字（输入框），分页查询商品
    public List<Product_Artdesign> queryProduct_ArtdesignByKeywordsAndPageNumber(String keywords, int pageNumber) {
		return product_ArtdesignDao.queryProduct_ArtdesignByKeywordsAndPageNumber(keywords,LocalConstants.PAGE_SET.PAGE_SIZE*(pageNumber-1), LocalConstants.PAGE_SET.PAGE_SIZE*pageNumber);
	}
    
    //根据商品id，查询图片资源信息
    public List<Artdesign_Imgresource> queryArtdesign_ImgresourceByartdesignid(int artdesignid) {
		return artdesign_ImgresourceDao.queryArtdesign_ImgresourceByartdesignid(artdesignid);
	}
   
    //根据商品id，查询商品资源信息
    public Product_Artdesign queryProduct_ArtdesignByid(int id){
    	return (Product_Artdesign) product_ArtdesignDao.queryObjectByID(id);
    }

    //用户商品添加到购物车
	public int addProductToCart(Product_Cart product_Cart) {
		return product_CartDao.insert(product_Cart);
	}

	//根据用户id查询商品收藏列表
	public List<Product_Collection> queryProduct_CollectionListByUserId(int userId) {
		return product_CollectionDao.queryProduct_CollectionListByUserId(userId);
	}

	//用户收藏商品
	public int addProduct_CollectionObject(Product_Collection product_Collection) {
		return product_CollectionDao.insert(product_Collection);
	}

	public List<Product_Cart> queryProduct_CartListByUserId(int userId) {
		return product_CartDao.queryProduct_CartListByUserId(userId);
	}

	public int cancelCollectionObject(Product_Collection product_Collection) {
		product_Collection.setState("0");
		return product_CollectionDao.update(product_Collection);
	};
    
} 