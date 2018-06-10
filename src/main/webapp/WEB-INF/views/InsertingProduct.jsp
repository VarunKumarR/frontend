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

<title>ProductInsertion</title>	
</head>
<body>
<%-- <%@include file="AdminHome.jsp"%> --%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<h3 align="center">Product Page</h3>
<form:form modelAttribute="product" action="InsertProduct" method="post" enctype="multipart/form-data">

<div class="container">

    <div class="form-group">
      <label class="control-label col-sm-2" for="text">CategoryId:</label>
      <div class="col-sm-10">
        <form:select class="form-control" path="categoryId">
             <form:option  value="0" lable="---select---"></form:option>
             <form:options items="${catlist }" lable="---select---"></form:options>
        </form:select>
      </div>
    </div><br>
     
    <div class="form-group"> 
      <label class="control-label col-sm-2" for="text">SupplierId:</label>
         <div class="col-sm-10">
           <form:input class="form-control" path="supplierId"/>
           
         </div>
    </div><br>
       
    <div class="form-group">
       <label class="control-label col-sm-2" for="text">Product Name:</label> 
          <div class="col-sm-10">
            <form:input class="form-control" path="productName"/>
          </div>
    </div><br>
       
    <div class="form-group"> 
       <label class="control-label col-sm-2" for="text">Price:</label> 
          <div class="col-sm-10">
             <form:input class="form-control" path="price"/>
           </div>
    </div><br>
         
      <div class="form-group"> 
         <label class="control-label col-sm-2" for="text">Stock:</label> 
            <div class="col-sm-10"> 
              <form:input class="form-control" path="stock"/>
            </div>
      </div><br>
          
       <div class="form-group"> 
         <label class="control-label col-sm-2" for="text">Product Description:</label> 
            <div class="col-sm-10"> 
               <form:input class="form-control" path="prodDesc"/>
            </div>
       </div><br>
       
       <div class="form-group"> 
         <label class="control-label col-sm-2" for="text">Product image</label> 
            <div class="col-sm-10"> 
              <form:input class="form-control" type="file" path="pimage"/>
            </div>
       </div><br>
       
       <div class="form-group"> 
         <div class="col-sm-offset-2 col-sm-10">
           <button type="submit" class="form-control">Submit</button>
         </div>
       </div>

</form:form>

<%-- <%@ include file="Footer.jsp" %> --%>
</body>
</html>