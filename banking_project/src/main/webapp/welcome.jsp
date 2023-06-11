<%@page import="com.controller.Signup"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>

<%@ include file="navbar.jsp" %>

<% Signup trans = (Signup) session.getAttribute("signup"); %>

<div class="container mt-4">     
<div class="row">       
<div class="col-sm-6 offset-md-3">         
<div class="card">         
<div class="card-body">

<h2>Welcome! Your Account Created Successfully!!</h2>

<a role="button" href="login.jsp" class="btn btn-primary" >Click Here To Login</a>

</div>
</div>
</div>
</div>
</div>

</body>
</html>