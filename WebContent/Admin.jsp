<%@page import="java.util.ArrayList"%>
<%@page import="com.sterling.dto.StudentResources"%>
<%@page import="com.sterling.connection.FactoryProvider"%>
<%@page import="com.sterling.dao.StudentDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home - Admin</title>
<%@ include file="components/Bootstrap_css_js.jsp"%>
</head>

<%
	StudentDao sd = new StudentDao(FactoryProvider.getFactory());

	List<Student> tl = sd.getAllTeamLeads();
	List<Student> students = sd.getAllStudents();
	List<Student> users = new ArrayList();
	users.addAll(tl);
	users.addAll(students);
	List<StudentResources> resources = sd.getAllResources();
	
	
%>

<body>
	<%@ include file="components/Header.jsp"%>
	<%@ include file="components/Background.jsp"%>
	<!-- Page start -->

	<div class="container-fluid">


		<div class="row mt-2">
			<div class="col-md-1"></div>

			<div class="col-md-10">
				<%@include file="components/Message.jsp"%>
				<!-- CENTER START -->
				<div class="container-fluid">

					<div class="row mt-5">

						<!-- Box 1 -->
						<div class="col-md-3">
							<div
								class="card text-center cards shadow p-3 mb-5 bg-body rounded"
								style="width: 18rem;" data-bs-toggle="modal"
								data-bs-target="#teamleadmodal">
								<div class="card-body">
									<img style="width: 200px;" src="img/tl.png">
									<h5>Team Leads</h5>
									<p class="card-text">
										<%=tl.size()%>
									</p>
								</div>
							</div>
						</div>

						<!-- Box 2 -->
						<div class="col-md-3">
							<div
								class="card text-center cards shadow p-3 mb-5 bg-body rounded"
								style="width: 18rem;" data-bs-toggle="modal"
								data-bs-target="#studentmodal">
								<div class="card-body">
									<img style="width: 200px;" src="img/students.png">
									<h5>Total Students</h5>
									<p class="card-text">
										<%=students.size()%>
									</p>
								</div>
							</div>
						</div>

						<!-- Box 3 -->
						<div class="col-md-3">
							<div
								class="card text-center cards shadow p-3 mb-5 bg-body rounded"
								style="width: 18rem;" data-bs-toggle="modal"
								data-bs-target="#addresourcemodal">
								<div class="card-body">
									<img style="width: 200px;" src="img/book.png">
									<h5>Add Student Resources</h5>
									<p class="card-text"><%=resources.size()%></p>
								</div>
							</div>
						</div>


						<!-- Box 4 -->
						
						<div class="col-md-3">
							<div
								class="card text-center cards shadow p-3 mb-5 bg-body rounded"
								style="width: 18rem;" data-bs-toggle="modal"
								data-bs-target="#makeadminmodal">
								<div class="card-body">
									<img style="width: 200px;" src="img/admin.png">
									<h5>Make Admin</h5>
									<p class="card-text"><%=users.size()%></p>
								</div>
							</div>
						</div>

					</div>

					<!-- 2nd row -->

					<div class="row mt-5">

						<!-- Box 1 -->
						<div class="col-md-3">
							<div
								class="card text-center cards shadow p-3 mb-5 bg-body rounded"
								style="width: 18rem;" data-bs-toggle="modal"
								data-bs-target="#addannouncementmodal">
								<div class="card-body">
									<img style="width: 200px;" src="img/anno.png">
									<h5>Add Announcement</h5>
									<p class="card-text"></p>
								</div>
							</div>
						</div>

						<!-- Box 2 -->
						<div class="col-md-3">
							<div
								class="card text-center cards shadow p-3 mb-5 bg-body rounded"
								style="width: 18rem;" data-bs-toggle="modal"
								data-bs-target="#addpostmodal">
								<div class="card-body">
									<img style="width: 200px;" src="img/post.png">
									<h5>Add Post</h5>
									<p class="card-text"></p>
								</div>
							</div>
						</div>

						<!-- Box 3 -->
						<div class="col-md-3">
							<div
								class="card text-center cards shadow p-3 mb-5 bg-body rounded"
								style="width: 18rem;" data-bs-toggle="modal"
								data-bs-target="#addcoursemodal">
								<div class="card-body">
									<img style="width: 200px;" src="img/course.png">
									<h5>Add Course</h5>
									<p class="card-text"></p>
								</div>
							</div>
						</div>


<!-- 3rd row -->
<!-- Box 1 -->
						<div class="col-md-3">
							<div
								class="card text-center cards shadow p-3 mb-5 bg-body rounded"
								style="width: 18rem;" data-bs-toggle="modal"
								data-bs-target="#addresultmodal">
								<div class="card-body">
									<img style="width: 200px;" src="img/resultanno.png">
									<h5>Add Student Result</h5>
									<p class="card-text"><%=resources.size()%></p>
								</div>
							</div>
						</div>


