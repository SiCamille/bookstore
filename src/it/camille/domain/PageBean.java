package it.camille.domain;

import java.util.List;

/**
 * 分页模型类
 * 
 * @author Camille
 * @version 1.0,2016-12-9 18:12:19
 */
public class PageBean<T> {

	/** 当前页数 */
	private int currPage;
	
	/** 每页显示条数 */
	private int pageSize;
	
	/** 总条数 */
	private int totalCount;
	
	/** 总页数 */
	private int totalPage;
	
	/** 每页显示分类集合 */
	private List<T> list;

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}
	
}
