package com.service.DAO;

import java.lang.reflect.Array;
import java.util.ArrayList;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.HashMap;
import java.util.Iterator;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import com.service.model.CarInventory;
import com.service.model.CarPartsInventory;
import com.service.model.Carpartssale;
import com.service.model.Carsale;
import com.service.model.Dealer;
import com.service.model.Dealership;

public class InventoryDAO {

	public void addCarToInventory(CarInventory car) {
		// TODO Auto-generated method stub
		try {
			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();
			car.setVid("a1001");
			session.save(car);
			transaction.commit();
			session.close();
			System.out.println("new car Added");
		}catch(HibernateException e)
		{
			e.printStackTrace();	
		}
	}

	public void addCarPartToInventory(CarPartsInventory carpart) {
		// TODO Auto-generated method stub
		try {
			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();
			carpart.setPid("");
			session.save(carpart);
			transaction.commit();
			System.out.println("new parts Added");
			session.close();
		}catch(HibernateException e)
		{
			e.printStackTrace();	
		}	
	}

	public List<String> getCarModels() {
		// TODO Auto-generated method stub
		List<String> cars= new ArrayList<String>();
		try {
			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();
			
			Criteria criteria = session.createCriteria(CarInventory.class);
	        Projection projection = Projections.property("model");
	        criteria.setProjection(projection).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);;
	       
	        List list = criteria.list();
	        Iterator it = list.iterator();
	        while (it.hasNext()) {
	            String model = (String) it.next();
	            cars.add(model);
	            System.out.println("car models : " + model);
	        }
	        session.close();
/*			Transaction transaction = session.beginTransaction();
			//dealer.setDid("a1001");
			session.save(carpart);
			transaction.commit();
			System.out.println("new parts Added");*/
		}catch(HibernateException e)
		{
			e.printStackTrace();	
		}
		return cars;
		
	}
	
	public List<String> getCarMake() {
		// TODO Auto-generated method stub
		List<String> cars= new ArrayList<String>();
		try {
			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();
			
			Criteria criteria = session.createCriteria(CarInventory.class);
	        Projection projection = Projections.property("make");
	        criteria.setProjection(projection);
	        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
	        List list = criteria.list();
	        Iterator it = list.iterator();
	        while (it.hasNext()) {
	            String model = (String) it.next();
	            cars.add(model);
	            System.out.println("car make : " + model);
	        }
	        session.close();
/*			Transaction transaction = session.beginTransaction();
			//dealer.setDid("a1001");
			session.save(carpart);
			transaction.commit();
			System.out.println("new parts Added");*/
		}catch(HibernateException e)
		{
			e.printStackTrace();	
		}
		return cars;
		
	}
	public List<Object> getDealership() {
		// TODO Auto-generated method stub
		List<Object> cars= new ArrayList<Object>();
		try {
			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();
			
			Criteria criteria = session.createCriteria(Dealership.class);
	        Projection projection = Projections.property("name");
	        Projection projection1 = Projections.property("dsid");
	        ProjectionList pList = Projections.projectionList();
	        pList.add(projection);
	        pList.add(projection1);   
	        criteria.setProjection(pList);
	        List list = criteria.list();
	        Iterator it = list.iterator();
	        while (it.hasNext()) {
	            Object[] dealership = (Object[]) it.next();
	            cars.add(dealership);
	            
	            System.out.println("Dealership name: " + dealership[0] +"\t"+dealership[1]);
	        }
	        session.close();
/*			Transaction transaction = session.beginTransaction();
			//dealer.setDid("a1001");
			session.save(carpart);
			transaction.commit();
			System.out.println("new parts Added");*/
		}catch(HibernateException e)
		{
			e.printStackTrace();	
		}
		return cars;
		
	}
	
	
	public List<String>  getCarPartsMake(){
		List<String> partmake= new ArrayList<String>();
		try {
			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();
			
			Criteria criteria = session.createCriteria(CarPartsInventory.class);
	        Projection projection = Projections.property("make");
	        criteria.setProjection(projection);
	        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
	        List list = criteria.list();
	        Iterator it = list.iterator();
	        while (it.hasNext()) {
	            String make = (String) it.next();
	            partmake.add(make);
	            System.out.println("car part make : " + make);
	        }
	        session.close();
/*			Transaction transaction = session.beginTransaction();
			//dealer.setDid("a1001");
			session.save(carpart);
			transaction.commit();
			System.out.println("new parts Added");*/
		}catch(HibernateException e)
		{
			e.printStackTrace();	
		}
		return partmake;
	}
	
