package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.DAO.InventoryDAO;
import com.service.model.CarInventory;
import com.service.model.Customer;

/**
 * Servlet implementation class CarSearch
 */
@WebServlet("/CarSearch")
public class CarSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  PrintWriter pw = response.getWriter();
		 InventoryDAO dao = new InventoryDAO();
		 pw.println("CAr search servlet");	
		 CarInventory car = new CarInventory();
		 car.setMake(request.getParameter("make"));
		 car.setModel(request.getParameter("model"));
		 car.setYear(Integer.parseInt(request.getParameter("year")));
		 car.setDsId(request.getParameter("dealer"));
		 pw.println("CAr search servlet "+car.getDsId()+" "+car.getMake()+" "+car.getModel());	
		 //List<CarInventory> cars = dao.SearchCarInventory(car);
		 /*if(MyServlet.LoggedInUser!=null) {
			Customer us = (Customer)MyServlet.LoggedInUser;
			 System.out.println("%%%%%%%%%>>>>>>>>>>>>"+us.getCid());
		 }*/
		 //SearchResult
		 getServletConfig().getServletContext().getRequestDispatcher("/SearchResult.jsp").forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
