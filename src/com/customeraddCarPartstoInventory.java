package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.model.CarPartsInventory;
import com.service.model.Carpartssale;
import com.service.model.Customer;

/**
 * Servlet implementation class customeraddCarPartstoInventory
 */
@WebServlet("/customeraddCarPartstoInventory")
public class customeraddCarPartstoInventory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public customeraddCarPartstoInventory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	System.out.println(request.getParameter("custnewcarpartname")+" "+request.getParameter("custnewcarpartmake")+" "+request.getParameter("custnewcarpartmodel")+" "+
	request.getParameter("custnewcarpartyear")+" "+
	request.getParameter("custnewcarpartprice")+" "+
	request.getParameter("custnewcarparttype")+" "+
	request.getParameter("custnewcarpartcategory")+" "+
	request.getParameter("custnewcarpartquantity")+" "+
	request.getParameter("dealers"));
	 Customer  customerSellingpart= (Customer)request.getSession().getAttribute("loogedincustomer");
	 CarPartsInventory ccpi = new CarPartsInventory();
	 ccpi.setCategory(	request.getParameter("custnewcarpartcategory"));
	ccpi.setDsid(	request.getParameter("dealers"));
	ccpi.setMake(request.getParameter("custnewcarpartmake"));
	ccpi.setModel(request.getParameter("custnewcarpartmodel"));
	ccpi.setName(request.getParameter("custnewcarpartname"));
	ccpi.setPrice(request.getParameter("custnewcarpartprice"));
	ccpi.setQuantity(	request.getParameter("custnewcarpartquantity"));
	ccpi.setYear(request.getParameter("custnewcarpartyear"));
	ccpi.setSeller(customerSellingpart.getCid());
	ccpi.setIr(request.getParameter("custnewcarpartmake")+request.getParameter("custnewcarpartmodel"));
	ccpi.setStatus("0");
	ccpi.setType(	request.getParameter("custnewcarparttype"));
	customerSellingpart.sellParts(ccpi);
	request.setAttribute("currentSessionUser",customerSellingpart.getName().toString());
	request.getSession().setAttribute("loogedintype", "customer");
	request.getSession().setAttribute("loogedincustomer", customerSellingpart);
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
