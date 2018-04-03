package com.service.DAO;

import java.util.List;

import javax.xml.parsers.ParserConfigurationException;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.w3c.dom.DOMException;
import org.hibernate.Query;
import com.service.model.Carpartssale;
import com.service.model.Carsale;
import com.service.model.Dealer;
import com.service.model.Dealership;



public class DealerDAO {
	public String addDealer(Dealer dealer) throws DOMException, ParserConfigurationException	{
		

			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();
			
			dealer.setDid("a1001");
			session.save(dealer);
			transaction.commit();

		       Criteria crit = session.createCriteria(Dealer.class);
		        ProjectionList projList = Projections.projectionList();
		        projList.add(Projections.max("did"));
		        crit.setProjection(projList);
		        List results = crit.list();
			System.out.println("\n\n Dealer Added \n"+"new deler id is>>>>>:"+results.get(0));
			
			session.close();

		return results.get(0).toString();

	}

	public void removeDealer(Dealer dealer) {
		// TODO Auto-generated method stub
		System.out.println("DEaler to delete"+dealer.getDid());
	}

	

	public void resetPassword(Dealer mydel, String newPassword) {
		// TODO Auto-generated method stub
		try {
			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();
			//admin.setAid("a1001");
			mydel.setPassword(newPassword);
			session.update(mydel);
			transaction.commit();
			System.out.println("\nreset dealer password");
			session.close();
		}catch(HibernateException e)
		{
			e.printStackTrace();	
		}
	
	}

	public void updateProfile(Object editupdate) {
		// TODO Auto-generated method stub
		try {
			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();
			//admin.setAid("a1001");
			session.update(editupdate);
			transaction.commit();
			System.out.println("\n updated profile details");
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

	public void addDealership(Dealership newDealership) {
		// TODO Auto-generated method stub
		// 1. configuring hibernate
		Configuration configuration = new AnnotationConfiguration().configure();
		// 2. create sessionfactory
		SessionFactory sessionFactory = configuration.buildSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		
		newDealership.setDsid("a1001");
		session.save(newDealership);
		transaction.commit();
		session.close();
	}
}
