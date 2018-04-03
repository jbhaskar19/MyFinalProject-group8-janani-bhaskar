package com;

import java.io.IOException;

import java.io.PrintWriter;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.DAO.DealershipDAO;
import com.service.DAO.LoginDAO;
import com.service.model.Admin;
import com.service.model.Cart;
import com.service.model.Customer;
import com.service.model.Dealer;
import com.service.model.Dealership;
import com.service.model.Login;



/**
 * Servlet implementation class MyServlet
 */
@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public static Object LoggedInUser=null;
    public static String LoggedInUserType=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			String reply="";
			response.setContentType("text/html");
			 String loggedInUser= request.getParameter("userType");
			 HttpSession session = request.getSession(true);	
		
			 PrintWriter pw = response.getWriter();
			 
			 pw.println(loggedInUser +"\t"+ request.getParameter("hostname"));
		 
if(loggedInUser.equalsIgnoreCase("customer")) {
Login loginUser = new Login();
loginUser.setUsername(request.getParameter("uname"));
loginUser.setPassword(request.getParameter("psw"));
loginUser.setUserRole("customer");
LoginDAO dao = new LoginDAO();

Customer customer=(Customer)dao.authenticateLogin(loginUser);
if(customer!=null) {

pw.println(customer.getName()+"\n");
pw.println(customer.getAddress()+"\n");
pw.println(customer.getCity()+"\n");
pw.println(customer.getEmail()+"\n");
pw.println(customer.getCountry()+"\n");
pw.println(customer.getState()+"\n");
pw.println(customer.getPhone()+"\n");
pw.println(customer.getZip()+"\n");

request.setAttribute("currentSessionUser",customer.getName().toString());

request.getSession().setAttribute("loogedintype", "customer");
request.getSession().setAttribute("loogedincustomer", customer);

LoggedInUser=customer;
LoggedInUserType="customer";

request.getRequestDispatcher("/MyHomePage.jsp").forward(request, response);
}else
{
	String errormsg="No such user";
	request.setAttribute("utilOutput", errormsg.toString());
	request.getRequestDispatcher("/Login.jsp").forward(request, response);

}
}
else if(loggedInUser.equalsIgnoreCase("admin")) {

Login loginUser = new Login();
loginUser.setUsername(request.getParameter("uname"));
loginUser.setPassword(request.getParameter("psw"));
loginUser.setUserRole("admin");
LoginDAO dao = new LoginDAO();
Admin details =(Admin)dao.authenticateLogin(loginUser);
if(details!=null) {
pw.println(details.getName());
pw.println(details.getAddress());
pw.println(details.getCity());
pw.println(details.getEmail());
pw.println(details.getCountry());
pw.println(details.getState());
pw.println(details.getPhone());
pw.println(details.getZip());
LoggedInUser=details;

request.setAttribute("currentSessionUser",details.getName().toString());

request.getSession().setAttribute("loogedintype", "admin");
request.getSession().setAttribute("loogedinadmin", details);

request.getRequestDispatcher("/MyHomePage.jsp").forward(request, response);
}
else
{
	String errormsg="No such user";
	request.setAttribute("utilOutput", errormsg.toString());
	request.getRequestDispatcher("/Login.jsp").forward(request, response);
	}
}
else if(loggedInUser.equalsIgnoreCase("dealer")){
	System.out.println(">>>>> DEALER <<<<<<<");
	Login loginUser = new Login();
	loginUser.setUsername(request.getParameter("uname"));
	loginUser.setPassword(request.getParameter("psw"));
	loginUser.setUserRole("dealer");
	LoginDAO dao = new LoginDAO();
	Dealer details =(Dealer)dao.authenticateLogin(loginUser);
	if(details!=null) {
	pw.println(details.getName());
	pw.println(details.getAddress());
	pw.println(details.getCity());
	pw.println(details.getEmail());
	pw.println(details.getCountry());
	pw.println(details.getState());
	pw.println(details.getPhone());
	pw.println(details.getZip());
	DealershipDAO Ddao = new DealershipDAO();
	Dealership dealership = Ddao.getDealership(details.getDid());
	request.setAttribute("currentSessionUser",details.getName());
	
	request.getSession().setAttribute("loogedintype", "dealer");
	request.getSession().setAttribute("loogedindealer", details);
	request.getSession().setAttribute("dealerDealership", dealership);

	LoggedInUser=details;
	request.getRequestDispatcher("/MyHomePage.jsp").forward(request, response);
	}
	else
	{
		String errormsg="Incorrect Username and Password"+"\n"+reply;
		request.setAttribute("utilOutput", errormsg.toString());
		request.getRequestDispatcher("/Login.jsp").forward(request, response);
	}
}

}
	catch(Exception e){
		e.printStackTrace();
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
