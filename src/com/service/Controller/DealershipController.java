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

import com.service.DAO.DealershipDAO;
import com.service.model.Dealership;

public class DealershipController {
	public static void parseXMLTOPOJO() throws DOMException, ParserConfigurationException {
		// TODO Auto-generated method stub
		List<Dealership> ladmin = new ArrayList<Dealership>();
		try {
			// File Path
			//adminData.xml,
			String filePath = "/Users/MAJA/eclipse-workspace-project515/CarServices/WebContent/WEB-INF/Data/dealershipData.xml";

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
			NodeList nodeList = document.getElementsByTagName("dealership");

			// Process element list.
			for (int temp = 0; temp < nodeList.getLength(); temp++) {
				Node nNode = nodeList.item(temp);
				System.out.println("\nCurrent Element:" + nNode.getNodeName());
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					Dealership  dealership = new Dealership();
					dealership.setDid(eElement.getElementsByTagName("dealerID").item(0).getTextContent());
					dealership.setName(eElement.getElementsByTagName("dealershipname").item(0).getTextContent());
					dealership.setPhone(eElement.getElementsByTagName("phone").item(0).getTextContent());
					dealership.setAddress(eElement.getElementsByTagName("addres").item(0).getTextContent());
					dealership.setCity(eElement.getElementsByTagName("city").item(0).getTextContent());
					dealership.setZip(eElement.getElementsByTagName("zip").item(0).getTextContent());
					dealership.setState(eElement.getElementsByTagName("state").item(0).getTextContent());
					dealership.setCountry(eElement.getElementsByTagName("country").item(0).getTextContent());
					ladmin.add(dealership);
				}
			}
			//Add Dealer
			DealershipDAO dsdao= new DealershipDAO();
			for(Dealership deal:ladmin) {
				deal.setDsid("");
				dsdao.addDealership(deal);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
			e.printStackTrace();
		}

	}
}
