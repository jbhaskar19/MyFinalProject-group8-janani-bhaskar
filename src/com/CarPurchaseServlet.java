package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.model.CarInventory;
import com.service.model.Cart;

/**
 * Servlet implementation class CarPurchaseServlet
 */
@WebServlet("/CarPurchaseServlet")
public class CarPurchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarPurchaseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
/*		
		 PrintWriter pw = response.getWriter();
		 request.getparameter(carpurchased);
		 pw.println(car.getMake());
	        String d  = request.getParameter("trial");
	        pw.println( request.getParameter("model")+"*********"+request.getParameter("vid"));*/


	        CarInventory carcart = new CarInventory();
	        carcart.setCitymilage(Integer.parseInt("20"));
	        carcart.setDiscount(Double.parseDouble("20"));
	        carcart.setEngine(request.getParameter("engine"));
	        carcart.setExterior(request.getParameter("extreior"));
	        carcart.setHwymilage(Integer.parseInt("20"));
	        carcart.setInterior(request.getParameter("interior"));
	        carcart.setMake(request.getParameter("make"));
	        carcart.setModel(request.getParameter("model"));
	        carcart.setPrice(Long.parseLong(request.getParameter("price")));
	        carcart.setVid(request.getParameter("vid"));
	        carcart.setTransmission(request.getParameter("transmi"));
	        carcart.setVinNumber(request.getParameter("num"));
	        carcart.setYear(Integer.parseInt(request.getParameter("year")));
	        carcart.setDsId(request.getParameter("dshipIDnum"));
	        System.out.println(carcart.getYear()+" "+carcart.getMake()+" "+carcart.getModel());
	        Cart mycartnow =(Cart) request.getSession().getAttribute("mycart");
	        mycartnow.addCarToCart(carcart);
	        mycartnow.printCart();
	        
	        
	        request.getRequestDispatcher("/About.jsp").forward(request, response);
	       	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
