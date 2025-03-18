package com.sterling.ctl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Transaction;
import org.hibernate.classic.Session;

import com.sterling.connection.FactoryProvider;
import com.sterling.dto.StudentResources;
@MultipartConfig
@WebServlet("/StudentResourcesCtl")
public class StudentResourcesCtl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StudentResourcesCtl() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		try {
		String name = request.getParameter("rTitle");
		String desc = request.getParameter("rContent");
		Part part = request.getPart("rFile");
		
		StudentResources sr = new StudentResources();
		sr.setName(name);
		sr.setDescription(desc);
		sr.setFileName(part.getSubmittedFileName());
		
		InputStream is = part.getInputStream();
		byte[] b = new byte[is.available()];
		is.read(b);
		
		
		String path = request.getRealPath("StudentResourcesFiles")+File.separator+part.getSubmittedFileName();
		
		FileOutputStream fos = new FileOutputStream(path);
		fos.write(b);
		System.out.println("done");
		System.out.println(path);
		
		Session s = FactoryProvider.getFactory().openSession();
		Transaction t = s.beginTransaction();
		
		s.save(sr);
		t.commit();
		s.evict(sr);
		
		
		session.setAttribute("message", "Resource Added Successfully");
		session.setAttribute("color", "success");
		response.sendRedirect("Admin.jsp");
		
		}catch (Exception e) {
		e.printStackTrace();
		session.setAttribute("message", "Resource Upload Failed");
		session.setAttribute("color", "danger");
		response.sendRedirect("Admin.jsp");

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
