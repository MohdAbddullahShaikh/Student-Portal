package com.sterling.ctl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;

import com.sterling.connection.FactoryProvider;
import com.sterling.dao.StudentDao;
import com.sterling.dto.Announcement;
import com.sterling.dto.Student;

@WebServlet("/AnnouncementCtl")
public class AnnouncementCtl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AnnouncementCtl() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Announcement a = new Announcement();
		a.setTitle(title);
		a.setContent(content);
		
		HttpSession session = request.getSession();
		Student student = (Student)session.getAttribute("current-user");
		
//		StudentDao sd = new StudentDao(FactoryProvider.getFactory());
		a.setAnnouncerId(student);
		boolean flag = false;
		try {
			Session s = FactoryProvider.getFactory().openSession();
			Transaction t = s.beginTransaction();
			
			s.save(a);
			t.commit();
			s.evict(a);
			flag=true;
		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
		}
//		boolean flag = sd.uploadAnnouncement(student.getId(), a);
		
		if(flag) {
			session.setAttribute("message", "Announcement Added Successfully");
			session.setAttribute("color", "success");
			switch(student.getType()) {
			
			case"TL" :response.sendRedirect("TeamLead.jsp");
			break;
			case"Admin" :response.sendRedirect("Admin.jsp");
			break;
			case"Student" :response.sendRedirect("Student.jsp");
			break;
			}
		}else {
			session.setAttribute("message", "Announcement Upload Failed");
			session.setAttribute("color", "danger");
			switch(student.getType()) {
			
			case"TL" :response.sendRedirect("TeamLead.jsp");
			break;
			case"Admin" :response.sendRedirect("Admin.jsp");
			break;
			case"Student" :response.sendRedirect("Student.jsp");
			break;
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
