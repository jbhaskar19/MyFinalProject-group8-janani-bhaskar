package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.DOMException;

import com.service.model.Admin;
import com.service.model.Dealer;

/**
 * Servlet implementation class dealerRegistration
 */
@WebServlet("/dealerRegistration")
public class dealerRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dealerRegistration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("registering new dealer Served at: ").append(request.getContextPath());
		// aDealerusername aDealercountry aDealerzip aDealeremail aDealeraddress aDealerstate aDealercity aDealerphone aDealerlname aDealerfirstname

Dealer newDealer = new Dealer();
newDealer.setName(request.getParameter("aDealerfirstname")+" "+request.getParameter("aDealerusername"));
newDealer.setPhone(request.getParameter("aDealerphone"));
newDealer.setEmail(request.getParameter("aDealeremail"));
newDealer.setAddress(request.getParameter("aDealeraddress"));
newDealer.setState(request.getParameter("aDealerstate"));
newDealer.setCity(request.getParameter("aDealercity"));
newDealer.setZip(request.getParameter("aDealerzip"));
newDealer.setCountry(request.getParameter("aDealercountry"));
newDealer.setUsername(request.getParameter("aDealerusername"));
newDealer.setPassword(request.getParameter("aDealerpassword"));
Admin myadmin = (Admin)request.getSession().getAttribute("loogedinadmin");
newDealer.setAdminId(myadmin.getAid());
try {
request.getSession().setAttribute("newDealaerID", myadmin.addDealer(newDealer));
	request.getRequestDispatcher("/adminAddDealer.jsp").forward(request, response);

} catch (DOMException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (ParserConfigurationException e) {
	// TODO Auto-generated catch block
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
