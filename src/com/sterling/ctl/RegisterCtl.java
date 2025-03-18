package com.sterling.ctl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Transaction;
import org.hibernate.classic.Session;


import com.sterling.connection.FactoryProvider;
import com.sterling.dto.Student;
import com.sterling.model.EmailSend;


@WebServlet("/RegisterCtl")
public class RegisterCtl extends HttpServlet {
	
       
    
    public RegisterCtl() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name").trim();
		String email = request.getParameter("email").trim().toLowerCase();
		String password = request.getParameter("pwd").trim();
		long mobile = Long.parseLong(request.getParameter("mob").trim());
		String address = request.getParameter("address").trim();
		
//		Validation Start
		Student student = new Student();
		HttpSession session = request.getSession();
		
		
//		NAME VALEDATION START
		String regexName = "^[a-zA-Z]{2,15}\\s([a-zA-Z]{2,15}\\s)?[a-zA-Z]{2,15}$";
		if(name!=null || name!=" ") {
		if(name.matches(regexName)) {
			student.setName(name);
		}else {
			session.setAttribute("message", "Incorrect Name Formet");
			session.setAttribute("color", "danger");
			response.sendRedirect("Register.jsp");
			return;
		}
		}
//		NAME VALEDATION END

//		EMAIL VALEDATION START

		String regexEmail = "^([\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4})?$";
		if(email!=null || email!="") {
		if(email.matches(regexEmail)) {

		student.setEmail(email);
		}else {
			session.setAttribute("message", "Incorrect Email Formet");
			session.setAttribute("color", "danger");
			response.sendRedirect("Register.jsp");
			return;
		}
		}
		
//		EMAIL VALEDATION END
		
		
		student.setPassword(password);
		
		student.setAddress(address);
		student.setType("Student");
		
		String regexMobileNumber = "^[7-9][0-9]{9}$";
			if(request.getParameter("mob").trim()!=null || request.getParameter("mob").trim()!="") {
				if(request.getParameter("mob").trim().matches(regexMobileNumber)) {

			student.setMobileNumber(mobile);
		}else {
			session.setAttribute("message", "Entered mobile number is invalid.");
			session.setAttribute("color", "danger");
			response.sendRedirect("Register.jsp");
			return;
		}
		}

		
		
//		Validation End
		
		
		try {
		Session s = FactoryProvider.getFactory().openSession();
		Transaction t = s.beginTransaction();
		
		s.save(student);
		
		t.commit();
		
		s.evict(student);
		s.close();
		
		EmailSend em = new EmailSend();
		em.sendEmail(email, name);
		session.setAttribute("message", "Registration successfull");
		session.setAttribute("color", "success");
		
		response.sendRedirect("Login.jsp");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
