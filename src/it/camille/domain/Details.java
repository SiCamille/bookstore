package it.camille.domain;

/**
 * 订单详情模型类
 * 
 * @author Camille
 * @version 1.0,2016-12-6 21:05:21
 */
public class Details {

	/** 图书ID */
	private String bid;
	
	/** 订单ID */
	private String oid;

	public String getBid() {
		return bid;
	}

	public void setBid(String bid) {
		this.bid = bid;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}
	
}
