package it.camille.service;

import java.util.List;
import java.util.Map;
import it.camille.dao.BookDao;
import it.camille.domain.Book;
import it.camille.domain.Classify;
import it.camille.domain.PageBean;

/**
 * 图书业务类
 * 
 * @author Camille
 * @version 1.0,2016-12-6 21:38:18
 */
public class BookService {

	/** 获取处理层对象 */
	private BookDao dao = new BookDao();
	
	/**
	 * 根据模型添加图书分类
	 * 
	 * @param classify 分类模型
	 * @return 
	 */
	public String addClassify(Classify classify) {
		return dao.addClassify(classify);
	}

	/**
	 * 根据传入的ID获取分类模型
	 * 
	 * @param id 分类ID值
	 * @return Classify 查找到的分类对象
	 */
	public Classify findClassifyById(String id) {
		return dao.findClassifyById(id);
	}

	/**
	 * 根据传入的分类模型进行修改
	 * 
	 * @param classify 传入的分类模型
	 * @return String 响应信息
	 */
	public String updateClassify(Classify classify) {
		return dao.updateClassify(classify);
		
	}

	/**
	 * 根据ID删除分类模型
	 * 
	 * @param id
	 * @return String 响应信息
	 */
	public String deleteClassifyById(String id) {
		return dao.deleteClassifyById(id);
	}

	/**
	 * 根据传入页数获取分页模型
	 * 
	 * @param num 当前页数
	 * @return PageBean 分页模型
	 */
	public PageBean getClassifyulByPage(int currPage) {
		PageBean<Classify> page = new PageBean<Classify>();
		page.setCurrPage(currPage);
		int pageSize = 10;
		page.setPageSize(pageSize);
		int totalCount = dao.getClassifyCount();
		page.setTotalCount(totalCount);
		int totalPage = totalCount%pageSize == 0 ? totalCount/pageSize : totalCount/pageSize + 1;
		page.setTotalPage(totalPage);
		int begin = (currPage - 1) * pageSize;
		List<Classify> list = dao.findClassifyListByPage(begin,pageSize); 
		page.setList(list);
		return page;
	}

	/**
	 * 根据录入图书信息进行存储
	 * 
	 * @param book 录入图书信息模型
	 * @return String 响应信息
	 */
	public String addBook(Book book) {
		return dao.addBook(book);
	}

	/**
	 * 根据指定信息查询图书
	 * 
	 * @param map 用户输入信息
	 * @return List<Book> 查找到的图书集合
	 */
	public List<Book> findBookByMsg(Map<String, String> map) {
		return dao.findBookByMsg(map);
	}

	/**
	 * 获取当前页面全部图书
	 * 
	 * @return PageBean<Book> 当前页面全部图书
	 */
	public PageBean<Book> getBookByPage(int currPage) {
		PageBean<Book> page = new PageBean<Book>();
		page.setCurrPage(currPage);
		int pageSize = 5;
		page.setPageSize(pageSize);
		int totalCount = dao.getBookCount();
		page.setTotalCount(totalCount);
		int totalPage = totalCount%pageSize == 0 ? totalCount/pageSize : totalCount/pageSize + 1;
		page.setTotalPage(totalPage);
		int begin = (currPage - 1) * pageSize;
		List<Book> list = dao.findBookListByPage(begin,pageSize); 
		page.setList(list);
		return page;
	}

	/**
	 * 根据传入的ID查找对应图书
	 * 
	 * @param id 传入的ID值
	 * @return Book 查找到的图书模型
	 */
	public Book findBookById(String id) {
		return dao.findBookById(id);
	}

	/**
	 * 修改指定ID图书属性
	 * 
	 * @param book 图书模型
	 * @return num 被影响的行数
	 */
	public int changeBook(Book book) {
		return dao.changeBook(book);
	}

	/**
	 * 根据ID删除图书
	 * 
	 * @param id 需要删除的图书ID
	 * @return int 被影响的行数
	 */
	public int deleteBookById(String id) {
		return dao.deleteBookById(id);
	}
}
