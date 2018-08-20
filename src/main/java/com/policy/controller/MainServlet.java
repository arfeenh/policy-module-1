

package com.policy.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.regex.*;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.policy.dao.PolicyDao;
import com.policy.dao.NomineeDao;
import com.policy.dao.PolicyMapDao;
import com.policy.data.Nominee;
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
				System.out.println(nameAndID);
				
			case "updatePolicy":
				Policy policy = new Policy();
				PolicyDao polDao = new PolicyDao();
				
				String str =request.getParameter("selectPolicy");
				final Pattern pattern = Pattern.compile("^.*\\((.*)\\).*$");
		        final Matcher matcher = pattern.matcher(str);
		        String answer1 = "";
				System.out.println(str);
				
				if (matcher.matches())
		            answer1 = matcher.group(1);
				
				
		        System.out.println(answer1);	
		        int extracted_policy_id = Integer.parseInt(answer1);
		        
		        try {
		        	policy = polDao.selectAllPolicyByID(extracted_policy_id);
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		        
		        response.sendRedirect("view/UpdatePolicyDisplay.jsp");
		        
		        HttpSession ses = request.getSession();
				
				int policy_Id = extracted_policy_id;
				ses.setAttribute("pol_Id", policy_Id);
				
			   	String polName = policy.getPolicyName();
			   	ses.setAttribute("policyname", polName);
			   	
			   	String PolicyType = policy.getPolicyType();
			   	ses.setAttribute("policyType", PolicyType);
		   		 
				int numNominees = policy.getNumberNominees();
			   	ses.setAttribute("nominee", numNominees);
			   	   	
				double numTenure = policy.getTenure();
			   	ses.setAttribute("year", numTenure);
			   	
			   	
			   	double minSumD = policy.getMinSum();
			   	String minSum = new StringBuilder().append(minSumD).toString();
			   	ses.setAttribute("min", minSum);
			   	
			   	double maxSumD = policy.getMaxSum();
			   	String maxSum = new StringBuilder().append(maxSumD).toString();
			   	ses.setAttribute("max", maxSum);
			   	

			   	String preReq = policy.getPreReqs();
			   	ses.setAttribute("pre-req", preReq);
			   	System.out.println(preReq);
			   	
			   	break;
			   	
			case "updatePolicyInsert": //use to insert updated data
	
		        HttpSession ses1 = request.getSession();
		        
			   	polName = request.getParameter("policy_name");
			   	ses1.setAttribute("policy_name", polName);

				numNominees = Integer.parseInt(request.getParameter("nominee"));
			   	ses1.setAttribute("nominee", numNominees);
			   	
				numTenure = Double.parseDouble(request.getParameter("year"));
			   	ses1.setAttribute("year", numTenure);
		   		 
			   	double minSum1 = Double.parseDouble(request.getParameter("min"));
			   	ses1.setAttribute("min", minSum1);
			   	
			   	double maxSum1 = Double.parseDouble(request.getParameter("max"));
			   	ses1.setAttribute("max", maxSum1);
			   	
			   	preReq = request.getParameter("pre-req");
			   	ses1.setAttribute("pre-req", preReq);
			   	
			   	PolicyType = request.getParameter("policyType");
			   	ses1.setAttribute("policyType", PolicyType);

			   	System.out.println(polName);
			   	
			   	Policy obj = new Policy();
		   	
			   	obj.setPolicyName(polName);
			   	obj.setNumberNominees(numNominees);
			   	obj.setTenure(numTenure);
			   	obj.setMinSum(minSum1);
			   	obj.setMaxSum(maxSum1);
			   	obj.setPreReqs(preReq);
			   	obj.setPolicyType(PolicyType);
			   	
			   	ses1.setAttribute("policy", obj);
			   	
			   	System.out.println(ses1.getAttribute("pol_Id"));
			   	int policyID = (int) ses1.getAttribute("pol_Id");
			   	PolicyDao obj1 = new PolicyDao();
			   	try {
					obj1.update(obj, policyID);
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			   	
			   	
			   	response.sendRedirect("view/ViewPolicy.jsp");
			   	
			}
			return;
		}
		
		HttpSession hses = request.getSession(true);
		
		response.setContentType("text/html");

		String agentid = (String) hses.getAttribute("agentid");
		String custid = (String) hses.getAttribute("cust");
		String policyid = request.getParameter("policyid");
		
		PolicyMapDao obj = new PolicyMapDao(agentid, custid, policyid);
		Policy myPolicy;
		int policyMapId;
		List<Nominee> myNominees;
		
		try {
			myPolicy = obj.getPolicyInfo();
			policyMapId = obj.getPolicyMapIDFromPolicyID();
			myNominees = NomineeDao.getNomineesFromMapID(policyMapId);
			myPolicy.setNumberNominees(myNominees.size());
			myPolicy.setNominees(myNominees);
			
			response.sendRedirect("view/customerViewPolicy.jsp");
			hses.setAttribute("policy", myPolicy);
			
		} catch (ClassNotFoundException | SQLException e1) {
			e1.printStackTrace();
		}
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