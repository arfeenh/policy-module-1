
<!-- This Webpage can only be viewed by the Admin or Manager. Module 2.5.5.
     Select Agent ID, Customer ID, and Policy ID to view its Information and 
     pass information and redirect to customerViewPolicy.jsp page 
	 @author: Jian An Chiang 
	 @version: 1.0
	 @name: ViewPolicyByAgent
	 @Creation Date: August 14 2018 4:00PM 
	 @History: Page UI Created, Validation, Dynamic Population of Dropdown from Database 
	 @Reviewed by:             -->
	 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.policy.dao.PolicyMapDao"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../javascript/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Policy By Agent</title>
<script>
	
	//RESTRICT AGENT TEXTBOX TO ONLY NUMBERS
	function validate(){ 
		var text = document.forms["ViewCustomerByAgentID"]["agent"].value;
		if (!text.match(/^\d+$/)){
			document.forms["ViewCustomerByAgentID"]["agent"].value = text.substring(0,text.length-1);
		}
	}
	//AUTO ERASE AGENT TEXTBOX WHEN CLICKED
	function erase(){
		document.forms["ViewCustomerByAgentID"]["agent"].value = "";
	} 
	
	//GO BACK BUTTON
	function goBack(){
		window.location.href = "admin.jsp"
	}
	
</script>
</head>

<body>


<%
/* JAVA CODE TO INTERACT WITH THE FOLLOWING:
	 MainServlet.java: This will send Session Attributes set in this page to customerViewPolicy.jsp
	 PolicyMapDao.java: Able to obtain Data in DropDown based on Data specified in this page  
	Session Attributes are the following:
		agentid
		cust
		policy */
HttpSession hses = request.getSession(true);

String agentid = request.getParameter("agent");
if (agentid!=null) {
	hses.setAttribute("agentid", agentid);
}else {
	hses.setAttribute("agentid", " ");
}

PolicyMapDao obj = new PolicyMapDao();
ArrayList<String> custid_list = obj.getCustomers(agentid); //ArrayList used to hold all Customer IDs of Agent

hses.setAttribute("custid", custid_list);

String custid = request.getParameter("custid");
hses.setAttribute("cust", custid);
ArrayList<String> policyid_list = obj.getPolicies(agentid, custid); //ArrayList used to hold all Policy IDs of Customer

hses.setAttribute("policyid", policyid_list);

String policyid = request.getParameter("policyid");
if (policyid!=null){
	hses.setAttribute("policy", policyid);
}
%>
<div class="container">
<div align="center">
<h1 align="center">Search Policy</h1>
<hr>

<!-- FINDING CUSTOMER IDs FORM -->
<form name="ViewCustomerByAgentID"> 
    <div class="container-fluid" align="right"> 
		<p>
		Time: <span id="time"></span>
		Date: <span id="date"></span>
		</p>
			<script> var dt = new Date(); document.getElementById("date").innerHTML = dt.toLocaleDateString(); </script>
	</div>
<table>
	<tr>
		<td>Enter Agent ID</td>													  
		<td><input type="text" name="agent" oninput="validate()" onfocus="erase()"
		value="<%if (session.getAttribute("agentid")!=null)%><%=session.getAttribute("agentid")%>" required></td>
		<!-- RETRIEVE AGENT ID LAST INPUTTED FROM SERVLET...UNLESS IT'S NULL -->
		<td><input type="submit" name="SearchCust" value="Search"></td>
	</tr>
</table>
</form>
</div>

<!-- DISPLAY CUSTOMER ID DROPDOWN WHEN AGENT ID SEARCH IS CLICKED -->
<div align="center" <%  
if (request.getParameter("SearchCust")!=null || request.getParameter("SearchPolicy")!=null || request.getParameter("view")!=null){%>
	style="display: block;"<%
	}else{
	%>style="display: none;"<% 
}%>>

<!--FINDING POLICY IDs FORM -->
<form name="ViewPolicyByCustomerID"><table>
	<tr>	
		<td>Select Customer ID</td>
		<td><select name="custid" required>
		<%
		if (session.getAttribute("agentid")!=null){
			ArrayList<String> custarray = (ArrayList<String>) session.getAttribute("custid"); //RETRIEVE CUSTID ARRAY FOR AGENT ID
			for (String i:custarray){ %> <!-- LOAD ALL CUSTOMER IDS INTO THE DROP DOWN BOX --> 
				<option <%if (i.equals(session.getAttribute("cust")) && request.getParameter("SearchCust")==null){%>selected<%}%>><%=i%></option> 
			<%}	   //KEEP THE ONE SELECTED AS SELECTED WHEN SEARCH POLICY IS CLICKED. DO NOT DEFAULT BACK TO THE FIRST OPTION 
		}%>		
		</select></td>
		<td><input type="submit" name="SearchPolicy" value="Search"></td>
		
		<td><input type="hidden" name="agent" value="<%=session.getAttribute("agentid")%>"> <!-- RETRIEVE AGENT ID VALUE TO BE SUBMITTED AGAIN -->
	</tr>

</table>
</form>
</div>


<!-- DISPLAY POLICY ID DROPDOWN WHEN CUSTOMER ID SEARCH IS CLICKED -->
<div align="center" <% 
if (request.getParameter("SearchPolicy")!=null && request.getParameter("SearchCust")==null || request.getParameter("view")!=null){%>
	style="display: block;"<%
	}else{
	%>style="display: none;"><% 
}%>

<!-- SUBMIT ALL DETAILS TO POLICY INFORMATION PAGE -->
<form name="ViewDetails" method="get" action="../MainServlet">
<table>
	<tr>
		<td>Select Policy ID</td>
		<td><select name="policyid" required>
		<%
		if (session.getAttribute("cust")!=null){
			ArrayList<String> policyarray = (ArrayList<String>) session.getAttribute("policyid"); //RETRIEVE POLICYID ARRAY FOR CUSTOMER ID
			for (String i:policyarray){ %>
				<option><%=i%></option>
			<%}	
		}%>	
		</select></td>
	</tr>
</table>
<br><br>
	<input type="submit" class="button" name="view" value="View Details"/>
	
	<input type="hidden" name="agent" value="<%=session.getAttribute("agentid")%>"> <!-- RETRIEVE AGENT ID AND CUSTOMER ID VALUE TO BE SUBMITTED AGAIN -->
	<input type="hidden" name="custid" value="<%=session.getAttribute("cust")%>">
</form>
</div>
<br>
<div align="center">
	<input type="submit" class="button" name="goBack" value="Go Back" onclick="goBack()"/>
	
</div>
</div>
		<script src = "../javascript/PolicyValidation.js"> </script>
</body>
</html>