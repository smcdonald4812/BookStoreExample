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
import com.mcdonald.cls.Users;
import com.mcdonald.conns.Connect;

/**
 * Servlet implementation class SignUpServ
 */
@WebServlet("/SignUpServ")
public class SignUpServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InputChecker ic = new InputChecker();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignUpServ() {
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
		if (!ic.checkUnameSignup(request.getParameter("uname"))) {
			request.getSession().setAttribute("isValid", "used");
			send = "signup.jsp";
		} else if (!ic.checkEmail(request.getParameter("email"))) {
			request.getSession().setAttribute("isValid", "mail");
			send = "signup.jsp";
		} else if (!ic.checkNewPassword(request.getParameter("pass1"), request.getParameter("pass2"))) {
			request.getSession().setAttribute("isValid", "false");
			send = "signup.jsp";
		} else if (!ic.checkNames(request.getParameter("firstName"), request.getParameter("lastName"))) {
			request.getSession().setAttribute("isValid", "names");
			send = "signup.jsp";
		} else if (!ic.checkAddress(request.getParameter("address"), request.getParameter("city"), request.getParameter("zip"))) {
			request.getSession().setAttribute("isValid", "address");
			send = "signup.jsp";
		} else {
			Users u = new Users();
			Connect con = new Connect();
			u.setNfirst(request.getParameter("firstName"));
			u.setNlast(request.getParameter("lastName"));
			u.setAddress(request.getParameter("address") + ", " + request.getParameter("city") + ", "
					+ request.getParameter("state") + " " + request.getParameter("zip"));
			u.setEmail(request.getParameter("email"));
			u.setMobile(request.getParameter("mobile"));
			u.setUsername(request.getParameter("uname"));
			u.setPassword(request.getParameter("pass1"));
			if (request.getParameter("subscribe") != null)
				u.setSubscribed(true);
			else
				u.setSubscribed(false);
			if (con.setNewUser(u) == 0) {
				request.getSession().setAttribute("isValid", "try");
				send = "signup.jsp";
			} else {
				Cookie co = new Cookie("user", request.getParameter("uname"));
				Cookie logged = new Cookie("loggedStatus", "true");
				request.getSession().setAttribute("cart", new Cart());
				response.addCookie(co);
				response.addCookie(logged);
				request.getSession().setAttribute("loggedIn", true);
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
