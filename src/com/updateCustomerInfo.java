package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.model.Customer;

/**
 * Servlet implementation class updateCustomerInfo
 */
@WebServlet("/updateCustomerInfo")
public class updateCustomerInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateCustomerInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Customer  myCustomer= (Customer)request.getSession().getAttribute("loogedincustomer");
		if( (!myCustomer.getAddress().equals(request.getParameter("cstaddress").toString())) ||
				(!myCustomer.getPhone().toString().equals(request.getParameter("csth").toString())) ||
				(!myCustomer.getCountry().equals(request.getParameter("cstcountry").toString()))||
				(!myCustomer.getState().equals(request.getParameter("cststate").toString()))||
				(!myCustomer.getZip().toString().equals(request.getParameter("cstzip").toString()))|| 
				(!myCustomer.getCity().equals(request.getParameter("cstcity").toString()))||
				(!myCustomer.getName().equals(request.getParameter("cstname").toString()))||
				(!myCustomer.getEmail().equals(request.getParameter("cstmail").toString()))
				)
		{
			myCustomer.setAddress(request.getParameter("cstaddress"));	
			myCustomer.setCountry(request.getParameter("cstcountry"));
			myCustomer.setState(request.getParameter("cststate"));
			myCustomer.setZip(Long.parseLong(request.getParameter("cstzip")));
			myCustomer.setCity(request.getParameter("cstcity"));
			myCustomer.setPhone(Long.parseLong(request.getParameter("csth")));
			myCustomer.setEmail(request.getParameter("cstmail"));
			myCustomer.setName(request.getParameter("cstname"));
			System.out.println("Calling edit profile");
			myCustomer.editProfile(myCustomer);
		}
		if((request.getParameter("cstnewpassword").toString()!="") &&(!myCustomer.getPassword().equals(request.getParameter("cstnewpassword")))) {
			System.out.println("calling db update");
			myCustomer.resetPassword(request.getParameter("cstnewpassword"),myCustomer);
		}
		System.out.println("From Customer controller");
		request.setAttribute("currentSessionUser",myCustomer.getName().toString()); 
		request.getSession().setAttribute("loogedincustomer",myCustomer);	
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
