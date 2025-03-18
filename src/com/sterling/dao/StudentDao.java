package com.sterling.dao;

import java.util.List;

import javax.servlet.Registration;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;
import org.omg.CORBA.PUBLIC_MEMBER;

import com.sterling.dto.Announcement;
import com.sterling.dto.Course;
import com.sterling.dto.Post;
import com.sterling.dto.Student;
import com.sterling.dto.StudentResources;
import com.sterling.dto.StudentResult;

public class StudentDao {

	private SessionFactory session = null;

	public StudentDao(SessionFactory session) {
		this.session = session;
	}
	
	public Student getStudentByEmailAndPassword(String email,String password) {
		Student student = null;
		try {
		String query = "from Student where email =:e and password =:p";
		
		Session session = this.session.openSession();
		
		Query q = session.createQuery(query);
		
		q.setParameter("e", email);
		q.setParameter("p", password);
		
		student = (Student)q.uniqueResult();
		return student;
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return student;
		
		
	}
	
	
	public List<Student> getAllTeamLeads(){
		
		Session s = this.session.openSession();
		
		Criteria c = s.createCriteria(Student.class);
		c.add(Restrictions.eq("type", "TL"));
		
		List<Student> tl = c.list();
		
		return tl;
	}
	
	public List<Student> getAllStudents(){
		
		Session s = this.session.openSession();
		
		Criteria c = s.createCriteria(Student.class);
		c.add(Restrictions.eq("type", "Student"));
		
		List<Student> tl = c.list();
		
		return tl;
	}
	
	public boolean demoteToStudent(int id,String type) {
		try {
		Session s = this.session.openSession();
		Transaction t = s.beginTransaction();
		
		Student student = (Student)s.get(Student.class, id);
		student.setType(type);
		
		s.save(student);
		t.commit();
		s.evict(student);
		
		return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean promoteToStudent(int id,String type) {
		return demoteToStudent(id, type);
	}
	
	
	

	
	public List<StudentResources> getAllResources(){

		Session s = this.session.openSession();
		Query c = s.createQuery("from StudentResources");
		
		return c.list();
	}
	
	
	public List<StudentResult> getAllResult(){


		Session s = this.session.openSession();
		Query c = s.createQuery("from StudentResult");
		return c.list();
	}
	
	
	public List<Course> getAllCourses(){
		Session s = this.session.openSession();
		Query c = s.createQuery("from Course");
		
		return c.list();
	}
	
	
	public List<Announcement> getAllAnnouncement(){
		Session s = this.session.openSession();
		Query c = s.createQuery("from Announcement");
		
		
		return c.list();
	}
	
	public List<Post> getAllPosts(){
		Session s = this.session.openSession();
		Query c = s.createQuery("from Post");
		
		
		return c.list();
	}
	
	public List<Student> getAllUsers(){
		
		Session s = this.session.openSession();
		
		Query c = s.createQuery("from Student");
		
		return c.list();
	}
}
