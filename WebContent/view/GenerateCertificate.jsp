<!-- CREATED BY NICHOLAS KAULDHAR -->
<!-- August 16 2018 3:00PM -->
<!-- Certificate Generation Screen (Admin view) -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../javascript/main.css">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<title>Generate Certificate</title>
<%@ page import="com.policy.data.Policy" %>
<%@ page import= "com.policy.dao.PolicyDao" %>
<%@ page import= "java.util.List" %>
<%@ page import= "java.util.ArrayList" %>
</head>
<body>
<h1 align="center"> Generate Certificate </h1>
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
			try {
				List<Policy> k;
// 				if (session.getAttribute("allPolicies") == null){
// 					k = PolicyDao.getAllPolicies();
// 					session.setAttribute("allPolicies", k);
// 				}
// 				else{
// 					k = (List<Policy>)session.getAttribute("allPolicies");
// 				}
				
				k = PolicyDao.getAllPolicies();
				session.setAttribute("allPolicies", k);
				
				for(int x = 0; x < k.size(); x++){
					%><option value = "<%= k.get(x).getPolicyId() %>"><%=k.get(x).getPolicyName() %></option> <%
				}
			}     
			catch(Exception e){
				e.printStackTrace();
			}
	
		%>
	</select><br>
	Enter Customer ID: 
	<input type = "text" name = "customerID"><br>
	<input type = "submit" value = "Generate Certificate" name = "op">
	<input type = "submit" value = "Go Back" name = "op">
	
	
</form>
</div>
</body>
</html>