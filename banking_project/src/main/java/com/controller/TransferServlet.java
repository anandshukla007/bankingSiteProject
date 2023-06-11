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

@WebServlet("/transfer")
public class TransferServlet extends HttpServlet{
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int actno1=Integer.parseInt(req.getParameter("sactno"));
		int actno2=Integer.parseInt(req.getParameter("ractno"));
		int amt=Integer.parseInt(req.getParameter("bal"));
		
		CustomerService service=new CustomerService();
		int result=service.transferMoney(actno1, actno2, amt);
		
		if(result>0) {
			Transferred trans=new Transferred(result);
			HttpSession session=req.getSession();
			session.setAttribute("transfer", trans);
			res.sendRedirect("transfered.jsp");
		}
		else if(result==(-1)) {
			HttpSession session = req.getSession();
			session.setAttribute("error", "Receiver Not Found....!!");
			res.sendRedirect("transfer_money.jsp");
		}
		else {
			HttpSession session = req.getSession();
			session.setAttribute("error", "Insufficient Balance....!!");
			res.sendRedirect("transfer_money.jsp");
		}
		
	}

}
