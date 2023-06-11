<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<meta charset="UTF-8">
<title>SignUp</title>
</head>
<body style="background-color:SlateBlue;">
<%@ include file="navbar.jsp" %>


<div class="text-center">
<h1 style="color: lime">Create Account</h1>
</div>
<div class="container mt-4">     
<div class="row">       
<div class="col-sm-6 offset-md-3">         
<div class="card">         
<div class="card-body">

<%
		String errorMsg = (String) session.getAttribute("error");
		if(errorMsg!=null){
	%>
	<div class="alert alert-danger alert-dismissible fade show" role="alert">
	<p style = "color:red;"><%= errorMsg %></p>
	
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<%}session.removeAttribute("error"); %>

<%-- <%
String errorMessage = (String) session.getAttribute("error");
if (errorMessage != null){session.invalidate();
%>
<p style="color:red;"><%= errorMessage %></p>
<%} %> --%>
<form action="welcome" method="post">
<div class="mb-3">
    <label for="name" class="form-label">Name : </label>
    <input type="text" class="form-control" id="name" name="name" aria-describedby="acc">
  </div>
  <div class="mb-3">
    <label for="age" class="form-label">Age : </label>
    <input type="number" class="form-control" id="age" name="age" aria-describedby="acc">
  </div>
  <div class="mb-3">
    <label for="account" class="form-label">Phone No. : </label>
    <input type="number" class="form-control" id="account" name="accountno" aria-describedby="acc">
  </div>
  <div class="mb-3">
    <label for="bal" class="form-label">Balance : </label>
    <input type="number" class="form-control" id="bal" name="balance" aria-describedby="acc">
  </div>
  <div class="mb-3">
    <label for="pass" class="form-label">Password : </label>
    <input type="password" class="form-control" id="pass" name="password">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
</div>
</div>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>