package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.model.Customer;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		 Customer customer =new Customer();
		 customer.setPassword(request.getParameter("password"));
		 customer.setUsername(request.getParameter("username"));
		 customer.setAddress(request.getParameter("address"));
		 customer.setCity(request.getParameter("city"));
		 customer.setCountry(request.getParameter("country"));
		 customer.setEmail(request.getParameter("email"));
		 customer.setName(request.getParameter("firstname")+" "+request.getParameter("lastname"));
		 customer.setPhone(Long.parseLong(request.getParameter("ph")));
		 customer.setState(request.getParameter("state"));
		 customer.setZip(Long.parseLong(request.getParameter("zip")));
		 customer.registration(customer);
		 request.getSession().setAttribute("status", "registered successfully");
			request.getRequestDispatcher("/Root.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
