package com;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.model.Admin;
import com.service.model.CarInventory;
import com.service.model.CarPartsInventory;
import com.service.model.Carpartssale;
import com.service.model.Carsale;
import com.service.model.Cart;
import com.service.model.Customer;
import com.service.model.Dealer;
import com.service.model.Dealership;

/**
 * Servlet implementation class BillingServlet
 */
@WebServlet("/BillingServlet")
public class BillingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BillingServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * CarInventory rf = (CarInventory)request.getAttribute("OBJECT_NAME");
		 * System.out.println("%%%%%%%%%%%%%%"+rf.getExterior());
		 */

		Cart checkoutCart = (Cart) request.getSession().getAttribute("mycart");
		List<CarInventory> carscheckout = checkoutCart.getCarInCart();
		List<CarPartsInventory> carpartscheckout = checkoutCart.getCarPartsInCart();

		String usrty = request.getSession().getAttribute("loogedintype").toString();
		System.out.println("Logged in type:" + usrty);
		if (usrty.equals("customer")) {
			Customer billfor = (Customer) request.getSession().getAttribute("loogedincustomer");
			Carsale sale = new Carsale();
			Carpartssale cpsale = new Carpartssale();
			System.out.println("*****************");
			System.out.println(billfor.getName());
			if (carscheckout.size() != 0) {
				for (CarInventory c : carscheckout) {
					System.out.println(c.getDsId() + "Checkout in car page Car:" + c.getVid());
				}
				sale.setCsid(billfor.getCid());
				billfor.makeCarPayment(carscheckout, sale);
			}

			if (carpartscheckout.size() != 0) {
				
				//* for(CarPartsInventory cp:carpartscheckout) {
				 //* System.out.println("Checkout in car page  Carparts:"+cp.getPid()); }
				 
				String maxCapacity = (String) request.getSession().getAttribute("maxcapacty");
				int valueOfCapacity = Integer.valueOf(maxCapacity);
				System.out.println("valueOfCapacity:" + valueOfCapacity);
				cpsale.setClientId(billfor.getCid());
				billfor.makeCarPartPayment(carpartscheckout, valueOfCapacity, cpsale);
			}
			//
			request.getSession().setAttribute("purchasedFor", billfor.getCid());
			request.setAttribute("currentSessionUser",billfor.getName().toString());

			request.getSession().setAttribute("loogedintype", "customer");
			request.getSession().setAttribute("loogedincustomer", billfor);
			request.getRequestDispatcher("/MyHomePage.jsp").forward(request, response);

			System.out.println("*****************");
		}

		if (usrty.equals("admin")) {
			Admin billfor = (Admin) request.getSession().getAttribute("loogedinadmin");
			System.out.println("*****************");
			System.out.println(billfor.getName());
			System.out.println("*****************");
			
			Carsale sale = new Carsale();
			Carpartssale cpsale = new Carpartssale();
			System.out.println("*****************");
			System.out.println(billfor.getName());
			if (carscheckout.size() != 0) {
				for (CarInventory c : carscheckout) {

					System.out.println(c.getDsId() + "Checkout in car page Car:" + c.getVid());

				}
				sale.setCsid(billfor.getAid());
				billfor.makeCarPayment(carscheckout, sale);
			}

			if (carpartscheckout.size() != 0) {
				/*
				 * for(CarPartsInventory cp:carpartscheckout) {
				 * System.out.println("Checkout in car page  Carparts:"+cp.getPid()); }
				 */
				String maxCapacity = (String) request.getSession().getAttribute("maxcapacty");
				int valueOfCapacity = Integer.valueOf(maxCapacity);
				System.out.println("valueOfCapacity:" + valueOfCapacity);
				cpsale.setClientId(billfor.getAid());
				billfor.makeCarPartPayment(carpartscheckout, valueOfCapacity, cpsale);
			}
			request.setAttribute("currentSessionUser",billfor.getName().toString());

			request.getSession().setAttribute("loogedintype", "admin");
			request.getSession().setAttribute("loogedinadmin", billfor);
			request.getRequestDispatcher("/MyHomePage.jsp").forward(request, response);

			System.out.println("*****************");
				
		}

		if (usrty.equals("dealer")) {
			Dealer billfor = (Dealer) request.getSession().getAttribute("loogedindealer");
			System.out.println("*****************");
			System.out.println(billfor.getName());
			System.out.println("*****************");
			Dealership sdealership = (Dealership)request.getSession().getAttribute("dealerDealership");
			Carsale sale = new Carsale();
			Carpartssale cpsale = new Carpartssale();
			System.out.println("*****************");
			System.out.println(billfor.getName());
			if (carscheckout.size() != 0) {
				for (CarInventory c : carscheckout) {

					System.out.println(c.getDsId() + "Checkout in car page Car:" + c.getVid());

				}
				sale.setCsid(billfor.getDid());
				billfor.makeCarPayment(carscheckout, sale);
			}

			if (carpartscheckout.size() != 0) {
				/*
				 * for(CarPartsInventory cp:carpartscheckout) {
				 * System.out.println("Checkout in car page  Carparts:"+cp.getPid()); }
				 */
				String maxCapacity = (String) request.getSession().getAttribute("maxcapacty");
				int valueOfCapacity = Integer.valueOf(maxCapacity);
				System.out.println("valueOfCapacity:" + valueOfCapacity);
				cpsale.setClientId(billfor.getDid());
				billfor.makeCarPartPayment(carpartscheckout, valueOfCapacity, cpsale);
			}
			request.setAttribute("currentSessionUser",billfor.getName());
			
			request.getSession().setAttribute("loogedintype", "dealer");
			request.getSession().setAttribute("loogedindealer", billfor);
			request.getSession().setAttribute("dealerDealership", sdealership);
			request.getRequestDispatcher("/MyHomePage.jsp").forward(request, response);
			System.out.println("*****************");
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
