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

import com.service.DAO.AdminDAO;
import com.service.model.Admin;


public class AdminController {
	public static void parseXMLTOPOJO() throws DOMException, ParserConfigurationException {
		// TODO Auto-generated method stub
		List<Admin> ladmin = new ArrayList<Admin>();
		try {
			// File Path
			//adminData.xml,
			String filePath = "/Users/MAJA/eclipse-workspace-project515/CarServices/WebContent/WEB-INF/Data/adminData.xml";

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
			NodeList nodeList = document.getElementsByTagName("admin");

			// Process element list.
			for (int temp = 0; temp < nodeList.getLength(); temp++) {
				Node nNode = nodeList.item(temp);
				System.out.println("\nCurrent Element:" + nNode.getNodeName());
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					Admin  admin = new Admin();
					//admin.setAdminId(eElement.getElementsByTagName("adminID").item(0).getTextContent());
					admin.setName(eElement.getElementsByTagName("firstname").item(0).getTextContent() + " "
							+ eElement.getElementsByTagName("lastname").item(0).getTextContent());
					admin.setPhone(Long.parseLong(eElement.getElementsByTagName("phone").item(0).getTextContent()));
					admin.setAddress(eElement.getElementsByTagName("addres").item(0).getTextContent());
					admin.setEmail(eElement.getElementsByTagName("email").item(0).getTextContent());
					admin.setCity(eElement.getElementsByTagName("city").item(0).getTextContent());
					admin.setZip(Long.parseLong(eElement.getElementsByTagName("zip").item(0).getTextContent()));
					admin.setState(eElement.getElementsByTagName("state").item(0).getTextContent());
					admin.setCountry(eElement.getElementsByTagName("country").item(0).getTextContent());
					admin.setUsername(eElement.getElementsByTagName("username").item(0).getTextContent());
					admin.setPassword(eElement.getElementsByTagName("password").item(0).getTextContent());
					ladmin.add(admin);
					
				}
			}
			//Add admin to the table
			AdminDAO admindao= new AdminDAO();
			for(Admin ad:ladmin) {
				ad.setAid("");
			admindao.addAdmin(ad);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
			e.printStackTrace();
		}
	}
}
