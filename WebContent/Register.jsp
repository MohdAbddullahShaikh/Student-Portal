<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<%@ include file="components/Bootstrap_css_js.jsp" %>
</head>
<body>
<%@ include file="components/Header.jsp" %>


<div class="container-sm">
		<div class="row mt-3">
		<div class="col-md-3"></div>
		<div class="col-md-6 shadow p-3 mb-5 bg-body rounded">
			<%@ include file="components/Message.jsp" %>
            <div class="container text-center p-3">
            <!-- Regisetr Form  Start-->
            
            <img style="width: 150px" src="img/register.png">
            </div>
  <form action="RegisterCtl" method="post">
  <div class="mb-3">
    <label for="name" class="form-label">Full Name</label>
    <input type="text" class="form-control" id="name" aria-describedby="emailHelp" name="name" required="required">
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email" required="required">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="pwd" required="required">
  </div>
  <div class="mb-3">
    <label for="phone" class="form-label">Mobile Number</label>
    <input type="number" class="form-control" id="phone" aria-describedby="emailHelp" name="mob" required="required">
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Address</label>
    <textarea style="height: 130px;" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="address" required="required"></textarea>
  </div>

  
      <div class="container text-center">
      <a href="Login.jsp" style="text-decoration: none;color:gray;">Click here. if already registered</a><br>
        <button type="reset" class="btn btn-outline-warning mt-3" data-bs-dismiss="modal">Reset</button>
        <button type="submit" class="btn btn-outline-danger mt-3">Register</button>
        
      </div>           
</form>
            <!-- Regisetr Form  End-->
            
            
            </div>
      </div>
      </div>
      <div class="col-md-3"></div>
</body>
</html>