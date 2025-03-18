
<%@page import="com.sterling.dto.Banner"%>
<%@page import="com.sterling.dto.Slider"%>
<%@page import="java.util.List"%>
<%@page import="com.sterling.connection.FactoryProvider"%>
<%@page import="com.sterling.dao.HomePageDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
HomePageDao h = new HomePageDao(FactoryProvider.getFactory());
List<Slider> sl = h.getAllSlides();
List<Banner> b = h.getAllBanner();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Home Page</title>
<%@include file="components/Bootstrap_css_js.jsp" %>
</head>
<body>
<%@include file="components/Header.jsp" %>

<div class="container">
<%@include file="components/Message.jsp" %>

<div class="row mt-5 text-center">
<div class="col-md-2"></div>

	<!-- box 1 -->

	<div class="col-md-2" style="height: 350px;">
	
								<div
								class="card text-center cards shadow p-3 mb-5 bg-body rounded"
								style="width: 18rem;" data-bs-toggle="modal"
								data-bs-target="#addslidemodal">
								<div class="card-body">
									<img style="width: 200px;" src="img/slide.png">
									<h5>Add Slide</h5>
									<p class="card-text"></p>
								</div>
							</div>
	
	
	</div>
	<div class="col-md-2"></div>
	<!-- box 2 -->
	
	<div class="col-md-2"></div>
	<div class="col-md-2" style="height: 350px;">
	
								<div
								class="card text-center cards shadow p-3 mb-5 bg-body rounded"
								style="width: 18rem;" data-bs-toggle="modal"
								data-bs-target="#removeslidermodal">
								<div class="card-body">
									<img style="width: 200px;" src="img/remove.png">
									<h5>Remove Slide</h5>
									<p class="card-text"></p>
								</div>
							</div>
	
	
	</div>
	<div class="col-md-2"></div>
</div>


<div class="row mt-5 text-center">
<div class="col-md-2"></div>
	<!-- box 3 -->

	<div class="col-md-2" style="height: 350px;">
	
								<div
								class="card text-center cards shadow p-3 mb-5 bg-body rounded"
								style="width: 18rem;" data-bs-toggle="modal"
								data-bs-target="#addbannermodal">
								<div class="card-body">
									<img style="width: 200px;" src="img/addbanner.png">
									<h5>Add Banner</h5>
									<p class="card-text"></p>
								</div>
							</div>
	
	
	</div>
	<div class="col-md-2"></div>
	
	<div class="col-md-2"></div>
	
	<!-- box 4 -->
	<div class="col-md-2" style="height: 350px;">
	
								<div
								class="card text-center cards shadow p-3 mb-5 bg-body rounded"
								style="width: 18rem;" data-bs-toggle="modal"
								data-bs-target="#removebannermodal">
								<div class="card-body">
									<img style="width: 200px;" src="img/dbanner.png">
									<h5>Remove Banner</h5>
									<p class="card-text"></p>
								</div>
							</div>
	
	
	</div>
	<div class="col-md-2"></div>
</div>


</div>

<!-- Add Slide Modal -->

	<div class="modal fade" id="addslidemodal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Add Slide</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="AddSlideCtl" method="POST" enctype="multipart/form-data">
						<div class="mb-3">
							<label for="title" class="form-label">Slide Title </label> <input
								type="text" class="form-control" id="title"
								aria-describedby="emailHelp" name="title" required="required">
						</div>
						<div class="mb-3">
							<label for="content" class="form-label">Slide Content</label>
							<textarea class="form-control" id="content" name="content"
								required="required"></textarea>
						</div>

						<div class="form-group">
							<label for="pPic">Upload Photo</label> <input type="file"
								id="pPic" class="form-control" name="sPic" required="required"
								accept="image/png, image/gif, image/jpeg">
						</div>

						<div class="container text-center my-3">

							<button type="reset" class="btn btn-outline-warning">reset</button>
							<button type="submit" class="btn btn-outline-success">Add Slide</button>

						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

<!-- Add Banner Modal -->

	<div class="modal fade" id="addbannermodal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Add Banner</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="AddBannerCtl" method="POST" enctype="multipart/form-data">
						<div class="mb-3">
							<label for="title" class="form-label">Banner Title </label> <input
								type="text" class="form-control" id="title"
								aria-describedby="emailHelp" name="title" required="required">
						</div>
						<div class="mb-3">
							<label for="content" class="form-label">Banner Content</label>
							<textarea class="form-control" id="content" name="content"
								required="required"></textarea>
						</div>

						<div class="form-group">
							<label for="pPic">Upload Photo</label> <input type="file"
								id="pPic" class="form-control" name="bPic" required="required"
								accept="image/png, image/gif, image/jpeg">
						</div>

						<div class="container text-center my-3">

							<button type="reset" class="btn btn-outline-warning">reset</button>
							<button type="submit" class="btn btn-outline-success">Add Banner</button>

						</div>
					</form>
				</div>

			</div>
		</div>
	</div>


	<!-- Modal Slider-->
	<div class="modal fade" id="removeslidermodal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">
						Slides(<%=sl.size()%>)
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<%
						int i = 1;
						for (Slider s : sl) {
					%>



					<div class="accordion accordion-flush" id="accordionFlushExample">
						<div class="accordion-item">
							<h2 class="accordion-header" id="panelsStayOpen-heading<%=i%>">

								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse"
									data-bs-target="#panelsStayOpen-collapse<%=i%>"
									aria-expanded="false"
									aria-controls="panelsStayOpen-collapse<%=i%>">
									<%=s.getSlideHeading()%></button>
							</h2>
							<div id="panelsStayOpen-collapse<%=i%>"
								class="accordion-collapse collapse"
								aria-labelledby="panelsStayOpen-heading<%=i%>">
								<div class="accordion-body">

									<div class="row">
										<div class="col-md-7">

											<p>
											<%=s.getSlideContent() %>
												</p>
										</div>
										<div class="col-md-5">

											<a href="RemoveSlideCtl?id=<%=s.getSlideId()%>"><button
													class="btn btn-outline-danger ms-5">Remove This 
													Slide</button></a>
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
</div>

	<!-- Modal Banner-->
	<div class="modal fade" id="removebannermodal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">
						Slides(<%=b.size()%>)
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<%
						//int i = 1;
						for (Banner s : b) {
					%>



					<div class="accordion accordion-flush" id="accordionFlushExample">
						<div class="accordion-item">
							<h2 class="accordion-header" id="panelsStayOpen-heading<%=i%>">

								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse"
									data-bs-target="#panelsStayOpen-collapse<%=i%>"
									aria-expanded="false"
									aria-controls="panelsStayOpen-collapse<%=i%>">
									<%=s.getTitle()%></button>
							</h2>
							<div id="panelsStayOpen-collapse<%=i%>"
								class="accordion-collapse collapse"
								aria-labelledby="panelsStayOpen-heading<%=i%>">
								<div class="accordion-body">

									<div class="row">
										<div class="col-md-7">

											<p>
											<%=s.getContent() %>
												</p>
										</div>
										<div class="col-md-5">

											<a href="RemoveBannerCtl?id=<%=s.getId()%>"><button
													class="btn btn-outline-danger ms-5">Remove This 
													Banner</button></a>
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
<%i=1; %>

</body>
</html>