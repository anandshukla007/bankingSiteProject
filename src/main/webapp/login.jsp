<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<meta charset="UTF-8">
</head>
<body style="background-color:powderblue;">
<%@ include file="navbar.jsp" %>
<div class="text-center">
<h1 style="color: lime">Login</h1>
</div>

<div class="container mt-4">     
<div class="row">       
<div class="col-sm-6 offset-md-3">         
<div class="card">         
<div class="card-body">
<%
String errorMessage = (String) session.getAttribute("error");
if (errorMessage != null){session.invalidate();
%>
<p style="color:red;"><%= errorMessage %></p>
<%} %>

<form action="login" method="post">
  <div class="mb-3">
    <label for="account" class="form-label">Account No. : </label>
    <input type="number" class="form-control" id="account" aria-describedby="acc" name="accountno">
  </div>
  <div class="mb-3">
    <label for="password" class="form-label">Password : </label>
    <input type="password" class="form-control" id="password" name="password">
  </div>
  <button type="submit" class="btn btn-primary">Login</button>
  <a role="button" href="forget_password.jsp" class="btn btn-outline-primary" >Forget Password?</a>
</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>