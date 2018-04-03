package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.model.Admin;

/**
 * Servlet implementation class updateAdminInfo
 */
@WebServlet("/updateAdminInfo")
public class updateAdminInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateAdminInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Admin myAdmin = (Admin)request.getSession().getAttribute("loogedinadmin");	
		if( (!myAdmin.getAddress().equals(request.getParameter("adaddress"))) ||
				(!myAdmin.getPhone().toString().equals(request.getParameter("adh"))) ||
				(!myAdmin.getCountry().equals(request.getParameter("adcountry")))||
				(!myAdmin.getState().equals(request.getParameter("adstate")))||
				(!myAdmin.getZip().toString().equals(request.getParameter("adzip")))|| 
				(!myAdmin.getCity().equals(request.getParameter("adcity")))||
				(!myAdmin.getName().equals(request.getParameter("adname")))||
				(!myAdmin.getEmail().equals(request.getParameter("ademail")))
				)
		{
			myAdmin.setAddress(request.getParameter("adaddress"));	
			myAdmin.setCountry(request.getParameter("adcountry"));
			myAdmin.setState(request.getParameter("adstate"));
			myAdmin.setZip(Long.parseLong(request.getParameter("adzip")));
			myAdmin.setCity(request.getParameter("adcity"));
			myAdmin.setPhone(Long.parseLong(request.getParameter("adh")));
			myAdmin.setEmail(request.getParameter("ademail"));
			myAdmin.setName(request.getParameter("adname"));
			
			myAdmin.editProfile(myAdmin);
		}
		if((request.getParameter("newpassword").toString()!="") &&(!myAdmin.getPassword().equals(request.getParameter("newpassword")))) {
			System.out.println("calling db update");
			myAdmin.resetPassword(request.getParameter("newpassword"),myAdmin);
		}
		request.setAttribute("currentSessionUser",myAdmin.getName().toString()); 
		request.getSession().setAttribute("loogedinadmin",myAdmin);	
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
