package it.camille.utils;

import java.io.UnsupportedEncodingException;
import java.util.UUID;
import javax.servlet.http.Cookie;

/**
 * 小功能工具类
 * 
 * @author Camille
 * @version 1.0,2016-12-6 20:59:27
 */
public class FunctionUtils {

	/** 工具类私有构造方法 */
	private FunctionUtils() {}
	
	/**
	 * 获取唯一码的方法
	 * 
	 * @return UUID 随机生成的唯一码
	 */
	public static String getUUID() {
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	/**
	 * 根据传入的Cookies获取指定名称的Cookie
	 * 
	 * @param cookies 传入的Cookies数组
	 * @param name 需要查找的名称
	 * @return null 没有对应Cookie Cookie 找到需要的Cookie
	 */
	public static Cookie getCookie(Cookie[] cookies,String name) {
		if(cookies == null) {
			return null;
		}
		for (Cookie cookie : cookies) {
			if(cookie.getName().equals(name)) {
				return cookie;
			}
		}
		return null;
	}
	
	/**
	 * 将传入的ISO8859-1编码转换为UTF-8编码
	 * 
	 * @param value 传入的字符串
	 * @return String 经过转码后的字符串
	 * @throws UnsupportedEncodingException
	 */
	public static String getUTF8(String value) throws UnsupportedEncodingException {
		return new String(value.getBytes("iso8859-1"),"utf-8");
	}
	
	public static boolean checkString(String key) {
		if(key.equals("") || key.isEmpty() || key == null) {
			return false;
		}
		return true;
	}
	
	/**
	 * 将地址值加随机码处理
	 * 
	 * @param path 原地址值
	 * @return String 处理后地址值
	 */
	public static String getUUIDPath(String path) {
		return getUUID() + "_" + path;
	}
	
	/**
	 * 根据名称的哈希值设置地址
	 * 
	 * @param path 传入的地址名
	 * @return String 前缀地址名
	 */
	public static String getRandomPath(String path) {
		int hash = path.hashCode();
		int num1 = hash & 0xf;
		hash = hash >>> 4;
		int num2 = hash & 0xf;
		return "/" + num1 + "/" + num2;
	}

}