<!-- try  -->

<div class="col-md-3">
							<div
								class="card text-center cards shadow p-3 mb-5 bg-body rounded"
								style="width: 18rem;">
								<div class="card-body"><a href="EditHomePage.jsp" style="text-decoration: none;color: black;">
									<img style="width: 200px;" src="img/home.png">
									<h5>Edit Home Page</h5>
									<p class="card-text"></p>
								</a></div>
							</div>
						</div>

<!-- try  -->



					</div>


				</div>

				<!-- CENTER END -->

			</div>
		</div>
	</div>
	<!-- Page End -->

	<!-- Modals Start -->


	<!-- Modal Team Lead-->
	<div class="modal fade" id="teamleadmodal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">
						Team Leads(<%=tl.size()%>)
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<%
						int i = 1;
						for (Student s : tl) {
					%>



					<div class="accordion accordion-flush" id="accordionFlushExample">
						<div class="accordion-item">
							<h2 class="accordion-header" id="panelsStayOpen-heading<%=i%>">

								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse"
									data-bs-target="#panelsStayOpen-collapse<%=i%>"
									aria-expanded="false"
									aria-controls="panelsStayOpen-collapse<%=i%>">
									<%=s.getName()%></button>
							</h2>
							<div id="panelsStayOpen-collapse<%=i%>"
								class="accordion-collapse collapse"
								aria-labelledby="panelsStayOpen-heading<%=i%>">
								<div class="accordion-body">

									<div class="row">
										<div class="col-md-7">

											<p>
												<strong>Email :</strong>
												<%=s.getEmail()%><br> <strong>Mobile :</strong><%=s.getMobileNumber()%><br>
												<strong>Address :</strong><%=s.getAddress()%></p>
										</div>
										<div class="col-md-5">

											<a href="ManageCtl?id=<%=s.getId()%>&demoteTo=Student"><button
													class="btn btn-outline-danger ms-5">Demote To
													Developer</button></a>
										</div>
									</div>

								</div>
							</div>
						</div>


					</div>
					<%
						i++;
						}
					%>
				</div>

			</div>
		</div>
		<div class="col-md-2 "></div>
	</div>

	<!-- STUDENTS MODAL -->

	<div class="modal fade" id="studentmodal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">
						Students(<%=students.size()%>)
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<%
						int j = 1;
						for (Student s : students) {
					%>



					<div class="accordion accordion-flush" id="accordionFlushExample">
						<div class="accordion-item">
							<h2 class="accordion-header" id="panelsStayOpen-heading<%=j%>">

								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse"
									data-bs-target="#panelsStayOpen-collapse<%=j%>"
									aria-expanded="false"
									aria-controls="panelsStayOpen-collapse<%=j%>">
									<%=s.getName()%></button>
							</h2>
							<div id="panelsStayOpen-collapse<%=j%>"
								class="accordion-collapse collapse"
								aria-labelledby="panelsStayOpen-heading<%=j%>">
								<div class="accordion-body">

									<div class="row">
										<div class="col-md-7">

											<p>
												<strong>Email :</strong>
												<%=s.getEmail()%><br> <strong>Mobile :</strong><%=s.getMobileNumber()%><br>
												<strong>Address :</strong><%=s.getAddress()%></p>
										</div>
										<div class="col-md-5">

											<a href="ManageCtl?id=<%=s.getId()%>&demoteTo=TL"><button
													class="btn btn-outline-success ms-5">Promote To
													TeamLead</button></a>
										</div>
									</div>

								</div>
							</div>
						</div>


					</div>
					<%
						j++;
						}
					%>
				</div>

			</div>
		</div>
	</div>

	<!-- Add Post Modal -->

	<div class="modal fade" id="addpostmodal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Add Post</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="PostCtl" method="POST" enctype="multipart/form-data">
						<div class="mb-3">
							<label for="title" class="form-label">Title </label> <input
								type="text" class="form-control" id="title"
								aria-describedby="emailHelp" name="title" required="required">
						</div>
						<div class="mb-3">
							<label for="content" class="form-label">Post Content</label>
							<textarea class="form-control" id="content" name="content"
								required="required"></textarea>
						</div>

						<div class="form-group">
							<label for="pPic">Upload Photo</label> <input type="file"
								id="pPic" class="form-control" name="pPic" required="required"
								accept="image/png, image/gif, image/jpeg">
						</div>

						<div class="container text-center my-3">

							<button type="reset" class="btn btn-outline-warning">reset</button>
							<button type="submit" class="btn btn-outline-success">Post</button>

						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<!-- Add Announcement Modal -->

	<div class="modal fade" id="addannouncementmodal"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Add
						Announcement</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="AnnouncementCtl">
						<div class="mb-3">
							<label for="title" class="form-label">Title </label> <input
								type="text" class="form-control" id="title"
								aria-describedby="emailHelp" name="title" required="required">
						</div>
						<div class="mb-3">
							<label for="content" class="form-label">Announcement</label>
							<textarea class="form-control" style="height: 200px;"
								id="content" name="content" required="required"></textarea>
						</div>



						<div class="container text-center my-3">

							<button type="reset" class="btn btn-outline-warning">reset</button>
							<button type="submit" class="btn btn-outline-success">Post</button>

						</div>
					</form>
				</div>

			</div>
		</div>
	</div>


	<!-- Add Course Modal -->

	<div class="modal fade" id="addcoursemodal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Add Course</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="CourseCtl">

						<input type="hidden" name="operation" value="addcourse">

						<div class="mb-3">
							<label for="title" class="form-label">Course Title</label> <input
								type="text" class="form-control" id="title"
								aria-describedby="emailHelp" name="cName" required="required">
						</div>
						<div class="mb-3">
							<label for="content" class="form-label">Course Details</label>
							<textarea class="form-control" style="height: 200px;"
								id="content" name="cDetails" required="required"></textarea>
						</div>
						<div class="mb-3">
							<label for="title" class="form-label">Course Price</label> <input
								type="number" class="form-control" id="title"
								aria-describedby="emailHelp" name="cPrice" required="required">
						</div>



						<div class="container text-center my-3">

							<button type="reset" class="btn btn-outline-warning">Reset</button>
							<button type="submit" class="btn btn-outline-success">Add
								Course</button>

						</div>
					</form>
				</div>

			</div>
		</div>
	</div>


	<!-- Add Resources Modal -->

	<div class="modal fade" id="addresourcemodal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Add Resource</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="StudentResourcesCtl" method="POST"
						enctype="multipart/form-data">
						<div class="mb-3">
							<label for="title" class="form-label">Title</label> <input
								type="text" class="form-control" id="title"
								aria-describedby="emailHelp" name="rTitle" required="required">
						</div>
						<div class="mb-3">
							<label for="content" class="form-label">Post Description</label>
							<textarea class="form-control" id="content" name="rContent" required="required"></textarea>
						</div>

						<div class="form-group">
							<label for="pPic">Upload File</label> <input type="file"
								id="pPic" class="form-control" name="rFile" required="required"
								accept="application/pdf,application/vnd.ms-excel">
						</div>

						<div class="container text-center my-3">

							<button type="reset" class="btn btn-outline-warning">reset</button>
							<button type="submit" class="btn btn-outline-success">Add
								to library</button>

						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	
	
	<!-- Add Result -->
	
	<div class="modal fade" id="addresultmodal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Add Result</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="StudentResultCtl" method="POST"
						enctype="multipart/form-data">
						<div class="mb-3">
							<label for="title" class="form-label">Enter Roll No</label> <input
								type="text" class="form-control" id="title"
								aria-describedby="emailHelp" name="rTitle" required="required">
						</div>
						<div class="mb-3">
							<label for="content" class="form-label">Post Description</label>
							<textarea class="form-control" id="content" name="rContent" required="required"></textarea>
						</div>

						<div class="form-group">
							<label for="pPic">Upload File</label> <input type="file"
								id="pPic" class="form-control" name="rFile" required="required"
								accept="application/pdf,application/vnd.ms-excel">
						</div>

						<div class="container text-center my-3">

							<button type="reset" class="btn btn-outline-warning">reset</button>
							<button type="submit" class="btn btn-outline-success">Add
								to library</button>

						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	
	
	

	<!-- Modals End -->
	
		<!-- STUDENTS MODAL -->

	<div class="modal fade" id="makeadminmodal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">
						Students(<%=students.size()%>)
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<%
						
						for (Student s : users) {
					%>



					<div class="accordion accordion-flush" id="accordionFlushExample">
						<div class="accordion-item">
							<h2 class="accordion-header" id="panelsStayOpen-heading<%=j%>">

								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse"
									data-bs-target="#panelsStayOpen-collapse<%=j%>"
									aria-expanded="false"
									aria-controls="panelsStayOpen-collapse<%=j%>">
									<%=s.getName()%></button>
							</h2>
							<div id="panelsStayOpen-collapse<%=j%>"
								class="accordion-collapse collapse"
								aria-labelledby="panelsStayOpen-heading<%=j%>">
								<div class="accordion-body">

									<div class="row">
										<div class="col-md-7">

											<p>
												<strong>Email :</strong>
												<%=s.getEmail()%><br> <strong>Mobile :</strong><%=s.getMobileNumber()%><br>
												<strong>Address :</strong><%=s.getAddress()%></p>
										</div>
										<div class="col-md-5">

											<a href="ManageCtl?id=<%=s.getId()%>&demoteTo=Admin"><button
													class="btn btn-outline-success ms-5">Make 
													Admin</button></a>
										</div>
									</div>

								</div>
							</div>
						</div>


					</div>
					<%
						j++;
						}
					%>
				</div>

			</div>
		</div>
	</div>
	


</body>
</html>