package com.policy.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.policy.dao.PolicyMapDao;
import com.policy.data.Policy;
import com.policy.service.PolicyService;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * Use this to differentiate multiple submit buttons in a single form
		 * 
		 * Updated by Domenic Garreffa on Aug 16, 2018
		 */
		String action = request.getParameter("action");
		
		System.out.println(action);
		if(action != null) {
			switch(action) {
			case "viewPolicyBackButton": 
				request.getSession().removeAttribute("policy");
				response.sendRedirect("view/admin.jsp");
				break;
			case "viewPolicy":
				ArrayList<Policy> policies = (ArrayList<Policy>)request.getSession().getAttribute("policies");
				System.out.println("WTF" + request.getParameter("policy") + " po: " + policies.size() );
				request.getSession().setAttribute("policy", policies.get(Integer.parseInt(request.getParameter("policy"))));
				response.sendRedirect("view/customerViewPolicy.jsp");
				break;
			case "viewDeletePolicySelectPolicy":
				String nameAndID = request.getParameter("selectPolicy");
				
				
				//System.out.println(ID);
				//HttpSession ses = request.getSession();
				
				//Policy policy = new PolicyService().getPolicyById(ID);
				//ses.setAttribute("policy", policy );
				
			}
			return;
		}
		
		// TODO Auto-generated method stub
		HttpSession hses = request.getSession(true);
		
		response.setContentType("text/html");

		String agentid = (String) hses.getAttribute("agentid");
		String custid = (String) hses.getAttribute("cust");
		String policyid = (String) hses.getAttribute("policy");
		
		PolicyMapDao obj = new PolicyMapDao(agentid, custid, policyid);
		
		response.sendRedirect("view/customerViewPolicy.jsp");
	}
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		   	HttpSession ses = request.getSession();
		   	
		   	String polName = request.getParameter("policy_name");
		   	ses.setAttribute("policy_name", polName);
	   		 
			int numNominees = Integer.parseInt(request.getParameter("nominee"));
		   	ses.setAttribute("nominee", numNominees);
		   	
			double numTenure = Double.parseDouble(request.getParameter("year"));
		   	ses.setAttribute("year", numTenure);
		   	
		   	double minSum = Double.parseDouble(request.getParameter("min"));
		   	ses.setAttribute("min", minSum);
		   	
		   	double maxSum = Double.parseDouble(request.getParameter("max"));
		   	ses.setAttribute("max", maxSum);
		   	
		   	String preReq = request.getParameter("pre-req");
		   	ses.setAttribute("pre-req", preReq);
		   	
		   	String PolicyType = request.getParameter("policyType");
		   	ses.setAttribute("policyType", PolicyType);
		   	
		   	Policy obj = new Policy();
		   	
		   	obj.setPolicyName(polName);
		   	obj.setNumberNominees(numNominees);
		   	obj.setTenure(numTenure);
		   	obj.setMinSum(minSum);
		   	obj.setMaxSum(maxSum);
		   	obj.setPreReqs(preReq);
		   	obj.setPolicyType(PolicyType);
		   	
		   	ses.setAttribute("policy", obj);

		   	
		   	PolicyService obj1 = new PolicyService();
		   	obj1.addPolicy(obj);
		   	
		   	
		   	response.sendRedirect("view/ViewPolicy.jsp");
	 
	}
}
