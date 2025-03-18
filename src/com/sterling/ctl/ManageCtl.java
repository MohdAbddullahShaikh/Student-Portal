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

@WebServlet("/ManageCtl")
public class ManageCtl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ManageCtl() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	int id = Integer.parseInt(request.getParameter("id"));	
	String type = request.getParameter("demoteTo");
	
	StudentDao sd = new StudentDao(FactoryProvider.getFactory());
	HttpSession session = request.getSession();
	if("Student".equals(type)) {
	boolean flag = sd.demoteToStudent(id,type);
	if(flag) {
		session.setAttribute("message", "Demoted Successfully");
		session.setAttribute("color", "success");
		response.sendRedirect("Admin.jsp");
	}else {
		session.setAttribute("message", "Demotion Failed");
		session.setAttribute("color", "danger");
		response.sendRedirect("Admin.jsp");
	}
	}else if("TL".equals(type)) {
		boolean flag = sd.promoteToStudent(id,type);
		if(flag) {
			session.setAttribute("message", "Promoted Successfully");
			session.setAttribute("color", "success");
			response.sendRedirect("Admin.jsp");
		}else {
			session.setAttribute("message", "Promotion Failed");
			session.setAttribute("color", "danger");
			response.sendRedirect("Admin.jsp");
		}
		}else if("Admin".equals(type)) {
			boolean flag = sd.promoteToStudent(id,type);
			if(flag) {
				session.setAttribute("message", "Promoted Successfully");
				session.setAttribute("color", "success");
				response.sendRedirect("Admin.jsp");
			}else {
				session.setAttribute("message", "Promotion Failed");
				session.setAttribute("color", "danger");
				response.sendRedirect("Admin.jsp");
			}
			}
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
