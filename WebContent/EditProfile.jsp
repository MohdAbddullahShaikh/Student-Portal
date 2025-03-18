<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	Student s = (Student) session.getAttribute("current-user");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<%@ include file="components/Bootstrap_css_js.jsp"%>
</head>
<body>
	<%@ include file="components/Header.jsp"%>

	<!-- Page start -->

	<div class="container-fluid">


		<div class="row mt-2">
			<div class="col-md-2">
				
			</div>

			<div class="col-md-8 mt-5">
				<%@include file="components/Message.jsp"%>
				<!-- CENTER START -->
				<div class="container shadow p-3 mb-5 bg-body rounded">



					<form action="EditProfileCtl" method="post">
						<div class="mb-3">

							<input type="hidden" name="operation" value="editprofile">

							<label for="name" class="form-label">New Name</label> <input
								type="text" class="form-control" id="name"
								aria-describedby="emailHelp" name="name"
								placeholder="<%=s.getName()%>">
						</div>

						<div class="mb-3">
							<label for="phone" class="form-label"> New Mobile Number</label>
							<input type="number" class="form-control" id="phone"
								aria-describedby="emailHelp" name="mob"
								placeholder="<%=s.getMobileNumber()%>">
						</div>

						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">New
								Address</label>
							<textarea style="height: 130px;" type="text" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								name="address" placeholder="<%=s.getAddress()%>"></textarea>
						</div>

						<input type="hidden" name="id" value="<%=s.getId()%>">


						<button type="button" class="btn btn-outline-warning"
							data-bs-toggle="modal" data-bs-target="#changepassword">Change
							Password</button>
						<button type="submit" class="btn btn-outline-success">Save
							Changes</button>
					</form>
				</div>

			</div>
		</div>

	</div>

	<!-- Change Password Modal -->

	<div class="modal fade" id="changepassword" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Add Course</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="EditProfileCtl">

						<input type="hidden" name="operation" value="changepassword">

						<div class="mb-3">
							<label for="title" class="form-label">Old Password</label> <input
								type="password" class="form-control" id="title"
								aria-describedby="emailHelp" name="oldpass">
						</div>
						<div class="mb-3">
							<label for="title" class="form-label">New Password</label> <input
								type="password" class="form-control" id="title"
								aria-describedby="emailHelp" name="newpass">
						</div>

						<div class="mb-3">
							<label for="title" class="form-label">Confirm Password</label> <input
								type="password" class="form-control" id="title"
								aria-describedby="emailHelp" name="conpass">
						</div>
						<input type="hidden" name="id" value="<%=s.getId()%>">


						<div class="container text-center my-3">

							<button type="reset" class="btn btn-outline-warning">Reset</button>
							<button type="submit" class="btn btn-outline-success">Change
								Password</button>

						</div>
					</form>
				</div>

			</div>
		</div>
	</div>


</body>
</html>