<%@page import="com.controller.Transferred"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Updated Account</title>
</head>
<body>

<%@ include file="navbar.jsp" %>

<% Transferred trans = (Transferred) session.getAttribute("transfer"); %>

<div class="container mt-4">     
<div class="row">       
<div class="col-sm-6 offset-md-3">         
<div class="card">         
<div class="card-body">

<h2>Balance Left : <%=trans.getBal() %></h2>

<a role="button" href="transfer_money.jsp" class="btn btn-primary" >Transfer Money Again</a>

</div>
</div>
</div>
</div>
</div>

</body>
</html>