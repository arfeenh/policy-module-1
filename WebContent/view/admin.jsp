<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.policy.data.Manager" %>
<%@ page import="com.policy.controller.Dummy" %>

<!DOCTYPE html >
<html>
<script type="text/javascript" src="../javascript/utilities.js"></script>

<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>



<title>Admin page</title>
</head>
<% Manager m = (Manager) session.getAttribute("user"); %>
<h1 align="center">Admin <%= m.getFullname() %> ID: <%= m.getManagerId() %></h1>
<body>
<h1 align="center">Policy Management</h1> <br>
<div class="container">
	<table align="center">
	<!-- 
	Changed href from RegisterPolicy to CreatePolicy.
	Updated by Domenic Garreffa on Aug 16, 2018. -->
	<tr>
		<td><button type="button" onclick="window.location.href = 'RegisterPolicy.jsp';" value="newPolicy" class="btn btn-primary m-1"  >Create Policy</button></td>
	</tr>
	<tr>
		<td><button type="button" onclick="window.location.href = 'UpdatePolicy.jsp';" value="updatePolicy" class="btn btn-primary m-1">Update Policy</button></td>
	</tr>
	<tr>
		<td><button type="button" onclick="window.location.href = 'DeletePolicy.jsp';" value="DeletePolicy" class="btn btn-primary m-1">Delete Policy</button></td>
	</tr>
	<tr>
	
		<!-- 
	Updated by Hamza Arfeen on Aug 17, 2018. added additional buttons plus added bootstrap-->
	
		<td><button type="button" onclick="window.location.href = 'GenerateCertificate.jsp';" value="GenerateCertificate" class="btn btn-primary m-1">Generate Certificate</button></td>
	</tr>
	<tr>
		<td><button type="button" onclick="window.location.href = 'ViewPolicyByAgent.jsp';" value="ViewPolicyByAgent" class="btn btn-primary m-1">View Policy By Agent</button></td>
	</tr>
	</table>
	</div>
</body>
</html>

