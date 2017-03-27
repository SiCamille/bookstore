package it.camille.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import it.camille.domain.User;
import it.camille.service.UserService;
import it.camille.utils.FunctionUtils;

/**
 * 自动登录处理过滤器
 * 
 * @author Camille
 * @version 1.0,2016-12-11 8:37:17
 */
public class LoginFilter implements Filter {

	@Override
	/**
	 * 重写初始化方法
	 * 
	 * @param filterConfig 过滤器配置对象
	 */
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	/**
	 * 重写执行方法,对Cookie中信息进行判断
	 * 
	 * @param request 请求信息
	 * @param response 响应信息
	 * @param chain 过滤器链对象
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		HttpServletRequest hsr = (HttpServletRequest) request;
		User user = (User) hsr.getSession().getAttribute("user");
		if(user != null) {
			chain.doFilter(request, response);
			return;
		} else {
			Cookie[] cookies = hsr.getCookies();
			Cookie cookie = FunctionUtils.getCookie(cookies, "autoLogin");
			if(cookie == null) {
				chain.doFilter(request, response);
				return;
			} else {
				String value = cookie.getValue();
				String username = value.split("%camille%")[0];
				String password = value.split("%camille%")[1];
				user = new User();
				user.setUsername(username);
				user.setPassword(password);
				UserService service = new UserService();
				String key = service.loginUser(user);
				if("ok".equals(key)) {
					hsr.getSession().setAttribute("user", user);
					chain.doFilter(request, response);
					return;
				}
			}
		}
		chain.doFilter(request, response);
	}

	@Override
	/**
	 * 重写关闭方法
	 */
	public void destroy() {
	}

}
