<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.policy.data.Customer" %>
<%@ page import="com.policy.data.Policy" %>
<%@ page import="com.policy.data.Nominee" %>
<%@ page import="com.policy.dao.PolicyDao" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer View</title>
</head>
<body>
<% 
	Customer u = (Customer) session.getAttribute("user"); 
	//List<Policy> policies = PolicyDao.getAllCustomerPolicies(u.getCustomerId());
	List<Policy> policies = PolicyDao.getAllCustomerPolicies(u.getCustomerId());
	session.setAttribute("policies", policies);
	
%>
<h1>User: <%= u.getFirstname() %></h1>
<table>
	<tr>
		<th>Profile management</th>
	</tr>
	
	<tr>
		<td><form method="get" action="../MainServlet">
			<select name="policyType">
					<option value="Accidental">Accidental</option>
					<option value="Term">Term</option>
					<option value="Pension Scheme">Pension Scheme</option>
			</select>
			<button class="btn btn-primary btn-lg" type = "submit" name="action" value="buyPolicy"> Buy policy </button>
		</form></td>
	</tr>
	<tr>
		<td><button type="button" onclick="window.location.href = 'GenerateCertificateCustomer.jsp';" value="generateCert">Generate Certificate</button></td>
		
	</tr>
	<tr>
		<td>
  			<form  method = "get" action="../MainServlet">
				<select name="policy" >
				<%for(int i = 0; i<policies.size(); i++){
					Policy p = policies.get(i);%>  
					<option value=<%=i %>><%= p.getPolicyName() %></option>
					<%} %>
				</select> 
				<button class="btn btn-primary btn-lg" type = "submit" name="action" value="viewPolicy"> view </button>
			</form>
		</td>
	</tr>
	</table>
</body>
</html>