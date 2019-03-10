package com.roo.ssm.service.impl; 
  
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.roo.ssm.bean.Advertise_Carousel;
import com.roo.ssm.bean.Shop;
import com.roo.ssm.bean.User;
import com.roo.ssm.bean.User_Creditsoperate;
import com.roo.ssm.controller.UserController;
import com.roo.ssm.dao.Advertise_CarouselDao;
import com.roo.ssm.dao.BaseDao;
import com.roo.ssm.dao.PermissionDao;
import com.roo.ssm.dao.Role_PermissionDao;
import com.roo.ssm.dao.ShopDao;
import com.roo.ssm.dao.UserDao;
import com.roo.ssm.dao.User_CreditsoperateDao;
import com.roo.ssm.dao.User_PlaceDao;
import com.roo.ssm.dao.User_RoleDao;
import com.roo.ssm.service.CreditsService;
import com.roo.ssm.service.OutShowService;
import com.roo.ssm.service.UserService;

  
@Service  
public class OutShowServiceImpl implements OutShowService {  
	private static final transient Logger logger = Logger.getLogger(OutShowServiceImpl.class);
    
    @Autowired  
    private Advertise_CarouselDao advertise_CarouselDao;
    
    @Autowired  
    private ShopDao shopDao;
    
    //查询主页轮播信息
	public List<Advertise_Carousel> queryAllAdvertise_Carousel() {
		return advertise_CarouselDao.queryAllAdvertise_Carousel();
	}

	//查询主页展示的店铺信息
	public List<Shop> queryShopForInitShow() {
		return shopDao.queryShopForInitShow();
	}
    
} 