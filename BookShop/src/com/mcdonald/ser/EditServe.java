package com.mcdonald.ser;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mcdonald.cls.InputChecker;
import com.mcdonald.cls.Users;
import com.mcdonald.conns.Connect;

/**
 * Servlet implementation class EditServe
 */
@WebServlet("/EditServe")
public class EditServe extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InputChecker ic = new InputChecker();
	private Users u = new Users();
	private Connect con = new Connect();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String send = "account.jsp";
		request.getSession().setAttribute("isValid", null);
		if (!ic.checkEmail(request.getParameter("email"))) {
			request.getSession().setAttribute("isValid", "mail");
			send = "edit.jsp";
		} else if (!ic.checkNames(request.getParameter("firstName"),request.getParameter("lastName"))) {
			request.getSession().setAttribute("isValid", "names");
			send = "edit.jsp";
		} else if (!ic.checkAddress(request.getParameter("add"), request.getParameter("city"), request.getParameter("zip"))) {
			request.getSession().setAttribute("isValid", "address");
			send = "edit.jsp";
		} else {
			u.setNfirst(request.getParameter("firstName"));
			u.setNlast(request.getParameter("lastName"));
			u.setAddress(request.getParameter("add" + ", " + request.getParameter("city") + ", "
					+ request.getParameter("state") + " " + request.getParameter("zip")));
			u.setEmail(request.getParameter("email"));
			u.setMobile(request.getParameter("mobile"));
			if (con.editUser(u) == 0) {
				request.getSession().setAttribute("isValid", "try");
				send = "edit.jsp";
			}
		}
		response.sendRedirect(send);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
