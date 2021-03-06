package com.service.model;
// Generated Mar 30, 2018 2:37:38 PM by Hibernate Tools 5.2.8.Final

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.service.DAO.CustomerDAO;
import com.service.DAO.InventoryDAO;
import com.service.Interfaces.BillingModule;
import com.service.Interfaces.UserManagementServices;

/**
 * Customer generated by hbm2java
 */
@Entity
@Table(name = "customer", catalog = "ITMD_515", uniqueConstraints = @UniqueConstraint(columnNames = "username"))
public class Customer implements java.io.Serializable,UserManagementServices,BillingModule {
	CustomerDAO cdao=new CustomerDAO();

	private String cid;
	private String name;
	private String address;
	private Long phone;
	private String email;
	private String city;
	private Long zip;
	private String state;
	private String country;
	private String username;
	private String password;

	public Customer() {
	}

	public Customer(String cid, String username, String password) {
		this.cid = cid;
		this.username = username;
		this.password = password;
	}

	public Customer(String cid, String name, String address, Long phone, String email, String city, Long zip,
			String state, String country, String username, String password) {
		this.cid = cid;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.city = city;
		this.zip = zip;
		this.state = state;
		this.country = country;
		this.username = username;
		this.password = password;
	}

	@Id

	@Column(name = "cid", unique = true, nullable = false, length = 45)
	public String getCid() {
		return this.cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	@Column(name = "name", length = 45)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "address", length = 45)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "phone")
	public Long getPhone() {
		return this.phone;
	}

	public void setPhone(Long phone) {
		this.phone = phone;
	}

	@Column(name = "email", length = 45)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "city", length = 45)
	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(name = "zip")
	public Long getZip() {
		return this.zip;
	}

	public void setZip(Long zip) {
		this.zip = zip;
	}

	@Column(name = "state", length = 45)
	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(name = "country", length = 45)
	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	@Column(name = "username", unique = true, nullable = false, length = 45)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password", nullable = false, length = 45)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public void registration(Customer customer) {
		// TODO Auto-generated method stub
		CustomerDAO dao = new CustomerDAO();
		dao.addCustomer(customer);
	}

	@Override
	public String registration(Object user) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void forgotPassword() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void resetPassword(String newPassword,Object user) {
		// TODO Auto-generated method stub
		
	Customer myCustomer = (Customer)	user;
	cdao.updatePassword(myCustomer,newPassword);
	}

	@Override
	public void editProfile(Object editProfile) {
		// TODO Auto-generated method stub
		Customer cs = (Customer)editProfile;
		cdao.updateEditProfile(cs);
	}

	@Override
	public void makeCarPayment(List<CarInventory> carscheckout,Carsale sale  ) {
		// TODO Auto-generated method stub
		
		 for(CarInventory c:carscheckout) {
				System.out.println("Customer for Car Payment update:"+c.getVid() +"<>"+ c.getPrice()+" "+c.getDsId());
		sale.setDsId(c.getDsId());
		sale.setVId(c.getVid());
		sale.setPrice(c.getPrice().toString());
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		 String date =sdf.format(new Date());
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date()); // Now use today date.
		cal.add(Calendar.DATE, 5); // Adding 5 days
		String output = sdf.format(cal.getTime());
		sale.setOrderDate(date);	
		sale.setStatus("0");
		sale.setDelivaryDate(output);
		System.out.println(sale.getCsid()+""+sale.getDsId()+""+sale.getVId());
		cdao.payForCar(sale);
		InventoryDAO update = new InventoryDAO();
		update.removeCarFromInventory(c);
			}	
	}

	@Override
	public void makeCarPartPayment(List<CarPartsInventory> carpartscheckout, int maxCapacity,
			Carpartssale partSale) {
		// TODO Auto-generated method stub
		for(CarPartsInventory cp:carpartscheckout) {
			System.out.println("Customer in car page  Carparts:"+cp.getPid());
			partSale.setDsId(cp.getDsid());
			partSale.setPartId(cp.getPid());
			
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			 String date =sdf.format(new Date());
			partSale.setDatePurchased(date);
			partSale.setStatus("0");
			partSale.setQuantity(cp.getQuantity());

			int quanttyCP=Integer.valueOf(partSale.getQuantity());
			int amt = Integer.valueOf(cp.getPrice()) * quanttyCP;
			System.out.println(quanttyCP+ " "+"total amount is:"+amt);
			partSale.setPrice(Integer.toString(amt));
			cdao.payForCarPart(partSale);
			CarPartsInventory carupdate = new CarPartsInventory();
			carupdate.setPid(partSale.getPartId());
			if(quanttyCP<maxCapacity) {
				System.out.println("quanitty is less than capacity");
				InventoryDAO dao = new InventoryDAO();
				int updatedQuan = maxCapacity-quanttyCP;

				carupdate.setQuantity(Integer.toString(updatedQuan));
				dao.updateCarParts(carupdate);		
				}
			else if(Integer.parseInt(partSale.getQuantity())==maxCapacity) {
			//remove part from inventory	
				System.out.println("remove parts from inventory when quantity and capacity is equal");
				InventoryDAO dao = new InventoryDAO();
				dao.removeCarPartFromInventory(carupdate);	
			}
			
		}	
	}

	public void sellParts(CarPartsInventory ccpi) {
		// TODO Auto-generated method stub
		InventoryDAO dao = new InventoryDAO();
		dao.addCarPartToInventory(ccpi);
	}



}
