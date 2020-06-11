package com.mcdonald.ser;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mcdonald.cls.Cart;
import com.mcdonald.cls.InputChecker;

/**
 * Servlet implementation class LoginServe
 */
@WebServlet("/LoginServe")
public class LoginServe extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InputChecker ic = new InputChecker();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServe() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String send = "store.jsp";
		if (request.getParameter("logOut") != null) {
			Cookie[] co = request.getCookies();
			for (Cookie c : co) {
				if (c.getName().equals("loggedStatus")) {
					c.setValue("false");
					response.addCookie(c);
				}
			}
			send = "store.jsp";
		} else {
			if (!ic.checkLogin(request.getParameter("userName"), request.getParameter("pass"))) {
				request.getSession().setAttribute("login", "invalid");
				send = "login.jsp";
			} else {
				Cookie user = new Cookie("user", request.getParameter("userName"));
				Cookie logged = new Cookie("loggedStatus", "true");
				if(request.getSession().getAttribute("cart")==null) {
					request.getSession().setAttribute("cart", new Cart());
				}
				response.addCookie(user);
				response.addCookie(logged);
			}
		}
		response.sendRedirect(send);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
