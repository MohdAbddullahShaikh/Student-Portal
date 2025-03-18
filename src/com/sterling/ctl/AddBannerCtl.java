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
import com.sterling.dto.Banner;

@MultipartConfig
@WebServlet("/AddBannerCtl")
public class AddBannerCtl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddBannerCtl() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		try {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Part part = request.getPart("bPic");
		String imgName = part.getSubmittedFileName();

		Banner b1 = new Banner();
		b1.setTitle(title);
		b1.setContent(content);
		b1.setImgName(imgName);
		
		InputStream is = part.getInputStream();
		byte[] b = new byte[is.available()];
		is.read(b);
		String path = request.getRealPath("IndexPageImages")+File.separator+imgName;
		FileOutputStream fos = new FileOutputStream(path);
		fos.write(b);
		
		Session s = FactoryProvider.getFactory().openSession();
		Transaction t = s.beginTransaction();
		
		
		s.save(b1);
		t.commit();
		s.evict(b1);
		
		session.setAttribute("message", "Banner Added successfully");
		session.setAttribute("color", "success");
		response.sendRedirect("EditHomePage.jsp");
		
		}catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("message", "Banner Not Added");
			session.setAttribute("color", "danger");
			response.sendRedirect("EditHomePage.jsp");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
