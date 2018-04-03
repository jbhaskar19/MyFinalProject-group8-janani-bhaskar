package com;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.model.CarInventory;
import com.service.model.Dealer;
import com.service.model.Dealership;

/**
 * Servlet implementation class addCartoInventory
 */
@WebServlet("/addCartoInventory")
public class addCartoInventory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addCartoInventory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		// newcarmodel newcaryear newcarprice newcarengine newcartrans  newcarvin newcarext newcarinter newcarHMil newcarCMil newcarDis
		CarInventory  newcar = new CarInventory();
		newcar.setMake(request.getParameter("newcarmake"));
		newcar.setModel(request.getParameter("newcarmodel"));
		newcar.setYear(Integer.parseInt(request.getParameter("newcaryear")));		
		newcar.setPrice(Long.parseLong(request.getParameter("newcarprice")));
		newcar.setEngine(request.getParameter("newcarengine"));
		newcar.setTransmission(request.getParameter("newcartrans"));
		newcar.setVinNumber(request.getParameter("newcarvin"));
		newcar.setExterior(request.getParameter("newcarext"));
		newcar.setInterior(request.getParameter("newcarinter"));
		newcar.setHwymilage(Integer.parseInt(request.getParameter("newcarHMil")));
		newcar.setCitymilage(Integer.parseInt(request.getParameter("newcarCMil")));
		String nameOfImageFile=request.getParameter("newcarext")+request.getParameter("newcarmodel");		
		newcar.setIr(nameOfImageFile.toLowerCase());
		Dealer dealAddCar = (Dealer)request.getSession().getAttribute("loogedindealer");
		Dealership dsh = (Dealership)request.getSession().getAttribute("dealerDealership");
		System.out.println("See this>>>>>>>>>>>>>>>>>>>>>>>"+dsh.getDsid());
		newcar.setDsId(dsh.getDsid());
		newcar.setStatus(0);
		newcar.setDiscount(Double.parseDouble(request.getParameter("newcarDis")));
		dealAddCar.addCar(newcar);
		request.setAttribute("currentSessionUser",dealAddCar.getName());
		
		request.getSession().setAttribute("loogedintype", "dealer");
		request.getSession().setAttribute("loogedindealer", dealAddCar);
		request.getSession().setAttribute("dealerDealership", dsh);
		request.getSession().setAttribute("addstatus", "success");
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
