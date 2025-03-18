<%@page import="com.sterling.dto.Announcement"%>
<%@page import="java.util.List"%>
<%@page import="com.sterling.connection.FactoryProvider"%>
<%@page import="com.sterling.dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    StudentDao sd = new StudentDao(FactoryProvider.getFactory());
    List<Announcement> al = sd.getAllAnnouncement();
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Announcements</title>
<%@ include file="components/Bootstrap_css_js.jsp"%>
</head>
<body>
<%@ include file="components/Header.jsp"%>
<%@ include file="components/Background.jsp"%>

<div class="container mb-5">

<%for(int i=al.size(),j=1;i>0;i--,j++){
	if(j==10){break;}
	Announcement a = al.get(i-1);
	Student s = a.getAnnouncerId();
    String name = s.getName();
    String type = s.getType();	
	%>

<div class="card bg-dark text-white mt-5">
  <img src="img/anbg<%=(type.equals("Admin"))?"2":"1" %>.jpg" class="card-img" alt="...">
  <div class="card-img-overlay">
  <div class="row">
  <div class="col-md-7" >
   
    <h2 class="card-title mb-5">From<br><br><%=name+" " %><span ><sup class="badge bg-dark"><%= type%></sup></span></h2>
    
    <div class="container text-center">
    <h1 class="card-text mb-5 text-decoration-underline"><%=a.getTitle() %></h1>
    <h4 class="card-text"><%=a.getContent() %></h4>
    </div>
   </div> 
   </div>
  </div>
</div>

<%} %>

</div>

</body>
</html>