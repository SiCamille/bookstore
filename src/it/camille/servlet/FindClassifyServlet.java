package it.camille.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import it.camille.domain.Classify;
import it.camille.service.BookService;

/**
 * 修改分类信息WEB控制类
 * 
 * @author Camille
 * @version 1.0,2016-12-7 19:50:36
 */
public class FindClassifyServlet extends HttpServlet {

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
	 * 重写doPost方法,获取ID信息并跳转至修改页面
	 * 
	 * @param request 请求信息
	 * @param response 响应信息
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		BookService service = new BookService();
		Classify classify = service.findClassifyById(id);
		request.setAttribute("classify", classify);
		request.setAttribute("currPage", request.getParameter("currPage"));
		request.getRequestDispatcher("/classify/updateclassify.jsp").forward(request, response);
		return;
	}

}
