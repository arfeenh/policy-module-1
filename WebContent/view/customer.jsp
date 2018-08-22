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
<link rel="stylesheet" href="../javascript/main.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

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
<div class="container">
	<div class="container-fluid" align="right"> 
		<p>
		Time: <span id="time"></span>
		Date: <span id="date"></span>
		</p>
			<script> var dt = new Date(); document.getElementById("date").innerHTML = dt.toLocaleDateString(); </script>
	</div>
<% 
	Customer u = (Customer) session.getAttribute("user"); 
	//List<Policy> policies = PolicyDao.getAllCustomerPolicies(u.getCustomerId());
	List<Policy> policies = PolicyDao.getAllCustomerPolicies(1);
	session.setAttribute("policies", policies);
	
%>
<h1 align="center">User: <%= u.getFirstname() %></h1>
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
	</div>
</body>
</html>