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
<script>
	function validate(){
		var x = document.forms["polSelect"]["policy"].value;
		if (x == null || x == ""){
			alert("You don't have any policies");
			return false;
		}
		return true;
	}

</script>
</head>
<body>
<% 
	Customer u = (Customer) session.getAttribute("user"); 
	//List<Policy> policies = PolicyDao.getAllCustomerPolicies(u.getCustomerId());
	List<Policy> policies = PolicyDao.getAllCustomerPolicies(1);
	session.setAttribute("policies", policies);
	
%>
<h1>User: <%= u.getFirstname() %></h1>
<table>
	<tr>
		<th>Profile management</th>
	</tr>
	
	<tr>
		<td><button type="button" onclick="window.location.href = 'BuyPolicy.jsp';" value="buyPolicy">Buy Policy</button></td>
	</tr>
	<tr>
		<td><button type="button" onclick="window.location.href = 'GenerateCertificateCustomer.jsp';" value="generateCert">Generate Certificate</button></td>
		
	</tr>
	<tr>
		<td>
  			<form  method = "get" action="../MainServlet" name = "polSelect" onsubmit = "return validate()">
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