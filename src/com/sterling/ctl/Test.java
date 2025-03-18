package com.sterling.ctl;

import java.util.List;

import org.hibernate.Transaction;
import org.hibernate.classic.Session;

import com.sterling.connection.FactoryProvider;
import com.sterling.dto.Post;
import com.sterling.dto.Student;

public class Test {

	public static void main(String[] args) {
		
		byte[] b = new byte[500000];
		
		Post p = new Post();
		p.setPostTitle("Hello");
		p.setPostPhoto(b);
		p.setPostContent("testing");
		
		Session session = FactoryProvider.getFactory().openSession();
		Transaction t = session.beginTransaction();

		Student s1 = (Student)session.get(Student.class, 6); 
		
		
		
//		List<Post> l = s1.getPosts();
//		l.add(p);
		
		
		session.save(s1);
		
		t.commit();
		
		session.evict(s1);
		
		session.close();
		System.out.println("Done");
	}
	
}
