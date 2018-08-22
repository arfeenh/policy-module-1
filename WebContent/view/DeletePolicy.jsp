<!-- created by Hamza and domenic on 21th Aug at 10   -->

<%@ page import="java.io.IOException" %>
<%@ page import="com.policy.service.PolicyService" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1,Unicode #8896 / U+22C1 " pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*, java.lang.*" %>
<%@ page import="com.policy.service.PolicyService"%>
<%@ page import="com.policy.data.Policy"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html> 
<html>
<head>
<link rel="stylesheet" href="../javascript/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  
</head>

	<%! ArrayList<String> nameAndIdList;  %>
<body>
 	<h1 align="center"> Delete Policy </h1>

<div class="container">
	<div id="right">
				
	
    <div class="container-fluid" align="right"> 
		<p>
		Time: <span id="time"></span>
		Date: <span id="date"></span>
		</p>
			<script> var dt = new Date(); document.getElementById("date").innerHTML = dt.toLocaleDateString(); </script>
	</div>
 	</div>
  <div  id="form_style" >
  <form id="CreateFormUI" method= "post" action ="../MainServlet" >
  	<div class="form-group">
		<table align="center" >
			<tr>
				<td> please select policy you would like to delete </td>
				<td>
					<% nameAndIdList = new PolicyService().getAllPoliciesNameAndID();  
					%>
					 <div class="form-group">
				    <select class="form-control" id="deletePolicy" name="selectPolicy" >
				       <% for(int i = 0; i < nameAndIdList.size(); i++){ %>
				            <option value = "<%= nameAndIdList.get(i) %>"> <%= nameAndIdList.get(i) %> </option>
				      	 <% } %>   	 
				    </select>				    
				  </div>
				</td>				
			</tr>						
		</table>		
		<div class="clearfix" align="center">
      <button class="btn btn-primary btn-lg" type = "submit" name="action" value="viewDeletePolicySelectPolicy"> View Policy </button>		  
			<a href="admin.jsp" class="btn btn-primary btn-lg">Cancel/Back</a>			
    	</div >
		<div align="center">
			<a href="url"></a>
		</div>
		</div>
	</form> 	  
	</div>
	</div>
			<script src = "../javascript/PolicyValidation.js"> </script>
</body>
</html>