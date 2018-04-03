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

import com.service.model.Dealership;


public class DealershipDAO {
	public void addDealership(Dealership dealership) throws DOMException, ParserConfigurationException	{
		try {
			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();
			//dealer.setDid("a1001");
			session.save(dealership);
			transaction.commit();
			System.out.println("new Dealership Added");
			session.close();
		}catch(HibernateException e)
		{
			e.printStackTrace();	
		}

	}

	public Dealership getDealership(String did) {
		// TODO Auto-generated method stub
		AnnotationConfiguration config = new AnnotationConfiguration();
		  SessionFactory factory= config.configure().buildSessionFactory();
		  Session session = factory.openSession();
		  session.beginTransaction();
		  Query query = session.createQuery("from Dealership where did = :dealerId");
		  query.setString("dealerId", did);

		  Dealership dealerShip = (Dealership)query.uniqueResult();
		  session.getTransaction().commit();
		  System.out.println("Database contents delivered...");
			session.close();
		  //sendEmail();
		return dealerShip; 
	}
}
