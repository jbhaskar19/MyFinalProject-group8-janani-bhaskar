package com.service.DAO;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

import com.service.model.Carpartssale;
import com.service.model.Carsale;


public class SaleDAO {
	public void addCarSale(Carsale sale) {
		// TODO Auto-generated method stub
		try {
			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();
			//dealer.setDid("a1001");
			session.save(sale);
			transaction.commit();
			System.out.println("new sale Added");
	 		session.close();
		}catch(HibernateException e)
		{
			e.printStackTrace();	
		}
	}
	
	public void addCarPartsSale(Carpartssale parts) {
		// TODO Auto-generated method stub
		try {
			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();
			//dealer.setDid("a1001");
			session.save(parts);
			transaction.commit();
			System.out.println("new parts sale Added");
	 		session.close();
		}catch(HibernateException e)
		{
			e.printStackTrace();	
		}
	}
}
