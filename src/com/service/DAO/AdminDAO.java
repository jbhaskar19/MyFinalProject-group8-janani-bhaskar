package com.service.DAO;
import javax.xml.parsers.ParserConfigurationException;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;
import org.w3c.dom.DOMException;

import com.service.model.Admin;
import com.service.model.Carpartssale;
import com.service.model.Carsale;
import com.service.model.Dealer;

public class AdminDAO {

	public void addAdmin(Admin admin) throws DOMException, ParserConfigurationException	{
		try {
			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();
			//admin.setAid("a1001");
			session.save(admin);
			transaction.commit();
			System.out.println("new admin added");
			session.close();
		}catch(HibernateException e)
		{
			e.printStackTrace();	
		}

	}

	public Admin loginAdmin(Admin admin) throws Exception {
		// TODO Auto-generated method stub

		AnnotationConfiguration config = new AnnotationConfiguration();
		  config.addAnnotatedClass(Admin.class);
		  SessionFactory factory= config.configure().buildSessionFactory();
		  Session session = factory.openSession();
		  session.beginTransaction();
		  String queryString = "from Admin where a_username = :username and a_password = :password";
		  Query query = session.createQuery(queryString);
		  System.out.println(">>> query"+query+"\t "+admin.getUsername()+"\t"+admin.getPassword());

		  query.setString("username", admin.getUsername());
		  query.setString("password", admin.getPassword());

		  Admin user = (Admin)query.uniqueResult();
		  session.getTransaction().commit();
		  System.out.println("Database contents delivered..."+user.getName());
			session.close();
		return user; 
		 
	
	}

	public void updatePassword(String newPassword,Admin adm) {
		// TODO Auto-generated method stub
		try {
			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();
			//admin.setAid("a1001");
			adm.setPassword(newPassword);
			session.update(adm);
			transaction.commit();
			System.out.println("password Updated");
			session.close();
		}catch(HibernateException e)
		{
			e.printStackTrace();	
		}

	}

	public void editProfile(Object editP) {
		// TODO Auto-generated method stub
		try {
			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();
			//admin.setAid("a1001");

			session.update(editP);
			transaction.commit();
			System.out.println("Profile Updated");
			session.close();
		}catch(HibernateException e)
		{
			e.printStackTrace();	
		}
	
	}

	public void payForCar(Carsale sale) {
		// TODO Auto-generated method stub
		try {
			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();
			sale.setSid("");
			session.save(sale);
			transaction.commit();
			System.out.println("updated car sale table for"+sale.getVId());
			session.close();
		}catch(HibernateException e)
		{
			e.printStackTrace();	
		}	
	}

	public void payForCarPart(Carpartssale partSale) {
		// TODO Auto-generated method stub
		System.out.println("payForCarPart");
System.out.println(partSale.getClientId()+" "+partSale.getDatePurchased()+" "
		+partSale.getDsId()+" "+partSale.getPartId()+" "+partSale.getPrice()+" "+partSale.getQuantity()+" "+partSale.getStatus());
try {
	// 1. configuring hibernate
	Configuration configuration = new AnnotationConfiguration().configure();
	// 2. create sessionfactory
	SessionFactory sessionFactory = configuration.buildSessionFactory();

	Session session = sessionFactory.openSession();

	Transaction transaction = session.beginTransaction();
	partSale.setPsId("");
	session.save(partSale);
	transaction.commit();
	System.out.println("car part payment added to sale inevtory ");
	session.close();
}catch(HibernateException e)
{
	e.printStackTrace();	
}	
	}

}
