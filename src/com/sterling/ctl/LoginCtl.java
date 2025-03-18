package com.sterling.ctl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sterling.connection.FactoryProvider;
import com.sterling.dao.StudentDao;
import com.sterling.dto.Student;


@WebServlet("/LoginCtl")
public class LoginCtl extends HttpServlet {
	   
    
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("uid").toLowerCase();
		String password = request.getParameter("pwd");
		System.out.println(email);
		System.out.println(password);
//		EMAIL VALEDATION START
		HttpSession session = request.getSession();
		Student student = null;
		String regexEmail = "^([\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4})?$";
		if(email!=null || email!="") {
		if(email.matches(regexEmail)) {
			StudentDao sd=null;
			try {
			sd = new StudentDao(FactoryProvider.getFactory());
			student = (Student)sd.getStudentByEmailAndPassword(email, password);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			if(student==null) {
				session.setAttribute("message", "Invalid User Name Or Password");
				session.setAttribute("color", "danger");
				response.sendRedirect("Login.jsp");			
			}else {
				session.setAttribute("current-user", student);
				
				if(student.getType().equals("Admin")) {
					response.sendRedirect("Admin.jsp");
				}else if(student.getType().equals("TL")) {
					response.sendRedirect("TeamLead.jsp");
				}else if(student.getType().equals("Student")) {
					response.sendRedirect("Student.jsp");
				}else {
					session.setAttribute("message", "We Can Not Identify User");
					session.setAttribute("color", "danger");
					response.sendRedirect("Login.jsp");
				}
			}

		}else {
			session.setAttribute("message", "Incorrect Email Formet");
			session.setAttribute("color", "danger");
			response.sendRedirect("Register.jsp");
			return;
		}
		}

		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
