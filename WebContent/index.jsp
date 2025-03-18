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
Slider[] slides = new Slider[3];
List<Banner> b1 = h.getAllBanner();


for(int i=sl.size(),j=0;j<3;j++){
	slides[j]=(Slider)sl.get(sl.size()-j-1);
}

	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sterling - Home</title>
<%@include file="components/Bootstrap_css_js.jsp"%>
</head>
<body>
	<%@include file="components/Header.jsp"%>

	<div id="carouselExampleCaptions" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img style="height: 90vh;" src="IndexPageImages/<%=slides[0].getSlideImageName() %>" class="d-block w-100"
					alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5><%=slides[0].getSlideHeading() %></h5>
					<p><%=slides[0].getSlideContent() %></p>
				</div>
			</div>

			<div class="carousel-item">
				<img style="height: 90vh;" src="IndexPageImages/<%=slides[1].getSlideImageName() %>" class="d-block w-100"
					alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5><%=slides[1].getSlideHeading() %></h5>
					<p><%=slides[1].getSlideContent() %></p>
				</div>
			</div>

			<div class="carousel-item">
				<img style="height: 90vh;" src="IndexPageImages/<%=slides[2].getSlideImageName() %>" class="d-block w-100"
					alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5><%=slides[2].getSlideHeading() %></h5>
					<p><%=slides[2].getSlideContent() %></p>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>


<!-- Banners  -->

	<div class="container-fluid my-5">
	<%int i=2;
	for(Banner b: b1){
		if(i%2==0){
		%>
		<div class="row mt-5">
			<div class="col-md-6">
				
				<img src="IndexPageImages/<%=b.getImgName() %>" style="width: 100%;">
			
			</div>
			
			<div class="col-md-6">
				
				<h1 class="my-3 ms-3" style="font-size: 100px;"><%=b.getTitle() %></h1>
				<p class="my-3 ms-3"><%=b.getContent() %></p>
			</div>		
		</div>
	<%
		}else{
			%>
		<div class="row mt-5">
			<div class="col-md-6">
				
				<h1 class="my-3 ms-3"  style="font-size: 100px;"><%=b.getTitle() %></h1>
				<p class="my-3 ms-3"><%=b.getContent() %></p>
			</div>		
			
			<div class="col-md-6">
				
				<img src="IndexPageImages/<%=b.getImgName() %>" style="width: 100%;">
			
			</div>
			
		</div>	
	<%	}
	i++;
	} 
	i=2;
	%>
	</div>

<!-- Banners  -->

<%@include file="components/Footer.jsp"%>


</body>
</html>