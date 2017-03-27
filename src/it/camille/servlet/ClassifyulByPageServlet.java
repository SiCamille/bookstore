package it.camille.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import it.camille.domain.PageBean;
import it.camille.service.BookService;

/**
 * 图书列表初始化类
 * 
 * @author Camille
 * @version 1.0,2016-12-9 18:22:14
 */
public class ClassifyulByPageServlet extends HttpServlet {

	/**
	 * 重写doGet方法,指向doPost方法
	 * 
	 * @param request 请求信息
	 * @param response 响应信息
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * 重写doPost方法,获取列表名称集合根据分页信息转发至jsp
	 * 
	 * @param request 请求信息
	 * @param response 响应信息
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currPage = Integer.parseInt(request.getParameter("currPage"));
		BookService service = new BookService();
		PageBean pageBean = service.getClassifyulByPage(currPage);
		request.setAttribute("pageBean", pageBean);
		request.getRequestDispatcher("/classify/classifyulByPage.jsp").forward(request, response);
		return;
	}

}
