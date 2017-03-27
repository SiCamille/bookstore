package it.camille.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import it.camille.domain.Book;
import it.camille.domain.Classify;
import it.camille.utils.FunctionUtils;
import it.camille.utils.JDBCUtils;

/**
 * 图书业务处理层
 * 
 * @author Camille
 * @version 1.0,2016-12-6 21:43:02
 */
public class BookDao {

	/** 获取DBUtils对象 */
	private static QueryRunner runner = new QueryRunner(JDBCUtils.getDataSource());
	
	/**
	 * 根据分类模型添加分类
	 * 
	 * @param classify 分类模型
	 * @return String 响应信息
	 */
	public String addClassify(Classify classify) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet set = null;
		try {
			String sql = "select * from classify where name = ?";
			conn = JDBCUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, classify.getName());
			set = stmt.executeQuery();
			if (set.next()) {
				return "分类名已存在";
			}

			sql = "insert into classify values(?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, FunctionUtils.getUUID());
			stmt.setString(2, classify.getName());
			int num = stmt.executeUpdate();
			if (num > 0) {
				return "ok";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.free(set, stmt, conn);
		}
		return "添加失败";
	}

	/**
	 * 根据传入的ID获取分类模型
	 * 
	 * @param id 分类ID值
	 * @return Classify 查找到的分类对象
	 */
	public Classify findClassifyById(String id) {
		QueryRunner runner = new QueryRunner(JDBCUtils.getDataSource());
		Classify classify = null;
		try {
			classify = runner.query("select * from classify where cid = ?", new BeanHandler<Classify>(Classify.class),
					id);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return classify;
	}

	/**
	 * 根据模型修改分类信息
	 * 
	 * @param classify 分类模型
	 * @return String 响应信息
	 */
	public String updateClassify(Classify classify) {
		
		try {
			runner.update("update classify set name = ? where cid = ?",
					classify.getName(), classify.getCid());
			return "ok";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "修改失败";
	}

	/**
	 * 根据ID删除分类模型
	 * 
	 * @param id
	 * @return String 响应信息
	 */
	public String deleteClassifyById(String id) {
		try {
			runner.update("delete from classify where cid = ?",id);
			return "ok";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "删除失败";
	}

	/**
	 * 获取分类模型数量
	 * 
	 * @return int 分类模型总数
	 */
	public int getClassifyCount() {
		String sql = "select count(*) from classify";
		Long count = -1L;
		try {
			count = (Long) runner.query(sql, new ScalarHandler());
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("获取分类模型数量出错");
		}
		return count.intValue();
	}

	/**
	 * 根据传入的起始值和每页显示数量获取分类模型List集合
	 * 
	 * @param begin 起始值
	 * @param pageSize 每页显示数量
	 * @return List<Classify> 分类模型List集合
	 */
	public List<Classify> findClassifyListByPage(int begin, int pageSize) {
		String sql = "select * from classify limit ?,?";
		List<Classify> list;
		try {
			list = runner.query(sql, new BeanListHandler<Classify>(Classify.class),begin,pageSize);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("获取分类模型集合出错");
		}
		return list;
	}

	/**
	 * 根据录入图书信息进行存储
	 * 
	 * @param book 录入图书信息模型
	 * @return String 响应信息
	 */
	public String addBook(Book book) {
		String sql = "select * from book where name = ?";
		Book b;
		try {
			b = runner.query(sql, new BeanHandler<Book>(Book.class), book.getName());
			if(b != null) {
				return "图书已存在";
			}
			sql = "insert into book values(?,?,?,?,null)";
			Object[] params = {FunctionUtils.getUUID(),book.getName(),book.getPrice(),book.getPicture()};
			if(book.getPicture() == null) {
				params[3] = null;
			}
			int num = runner.update(sql, params);
			if(num > 0) {
				return "ok";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return "添加失败";
	}

	/**
	 * 根据指定信息查询图书
	 * 
	 * @param map 用户输入信息
	 * @return List<Book> 查找到的图书集合
	 */
	public List<Book> findBookByMsg(Map<String, String> map) {
		StringBuffer sql = new StringBuffer("select * from book where ");
		Object[] params = new Object[map.size()];
		int i = 0;
		for (String key : map.keySet()) {
			if(i == 0) {
				sql.append(key).append(" like ").append(" CONCAT('%',?,'%')");
			} else {
				sql.append(" and ").append(key).append(" like ").append(" CONCAT('%',?,'%')");
			}
			params[i] = map.get(key);
			i++;
		}
		List<Book> list;
		try {
			list = runner.query(sql.toString(), new BeanListHandler<Book>(Book.class),params);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return list;
	}

	/**
	 * 获取数据库中图书数量
	 * 
	 * @return int 数据库中图书数量
	 */
	public int getBookCount() {
		String sql = "select count(*) from book";
		Long l;
		try {
			l = (Long) runner.query(sql, new ScalarHandler());
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return l.intValue();
	}
	
	/**
	 * 根据指定起始位置和显示数量,获取图书模型集合
	 * 
	 * @param begin 起始位置
	 * @param pageSize 每页显示数量
	 * @return List<Book> 查询到的图书模型集合
	 */
	public List<Book> findBookListByPage(int begin, int pageSize) {
		String sql = "select * from book limit ?,?";
		List<Book> list;
		try {
			list = runner.query(sql, new BeanListHandler<Book>(Book.class),begin,pageSize);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return list;
	}

	/**
	 * 根据传入的ID查找对应图书
	 * 
	 * @param id 传入的ID值
	 * @return Book 查找到的图书模型
	 */
	public Book findBookById(String id) {
		String sql = "select * from book where bid = ?";
		Book book;
		try {
			book = runner.query(sql, new BeanHandler<Book>(Book.class), id);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return book;
	}

	/**
	 * 修改指定ID图书属性
	 * 
	 * @param book 图书模型
	 * @return num 被影响的行数
	 */
	public int changeBook(Book book) {
		StringBuffer sql = new StringBuffer("update book set ");
		ArrayList<Object> list = new ArrayList<Object>();
		if(book.getName() != null) {
			sql.append("name = ? ,");
			list.add(book.getName());
		}
		if(book.getPrice() != -1) {
			sql.append("price = ? ,");
			list.add(book.getPrice());
		}
		if(book.getPicture() != null) {
			sql.append("picture = ? ,");
			list.add(book.getPicture());
		}
		if(book.getCid() != null) {
			sql.append("cid = ? ,");
			list.add(book.getCid());
		}
		String s = sql.substring(0, sql.length() - 1);
		s += "where bid = ?";
		list.add(book.getBid());
		Object[] params = list.toArray();
		try {
			int num = runner.update(s,params);
			return num;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 根据传入的ID删除对应图书
	 * 
	 * @param id 传入的ID
	 * @return num 受影响的行数
	 */
	public int deleteBookById(String id) {
		String sql = "delete from book where bid = ?";
		int num;
		try {
			num = runner.update(sql,id);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return num;
	}

}
