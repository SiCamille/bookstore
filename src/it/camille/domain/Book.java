package it.camille.domain;

/**
 * 图书模型类
 * 
 * @author Camille
 * @version 1.0,2016-12-6 20:42:42
 */
public class Book{
	
	/** 图书ID */
	private String bid;
	
	/** 图书名称 */
	private String name;
	
	/** 图书单价 */
	private double price;
	
	/** 图书图片 */
	private String picture;
	
	/** 订单ID */
	private String cid;
	
	public String getBid() {
		return bid;
	}
	
	public void setBid(String bid) {
		this.bid = bid;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public double getPrice() {
		return price;
	}
	
	public void setPrice(double price) {
		this.price = price;
	}
	
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

}
