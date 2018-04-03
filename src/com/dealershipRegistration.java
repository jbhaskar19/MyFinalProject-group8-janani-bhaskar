package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.model.Admin;
import com.service.model.Dealership;

/**
 * Servlet implementation class dealershipRegistration
 */
@WebServlet("/dealershipRegistration")
public class dealershipRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dealershipRegistration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("dealership  Served at: ").append(request.getContextPath());
		Dealership newDealership = new Dealership();
		newDealership.setName(request.getParameter("dealshpfirstname"));
		newDealership.setAddress(request.getParameter("dealshpaddress"));
		newDealership.setCity(request.getParameter("dealshpcity"));
		newDealership.setCountry(request.getParameter("dealshpcountry"));
		newDealership.setDid(request.getParameter("dealshpdId"));
		newDealership.setPhone(request.getParameter("dealshpphone"));
		newDealership.setState(request.getParameter("dealshpstate"));
		newDealership.setZip(request.getParameter("dealshpzip"));
		Admin myadmin = (Admin)request.getSession().getAttribute("loogedinadmin");
		newDealership.setDid(request.getSession().getAttribute("newDealaerID").toString());
		myadmin.addDealership(newDealership);
		
		request.getSession().setAttribute("loogedintype", "admin");
		request.getSession().setAttribute("loogedinadmin", myadmin);
		request.getRequestDispatcher("/MyHomePage.jsp").forward(request, response);


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
