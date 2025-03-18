<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

String message = (String)session.getAttribute("message");
String color = (String)session.getAttribute("color");

if(message!=null){


%>

    <div class="alert alert-<%=color %> alert-dismissible fade show" role="alert">
  	<%=message %>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>

<%}
session.removeAttribute("message");
session.removeAttribute("color");
%>