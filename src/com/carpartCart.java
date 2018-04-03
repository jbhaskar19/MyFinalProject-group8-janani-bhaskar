package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.model.CarPartsInventory;
import com.service.model.Cart;


/**
 * Servlet implementation class carpartCart
 */
@WebServlet("/carpartCart")
public class carpartCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public carpartCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("carpartCArt"+request.getParameter("pid")+" "+
		request.getParameter("ppmake")+" "+
		request.getParameter("ppmodel")+" "+
		request.getParameter("ppyear")+" "+
		request.getParameter("pprice")+" "+"\nquantity:"+
		request.getParameter("pquantity")+" "+
		request.getParameter("pselle")+"\ncapacity:"+request.getParameter("capacity"));
	
		CarPartsInventory carPart=new CarPartsInventory();
		carPart.setPid(request.getParameter("pid"));
		carPart.setMake(request.getParameter("ppmake"));
		carPart.setModel(request.getParameter("ppmodel"));
		carPart.setYear(request.getParameter("ppyear"));
		carPart.setPrice(request.getParameter("pprice"));
		carPart.setName(request.getParameter("nameofpart"));
		carPart.setQuantity(request.getParameter("pquantity"));
		carPart.setSeller(request.getParameter("pselle"));
		carPart.setDsid(request.getParameter("dealerPartId"));
		System.out.println("################"+request.getParameter("capacity"));
		Cart mycartnow =(Cart) request.getSession().getAttribute("mycart");
		request.getSession().setAttribute("maxcapacty", request.getParameter("capacity"));
		if(carPart!=null) {
		mycartnow.addCarPartToCart(carPart);}
	//mycartnow.printCart();
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
