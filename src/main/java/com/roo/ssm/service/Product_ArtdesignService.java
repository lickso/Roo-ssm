package com.roo.ssm.service; 
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

import com.roo.ssm.bean.Artdesign_Imgresource;
import com.roo.ssm.bean.Product_Artdesign;
import com.roo.ssm.bean.Product_Cart;
import com.roo.ssm.bean.Product_Collection;



    
  
public interface Product_ArtdesignService {
	
	//输入框，分页查询商品
	public List<Product_Artdesign> queryProduct_ArtdesignByKeywordsAndPageNumber(String keywords,int pageNumber);
	
	 //根据商品id，查询图片资源信息
    public List<Artdesign_Imgresource> queryArtdesign_ImgresourceByartdesignid(int artdesignid);
    
     //根据商品id，查询商品资源信息
    public Product_Artdesign queryProduct_ArtdesignByid(int id);
    
    //商品添加到购物车
    public int addProductToCart(Product_Cart product_Cart); 
    
    //根据用户id购物车商品列表
    public List<Product_Collection> queryProduct_CollectionListByUserId(int userId); 
	
    //根据用户id查询收藏列表
    public List<Product_Cart> queryProduct_CartListByUserId(int userId); 
    
    //用户商品收藏
    public int addProduct_CollectionObject(Product_Collection product_Collection);
    
    //用户取消收藏
    public int cancelCollectionObject(Product_Collection product_Collection);
    
    
	/*//用户登录
	int userLogin(User user);
	
	//通过用户名查询用户信息
	User queryUserByName(String name);
	
	//添加用户
	public int userRegister(User user);
	
    //用户注册  
    int addUser(User user);
    
    int addByBase(User user);
    
    
    
    //通过用户id查询角色id列表 
  	public Set<String> queryRoleIdByUserId(String userId);
	
	//通过用户角色id列表查询权限id列表role_PermissionDao
	public Set<String> queryPermissionIdByRoleId(Set<String> rolesId) ;
	
	//通过用户权限id列表查询用户权限列表
	public Set<String> queryPermissionSetByPermissionIdSet(Set<String> permissionsId) ;
    */
    
    
    //用户登录  
    //boolean login(String name, String password);  
    
    //删除用户
    //boolean deleteUser(int id);
    //修改用户
    //boolean editUser(User user);
    //依照主键查询用户信息
    //User qryUserById(int id);
    //查询用户列表
    //List<User> findAll();

} 