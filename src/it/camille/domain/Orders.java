package it.camille.domain;

import java.util.Date;

/**
 * 订单模型类
 * 
 * @author Camille
 * @version 1.0,
 */
public class Orders {

	/** 订单ID */
	private String oid;
	
	/** 订单日期 */
	private Date date;
	
	/** 订单地址 */
	private String address;
	
	/** 订单状态 */
	private String state;
	
	/** 用户ID */
	private String uid;

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}
	
}
