package it.camille.servlet;

import it.camille.domain.User;
import it.camille.service.UserService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

/**
 * 此类是为了检查用户输入的用户名和密码是否与数据库中的匹配,并对验证码进行验证
 * 
 * @author Camille
 * @version 1.0,2016-11-23 11:15:49
 */
public class LoginServlet extends HttpServlet {

	/**
	 * 重写doGet方法,调用doPost()方法,全部由doPost方法处理
	 * 
	 * @param request 用户请求信息
	 * @param response 响应信息
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * 重写doPost方法,调用数据库验证用户输入
	 * 
	 * @param request 用户请求信息
	 * @param response 响应信息
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		//获取验证码
		String checkCode = (String) request.getSession().getAttribute("checkCode");
		request.getSession().removeAttribute("checkCode");
		request.setCharacterEncoding("utf-8");	
		String code = (String) request.getParameter("code");
		if(!checkCode.equalsIgnoreCase(code)) {
			request.setAttribute("mistake", "验证码错误");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		//获取数据库信息,与用户输入进行匹配
		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		UserService service = new UserService();
		String key = service.loginUser(user);
		//如匹配上,进入主界面,否则进入失败界面
		if("ok".equals(key)) {
			System.out.println(user.getUsername() + "用户已登录");
			Cookie cookie = new Cookie("autoLogin", user.getUsername() + "%camille%" + user.getPassword());
			cookie.setMaxAge(60*60*24);
			cookie.setPath("/");
			response.addCookie(cookie);
			request.getSession().setAttribute("user", user);
			response.sendRedirect("${pageContext.request.contextPath}/main.jsp");
			return;
		} else {
			request.setAttribute("mistake", key);
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		
	}

}
