<%@page import="com.controller.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Transfer Money</title>
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
String errorMessage = (String) session.getAttribute("error");
if (errorMessage != null){session.invalidate();
%>
<p style="color:red;"><%= errorMessage %></p>
<%} %>

<form action="transfer" method="post">
  <div class="mb-3">
    <label for="account" class="form-label">Sender's Account No. : </label>
    <input type="number" class="form-control" readonly="readonly" id="saccount" name="sactno" aria-describedby="sacc" value="<%=cust.getActNo() %>">
  </div>
  <div class="mb-3">
    <label for="account" class="form-label">Receiver's Account No. : </label>
    <input type="number" class="form-control" id="raccount" name="ractno" aria-describedby="racc">
  </div>
  <div class="mb-3">
    <label for="bal" class="form-label">Amount : </label>
    <input type="number" class="form-control" id="bal" name="bal" aria-describedby="acc">
  </div>
  <button type="submit" class="btn btn-primary">Transfer</button>
</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>