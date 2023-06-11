package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.CustomerService;

@WebServlet("/forget")
public class FogetServlet extends HttpServlet{
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int actno=Integer.parseInt(req.getParameter("accountno"));
		int age=Integer.parseInt(req.getParameter("age"));
		
		CustomerService service=new CustomerService();
		String result=service.forgetPass(actno, age);
		
		if(result.equals("Error")) {
			HttpSession session=req.getSession();
			session.setAttribute("error", "User Not Found....!!");	
			res.sendRedirect("forget_password.jsp");
		}
		else {
			HttpSession session=req.getSession();
			session.setAttribute("password", result);
			res.sendRedirect("forget_password.jsp");
		}
		
	}

}
