package com.sterling.ctl;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sterling.dto.Student;


@WebFilter({ "/AdminFilter", "/Admin.jsp" ,"/ManageCtl" ,"/StudentResourcesCtl","/CourseCtl","/RemoveSlideCtl","/RemoveBannerCtl","/EditHomePage.jsp"})
public class AdminFilter implements Filter {

    
    public AdminFilter() {
       
    }

	
	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		HttpSession session = req.getSession();
		Student s = (Student)session.getAttribute("current-user");
		if(s==null) {
			session.setAttribute("message", "Login First");
			session.setAttribute("color", "danger");
			resp.sendRedirect("Login.jsp");
		}else {
			if (s.getType().equals("Admin")) {
				chain.doFilter(request, response);
			}else {
				session.setAttribute("message", "You Are Not Admin Don't Try To Access Admin Page");
				session.setAttribute("color", "danger");
				if(s.getType().equals("Student")) {
				resp.sendRedirect("Student.jsp");
				}else if(s.getType().equals("TL")) {
					resp.sendRedirect("TeamLead.jsp");
					}
			}
			
		}
		
		
		
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
