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

import com.service.DAO.SaleDAO;
import com.service.model.Carpartssale;
import com.service.model.Carsale;


public class SalesController {
	public static void parseCarSaleXMLTOPOJO() throws DOMException, ParserConfigurationException {
		// TODO Auto-generated method stub
		List<Carsale> ladmin = new ArrayList<Carsale>();
		try {
		
			// File Path
			//adminData.xml,
			String filePath = "/Users/MAJA/eclipse-workspace-project515/CarServices/WebContent/WEB-INF/Data/SalesData.xml";

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
			NodeList nodeList = document.getElementsByTagName("sale");

			// Process element list.
			for (int temp = 0; temp < nodeList.getLength(); temp++) {
				Node nNode = nodeList.item(temp);
				System.out.println("Current Element:" + nNode.getNodeName());
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					Carsale  sale = new Carsale();
					sale.setVId(eElement.getElementsByTagName("V_ID").item(0).getTextContent());
					sale.setCsid(eElement.getElementsByTagName("C_ID").item(0).getTextContent());
					sale.setDsId(eElement.getElementsByTagName("D_S_ID").item(0).getTextContent());
					sale.setPrice(eElement.getElementsByTagName("price").item(0).getTextContent());
					sale.setOrderDate(eElement.getElementsByTagName("date_ordered").item(0).getTextContent());
					sale.setDelivaryDate(eElement.getElementsByTagName("date_delivered").item(0).getTextContent());
					sale.setStatus(eElement.getElementsByTagName("status").item(0).getTextContent());
					ladmin.add(sale);
				}
			}
			//Add Customer to the table
			SaleDAO sdao= new SaleDAO();
			for(Carsale sale:ladmin) {
				sale.setSid("");
				sdao.addCarSale(sale);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
			e.printStackTrace();
		}
	}

	
	
	
	public static void parseCarPartSaleXMLTOPOJO() throws DOMException, ParserConfigurationException {
		// TODO Auto-generated method stub
		List<Carpartssale> ladmin = new ArrayList<Carpartssale>();
		try {
		
			// File Path
			//adminData.xml,
			String filePath = "/Users/MAJA/eclipse-workspace-project515/MyFinalProject/WebContent/WEB-INF/Data/carPartsSale.xml";
			
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
			NodeList nodeList = document.getElementsByTagName("partsale");

			// Process element list.
			for (int temp = 0; temp < nodeList.getLength(); temp++) {
				Node nNode = nodeList.item(temp);
				System.out.println("Current Element:" + nNode.getNodeName());
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					Carpartssale  parts = new Carpartssale();
					parts.setPartId(eElement.getElementsByTagName("V_P_ID").item(0).getTextContent());
					parts.setClientId(eElement.getElementsByTagName("C_ID").item(0).getTextContent());
					parts.setDsId(eElement.getElementsByTagName("D_S_ID").item(0).getTextContent());
					parts.setPrice(eElement.getElementsByTagName("price").item(0).getTextContent());
					parts.setDatePurchased(eElement.getElementsByTagName("date_purchased").item(0).getTextContent());
					parts.setQuantity(eElement.getElementsByTagName("quantity").item(0).getTextContent());
					parts.setStatus(eElement.getElementsByTagName("status").item(0).getTextContent());
					ladmin.add(parts);
				}
			}
			//Add Customer to the table
			SaleDAO sdao= new SaleDAO();
			for(Carpartssale partSale:ladmin) {
				partSale.setPsId("");
				sdao.addCarPartsSale(partSale);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
			e.printStackTrace();
		}
	}
	
	
	
}
