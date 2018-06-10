<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<style type="text/css">
.background
{
   height: 700px;
   background-image: url("http://studinfo.edu.aris.ge/wp-content/uploads/2017/12/book.jpg");
   background-repeat: no-repeat;
   background-size: 100%;
}
</style>
<title>product</title>
</head>
<body>
<%-- <%@include file="Header.jsp"%> --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="background">
<div class="container-fluid">
	   <table class="table table-bordered">

<h4 align="center">Choose the Best book....Your search starts from here!!</h4>

	<thread>
	<div>
<c:forEach items="${listProducts}" var="product">
	
		<td>
			<img src="<c:url value="/resources/images/${product.productId}.jpg"/>" width="100" height="100"/>
			<br/>
			<a href="<c:url value="/productDesc/${product.productId}"/>">${product.productName}</a>
			<br/>INR. ${product.price} /-
		</td>
    </div>
</c:forEach>
<br>
	</thread>
</div>
</table>
</div>
<%-- <%@ include file="Footer.jsp" %> --%>
</body>
</html>