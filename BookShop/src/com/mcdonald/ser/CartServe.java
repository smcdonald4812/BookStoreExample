package com.mcdonald.ser;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mcdonald.cls.Books;
import com.mcdonald.cls.Cart;

/**
 * Servlet implementation class CartServe
 */
@WebServlet("/CartServe")
public class CartServe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String send = "store.jsp";
		Cart c = (Cart)request.getSession().getAttribute("cart");
		if(request.getParameter("remove")!=null) {
			int a = Integer.valueOf(request.getParameter("remove"));
			c.removeFromCart(a);
			send="cart.jsp";
		} else {
			Books b = (Books)request.getSession().getAttribute("currentBook");
			if(b==null) send="store.jsp";
			if(c==null) {
				c = new Cart();
				request.getSession().setAttribute("cart", c);
			}
			if(c!=null&b!=null) {
				c.addToCart(b);
				request.getSession().setAttribute("cart", c);
			}
		}
		response.sendRedirect(send);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
