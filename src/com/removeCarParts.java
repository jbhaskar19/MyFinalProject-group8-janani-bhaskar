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
 * Servlet implementation class removeCarParts
 */
@WebServlet("/removeCarParts")
public class removeCarParts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public removeCarParts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

System.out.println("Part id to be removed:"+request.getParameter("cpid"));
CarPartsInventory carPartsToRemove = new CarPartsInventory();
carPartsToRemove.setPid(request.getParameter("cpid"));
Dealer dealerDeleteParts = (Dealer)request.getSession().getAttribute("loogedindealer");
dealerDeleteParts.removeCarPart(carPartsToRemove);
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
