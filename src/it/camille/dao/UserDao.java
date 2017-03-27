package it.camille.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import it.camille.domain.User;
import it.camille.utils.FunctionUtils;
import it.camille.utils.JDBCUtils;

/**
 * 用户业务处理层
 * 
 * @author Camille
 * @version 1.0,2016-12-6 17:19:31
 */
public class UserDao {

	/**
	 * 用户注册信息
	 * 
	 * @param User 注册信息模型
	 * @return String 响应信息
	 */
	public String registUser(User user) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet set = null;
		try {
			//编写SQL语句判断用户名是否存在
			String sql = "select * from user where username = ?";
			//获得连接对象
			conn = JDBCUtils.getConnection();
			
			//获得指令集对象
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, user.getUsername());
			//获得结果集对象
			set = stmt.executeQuery();
			if(set.next()) {
				return "用户名已存在";
			}
			
			//编写SQL语句
			sql = "insert into user values(?,?,?,?)";
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, FunctionUtils.getUUID());
			stmt.setString(2, user.getUsername());
			stmt.setString(3, user.getPassword());
			stmt.setString(4, user.getName());
			
			//执行SQL语句
			int num = stmt.executeUpdate();
			if(num > 0) {
				return "ok";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.free(set, stmt, conn);
		}
		return "注册失败";
	}

	/**
	 * 用户登录信息查询
	 * 
	 * @param User 登录信息模型
	 * @return String 响应信息
	 */
	public String loginUser(User user) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet set = null;
		try {
			//编写SQL语句
			String sql = "select * from user where username = ?";
			
			//获取链接
			conn = JDBCUtils.getConnection();
			
			//获取指令集
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, user.getUsername());
			
			//获取响应集
			set = stmt.executeQuery();
			if(set.next()) {
				sql = "select * from user where username = ? and password = ?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, user.getUsername());
				stmt.setString(2, user.getPassword());
				set = stmt.executeQuery();
				if(set.next()) {
					user.setName(set.getString("name"));
					return "ok";
				} else {
					return "密码错误";
				}
			} else {
				return "用户名不存在";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.free(set, stmt, conn);
		}
		return "登录失败";
	}

}
