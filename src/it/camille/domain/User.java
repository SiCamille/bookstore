package it.camille.domain;

/**
 * 用户信息模型类
 * 
 * @author Camille
 * @version 1.0,
 */
public class User {
	
	/** 用户ID */
	private String uid;
	
	/** 用户名 */
	private String username;
	
	/** 密码 */
	private String password;
	
	/** 昵称 */
	private String name;
	
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
