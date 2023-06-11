<%@ page import="com.controller.Customer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Navbar</title>
 </head>
<body>
<header>
  <nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="index.html">Bank</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#feature">Feature</a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled">Disabled</a>
          </li>
        </ul>
        
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
        <%
        Customer customer = (Customer)session.getAttribute("customer");
		if(customer!=null){
			
		%>
   
		<a class="btn btn-primary" href="logout" role="button">Logout</a>
        <%}
		else{%>
		<a class="btn btn-primary mr-2"  href="login.jsp" role="button">Login</a>
          <a class="btn btn-outline-primary" href="signup.jsp" role="button">SignUp</a>
	
			<%}session.removeAttribute("error"); %>
        </div>
      </div>
    </div>
  </nav>
</header>
</body>
</html>