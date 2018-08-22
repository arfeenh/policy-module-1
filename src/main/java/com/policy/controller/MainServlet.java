

package com.policy.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.policy.dao.NomineeDao;
import com.policy.dao.PolicyDao;
import com.policy.dao.PolicyMapDao;
import com.policy.data.Customer;
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
			case "addPolicyToCustomer":
				try {
					boolean result = PolicyMapDao.tagCustomer((Customer)request.getSession().getAttribute("user"),
												(Policy) request.getSession().getAttribute("policy"),
												request.getParameter("premium"),
												request.getParameter("sumAssured"),
												request.getParameterValues("medicalDetails"),
												request.getParameter("agentID"),
												request.getParameter("initDate"),
												request.getParameterValues("nomineeName"),
												request.getParameterValues("relationship"),
												request.getParameterValues("purpose"));
					if(result)
						response.getWriter().println("Successfull");
					else
						response.getWriter().println("Something went wrong");
				} catch (Exception e3) {
					// TODO Auto-generated catch block
					e3.printStackTrace();
				}
				
				break;
			case "buyPolicy":
				try {
					ArrayList<Policy> policiesByType = PolicyDao.getPoliciesWithType(request.getParameter("policyType"));
					request.getSession().setAttribute("policiesByType", policiesByType);
					request.getSession().setAttribute("policyType", request.getParameter("policyType"));
					response.sendRedirect("view/BuyPolicy.jsp");
				} catch (Exception e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
				}
				break;
			case "viewPolicyBackButton": 
				request.getSession().removeAttribute("policy");
				response.sendRedirect("view/admin.jsp");
				break;
			case "viewPolicy":
				ArrayList<Policy> policies = (ArrayList<Policy>)request.getSession().getAttribute("policies");
				request.getSession().setAttribute("policy", policies.get(Integer.parseInt(request.getParameter("policy"))));
				response.sendRedirect("view/customerViewPolicy.jsp");
				break;
			case "AddNominee":
				String nominee_name = request.getParameter("new-nominee-name");
				String relationship = request.getParameter("new-nominee-relationship");
				if (relationship.equals("other-new")) {
					relationship = request.getParameter("other-relationship-new");
				}
				String purpose = request.getParameter("new-nominee-purpose");
				
				
				HttpSession hses = request.getSession();
				String custid = String.valueOf(hses.getAttribute("cust"));
				String policyid = String.valueOf(hses.getAttribute("policy"));
				
				PolicyMapDao info = new PolicyMapDao();
				
				int policy_map_id;
				int max_nominee_id;
				int max_nominee_map_id;
				
				try {
					policy_map_id = info.getPolicyMapIDFromIDs(custid, policyid);
					
					max_nominee_id = NomineeDao.maxNomineeID();
					max_nominee_map_id = NomineeDao.maxNomineeMapID();
					
					NomineeDao.insertNominee(nominee_name, relationship, purpose, max_nominee_id);
					NomineeDao.insertNomineeMap(max_nominee_map_id, policy_map_id, max_nominee_id);
					
					int nominee_id = max_nominee_id+1;
					
					Nominee nom = new Nominee();
					nom.setNomineeId(nominee_id);
					nom.setNomineeName(nominee_name);
					nom.setRelationshipToCustomer(relationship);
					nom.setPurposeOfChanged(purpose);
					
					Policy temp = (Policy) hses.getAttribute("policyobj");
					temp.addNomineeToList(nom);
					hses.setAttribute("policyobj", temp);
					
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				response.sendRedirect("view/updateNominee.jsp");
			
			break;
			case "UpdateNominee":
				System.out.println("wefwef");
				String update_nominee_name = request.getParameter("update-nominee-name");
				String update_relationship = request.getParameter("update-nominee-relationship");
				if (update_relationship.equals("other-update")) {
					update_relationship = request.getParameter("other-relationship-update");
				}
				String update_purpose = request.getParameter("update-nominee-purpose");
				String nominee_id = request.getParameter("update-nominee-id");
		

				try {
					NomineeDao.updateNomineeDetails(nominee_id, update_nominee_name, update_relationship, update_purpose);			
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				HttpSession hses_update = request.getSession();
				Policy temp = (Policy) hses_update.getAttribute("policy");
				for (Nominee i:temp.getNominees()) {
					if (i.getNomineeId()==Integer.parseInt(nominee_id)) {
						i.setNomineeName(update_nominee_name);
						i.setRelationshipToCustomer(update_relationship);
						i.setPurposeOfChanged(update_purpose);
					}
				}
				hses_update.setAttribute("policyobj", temp);
		
				response.sendRedirect("view/updateNominee.jsp");
			
			break;

			   	
			}
			return;
		}
		
		HttpSession hses = request.getSession(true);
		
		response.setContentType("text/html");

		String agentid = (String) hses.getAttribute("agentid");
		String custid = (String) hses.getAttribute("cust");
		String policyid = request.getParameter("policyid");
		hses.setAttribute("policy",policyid);
		
		PolicyMapDao obj = new PolicyMapDao(agentid, custid, policyid);
		Policy myPolicy;
		int policyMapId;
		List<Nominee> myNominees;
		
		try {
			myPolicy = obj.getPolicyInfo();
			policyMapId = obj.getPolicyMapIDFromIDs(obj.getCustID(),obj.getPolicyID());
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
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		System.out.println(action);
		if(action != null) {
			switch(action) {
			case "registerPolicy":
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
		
			   	if(minSum>maxSum) {  //swap min with max if min is larger then max
			   	 double temp = minSum;
			        minSum = maxSum;
			        maxSum = temp;
			   	}
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
				boolean updated =false;
			   	ses.setAttribute("updated", updated);

			   	
			   	response.sendRedirect("view/ViewPolicy.jsp");
			   	break;
				
			case "viewDeletePolicySelectPolicy":
				String str = request.getParameter("selectPolicy");
				Policy policy = new Policy();
				PolicyDao polDao = new PolicyDao();
				
				final Pattern pattern = Pattern.compile("^.*\\((.*)\\).*$");
		        final Matcher matcher = pattern.matcher(str);
		        String answer1 = "";
				System.out.println(str);
				
				if (matcher.matches())
		            answer1 = matcher.group(1);
				
				
		        System.out.println(answer1);	
		        int extracted_policy_id = Integer.parseInt(answer1);
		        
		        try {
		        	policy = polDao.selectPolicyByID(extracted_policy_id);
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		        
		        response.sendRedirect("view/DeletePolicyDisplay.jsp");
		        
		        HttpSession ses1 = request.getSession();
				
				int policy_Id = extracted_policy_id;
				ses1.setAttribute("pol_Id", policy_Id);
				
				
			   	String polName1 = policy.getPolicyName();
			   	ses1.setAttribute("policyname", polName1);
			   	
			   	String PolicyType1 = policy.getPolicyType();
			   	ses1.setAttribute("policyType", PolicyType1);
		   		 
				int numNominees1 = policy.getNumberNominees();
			   	ses1.setAttribute("nominee", numNominees1);
			   	   	
				double numTenure1 = policy.getTenure();
			   	ses1.setAttribute("year", numTenure1);
			   	
			   	
			   	double minSumD = policy.getMinSum();
			   	String minSum1 = new StringBuilder().append(minSumD).toString();
			   	ses1.setAttribute("min", minSum1);
			   	
			   	double maxSumD = policy.getMaxSum();
			   	String maxSum1 = new StringBuilder().append(maxSumD).toString();
			   	ses1.setAttribute("max", maxSum1);
			   	

			   	String preReq1 = policy.getPreReqs();
			   	ses1.setAttribute("pre-req", preReq1);
			   	System.out.println(preReq1);
		        

		        break;
				
			case "deletePolicy":
				boolean check = false;
				boolean delete= false;
				PolicyDao polDao1 = new PolicyDao();
				
		        HttpSession sesDelete = request.getSession();
		        System.out.println("hello");
			   	System.out.println(sesDelete.getAttribute("pol_Id"));
			   	int policyID = (int) sesDelete.getAttribute("pol_Id");
				
			   	try {
					check = polDao1.checkPolicyMapWithPolicyId(policyID);
				} catch (ClassNotFoundException | SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			   	System.out.println(check);
			   	
			   	if(check==false) {
			   		try {
						delete = polDao1.deletePolicyUsingId(policyID);
						
						sesDelete.setAttribute("delete", delete);
						
				        response.sendRedirect("view/DeletedPolicyView.jsp");
				        
						System.out.println("Successfully Deleted Policy");
					} catch (ClassNotFoundException | SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			   	}
			   	else {
					sesDelete.setAttribute("delete", delete);
			        response.sendRedirect("view/DeletedPolicyView.jsp");

			   		System.out.println("Unable to delete policy because there is a dependancy with the following policy Id:" + policyID);
			   	}
				break;
			
				
			case "updatePolicy":
				Policy policy1 = new Policy();
				PolicyDao polDao2 = new PolicyDao();
				
				String str1 =request.getParameter("selectPolicy");
				final Pattern pattern1 = Pattern.compile("^.*\\((.*)\\).*$");
		        final Matcher matcher1 = pattern1.matcher(str1);
		        String answer11 = "";
				System.out.println(str1);
				
				if (matcher1.matches())
		            answer11 = matcher1.group(1);
				
		        int extracted_policy_id1 = Integer.parseInt(answer11);
		        
		        try {
		        	policy1 = polDao2.selectPolicyByID(extracted_policy_id1);
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		        
		        response.sendRedirect("view/UpdatePolicyDisplay.jsp");
		        
		        HttpSession ses2 = request.getSession();
				
				int policy_Id1 = extracted_policy_id1;
				ses2.setAttribute("pol_Id", policy_Id1);
				
			   	String polName11 = policy1.getPolicyName();
			   	ses2.setAttribute("policyname", polName11);
			   	
			   	String PolicyType11 = policy1.getPolicyType();
			   	ses2.setAttribute("policyType", PolicyType11);
		   		 
				int numNominees11 = policy1.getNumberNominees();
			   	ses2.setAttribute("nominee", numNominees11);
			   	   	
				double numTenure11 = policy1.getTenure();
			   	ses2.setAttribute("year", numTenure11);
			   	
			   	
			   	double minSumD1 = policy1.getMinSum();
			   	String minSum11 = new StringBuilder().append(minSumD1).toString();
			   	ses2.setAttribute("min", minSum11);
			   	
			   	double maxSumD1 = policy1.getMaxSum();
			   	String maxSum11 = new StringBuilder().append(maxSumD1).toString();
			   	ses2.setAttribute("max", maxSum11);
			   	

			   	String preReq11 = policy1.getPreReqs();
			   	ses2.setAttribute("pre-req", preReq11);
			   	System.out.println(preReq11);
			   	System.out.println("hello"+ numTenure11);
			   	break;
			   	
			case "updatePolicyInsert": //use to insert updated data
	
		        HttpSession ses11 = request.getSession();
			   	updated = false;

			   	polName11 = request.getParameter("policy_name");
			   	ses11.setAttribute("policy_name", polName11);

				numNominees11 = Integer.parseInt(request.getParameter("nominee"));
			   	ses11.setAttribute("nominee", numNominees11);
			   	
				numTenure11 = Double.parseDouble(request.getParameter("year"));
			   	ses11.setAttribute("year", numTenure11);
		   		 
			   	System.out.println("hello"+ numTenure11);

			   	
			   	double minSum111 = Double.parseDouble(request.getParameter("min"));
			   	ses11.setAttribute("min", minSum111);
			   	
			   	double maxSum111 = Double.parseDouble(request.getParameter("max"));
			   	ses11.setAttribute("max", maxSum111);
			   	
			   	if(minSum111>maxSum111) {
				   	 double temp = minSum111;
				   	minSum111 = maxSum111;
				   	maxSum111 = temp;
				   	}
			   	
			   	preReq11 = request.getParameter("pre-req");
			   	ses11.setAttribute("pre-req", preReq11);
			   	
			   	PolicyType11 = request.getParameter("policyType");
			   	ses11.setAttribute("policyType", PolicyType11);

			   	System.out.println(polName11);
			   	
			   	Policy obj11 = new Policy();
		   	
			   	obj11.setPolicyName(polName11);
			   	obj11.setNumberNominees(numNominees11);
			   	obj11.setTenure(numTenure11);
			   	obj11.setMinSum(minSum111);
			   	obj11.setMaxSum(maxSum111);
			   	obj11.setPreReqs(preReq11);
			   	obj11.setPolicyType(PolicyType11);
			   	obj11.setPolicyId((int)ses11.getAttribute("pol_Id"));
			   	
			   	ses11.setAttribute("policy", obj11);
			   	System.out.println(ses11.getAttribute("pol_Id"));
			   	int policyID1 = (int) ses11.getAttribute("pol_Id");
			   	PolicyDao obj3 = new PolicyDao();
			   	try {
					obj3.update(obj11, policyID1);
					updated=true;
					ses11.setAttribute("updated", updated);

				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			   	
			   	
			   	response.sendRedirect("view/ViewPolicy.jsp");
			   	
			}
			return;
		}
		   	
	}
}