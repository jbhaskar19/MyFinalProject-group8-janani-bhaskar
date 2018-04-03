package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.model.CarPartsInventory;
import com.service.model.Dealer;
import com.service.model.Dealership;

/**
 * Servlet implementation class addCarPartstoInventory
 */
@WebServlet("/addCarPartstoInventory")
public class addCarPartstoInventory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addCarPartstoInventory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("from car parts jsp");
		//newcarpartname newcarpartmake newcarpartmodel 
		//newcarpartyear newcarpartprice newcarparttype 

		request.getParameter("newcarpartname");
		request.getParameter("newcarpartmake");
		request.getParameter("newcarpartmodel");
		request.getParameter("newcarpartyear");
		request.getParameter("newcarpartprice");
		request.getParameter("newcarparttype");
		request.getParameter("newcarpartcategory");
		request.getParameter("newcarpartquantity");
		
		CarPartsInventory carParts = new CarPartsInventory();
		 Dealership dealshp= (Dealership)request.getSession().getAttribute("dealerDealership");
		 Dealer dealerAddParts = (Dealer)request.getSession().getAttribute("loogedindealer");

		carParts.setDsid(dealshp.getDsid());
		carParts.setName(request.getParameter("newcarpartname"));
		carParts.setMake(request.getParameter("newcarpartmake"));
		carParts.setModel(request.getParameter("newcarpartmodel"));
		carParts.setPrice(request.getParameter("newcarpartprice"));
		carParts.setQuantity(request.getParameter("newcarpartquantity"));
		carParts.setYear(request.getParameter("newcarpartyear"));
		carParts.setType(request.getParameter("newcarparttype").toUpperCase());
		carParts.setCategory(request.getParameter("newcarpartcategory").toUpperCase());
		carParts.setSeller(dealshp.getDid() );
		carParts.setIr(request.getParameter("newcarpartname").toLowerCase()+request.getParameter("newcarpartmake").toLowerCase());
		carParts.setStatus("0");
		System.out.println("Calling Add Car PArts\n"+carParts.getSeller()+"\n"+carParts.getDsid());
		dealerAddParts.addCarPart(carParts);
		
		
		request.setAttribute("currentSessionUser",dealerAddParts.getName());
		
		request.getSession().setAttribute("loogedintype", "dealer");
		request.getSession().setAttribute("loogedindealer", dealerAddParts);
		request.getSession().setAttribute("dealerDealership", dealshp);
		
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
