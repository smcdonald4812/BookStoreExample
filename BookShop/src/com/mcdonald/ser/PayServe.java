package com.mcdonald.ser;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mcdonald.cls.Cart;
import com.mcdonald.cls.PayOrder;
import com.mcdonald.conns.Connect;

/**
 * Servlet implementation class PayServe
 */
@WebServlet("/PayServe")
public class PayServe extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayServe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//if this was a real site this servlet would incorporate call to or connection to some kind of card processing
			request.getSession().setAttribute("promo", null);
			PayOrder pay = new PayOrder();
			pay.setAddress(request.getParameter("add"));
			pay.setCity(request.getParameter("city"));
			pay.setNfirst(request.getParameter("firstName"));
			pay.setNlast(request.getParameter("lastName"));
			pay.setState(request.getParameter("state"));
			pay.setTotal((float)request.getSession().getAttribute("total"));
			Cookie[] cook = request.getCookies();
			for(Cookie c : cook) {
				if(c.getName().equals("user")) pay.setUserName(c.getValue());
			}
			pay.setZip(request.getParameter("zip"));
			Connect con = new Connect();
			if(con.setNewPayOrder(pay)>0) request.getSession().setAttribute("payment", "success");
			else request.getSession().setAttribute("payment", "failed");
			request.getSession().setAttribute("cart", new Cart());
		response.sendRedirect("pay.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
