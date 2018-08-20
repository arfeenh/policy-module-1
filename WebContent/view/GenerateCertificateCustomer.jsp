<!-- CREATED BY NICHOLAS KAULDHAR -->
<!-- August 20 2018 10:00AM -->
<!-- Certificate Generation Screen (Admin view) -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Generate Certificate</title>
<%@ page import="com.policy.data.Policy" %>
<%@ page import= "com.policy.dao.PolicyDao" %>
<%@ page import= "java.util.List" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "com.policy.data.Customer" %>
</head>
<body>

<form action = "../CertServlet" method = "get">
	Select Policy : 
	<select name = "policyID">
		<%
			
			int id = 1; //CHANGE THIS TO LOGGED IN CUSTOMER ID WHEN INTEGRATING
			session.setAttribute("customerID", Integer.toString(id));
			try {
				List<Policy> k;
				k = PolicyDao.getAllCustomerPolicies(id);
				
				System.out.println(k.size());
				for(int x = 0; x < k.size(); x++){
					%><option value = "<%= k.get(x).getPolicyId() %>"><%=k.get(x).getPolicyName() %></option> <%
				}
			}     
			catch(Exception e){
			}
	
		%>
	</select><br>
	<input type = "submit" value = "Generate Customer Certificate" name = "op">
	
	
</form>
</body>
</html>