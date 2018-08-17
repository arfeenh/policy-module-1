package com.policy.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class DummyLogout extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
		HttpSession session = req.getSession(true);
		if(session != null)
			session.invalidate();
		PrintWriter out = res.getWriter();
		out.println("Logged out");
	}
}
