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
import com.sterling.dao.StudentDao;
import com.sterling.dto.Post;
import com.sterling.dto.Student;

@MultipartConfig
@WebServlet("/PostCtl")
public class PostCtl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PostCtl() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Student currentUser = (Student)session.getAttribute("current-user");
		boolean flag = false;
		try {	
		String title = request.getParameter("title");
		
		String content = request.getParameter("content");
		
		Part part = request.getPart("pPic");

		String photoName = part.getSubmittedFileName();
		
		Post p = new Post();
		p.setPostTitle(title);
		p.setPostContent(content);
		p.setPhotoName(photoName);
		
		InputStream is = part.getInputStream();
		byte[] b = new byte[is.available()];
		is.read(b);
		
//		p.setPostPhoto(b);
		
		String path = request.getRealPath("PostImages")+File.separator+part.getSubmittedFileName();
		FileOutputStream fos = new FileOutputStream(path);
		fos.write(b);
		
		p.setPoster(currentUser);
		
		Session s = FactoryProvider.getFactory().openSession();
		Transaction t = s.beginTransaction();
		
		s.save(p);
		t.commit();
		s.evict(p);
		
		flag=true;
		
		}catch (Exception e) {
		e.printStackTrace();
		flag=false;
		}
		if(flag) {
			session.setAttribute("message", "Post Added Successfully");
			session.setAttribute("color", "success");
			switch(currentUser.getType()) {
			
			case"TL" :response.sendRedirect("TeamLead.jsp");
			break;
			case"Admin" :response.sendRedirect("Admin.jsp");
			break;
			case"Student" :response.sendRedirect("Student.jsp");
			break;
			}
		}else {
			session.setAttribute("message", "Post Upload Failed");
			session.setAttribute("color", "danger");
switch(currentUser.getType()) {
			
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
