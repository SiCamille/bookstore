package it.camille.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import it.camille.domain.Classify;
import it.camille.service.BookService;

/**
 * 添加分类信息web控制层
 * 
 * @author Camille
 * @version 1.0,2016-12-7 8:21:40
 */
public class AddClalssifyServlet extends HttpServlet {

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
	 * 对添加信息进行处理
	 * 
	 * @param request 请求信息
	 * @param response 响应信息
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		if(name.trim().length() == 0 || name.isEmpty() || name==null) {
			request.setAttribute("addclassify_msg", "分类名称不能为空");
			request.getRequestDispatcher("/classify/addclassify.jsp").forward(request, response);
			return;
		}
		Classify classify = new Classify();
		try {
			BeanUtils.populate(classify, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		BookService service = new BookService();
		String key = service.addClassify(classify);
		if("ok".equals(key)) {
			response.sendRedirect(request.getContextPath() + "/classify/classifysuccess.jsp");
			return;
		} else {
			request.setAttribute("addclassify_msg", key);
			request.getRequestDispatcher("/classify/addclassify.jsp").forward(request, response);
			return;
		}
	}

}
