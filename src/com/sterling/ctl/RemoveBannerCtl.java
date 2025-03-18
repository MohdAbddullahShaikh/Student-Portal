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
import com.sterling.dto.Banner;
import com.sterling.dto.Slider;


@WebServlet("/RemoveBannerCtl")
public class RemoveBannerCtl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RemoveBannerCtl() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		try {
		int id = Integer.parseInt(request.getParameter("id"));
		
		Session s = FactoryProvider.getFactory().openSession();
		Transaction t = s.beginTransaction();
		Banner b = (Banner)s.load(Banner.class, id);
		s.delete(b);
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
