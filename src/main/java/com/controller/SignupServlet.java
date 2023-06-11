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


@WebServlet("/welcome")
public class SignupServlet extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String name=req.getParameter("name");
		int age=Integer.parseInt(req.getParameter("age"));
		int actno=Integer.parseInt(req.getParameter("accountno"));
		int bal=Integer.parseInt(req.getParameter("balance"));
		String pass=req.getParameter("password");
		
		CustomerService service=new CustomerService();
		int result=service.signUp(name, age, actno, bal, pass);
		if(result>0) {
			Signup sign=new Signup();
			HttpSession session=req.getSession();
			session.setAttribute("signup", sign);
			CustomerService service1=new CustomerService();
			boolean result1=service.login(actno, pass);
			
			if(result1==true) {
				Customer cust=service1.getCustomerData(actno);
				HttpSession session1=req.getSession();
				session1.setAttribute("error", "Your Account Created Successfully and Loged In....!!");
				session1.setAttribute("customer", cust);			
				res.sendRedirect("home.jsp");
			}
		}
		else if(result==-1) {
			HttpSession session = req.getSession();
			session.setAttribute("error", "User already Exists....!!");
			res.sendRedirect("signup.jsp");
		}	
   }
}
