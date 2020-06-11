package com.mcdonald.ser;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class RedeemServe
 */
@WebServlet("/RedeemServe")
public class RedeemServe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RedeemServe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//could have calls to database with promotions instead of this quick example
		String code = request.getParameter("code");
		if (code.equalsIgnoreCase("PROMO1")) {
			request.getSession().setAttribute("promo", 10f);
		}
		if (code.equalsIgnoreCase("PROMO2")) {
			request.getSession().setAttribute("promo", 5f);
		}
		if (code.equalsIgnoreCase("PROMO3")) {
			request.getSession().setAttribute("promo", 15f);
		}
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
