package com.sterling.connection;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {

private static SessionFactory factory = null;
	
	public static SessionFactory getFactory() {
		try {
			if(factory==null) {
				factory = new Configuration()
						.configure("com/sterling/resources/Hibernate.cfg.xml")
						.buildSessionFactory();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return factory;
	}
	
}
