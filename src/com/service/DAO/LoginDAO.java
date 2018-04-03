package com.service.DAO;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

import com.service.model.Login;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public class LoginDAO {
	 static String QUERYSTRING ;

	public Object authenticateLogin(Login login)
	{
		AnnotationConfiguration config = new AnnotationConfiguration();
		  SessionFactory factory= config.configure().buildSessionFactory();
		  Session session = factory.openSession();
		  session.beginTransaction();
		  fixQuery(login);
		  Query query = session.createQuery(QUERYSTRING);
		  System.out.println(">>> query"+query+"\t "+login.getUsername()+"\t"+login.getPassword());

		  query.setString("username", login.getUsername());
		  query.setString("password", login.getPassword());

		  Object user = query.uniqueResult();
		  session.getTransaction().commit();
		  System.out.println("Database contents delivered...");
			session.close();
		  //sendEmail();
		return user; 
	}

	private void fixQuery(Login login) {
		// TODO Auto-generated method stub
		String adminUser="from Admin where username = :username and password = :password";
		String customerUser="from Customer where username = :username and password = :password";
		String dealerUser="from Dealer where username = :username and password = :password";
		if(login.getUserRole().equalsIgnoreCase("customer")) {
			QUERYSTRING=	customerUser;
			System.out.println("***********"+QUERYSTRING+"\t"+login.getUsername()+"\t"+login.getPassword());
		}
		
		if(login.getUserRole().equalsIgnoreCase("admin")) {
			QUERYSTRING=	adminUser;
			System.out.println("***********"+QUERYSTRING+"\t"+login.getUsername()+"\t"+login.getPassword());
		}
		
		if(login.getUserRole().equalsIgnoreCase("dealer")) {
			QUERYSTRING=	dealerUser;
			System.out.println("***********"+QUERYSTRING+"\t"+login.getUsername()+"\t"+login.getPassword());
		}
		
	}	

	public void sendEmail() {
		// Recipient's email ID needs to be mentioned.
		System.out.println(">>>>>>>>>>SENDING EMAIL>>>>>>");
	      String to = "jananibhaskarr@gmail.com";

	      // Sender's email ID needs to be mentioned
	      String from = "jananibhaskarr@gmail.com";

	      // Assuming you are sending email from localhost
	      String host = "127.0.0.1";

	      // Get system properties
	      Properties properties = System.getProperties();

	      // Setup mail server
	      properties.setProperty("mail.smtp.host", host);

	      // Get the default Session object.
	      javax.mail.Session session = javax.mail.Session.getDefaultInstance(properties);

	      try {
	         // Create a default MimeMessage object.
	         MimeMessage message = new MimeMessage(session);

	         // Set From: header field of the header.
	         message.setFrom(new InternetAddress(from));

	         // Set To: header field of the header.
	         message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

	         // Set Subject: header field
	         message.setSubject("This is the Subject Line!");

	         // Now set the actual message
	         message.setText("This is actual message");

	         // Send message
	         Transport.send(message);

	      } catch (MessagingException mex) {
	         mex.printStackTrace();
	      }

	}
}
