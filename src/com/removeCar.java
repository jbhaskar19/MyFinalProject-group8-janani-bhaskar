package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.model.CarInventory;
import com.service.model.Dealer;

/**
 * Servlet implementation class removeCar
 */
@WebServlet("/removeCar")
public class removeCar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public removeCar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		Dealer dealerRemoveCar = (Dealer)request.getSession().getAttribute("loogedindealer");
		CarInventory carToremove = new CarInventory();
		carToremove.setVid(request.getParameter("removeMyCar"));
		System.out.println("&&&&&&&&&&&&&"+carToremove.getVid());
		dealerRemoveCar.removeCar(carToremove);
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
