package it.camille.utils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.sql.DataSource;
import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * JDBC工具类
 * 
 * @author Camille
 * @version 1.0,2016-12-6 18:06:58
 */
public class JDBCUtils {

	/** 获取C3P0连接池对象 */
	private static ComboPooledDataSource datasource = new ComboPooledDataSource();
	
	/** 工具类私有构造方法 */
	private JDBCUtils(){}
	
	/**
	 * 获取链接对象
	 * 
	 * @return conn 连接对象
	 */
	public static Connection getConnection() {
		Connection conn = null;
		try {
			conn = datasource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	/**
	 * 获取连接池对象
	 * 
	 * @return DataSource 连接池对象
	 */
	public static DataSource getDataSource() {
		return datasource;
	}
	
	/**
	 * 释放资源
	 * 
	 * @param stmt 指令集对象
	 * @param conn 连接对象
	 */
	public static void free(Statement stmt, Connection conn) {
		//释放指令集对象
		if(stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			stmt = null;
		}
		
		//释放连接对象
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			conn = null;
		}
	}
	
	/**
	 * 释放资源
	 * 
	 * @param set 结果集对象
	 * @param stmt 指令集对象
	 * @param conn 连接对象
	 */
	public static void free(ResultSet set, Statement stmt, Connection conn) {
		//释放结果集对象
		if(set != null) {
			try {
				set.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			set = null;
		}
		
		//释放指令集对象
		if(stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			stmt = null;
		}
		
		//释放连接对象
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			conn = null;
		}
	}
}
