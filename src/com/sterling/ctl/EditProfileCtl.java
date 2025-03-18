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
import com.sterling.dto.Student;


@WebServlet("/EditProfileCtl")
public class EditProfileCtl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditProfileCtl() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Session s = FactoryProvider.getFactory().openSession();
		Transaction t = s.beginTransaction();
		int id = Integer.parseInt(request.getParameter("id"));
		Student student = (Student)s.get(Student.class, id);
		if(request.getParameter("operation").equals("editprofile")) {
		try {
		String name = request.getParameter("name");
		String mobile = request.getParameter("mob");
		String address = request.getParameter("address");
		
		
		if(name!="") {
			student.setName(name);
		}
		if(request.getParameter("mob")!="") {
			student.setMobileNumber(Long.parseLong(mobile));
		}
		if (address!="") {
			student.setAddress(address);
		}
		
		s.save(student);
		t.commit();
		session.setAttribute("current-user", student);
		s.evict(student);
		s.close();
		session.setAttribute("message", "Profile Updated Successfully");
		session.setAttribute("color", "success");
		String type = student.getType();
		
		switch(type) {
		case "Admin": response.sendRedirect("Admin.jsp");
		break;
		case "TL": response.sendRedirect("TeamLead.jsp");
		break;
		case "Student": response.sendRedirect("Student.jsp");
		break;
		}
		}catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("message", "Profile Update Failed");
			session.setAttribute("color", "danger");
			response.sendRedirect("Admin.jsp");

		}
		}
		else if (request.getParameter("operation").equals("changepassword")) {
			if(request.getParameter("oldpass").trim().equals(student.getPassword())){
				if (request.getParameter("newpass").trim().equals(request.getParameter("conpass").trim())) {
					student.setPassword(request.getParameter("newpass").trim());
					try {
					s.save(student);
					t.commit();
					session.setAttribute("current-user", student);
					s.evict(student);
					s.close();
					session.setAttribute("message", "Password Changed Successfully");
					session.setAttribute("color", "success");
					String type = student.getType();
					
					switch(type) {
					case "Admin": response.sendRedirect("Admin.jsp");
					break;
					case "TL": response.sendRedirect("TeamLead.jsp");
					break;
					case "Student": response.sendRedirect("Student.jsp");
					break;
					}
					
					}catch (Exception e) {
					e.printStackTrace();
					session.setAttribute("message", "Failed To Change Password");
					session.setAttribute("color", "dnager");
					response.sendRedirect("EditProfile.jsp");
					}
				}else {
					session.setAttribute("message", "New password And Confirm Password Not Matched");
					session.setAttribute("color", "danger");
					response.sendRedirect("EditProfile.jsp");
				}
			}else {
				session.setAttribute("message", "Old Password Is Incorrect");
				session.setAttribute("color", "danger");
				response.sendRedirect("EditProfile.jsp");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
