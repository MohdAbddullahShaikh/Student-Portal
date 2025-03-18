<%@page import="com.sterling.dto.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%
	Student student = (Student) session.getAttribute("current-user");
	String home = null;
	if (student == null) {
		home = "index.jsp";
	} else {
		switch (student.getType()) {

		case "Admin":
			home = "Admin.jsp";
			break;

		case "TL":
			home = "TeamLead.jsp";
			break;

		case "Student":
			home = "Student.jsp";
			break;
		}
	}
%>

<!-- Header strat -->
<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
	<div class="container-fluid">
		<nav class="navbar navbar-dark custom-bg">
			<div class="container-fluid">
				<a class="navbar-brand fs-2 text" href="<%=home%>"> <img
					src="img/slogo.png" alt="" width="150px"
					class="d-inline-block align-text-top">
				</a>
			</div>
		</nav>

		<div class="container">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav  me-auto mb-2 mb-lg-0 fs-4 text">
					<li class="nav-item me-3"><a class="nav-link active"
						aria-current="page" href="<%=home%>">Home</a></li>
					<li class="nav-item me-3"><a class="nav-link active"
						aria-current="page" href="Announcement.jsp">Announcements</a></li>
					<li class="nav-item me-3"><a class="nav-link active"
						aria-current="page" href="Feed.jsp">Feed</a></li>


				</ul>
				<%
					if (student == null) {
				%>
				<ul class="navbar-nav fs-4 text mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="Register.jsp">Register</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="Login.jsp">Login</a>
					</li>
				</ul>
				<%
					} else if (student.getType().equals("Admin")) {
				%>
				<ul class="navbar-nav fs-4 text mb-2 mb-lg-0">
					<li class="nav-item" data-bs-toggle="modal"
						data-bs-target="#profile"><a class="nav-link active me-3"
						href="#"><%=student.getName()%></a></li>
					<li class="nav-item"><a class="nav-link" href="LogoutCtl">Logout</a>
					</li>
				</ul>
				<%
					} else if (student.getType().equals("TL")) {
				%>
				<ul class="navbar-nav fs-4 text mb-2 mb-lg-0">
					<li class="nav-item" data-bs-toggle="modal"
						data-bs-target="#profile"><a class="nav-link active me-3"
						href="#"><%=student.getName()%></a></li>
					<li class="nav-item"><a class="nav-link" href="LogoutCtl">Logout</a>
					</li>
				</ul>

				<%
					} else if (student.getType().equals("Student")) {
				%>
				<ul class="navbar-nav fs-4 text mb-2 mb-lg-0">
					<li class="nav-item" data-bs-toggle="modal"
						data-bs-target="#profile"><a class="nav-link active me-3"
						href="#"><%=student.getName()%></a></li>
					<li class="nav-item"><a class="nav-link" href="LogoutCtl">Logout</a>
					</li>
				</ul>

				<%
					}
				%>
			</div>
		</div>
	</div>
</nav>

<!-- Header end -->
<%
	if (session.getAttribute("current-user") != null) {
%>
<!-- Edit Profile Modal Start -->

<div class="modal fade" id="profile" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">Profile</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<ul class="list-group">
				<li class="list-group-item">
						<div class="row">
							<div class="col-md-2">ROLL NO</div>
							<div class="col-md-1">:</div>
							<div class="col-md-9">RU202024<%=student.getId()%>
							</div>

						</div>
					</li>
					<li class="list-group-item">
						<div class="row">
							<div class="col-md-2">Name</div>
							<div class="col-md-1">:</div>
							<div class="col-md-9"><%=student.getName()%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
									class="badge bg-danger"><%=student.getType()%></span>
							</div>

						</div>
					</li>
					<li class="list-group-item">
						<div class="row">
							<div class="col-md-2">Email</div>
							<div class="col-md-1">:</div>
							<div class="col-md-9"><%=student.getEmail()%>
							</div>

						</div>
					</li>
					<li class="list-group-item">
						<div class="row">
							<div class="col-md-2">Mobile Number</div>
							<div class="col-md-1">:</div>
							<div class="col-md-9"><%=student.getMobileNumber()%>
							</div>

						</div>
					</li>
					<li class="list-group-item">
						<div class="row">
							<div class="col-md-2">Address</div>
							<div class="col-md-1">:</div>
							<div class="col-md-9"><%=student.getAddress()%>
							</div>

						</div>
					</li>

				</ul>
				<div class="container text-center my-2">
					<a href="EditProfile.jsp"><button
							class="btn btn-outline-primary">Edit Profile</button></a>
				</div>

			</div>

		</div>
	</div>
</div>

<!-- Edit Name modal-->


<%
	}
%>