public List<String>  getCarPartsModel(){
		
	List<String> partmake= new ArrayList<String>();
	try {
		// 1. configuring hibernate
		Configuration configuration = new AnnotationConfiguration().configure();
		// 2. create sessionfactory
		SessionFactory sessionFactory = configuration.buildSessionFactory();

		Session session = sessionFactory.openSession();
		
		Criteria criteria = session.createCriteria(CarPartsInventory.class);
        Projection projection = Projections.property("model");
        criteria.setProjection(projection);
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        List list = criteria.list();
        Iterator it = list.iterator();
        while (it.hasNext()) {
            String make = (String) it.next();
            partmake.add(make);
            System.out.println("car part model: " + make);
        }
        session.close();
/*			Transaction transaction = session.beginTransaction();
		//dealer.setDid("a1001");
		session.save(carpart);
		transaction.commit();
		System.out.println("new parts Added");*/
	}catch(HibernateException e)
	{
		e.printStackTrace();	
	}
	return partmake;
	}
	
	public List<CarInventory> SearchCarInventory (CarInventory car){
		System.out.println("In inventory dao");		
		List<String> makeQuery=  new ArrayList<String>();
		makeQuery.add("make = :make");
		makeQuery.add("year= :year");
		makeQuery.add("model = :model");
		makeQuery.add("dsId = :id");
		Query query=null;
				SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
		  Session session = sessionFactory.openSession();
		  session.beginTransaction();
		  
		  String SQL_QUERY = "FROM CarInventory WHERE dsId = :id and status=:st";
		  query = session.createQuery(SQL_QUERY);
		  query.setString("id", car.getDsId());
		  query.setInteger("st", 0);
		  System.out.println("1"+SQL_QUERY);
    if( (car.getMake()!=null) && (!car.getMake().equals("0"))) {
    	System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ MAke mentioned in query");
			  SQL_QUERY= SQL_QUERY.concat(" and make = :make");
			  query = session.createQuery(SQL_QUERY);
			  query.setString("make", car.getMake());
			  query.setString("id", car.getDsId());
			  query.setInteger("st", 0);
			  if(!car.getModel().equals("0")) {
			    	System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ MAke and Model mentioned in query");
					SQL_QUERY= SQL_QUERY.concat(" and model = :model");
					  query = session.createQuery(SQL_QUERY);
					  query.setString("model", car.getModel());
					  query.setString("make", car.getMake());
					  query.setString("id", car.getDsId());
					  query.setInteger("st", 0);
			 if(car.getYear()!=0) {
			    	System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ model and MAke and year mentioned in query");
							SQL_QUERY= SQL_QUERY.concat(" and year= :year");
							  query = session.createQuery(SQL_QUERY);
							  query.setInteger("year", car.getYear());	
							  query.setString("make", car.getMake());
							  query.setString("id", car.getDsId());	
							  query.setInteger("st", 0);
							  query.setString("model", car.getModel());

							  }}
			  else if(car.getYear()!=0)  {
									System.out.println("Id make and year provided");
									SQL_QUERY= SQL_QUERY.concat(" and year= :year");
									  query = session.createQuery(SQL_QUERY);
									  query.setInteger("year", car.getYear());	
									  query.setString("id", car.getDsId());
									  query.setInteger("st", 0);
									  query.setString("make", car.getMake());

							  }
			  }
    else {
    	System.out.println("********************* in else");
    	if( (car.getModel()!=null)&& !car.getModel().equals("0")) {
        	System.out.println("Model provided");
    					SQL_QUERY= SQL_QUERY.concat(" and model = :model");
    					  query = session.createQuery(SQL_QUERY);
    					  query.setString("model", car.getModel());
    					  query.setString("id", car.getDsId());
    					  query.setInteger("st", 0);
    					  if(car.getYear()!=0) {
    					    	System.out.println("Model and year provided");
    							SQL_QUERY= SQL_QUERY.concat(" and year= :year");
    							  query = session.createQuery(SQL_QUERY);
    							  query.setInteger("year", car.getYear());	
    							  query.setString("id", car.getDsId());
    							  query.setInteger("st", 0);
    							  query.setString("model", car.getModel());
    						}
    				}
    	else {
    		 if((car.getYear()!=null)&&(car.getYear()!=0)) {System.out.println("Id and year provided");
			SQL_QUERY= SQL_QUERY.concat(" and year= :year");
			  query = session.createQuery(SQL_QUERY);
			  query.setInteger("year", car.getYear());	
			  query.setString("id", car.getDsId());}
    		  		query.setInteger("st", 0);
    	}
       
    }
    
System.out.println("***************************");	
System.out.println(SQL_QUERY);
System.out.println("***************************");
List <CarInventory>result = query.list();
		  for(int j=0;j<result.size();j++) {
			  CarInventory re = (CarInventory)result.get(j);
			  System.out.println("*****************"+re.getVinNumber());
		  }
		  session.getTransaction().commit();
		  session.close();
		  System.out.println("Database contents delivered...");

		return result;	
	}

	
	public HashMap<String, String> getCategoriesandType(List<CarPartsInventory> mylist){
		HashMap<String, String> hmap = new HashMap<String, String>();
		
		
		
		for(CarPartsInventory part:mylist){
			hmap.put(part.getCategory(), part.getType());
		}
		
		return hmap;
	}
	
	public List<CarPartsInventory> getCarPartsInventory() {
		 List<CarPartsInventory> list=null;
		try {
			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();
			Query query = session.createQuery("from CarPartsInventory"); 

			  list = query.list();
			  session.close();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();	
		}

		return list;}

	public void removeCarFromInventory(CarInventory removedCar) {
		// TODO Auto-generated method stub
		try {
			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();
			removedCar.setVinNumber("WBAFZ9C55DC792157");
			//dealer.setDid("a1001");
			session.delete(removedCar);
			
			transaction.commit();
			System.out.println(removedCar.getVid()+"Deleted");
			session.close();
		}catch(HibernateException e)
		{
			e.printStackTrace();	
		}		
	}

	public  List <CarPartsInventory> getCarPartsInventory(Dealer dealers, Dealership dshp) {
		// TODO Auto-generated method stub
		// 1. configuring hibernate
		Configuration configuration = new AnnotationConfiguration().configure();
		// 2. create sessionfactory
		SessionFactory sessionFactory = configuration.buildSessionFactory();

		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		  String SQL_QUERY = "FROM CarPartsInventory WHERE dsid = :id and seller=:sel";
		  System.out.println(dshp.getDsid()+"^^^^^^^^^^^^^^"+dealers.getDid());
		  Query query = session.createQuery(SQL_QUERY);	
		  query.setString("id", dshp.getDsid());
		  query.setString("sel", dealers.getDid());
		  List <CarPartsInventory>result = query.list();
		  for(int j=0;j<result.size();j++) {
			  CarPartsInventory re = (CarPartsInventory)result.get(j);
			  System.out.println(re.getPid());
		  }
		  transaction.commit();
		  session.close();
		  System.out.println("Database contents delivered...from getCarPartsInventory");
		  return result;
	}
	
	public  List <CarInventory> getCarInventory(Dealer dealers, Dealership dshp) {
		// TODO Auto-generated method stub
		// 1. configuring hibernate
		Configuration configuration = new AnnotationConfiguration().configure();
		// 2. create sessionfactory
		SessionFactory sessionFactory = configuration.buildSessionFactory();

		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		  String SQL_QUERY = "FROM CarInventory WHERE dsId = :id";
		  System.out.println(dshp.getDsid()+"^^^^^^^^^^^^^^"+dealers.getDid());
		  Query query = session.createQuery(SQL_QUERY);	
		  query.setString("id", dshp.getDsid());
		  List <CarInventory>result = query.list();
		  for(int j=0;j<result.size();j++) {
			  CarInventory re = (CarInventory)result.get(j);
			  System.out.println(re.getVid());
		  }
		  transaction.commit();
		  session.close();
		  System.out.println("Database contents delivered...from getCarInventory");
		  return result;
	}

	public void removeCarPartFromInventory(CarPartsInventory removeCarPart) {
		// TODO Auto-generated method stub
		try {
			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();
			//dealer.setDid("a1001");
			session.delete(removeCarPart);
			
			transaction.commit();
			System.out.println(removeCarPart.getPid()+"Deleted");
			session.close();
		}catch(HibernateException e)
		{
			e.printStackTrace();	
		}			
	}

	public void updateCarParts(CarPartsInventory partUpdate) {
		// TODO Auto-generated method stub
		System.out.println(partUpdate.getQuantity() +" "+partUpdate.getPid());
		try {
			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();
			
			Query query = session.createQuery("update CarPartsInventory set quantity = :squantity" +
    				" where pid = :uppid");
query.setParameter("squantity", partUpdate.getQuantity());
query.setParameter("uppid", partUpdate.getPid());
int result = query.executeUpdate();
			
			//admin.setAid("a1001");
			//session.update(partUpdate);
			transaction.commit();
			System.out.println("\n update car part after car part sale");
			session.close();
		}catch(HibernateException e)
		{
			e.printStackTrace();	
		}
	}
	
	
	public List<Carsale> getCarsPurchased(String purchaser){

			// 1. configuring hibernate
			Configuration configuration = new AnnotationConfiguration().configure();
			// 2. create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction(); 
			String SQL_QUERY = "FROM Carsale WHERE csid = :client";

			Query  query = session.createQuery(SQL_QUERY);
			query.setParameter("client", purchaser);
			 List <Carsale>result = query.list();
		  transaction.commit();
			System.out.println("\n get car sale deyails");
			session.close();
		return result;
	}
	
	
	
	public List<Carpartssale> getCarPartsPurchased(String purchaser){

		// 1. configuring hibernate
		Configuration configuration = new AnnotationConfiguration().configure();
		// 2. create sessionfactory
		SessionFactory sessionFactory = configuration.buildSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction(); 
		String SQL_QUERY = "FROM Carpartssale WHERE clientId = :client";

		Query  query = session.createQuery(SQL_QUERY);
		query.setParameter("client", purchaser);
		 List <Carpartssale>result = query.list();
	  transaction.commit();
		System.out.println("\n get car part sale details");
		session.close();
	return result;
}	
	
}
