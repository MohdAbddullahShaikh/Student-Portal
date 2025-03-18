<%@page import="com.sterling.dto.StudentResources"%>
<%@page import="java.util.List"%>
<%@page import="com.sterling.connection.FactoryProvider"%>
<%@page import="com.sterling.dao.StudentDao"%>
<%@page import="com.sterling.dto.Course"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	StudentDao sd = new StudentDao(FactoryProvider.getFactory());
	List<Course> c = sd.getAllCourses();
	List<StudentResources> sr = sd.getAllResources();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home - Team Lead</title>
<%@ include file="components/Bootstrap_css_js.jsp"%>
</head>
<body>
	<%@ include file="components/Header.jsp"%>
	<%@ include file="components/Background.jsp"%>

	<div class="container">


		<div class="row mt-2">
			<div class="col-md-2"></div>

			<div class="col-md-10">
				<%@include file="components/Message.jsp"%>
				<!-- CENTER START -->
				<div class="container">

					<div class="row mt-5 align-items-center">

						<!-- Box 1 -->
						<div class="col-md-6">
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
						<div class="col-md-6">
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

						<div class="row mt-5">

							<!-- Box 3 -->
							<div class="col-md-6">
								<div
									class="card text-center cards shadow p-3 mb-5 bg-body rounded"
									style="width: 18rem;" data-bs-toggle="modal"
									data-bs-target="#coursemodal">
									<div class="card-body">
										<img style="width: 200px;" src="img/course.png">
										<h5>See Courses</h5>
										<p class="card-text"></p>
									</div>
								</div>
							</div>

							<!-- Box 4 -->
							<div class="col-md-6">
								<div
									class="card text-center cards shadow p-3 mb-5 bg-body rounded"
									style="width: 18rem;" data-bs-toggle="modal"
									data-bs-target="#downloadresourcesmodal">
									<div class="card-body">
										<img style="width: 200px;" src="img/book.png">
										<h5>Download Resources</h5>
										<p class="card-text"></p>
									</div>
								</div>
							</div>

						</div>

					</div>
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
							<textarea class="form-control" id="content" name="content" required="required"></textarea>
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


	<!-- Course MODAL -->

	<div class="modal fade" id="coursemodal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">
						Courses(<%=c.size()%>)
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<%
						int h = 1;
						for (Course s : c) {
					%>



					<div class="accordion accordion-flush" id="accordionFlushExample">
						<div class="accordion-item">
							<h2 class="accordion-header" id="panelsStayOpen-heading<%=h%>">

								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse"
									data-bs-target="#panelsStayOpen-collapse<%=h%>"
									aria-expanded="false"
									aria-controls="panelsStayOpen-collapse<%=h%>">
									<%=s.getCourseName()%></button>
							</h2>
							<div id="panelsStayOpen-collapse<%=h%>"
								class="accordion-collapse collapse"
								aria-labelledby="panelsStayOpen-heading<%=h%>">
								<div class="accordion-body">

									<div class="row">
										<div class="col-md-7">

											<p>
												<strong>Description :</strong>
												<%=s.getCourseDetails()%><br>

											</p>

										</div>
										<div class="col-md-5">
											<button class="btn btn-outline-primary">
												<strong>Fees :</strong><%=s.getCoursePrice()%></button>
										</div>


									</div>

								</div>
							</div>
						</div>


					</div>
					<%
						h++;
						}
					%>
				</div>

			</div>
		</div>
	</div>

	<!-- Download Resources Modal -->

	<div class="modal fade" id="downloadresourcesmodal"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">
						Download Resources</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<%
					int d= 1;
						for (StudentResources s : sr) {
					%>
		<div class="accordion accordion-flush" id="accordionFlushExample">
						<div class="accordion-item">
							<h2 class="accordion-header" id="panelsStayOpen-heading<%=d%>">

								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse"
									data-bs-target="#panelsStayOpen-collapse<%=d%>"
									aria-expanded="false"
									aria-controls="panelsStayOpen-collapse<%=d%>">
									<%=s.getFileName()%></button>
							</h2>
							<div id="panelsStayOpen-collapse<%=d%>"
								class="accordion-collapse collapse"
								aria-labelledby="panelsStayOpen-heading<%=d%>">
								<div class="accordion-body">

									<div class="row">
										<div class="col-md-7">

											<p>
												<strong>Description :</strong>
												<%=s.getDescription()%><br>

											</p>

										</div>
										<div class="col-md-5">
											<a href="StudentResourcesFiles/<%=s.getFileName()%>" download><button
							class="btn btn-outline-primary">Download File</button></a>
										</div>
					</div></div></div></div></div>

					<%
					d++;
						}
					%>
				</div>

			</div>
		</div>
	</div>


</body>
</html>