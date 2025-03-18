package com.sterling.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;

import com.sterling.dto.Banner;
import com.sterling.dto.Slider;

public class HomePageDao {

	private SessionFactory sf = null;
	
	public HomePageDao(SessionFactory sf) {
		this.sf=sf;		
	}
	
	
	public List<Slider> getAllSlides(){
		Session s = this.sf.openSession();
		Query c = s.createQuery("from Slider");
		return c.list();
	}

	public List<Banner> getAllBanner(){
		Session s = this.sf.openSession();
		Query c = s.createQuery("from Banner");
		return c.list();
	}

}
