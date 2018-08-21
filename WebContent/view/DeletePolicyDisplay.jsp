<!-- created by Hamza on 21th Aug at 10am   -->

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
<body>
<div class="container">
  <div  id="form_style" >
  <form id="updateFormInsert" method= "get" action ="../MainServlet" >
  	<div class="form-group">
		<table align="center" >
			<h1 align="center"> Delete Policy </h1>			
			<tr> 
				<td> Policy Name </td>				
				<td> <input type="text" readonly name="policy_name" required = "required" value= "<%= session.getAttribute("policyname")%>" pattern="([^\s][A-z0-9\s]+){2,100}" /> </td>
				<td> </td>
				<td> </td>
				<td> </td>
				<td> </td>
				<td>   <button type="reset" value="Reset">Reset form</button> </td>				
			</tr>		
			<tr>
				<td> Type of Insurance </td>
				<td> <input type="text" readonly name="policyType" required = "required" value= "<%= session.getAttribute("policyType")%>" pattern="([^\s][A-z0-9\s]+){2,100}"/> </td>	
			</tr>	
			<tr>	
				<td> Number of Nominee's </td>
				<td>			
					<input type="text" readonly name="nominee" id="display" value= "<%= session.getAttribute("nominee")%>" oninput="updateNumber()" required="required" pattern="^[0-9]*$" >
				    <input type="button" value="+" id="inc" onclick="incNumber()"/>
				    <input type="button" value="-" id="dec" onclick="decNumber()"/>
				</td> 
			</tr>
    			<tr> 
	    			<td> Tenure </td>
	    			<td> <br>
	    				The previous Tenure value is shown, please select new value: <input type="text" name="year" value="<%= session.getAttribute("year")%>" readonly>  <br> 
	    				<input type="radio" readonly name="year" value="1" onclick="hide();" required/> 1 Year<br>
	  					<input type="radio" readonly name="year" value="2" onclick="hide();"/> 2 Year<br>
	  					<input type="radio" readonly name="year" value="3" /> 3 Year <br>
	    				<input type="radio" readonly name="year" value="custom" id="cust" onclick="show();" /> Custom	 
	    				<input type="text"  readonly name="year" value="4" id="area" style= "display: none;" oninput="validate()">	
	    			</td>
				</tr>
				<tr> 
					<td> Sum Assured </td>
					<td> <br>
						 Min: <input type="text" readonly id="min" name="min" value="<%= session.getAttribute("min")%>" oninput="validate()"/> <br>
					     Max:<input type="text" readonly id="max" name="max" value="<%= session.getAttribute("max")%>"  oninput="validate()" />
					</td>
				</tr>
<!-- 				<tr> 
					<td> List Pre-Requisites</td>
					<td>
				   		
				   		<div id="certificationtog">
						   <p class="setting">
						   	<br>
						   	  <input type="button" id="addrows" name="add rows" class="addperson" value="Add Rows" onclick="add();" />
						      <input type="button" id="removerows" class="removerows" value="Delete Rows" onclick="remove();" />  
						      <br>
						    <span id="myspan" ></span>
						   	<span style="width: 0px; margin-left: 20px; font-weight: bold; float: none; ">  <br>						        
						      </span>				     
						      <br><br>

						   </p>
						</div>
					</td>
				</tr> -->				
				<tr>
					<td> Pre-req </td>
					<td><br><br>
					<textarea rows="4" cols="50" readonly placeholder="input your pre-req" name="pre-req" ><%= session.getAttribute("pre-req")%>					
					</textarea>
				 	</td>			
				</tr>	
		</table>		
		<div class="clearfix" align="center">			
			<button class="btn btn-primary btn-lg" type = "submit" name="action" value="deletePolicy"> Delete Policy </button>	
			<a href="DeletePolicy.jsp" class="btn btn-primary btn-lg">Cancel/Back</a>				
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