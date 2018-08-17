/*
 * Dummy was added because empty folders can't be pushed. 
 * Please delete once another class is created in this package.
 */


package com.policy.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.policy.data.Customer;
import com.policy.data.Manager;

@WebServlet("/login")
public class Dummy extends HttpServlet {
	
	public static void logout(HttpSession s) {
		s.invalidate();
		System.out.println("HERE LOGOUT");
	}
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String uname = req.getParameter("username");
		String password = req.getParameter("password");
		HttpSession session = req.getSession(true);
		if(uname.equals(password) && uname.equals("admin")) {
			Manager a = new Manager();
			a.setFullname("Amr El-Naggar");
			a.setManagerId(101);
			session.setAttribute("user", a);
			res.sendRedirect("view/admin.jsp");
		}
		else if(uname.equals(password) && uname.equals("customer")) {
			Customer u = new Customer();
			u.setFirstname("Ross");
			u.setLastname("Geller");
			u.setCustomerId(123);
			session.setAttribute("user", u);
			res.sendRedirect("view/customer.jsp");
		}
		else {
			PrintWriter out = res.getWriter();
			out.println("Login error!!");
		}
	}
}
