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
 * 修改分类列表WEB控制类
 * 
 * @author Camille
 * @version 1.0,2016-12-7 20:32:26
 */
public class UpdateClassifyServlet extends HttpServlet {

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
		String name = request.getParameter("name");
		if(name.trim().length() == 0 || name.isEmpty()) {
			request.setAttribute("updateclassify_msg", "名称不能为空");
			request.getRequestDispatcher("/classify/updateclassify.jsp").forward(request, response);
			return;
		}
		Classify classify = new Classify();
		try {
			BeanUtils.populate(classify, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		BookService service = new BookService();
		String key = service.updateClassify(classify);
		if("ok".equals(key)) {
			response.sendRedirect(request.getContextPath() + "/classifyulByPage?currPage=" + request.getParameter("currPage"));
			return;
		} else {
			request.setAttribute("updateclassify_msg", key);
			request.getRequestDispatcher("/classify/updateclassify.jsp").forward(request, response);
			return;
		}
		
	}

}
