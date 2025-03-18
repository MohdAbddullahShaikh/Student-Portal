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
import com.sterling.dto.Slider;

@WebServlet("/RemoveSlideCtl")
public class RemoveSlideCtl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RemoveSlideCtl() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		try {
		int id = Integer.parseInt(request.getParameter("id"));
		
		Session s = FactoryProvider.getFactory().openSession();
		Transaction t = s.beginTransaction();
		Slider sl = (Slider)s.load(Slider.class, id);
		s.delete(sl);
		t.commit();
		
		session.setAttribute("message", "Removel Successfull");
		session.setAttribute("color", "success");
		response.sendRedirect("EditHomePage.jsp");

		
		}catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("message", "Removel Failed");
			session.setAttribute("color", "danger");
			response.sendRedirect("EditHomePage.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
