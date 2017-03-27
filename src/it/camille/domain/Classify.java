package it.camille.domain;

/**
 * 分类模型类
 * 
 * @author Camille
 * @version 1.0,2016-12-6 21:04:02
 */
public class Classify {

	/** 分类ID */
	private String cid;
	
	/** 分类名称 */
	private String name;
	
	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	
}
