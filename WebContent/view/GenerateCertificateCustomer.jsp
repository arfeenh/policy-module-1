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

<link rel="stylesheet" href="../javascript/main.css">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</head>
<body>
<h1 align="center"> Generate Customer Customer</h1>
<div class="container">
            <div class="container-fluid" align="right"> 
				<p>
				Time: <span id="time"></span>
				Date: <span id="date"></span>
				</p>
					<script> var dt = new Date(); document.getElementById("date").innerHTML = dt.toLocaleDateString(); </script>
			</div>
<form action = "../CertServlet" method = "get">
	Select Policy : 
	<select name = "policyID">
		<%
			
			int id = 1; //CHANGE THIS TO LOGGED IN CUSTOMER ID WHEN INTEGRATING
			Customer c = (Customer)session.getAttribute("user");
			id = c.getCustomerId();
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
	<button type = "submit" value = "custGoBack" class="btn btn-primary btn-lg" name = "op">Go Back</button>
	
	
</form>
		<script src = "../javascript/PolicyValidation.js"> </script>
		</div>
</body>
</html>