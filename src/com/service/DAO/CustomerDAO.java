package com.service.DAO;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

import com.service.model.Carpartssale;
import com.service.model.Carsale;
import com.service.model.Customer;

public class CustomerDAO {
	public void addCustomer(Customer customer) {
	try {
		// 1. configuring hibernate
		Configuration configuration = new AnnotationConfiguration().configure();
		// 2. create sessionfactory
		SessionFactory sessionFactory = configuration.buildSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		customer.setCid("");
		session.save(customer);
		transaction.commit();
		System.out.println("new customer Added");
		session.close();
	}catch(HibernateException e)
	{
		e.printStackTrace();	
	}
	}

	public void updatePassword(Customer myCustomer, String newPassword) {
		// TODO Auto-generated method stub
		try {
			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();
			//admin.setAid("a1001");
			myCustomer.setPassword(newPassword);
			session.update(myCustomer);
			transaction.commit();
			System.out.println("\nreset customer password");
			session.close();
		}catch(HibernateException e)
		{
			e.printStackTrace();	
		}
	}

	public void updateEditProfile(Customer cs) {
		// TODO Auto-generated method stub
		try {
			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();
			//admin.setAid("a1001");
			session.update(cs);
			transaction.commit();
			System.out.println("\n customer profile edit update");
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
			System.out.println("new car sale Added");
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
