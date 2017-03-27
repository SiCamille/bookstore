package it.camille.service;

import it.camille.dao.UserDao;
import it.camille.domain.User;

/**
 * 用户业务类
 * 
 * @author Camille
 * @version 1.0,2016-12-6 17:17:13
 */
public class UserService {

	/** 获取Dao层对象 */
	private UserDao dao = new UserDao();
	
	/**
	 * 用户信息注册
	 * 
	 * @param user 用户信息对象
	 * @return true 注册成功 false 注册失败
	 */
	public String registUser(User user) {
		return dao.registUser(user);
	}
	
	/**
	 * 用户登录信息检查
	 * 
	 * @param user 输入模型对象
	 * @return String 响应信息
	 */
	public String loginUser(User user) {
		return dao.loginUser(user);
	}
}
