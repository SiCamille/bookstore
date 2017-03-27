package it.camille.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import it.camille.domain.Book;
import it.camille.domain.PageBean;
import it.camille.domain.User;
import it.camille.service.BookService;
import it.camille.utils.FunctionUtils;

/**
 * 根据传入的信息对图书进行CRUD操作
 * 
 * @author Camille
 * @version 1.0,2016-12-11 10:57:51
 */
public class BookServlet extends BaseServlet {
	
	/** 获取静态业务层对象 */
	private static BookService service = new BookService();

	/**
	 * 添加图书的方法
	 * 
	 * @param request 请求信息
	 * @param response 响应信息
	 * @return String 转发地址
	 */
	public String addBook(HttpServletRequest request, HttpServletResponse response) {
		/*String name = request.getParameter("name");
		try {
			double price = Double.parseDouble(request.getParameter("price"));
			
			if(name == null || name.trim().length() == 0) {
				request.setAttribute("addBook_msg", "图书名称不能为空");
				return "/book/addBook.jsp";
			} else if(price < 0) {
				request.setAttribute("addBook_msg", "图书单价不得小于0元");
				return "/book/addBook.jsp";
			}
		} catch (Exception e) {
			request.setAttribute("addBook_msg", "单价输入有误,请重新输入");
			return "/book/addBook.jsp";
		}
		Book book = new Book();
		try {
			BeanUtils.populate(book, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		String key = service.addBook(book);
		if("ok".equals(key)) {
			System.out.println("用户:" + ((User)request.getSession().getAttribute("user")).getUsername() + " 添加了图书:" + book.getName());
			try {
				response.sendRedirect(request.getContextPath() + "/book/bookSuccess.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		} else {
			request.setAttribute("addBook_msg", key);
			return "/book/addBook.jsp";
		}*/
		DiskFileItemFactory factory = new DiskFileItemFactory(5*1024, new File(request.getServletContext().getRealPath("/temp")));
		ServletFileUpload fileUpload = new ServletFileUpload(factory);
		fileUpload.setFileSizeMax(100*1024*1024);
		if(!fileUpload.isMultipartContent(request)) {
			request.setAttribute("addBook_msg", "请求信息出错");
			return "/book/addBook.jsp";
		}
		Book book = new Book();
		try {
			fileUpload.setHeaderEncoding("UTF-8");
			List<FileItem> list = fileUpload.parseRequest(request);
			for (FileItem fileItem : list) {
				if(fileItem.isFormField()) {
					String name = fileItem.getFieldName();
					if("name".equals(name)) {
						String value = FunctionUtils.getUTF8(fileItem.getString());
						if(FunctionUtils.checkString(value)) {
							book.setName(value);
						} else {
							request.setAttribute("addBook_msg", "名称不能为空");
							return "/book/addBook.jsp";
						}
					} else if("price".equals(name)) {
						String value = FunctionUtils.getUTF8(fileItem.getString());
						System.out.println(value);
						try {
							double price = Double.parseDouble(value);
							if(price < 0) {
								request.setAttribute("addBook_msg", "图书单价不得小于0元");
								return "/book/addBook.jsp";
							}
							book.setPrice(price);
						} catch (Exception e) {
							request.setAttribute("addBook_msg", "单价输入有误");
							return "/book/addBook.jsp";
						}
					}
					book.setCid(null);
				} else {
					String path = this.getServletContext().getRealPath("/upload");
					File dir = new File(path);
					if(!dir.exists()) {
						dir.mkdirs();
					}
					String name = fileItem.getName();
					if(name.lastIndexOf("\\") != -1) {
						int index = name.lastIndexOf("\\");
						name = name.substring(index + 1);
					}
					name = FunctionUtils.getUUIDPath(name);
					String upath = FunctionUtils.getRandomPath(name);
					path += upath;
					String filePath = path + "\\" + name;
					if(name == "" || name == null) {
						book.setPicture(null);
					} else {
						book.setPicture(request.getContextPath() + "/upload" + upath + "\\" + name);
					}
					dir = new File(path);
					if(!dir.exists()) {
						dir.mkdirs();
					}
					if(!dir.isHidden() && dir.canRead()) {
						InputStream is = fileItem.getInputStream();
						OutputStream os = new FileOutputStream(filePath);
						int len = -1;
						byte[] arr = new byte[1024];
						while((len = is.read(arr)) != -1) {
							os.write(arr, 0, len);
						}
						is.close();
						os.close();
						fileItem.delete();
					}
				}
			}
			String key = service.addBook(book);
			if("ok".equals(key)) {
				System.out.println("用户:" + ((User)request.getSession().getAttribute("user")).getUsername() + " 添加了图书:" + book.getName());
				try {
					response.sendRedirect(request.getContextPath() + "/book/bookSuccess.jsp");
				} catch (IOException e) {
					e.printStackTrace();
				}
				return null;
			} else {
				request.setAttribute("addBook_msg", key);
				return "/book/addBook.jsp";
			}
		} catch (FileUploadException | IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 根据用户输入信息获取图书集合
	 * 
	 * @param request 请求信息
	 * @param response 响应信息
	 * @return String 转发地址
	 */
	public String findBookByMsg(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String[]> map = request.getParameterMap();
		Map<String, String> filterMap = new HashMap<String, String>();
		boolean flag = false;
		for (String string : map.keySet()) {
			String[] arr = map.get(string);
			String str = arr[0];
			if(str.trim().length() > 0 && !("method".equalsIgnoreCase(string))) {
				filterMap.put(string, str);
				flag = true;
			}
			//map.remove(string);
		}
		if(!flag) {
			request.setAttribute("findBookByMsg_msg", "输入不能为空");
			return "/book/findBookByMsg.jsp";
		}
		List<Book> list = service.findBookByMsg(filterMap);
		if(list.size() > 0) {
			System.out.println("用户:" + ((User)request.getSession().getAttribute("user")).getUsername() + "根据指定信息搜索了图书");
			request.getSession().setAttribute("list", list);
			try {
				response.sendRedirect(request.getContextPath() + "/book/showBook.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		} else {
			request.setAttribute("findBookByMsg_msg", "无相应图书");
			return "/book/findBookByMsg.jsp";
		}
	}
	
	/**
	 * 浏览全部图书方法
	 * 
	 * @param request 请求信息
	 * @param response 响应信息
	 * @return String 转发路径
	 */
	public String showBook(HttpServletRequest request, HttpServletResponse response) {
		int currPage = Integer.parseInt(request.getParameter("currPage"));
		PageBean<Book> page = service.getBookByPage(currPage);
		if(page != null) {
			request.setAttribute("page", page);
			System.out.println("用户:" + ((User)request.getSession().getAttribute("user")).getUsername() + "浏览了图书");
			return "/book/showBookByPage.jsp";
		}
		return null;
	}
	
	/**
	 * 根据ID查找图书方法
	 * 
	 * @param request 请求参数
	 * @param response 响应参数
	 * @return String 转发路径
	 */
	public String updateBook(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("bid");
		Book book = service.findBookById(id);
		String currPage = request.getParameter("currPage");
		request.setAttribute("book", book);
		request.setAttribute("currPage", currPage);
		return "/book/changeBook.jsp";
	}
	
	/**
	 * 修改图书属性的方法
	 * 
	 * @param request 请求信息
	 * @param response 响应信息
	 * @return String 转发路径
	 */
	public String changeBook(HttpServletRequest request, HttpServletResponse response) {
		/*Book book = new Book();
		try {
			BeanUtils.populate(book, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		System.out.println(request.getParameter("price"));
		System.out.println(request.getParameter("name"));
		if(request.getParameter("price") != null || request.getParameter("price").trim().length() > 0) {
			try {
				double price = Double.parseDouble(request.getParameter("price"));
				if(price < 0) {
					request.setAttribute("change_msg", "图书单价不得小于0元");
					return "/book/changeBook.jsp";
				}
			} catch (Exception e) {
				request.setAttribute("change_msg", "单价输入有误,请重新输入");
				return "/book/changeBook.jsp";
			}
		} else {
			book.setPrice(-1);
		}
		int num = service.changeBook(book);
		if(num > 0) {
			System.out.println("用户:" + ((User)request.getSession().getAttribute("user")).getUsername() + "修改了图书:" + service.findBookById(book.getBid()).getName());
			try {
				response.sendRedirect(request.getContextPath() + "/bookServlet?method=showBook&currPage=" + request.getParameter("currPage"));
				return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			request.setAttribute("changeBook_msg", "修改失败");
			return "/book/changeBook.jsp";
		}
		return null;*/
		DiskFileItemFactory factory = new DiskFileItemFactory(5*1024, new File(request.getServletContext().getRealPath("/temp")));
		ServletFileUpload fileUpload = new ServletFileUpload(factory);
		fileUpload.setFileSizeMax(100*1024*1024);
		if(!fileUpload.isMultipartContent(request)) {
			request.setAttribute("changeBook_msg", "请求信息出错");
			return "book/changeBook.jsp";
		}
		Book book = new Book();
		try {
			List<FileItem> list = fileUpload.parseRequest(request);
			for (FileItem fileItem : list) {
				if(fileItem.isFormField()) {
					String name = fileItem.getFieldName();
					if("name".equals(name)) {
						String value = FunctionUtils.getUTF8(fileItem.getString());
						if(FunctionUtils.checkString(value)) {
							book.setName(value);
						} else {
							book.setName(null);
						}
					} else if("price".equals(name)) {
						String value = FunctionUtils.getUTF8(fileItem.getString());
						System.out.println("单价:" + value);
						if(value == "" || value == null || value.trim().length() == 0) {
							book.setPrice(-1);
						} else {
							try {
								double price = Double.parseDouble(value);
								if(price < 0) {
									request.setAttribute("changeBook_msg", "图书单价不得小于0元");
									return "/book/changeBook.jsp";
								} else if(price >= 0) {
									book.setPrice(price);
								}
							} catch (Exception e) {
								request.setAttribute("changeBook_msg", "单价输入有误");
								return "/book/changeBook.jsp";
							}
						}
					}
					book.setBid(request.getParameter("bid"));
					book.setCid(request.getParameter("cid"));
				} else {
					String path = this.getServletContext().getRealPath("/upload");
					File dir = new File(path);
					if(!dir.exists()) {
						dir.mkdirs();
					}
					String name = fileItem.getName();
					if(name.lastIndexOf("\\") != -1) {
						int index = name.lastIndexOf("\\");
						name = name.substring(index + 1);
					}
					name = FunctionUtils.getUUIDPath(name);
					String upath = FunctionUtils.getRandomPath(name);
					path += upath;
					String filePath = path + "\\" + name;
					if(name == "" || name == null) {
						book.setPicture(null);
					} else {
						book.setPicture(request.getContextPath() + "/upload" + upath + "\\" + name);
					}
					dir = new File(path);
					if(!dir.exists()) {
						dir.mkdirs();
					}
					if(!dir.isHidden() && dir.canRead()) {
						InputStream is = fileItem.getInputStream();
						OutputStream os = new FileOutputStream(filePath);
						int len = -1;
						byte[] arr = new byte[1024];
						while((len = is.read(arr)) != -1) {
							os.write(arr, 0, len);
						}
						is.close();
						os.close();
						fileItem.delete();
					}
				}
			}
			int key = service.changeBook(book);
			if(key > 0) {
				response.sendRedirect(request.getContextPath() + "/bookServlet?method=showBook&currPage=" + request.getParameter("currPage"));
				return null;
			} else {
				request.setAttribute("changeBook_msg", "修改失败");
				return "/book/changeBook.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 根据指定的ID删除图书
	 * 
	 * @param request 请求信息
	 * @param response 响应信息
	 * @return String 转发地址
	 */
	public String deleteBook(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("bid");
		int num = service.deleteBookById(id);
		if(num > 0) {
			try {
				response.sendRedirect(request.getContextPath() + "/bookServlet?method=showBook&currPage=" + request.getParameter("currPage"));
				return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			request.setAttribute("showBook_msg", "删除失败");
		}
		return "/bookServlet?method=showBook&currPage=" + request.getParameter("currPage");
	}
}
