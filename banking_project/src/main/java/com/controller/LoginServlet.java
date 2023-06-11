package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.CustomerService;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int actno=Integer.parseInt(req.getParameter("accountno"));
		String pass=req.getParameter("password");
		
		CustomerService service=new CustomerService();
		boolean result=service.login(actno, pass);
		
		if(result==true) {
			Customer cust=service.getCustomerData(actno);
			HttpSession session=req.getSession();
			session.setAttribute("customer", cust);
			res.sendRedirect("home.jsp");
		}
		else {
			HttpSession session = req.getSession();
			session.setAttribute("error", "Invalid Credentials....!!");
			res.sendRedirect("login.jsp");
		}
		
	}

}
