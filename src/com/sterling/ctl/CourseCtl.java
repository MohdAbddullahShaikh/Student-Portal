package com.sterling.ctl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Transaction;
import org.hibernate.classic.Session;

import com.sterling.connection.FactoryProvider;
import com.sterling.dto.Course;

@WebServlet("/CourseCtl")
public class CourseCtl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CourseCtl() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String operation = request.getParameter("operation");
		
		if(operation.equals("addcourse")) {
		try {
		String cName = request.getParameter("cName");
		String cDetails = request.getParameter("cDetails");
		int cPrice = Integer.parseInt(request.getParameter("cPrice"));
		
		Course c = new Course();
		c.setCourseName(cName);
		c.setCourseDetails(cDetails);
		c.setCoursePrice(cPrice);
		
		Session s = FactoryProvider.getFactory().openSession();
		Transaction t = s.beginTransaction();
		
		s.save(c);
		
		t.commit();
		
		s.evict(c);
		
		session.setAttribute("message", "Course Added Successfully");
		session.setAttribute("color", "success");
		response.sendRedirect("Admin.jsp");
		
		
		}catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("message", "Course Added Successfully");
			session.setAttribute("color", "success");
			response.sendRedirect("Admin.jsp");
		}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
