/*
 * Servlet implementation class CertServlet.
 * This servlet class handles redirections of displaying certificates.
 * @author					
 * @version      			
 * @Class name				CertServlet
 * @Creation Date			
 * @History
 * @Reviewed by & Status	
 */

package com.policy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.policy.dao.PolicyDao;

@WebServlet("/CertServlet")
public class CertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("op").equals("Generate Certificate")) {
			boolean resultFound = false;
			request.getSession().setAttribute("customerID", request.getParameter("customerID"));
			try {
				resultFound = PolicyDao.searchByCustandPolicy(request);
			}
			catch (Exception e) {}
			
			if (resultFound) {
				//redirect to certificate
				response.getWriter().println(request.getSession().getAttribute("certificateMapID"));
				request.getRequestDispatcher("view/Certificate.jsp").forward(request, response);
			}
			else {
				request.getRequestDispatcher("view/CertMapNotFound.jsp").forward(request, response);
			}
		}
		
		if (request.getParameter("op").equals("Generate Customer Certificate")) {
			boolean resultFound = false;
			try {
				resultFound = PolicyDao.searchByCustandPolicy(request);
			}
			catch (Exception e) {}
			
			if (resultFound) {
				//redirect to certificate
				response.getWriter().println(request.getSession().getAttribute("certificateMapID"));
				request.getRequestDispatcher("view/Certificate.jsp").forward(request, response);
			}
			else {
				request.getRequestDispatcher("view/CertMapNotFound.jsp").forward(request, response);
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
