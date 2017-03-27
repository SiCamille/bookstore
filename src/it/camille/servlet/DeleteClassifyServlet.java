package it.camille.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import it.camille.service.BookService;

/**
 * 根据ID删除分类模型
 * 
 * @author Camille
 * @version 1.0,2016-12-7 21:34:28
 */
public class DeleteClassifyServlet extends HttpServlet {

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
	 * 重写doPost方法,获取修改后信息并封装传入底层
	 * 
	 * @param request 请求信息
	 * @param response 响应信息
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		BookService service = new BookService();
		String key = service.deleteClassifyById(id);
		if("ok".equals(key)) {
			response.sendRedirect(request.getContextPath() + "/classifyulByPage?currPage=" + request.getParameter("currPage"));
			return;
		} else {
			request.setAttribute("classifyul_msg", key);
			request.getRequestDispatcher("/classifyul").forward(request, response);
			return;
		}
	}

}
