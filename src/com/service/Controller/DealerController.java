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

import com.service.DAO.DealerDAO;
import com.service.model.Dealer;

public class DealerController {
	public static void parseXMLTOPOJO() throws DOMException, ParserConfigurationException {
		// TODO Auto-generated method stub
		List<Dealer> ladmin = new ArrayList<Dealer>();
		try {
			// File Path
			//adminData.xml,
			String filePath = "/Users/MAJA/eclipse-workspace-project515/CarServices/WebContent/WEB-INF/Data/dealerData.xml";

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
			NodeList nodeList = document.getElementsByTagName("dealer");

			// Process element list.
			for (int temp = 0; temp < nodeList.getLength(); temp++) {
				Node nNode = nodeList.item(temp);
				System.out.println("\nCurrent Element:" + nNode.getNodeName());
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					Dealer  dealer = new Dealer();
					dealer.setAdminId(eElement.getElementsByTagName("adminID").item(0).getTextContent());
					dealer.setName(eElement.getElementsByTagName("firstname").item(0).getTextContent() + " "
							+ eElement.getElementsByTagName("lastname").item(0).getTextContent());
					dealer.setPhone(eElement.getElementsByTagName("phone").item(0).getTextContent());
					dealer.setAddress(eElement.getElementsByTagName("addres").item(0).getTextContent());
					dealer.setEmail(eElement.getElementsByTagName("email").item(0).getTextContent());
					dealer.setCity(eElement.getElementsByTagName("city").item(0).getTextContent());
					dealer.setZip(eElement.getElementsByTagName("zip").item(0).getTextContent());
					dealer.setState(eElement.getElementsByTagName("state").item(0).getTextContent());
					dealer.setCountry(eElement.getElementsByTagName("country").item(0).getTextContent());
					dealer.setUsername(eElement.getElementsByTagName("username").item(0).getTextContent());
					dealer.setPassword(eElement.getElementsByTagName("password").item(0).getTextContent());
					ladmin.add(dealer);
					
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
			e.printStackTrace();
		}
		//Add Dealer
		DealerDAO ddao= new DealerDAO();
		for(Dealer deal:ladmin) {
			deal.setDid("");
		ddao.addDealer(deal);
		}
	}
}
