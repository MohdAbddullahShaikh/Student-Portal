<%@page import="com.sterling.dto.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.sterling.connection.FactoryProvider"%>
<%@page import="com.sterling.dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

StudentDao sd = new StudentDao(FactoryProvider.getFactory());
List<Post> p = sd.getAllPosts();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student-Feed</title>
<%@ include file="components/Bootstrap_css_js.jsp"%>
</head>
<body>
<%@ include file="components/Header.jsp"%>
<%@ include file="components/Background.jsp"%>

<div class="container mb-5">
<%for(int i=p.size(),j=1;i>0;i--,j++){
	if(j==10){break;}
	Post p1 = p.get(i-1);
	Student s = p1.getPoster();
	if(s!=null){
    String name = s.getName();
	}
	%>
<div class="card my-5">
  <div class="card-body" style="height: 150px;">
    <h5 class="card-title" ><%=p1.getPostTitle() %></h5>
    <p class="card-text"><%=p1.getPostContent() %></p>
   
  </div>
  <img src="PostImages/<%=p1.getPhotoName()	 %>" class="card-img-bottom" alt="...">
</div>
<%} %>
</div>

</body>
</html>