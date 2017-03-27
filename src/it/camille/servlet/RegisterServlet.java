package it.camille.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import it.camille.domain.User;
import it.camille.service.UserService;

/**
 * 检查注册信息是否正确
 * 
 * @author Camille
 * @version 1.0,2016-11-27 18:21:49
 */
public class RegisterServlet extends HttpServlet {

	/**
	 * 重写doGet方法,指向doPost
	 * 
	 * @param request 请求信息
	 * @param response 响应信息
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * 重写doPost方法,对用户注册信息进行判断
	 * 
	 * @param request 请求信息
	 * @param response 响应信息
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String code = request.getParameter("code");
		String checkCode = (String) request.getSession().getAttribute("checkCode");
		if(code==null||checkCode==null||!(code.equalsIgnoreCase(checkCode))) {
			request.setAttribute("reMistake", "验证码错误");
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			return;
		}
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String rePassword = request.getParameter("rePassword");
		String name = request.getParameter("name");
		if((password.length() < 6 || password.length() > 13) || 
				(rePassword.length() < 6 || rePassword.length() > 13)) {
			request.setAttribute("reMistake", "密码长度需在6-13位之间");
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			return;
		}
		if(username.length() > 10) {
			request.setAttribute("reMistake", "用户名长度不得超过10个字符");
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			return;
		}
		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		UserService service = new UserService();
		String key = service.registUser(user);
		if("ok".equals(key)) {
			System.out.println("用户:" + username + "注册成功");
			Cookie cookie = new Cookie("registusername",username);
			if(name.trim().length() > 0) {
				cookie.setValue(name);;
			}
			cookie.setMaxAge(7*24*60*60);
			cookie.setPath("/");
			response.addCookie(cookie);
			response.sendRedirect("registerSuccess.jsp");
		} else {
			request.setAttribute("reMistake", key);
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			return;
		}
	}

}
