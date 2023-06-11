package com.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import com.controller.Customer;


public class CustomerService {
	
	public boolean login(int actno,String pass) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee","root","root");
			PreparedStatement ps=con.prepareStatement("Select pass from account where accntno = ?");
			ps.setInt(1, actno);
			ResultSet result=ps.executeQuery();
			String auth=null;
			while(result.next()) {
				auth = result.getString(1);
			}
			if(pass.equals(auth)) {
				return true;
			}
			else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public Customer getCustomerData(int actNo) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee","root","root");
			PreparedStatement ps=con.prepareStatement("Select * from account where accntno = ?");
			ps.setInt(1, actNo);
			ResultSet result=ps.executeQuery();
			
			String name=null;
			int age=0;
			int bal=0;
			String pass=null;
			
			while(result.next()) {
				name=result.getString(1);
				age=result.getInt(2);
				bal=result.getInt(4);
				pass=result.getString(5);
				
			}
			Customer cust=new Customer();
			cust.setName(name);
			cust.setAge(age);
			cust.setActNo(actNo);
			cust.setBal(bal);
			return cust;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	}
	
	public int transferMoney(int actNo1, int actNo2, int amt) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mySql://localhost:3306/j2ee","root", "root");
			PreparedStatement ps = con.prepareStatement("select balance from account where accntno = ?");
			ps.setInt(1, actNo1);
			ResultSet result = ps.executeQuery();
			int curramt=0;
			while (result.next()) {
				curramt=result.getInt(1);
			}
			boolean chk=false;
			PreparedStatement ps4 = con.prepareStatement("select accntno from account where accntno = ?");
			ps4.setInt(1, actNo2);
			ResultSet result2 = ps4.executeQuery();
			while (result2.next()) {
				chk=true;
			}
			if(curramt>=amt && chk==true) {
				PreparedStatement ps1 = con.prepareStatement("update account set balance=balance-? where accntno = ?");
				ps1.setInt(1, amt);
				ps1.setInt(2, actNo1);
				int rows=ps1.executeUpdate();
				PreparedStatement ps2 = con.prepareStatement("update account set balance=balance+? where accntno = ?");
				ps2.setInt(1, amt);
				ps2.setInt(2, actNo2);
				ps2.executeUpdate();
				if(rows>0) {
					PreparedStatement ps3 = con.prepareStatement("select balance from account where accntno = ?");
					ps3.setInt(1, actNo1);
					ResultSet result1=ps3.executeQuery();
					int updtamt=0;
					while (result1.next()) {
						updtamt=result1.getInt(1);
					}
					return updtamt;
				}
			}
			else if(chk==false){
				return (-1);
			}
			else {
				return 0;
			}
			} 
		catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 0;
	}
	
	public int signUp(String name, int age, int actno, int balance, String pass) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mySql://localhost:3306/j2ee","root", "root");
			boolean chk=true;
			PreparedStatement ps1 = con.prepareStatement("select accntno from account where accntno = ?");
			ps1.setInt(1, actno);
			ResultSet result = ps1.executeQuery();
			while (result.next()) {
				chk=false;
			}
			if(chk==true) {
				PreparedStatement ps = con.prepareStatement("insert into  account values(? , ? , ? , ? , ?)");
				ps.setString(1, name);
				ps.setInt(2, age);
				ps.setInt(3, actno);
				ps.setInt(4, balance);
				ps.setString(5, pass);
				int rows=ps.executeUpdate();
				if(rows>0) {
					return rows;
				}
				else {
					return 0;
				}
			}
			else {
				return -1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public String forgetPass(int actno, int age) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mySql://localhost:3306/j2ee","root", "root");
			boolean chk=false;
			PreparedStatement ps = con.prepareStatement("select pass from account where accntno=? and age=?");
			ps.setInt(1, actno);
			ps.setInt(2, age);
			ResultSet result = ps.executeQuery();
			String npass=null;
			while (result.next()) {
				chk=true;
				npass=result.getString(1);
			}
			if(chk==true) {
				return npass;
				}
			else {
				return "Error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "Error";
		}
	}

}
