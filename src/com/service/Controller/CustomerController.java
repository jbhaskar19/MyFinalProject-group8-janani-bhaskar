package com.service.Controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.DOMException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.service.DAO.CustomerDAO;
import com.service.model.Customer;

public class CustomerController {
	public static void parseXMLTOPOJO() throws DOMException, ParserConfigurationException {
		// TODO Auto-generated method stub
		List<Customer> ladmin = new ArrayList<Customer>();
		try {

			// File Path
			//adminData.xml,
			String filePath = "/Users/MAJA/eclipse-workspace-project515/CarServices/WebContent/WEB-INF/Data/customerData.xml";

			// Read XML file.
			File inputFile = new File(filePath);

			// Create DocumentBuilderFactory object.
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();

			// Get DocumentBuilder object.
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();

			// Parse XML file.
			Document document = dBuilder.parse(inputFile);
			document.getDocumentElement().normalize();

			// Print root element.
			Element root = document.getDocumentElement();
			System.out.println("Root element:" + root.getNodeName());

			// Get element list.
			NodeList nodeList = document.getElementsByTagName("customer");

			// Process element list.
			for (int temp = 0; temp < nodeList.getLength(); temp++) {
				Node nNode = nodeList.item(temp);
				System.out.println("Current Element:" + nNode.getNodeName());
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					Customer  customer = new Customer();
					customer.setName(eElement.getElementsByTagName("firstname").item(0).getTextContent() + " "
							+ eElement.getElementsByTagName("lastname").item(0).getTextContent());
					customer.setPhone(Long.parseLong(eElement.getElementsByTagName("phone").item(0).getTextContent()));
					customer.setAddress(eElement.getElementsByTagName("addres").item(0).getTextContent());
					customer.setEmail(eElement.getElementsByTagName("email").item(0).getTextContent());
					customer.setCity(eElement.getElementsByTagName("city").item(0).getTextContent());
					customer.setZip(Long.parseLong(eElement.getElementsByTagName("zip").item(0).getTextContent()));
					customer.setState(eElement.getElementsByTagName("state").item(0).getTextContent());
					customer.setCountry(eElement.getElementsByTagName("country").item(0).getTextContent());
					customer.setUsername(eElement.getElementsByTagName("username").item(0).getTextContent());
					customer.setPassword(eElement.getElementsByTagName("password").item(0).getTextContent());
					ladmin.add(customer);
					
				}
			}
			//Add Customer to the table
			CustomerDAO cdao= new CustomerDAO();
			for(Customer cust:ladmin) {
			cdao.addCustomer(cust);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
			e.printStackTrace();
		}


	}
}
