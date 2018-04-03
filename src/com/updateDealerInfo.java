package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.model.Dealer;


/**
 * Servlet implementation class updateDealerInfo
 */
@WebServlet("/updateDealerInfo")
public class updateDealerInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateDealerInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Dealer mydealer = (Dealer)request.getSession().getAttribute("loogedindealer");	
		if( (!mydealer.getAddress().equals(request.getParameter("deladdress"))) ||
				(!mydealer.getPhone().toString().equals(request.getParameter("delh"))) ||
				(!mydealer.getCountry().equals(request.getParameter("delcountry")))||
				(!mydealer.getState().equals(request.getParameter("delstate")))||
				(!mydealer.getZip().toString().equals(request.getParameter("delzip")))|| 
				(!mydealer.getCity().equals(request.getParameter("delcity")))||
				(!mydealer.getName().equals(request.getParameter("deldname")))||
				(!mydealer.getEmail().equals(request.getParameter("delemail")))
				)
		{
			mydealer.setAddress(request.getParameter("deladdress"));	
			mydealer.setCountry(request.getParameter("delcountry"));
			mydealer.setState(request.getParameter("delstate"));
			mydealer.setZip(request.getParameter("delzip"));
			mydealer.setCity(request.getParameter("delcity"));
			mydealer.setPhone(request.getParameter("delh"));
			mydealer.setEmail(request.getParameter("delemail"));
			mydealer.setName(request.getParameter("delname"));
			
			mydealer.editProfile(mydealer);
		}
		if((request.getParameter("delnewpassword").toString()!="") &&(!mydealer.getPassword().equals(request.getParameter("delnewpassword")))) {
			System.out.println("calling db update");
			mydealer.resetPassword(request.getParameter("delnewpassword"),mydealer);
		}
		System.out.println("From dealer controller");
		request.setAttribute("currentSessionUser",mydealer.getName().toString()); 
		request.getSession().setAttribute("loogedindealer",mydealer);	
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
