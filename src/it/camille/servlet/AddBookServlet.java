package it.camille.servlet;

import it.camille.domain.Book;
import it.camille.domain.User;
import it.camille.service.BookService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

/**
 * 添加图书web层控制类
 * 
 * @author Camille
 * @version 1.0,2016-12-5 8:55:21
 */
public class AddBookServlet extends HttpServlet {

	/**
	 * 重写doGet方法,指向doPost方法由doPost方法处理
	 * 
	 * @param request 请求信息
	 * @param response 响应信息
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * 重写doPost方法,对用户传入信息进行处理
	 * 
	 * @param request 请求信息
	 * @param response 响应信息
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		try {
			double price = Double.parseDouble(request.getParameter("price"));
			
			if(name == null || name.trim().length() == 0) {
				request.setAttribute("add_msg", "图书名称不能为空");
				request.getRequestDispatcher("/add.jsp").forward(request, response);
				return;
			} else if(price < 0) {
				request.setAttribute("addBook_msg", "图书单价不得小于0元");
				request.getRequestDispatcher("/add.jsp").forward(request, response);
				return;
			}
		} catch (Exception e) {
			request.setAttribute("addBook_msg", "单价输入有误,请重新输入");
			request.getRequestDispatcher("/add.jsp").forward(request, response);
			return;
		}
		
		Book book = new Book();
		try {
			BeanUtils.populate(book, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		BookService servies = new BookService();
		String key = servies.addBook(book);
		if("ok".equals(key)) {
			System.out.println(((User)request.getSession().getAttribute("user")).getUsername() + "添加了图书" + book.getName());
			response.sendRedirect(request.getContextPath() + "/book/bookSuccess.jsp");
			return;
		} else {
			request.setAttribute("addBook_msg", key);
			request.getRequestDispatcher("/add.jsp").forward(request, response);
			return;
		}
		
	}

}
