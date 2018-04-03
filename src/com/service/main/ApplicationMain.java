package com.service.main;
import javax.persistence.criteria.CriteriaBuilder.In;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.DOMException;
import com.service.Controller.AdminController;
import com.service.Controller.CustomerController;
import com.service.Controller.DealerController;
import com.service.Controller.DealershipController;
import com.service.Controller.InventoryController;
import com.service.Controller.SalesController;

public class ApplicationMain {
	public static void main(String args[]) throws DOMException, ParserConfigurationException {
		//Parse XML and update table
		//Adding Admin
		//AdminController.parseXMLTOPOJO();
		//Adding Customer
		//CustomerController.parseXMLTOPOJO();
		//Adding Dealer
		//DealerController.parseXMLTOPOJO();	
		//Adding Dealer ship
		//DealershipController.parseXMLTOPOJO();
		/*InventoryController adds both Car and Car parts */
		//InventoryController.parseCarXMLTOPOJO();
		//InventoryController.parseCarPartsXMLTOPOJO();
		//Adding car Sales.
		//SalesController.parseCarSaleXMLTOPOJO();
		//Adding car parts.
		//SalesController.parseCarPartSaleXMLTOPOJO();
	}
}
