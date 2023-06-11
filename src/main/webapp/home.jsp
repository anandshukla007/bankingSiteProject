<%@page import="com.controller.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<meta charset="UTF-8">
<title>User Home Page</title>
</head>
<body>

<%@ include file="navbar.jsp" %>


<% Customer cust = (Customer) session.getAttribute("customer"); %>

<div class="container mt-4">     
<div class="row">       
<div class="col-sm-6 offset-md-3">         
<div class="card">         
<div class="card-body">

<%
        String errorMsg = (String) session.getAttribute("error");
		if(errorMsg!=null){
	%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
	<p style = "color:green;"><%= errorMsg %></p>
	
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<%}session.removeAttribute("error"); %>

<%-- <%
String errorMessage = (String) session.getAttribute("success");
if (errorMessage != null){
%>
<p style="color:green;"><%= errorMessage %></p>
<%} %> --%>

<h2>Customer Name: <%=cust.getName() %></h2>
<h2>Account No.: <%=cust.getActNo() %></h2>
<h2>Balance : <%=cust.getBal() %></h2>

<a role="button" href="transfer_money.jsp" class="btn btn-primary" >Transfer Money</a>

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