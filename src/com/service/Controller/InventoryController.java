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

import com.service.DAO.InventoryDAO;
import com.service.model.CarInventory;
import com.service.model.CarPartsInventory;

public class InventoryController {
	public static void parseCarXMLTOPOJO() throws DOMException, ParserConfigurationException {
		// TODO Auto-generated method stub
		List<CarInventory> ladmin = new ArrayList<CarInventory>();
		try {
			// File Path
			//adminData.xml,
			String filePath = "/Users/MAJA/eclipse-workspace-project515/CarServices/WebContent/WEB-INF/Data/CarInventoryData.xml";

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
			NodeList nodeList = document.getElementsByTagName("car");

			// Process element list.
			for (int temp = 0; temp < nodeList.getLength(); temp++) {
				Node nNode = nodeList.item(temp);
				System.out.println("Current Element:" + nNode.getNodeName());
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					CarInventory  carInventory = new CarInventory();
					carInventory.setDsId(eElement.getElementsByTagName("DS_ID").item(0).getTextContent());
					carInventory.setExterior(eElement.getElementsByTagName("colour").item(0).getTextContent());
					carInventory.setMake(eElement.getElementsByTagName("make").item(0).getTextContent());
					carInventory.setModel(eElement.getElementsByTagName("model").item(0).getTextContent());
					carInventory.setPrice(Long.parseLong(eElement.getElementsByTagName("price").item(0).getTextContent()));
					carInventory.setStatus(Integer.parseInt(eElement.getElementsByTagName("status").item(0).getTextContent()));
					carInventory.setVinNumber(eElement.getElementsByTagName("vin_number").item(0).getTextContent());
					carInventory.setYear(Integer.parseInt(eElement.getElementsByTagName("year").item(0).getTextContent()));
					ladmin.add(carInventory);
				}
			}
			//Add car
			InventoryDAO dsdao= new InventoryDAO();
			for(CarInventory car:ladmin) {
				car.setVid("");
				dsdao.addCarToInventory(car);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
			e.printStackTrace();
		}

	}
	
	public static void parseCarPartsXMLTOPOJO() throws DOMException, ParserConfigurationException {
		// TODO Auto-generated method stub
		List<CarPartsInventory> ladmin = new ArrayList<CarPartsInventory>();
		try {
			// File Path
			//adminData.xml,
			String filePath = "/Users/MAJA/eclipse-workspace-project515/MyFinalProject/WebContent/WEB-INF/Data/carPartsInventory.xml";

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
			NodeList nodeList = document.getElementsByTagName("car_parts");

			// Process element list.
			for (int temp = 0; temp < nodeList.getLength(); temp++) {
				Node nNode = nodeList.item(temp);
				System.out.println("Current Element:" + nNode.getNodeName());
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					CarPartsInventory  carpart = new CarPartsInventory();
					carpart.setDsid(eElement.getElementsByTagName("DS_ID").item(0).getTextContent());
					carpart.setName(eElement.getElementsByTagName("p_name").item(0).getTextContent());
					carpart.setMake(eElement.getElementsByTagName("make").item(0).getTextContent());
					carpart.setModel(eElement.getElementsByTagName("model").item(0).getTextContent());
					carpart.setPrice(eElement.getElementsByTagName("price").item(0).getTextContent());
					carpart.setStatus(eElement.getElementsByTagName("status").item(0).getTextContent());
					carpart.setQuantity(eElement.getElementsByTagName("quantity").item(0).getTextContent());
					carpart.setYear(eElement.getElementsByTagName("year").item(0).getTextContent());
					carpart.setType(eElement.getElementsByTagName("type").item(0).getTextContent());
					carpart.setCategory(eElement.getElementsByTagName("category").item(0).getTextContent());

					ladmin.add(carpart);
					
				}
			}
			//Add car part
			InventoryDAO dsdao= new InventoryDAO();
			for(CarPartsInventory carpart:ladmin) {
				carpart.setPid("");
				dsdao.addCarPartToInventory(carpart);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
			e.printStackTrace();
		}

	}
}
