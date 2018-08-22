<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="com.policy.data.Nominee"%>
<%@ page import="com.policy.data.Policy"%>
<%@ page import="java.text.Format"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.policy.dao.PolicyMapDao" %>
<%@ page import="com.policy.dao.NomineeDao" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.sql.Date" %>
<%@ page import = "com.policy.data.Manager" %>
<%
	Policy myPolicy = (Policy)session.getAttribute("policy");
	
	// Get values from the session object
	int policyId = myPolicy.getPolicyId();
	String policyName = myPolicy.getPolicyName();
	double policyTenure = myPolicy.getTenure();
	String sumAssured = "$" + (int)myPolicy.getMinSum() + " to $" + (int)myPolicy.getMaxSum();
	
	List<Nominee> myNominees = myPolicy.getNominees();
	int paymentsPerYear = myPolicy.getPaymentsPerYear();
	String premiumType;
	if(paymentsPerYear == 1) {
		premiumType = "Annually";
	} else if(paymentsPerYear == 2) {
		premiumType = "Half-yearly";
	} else if(paymentsPerYear == 4) {
		premiumType = "Quarterly";
	} else {
		premiumType = "Undefined";
	}
	
	double premiumAmount = myPolicy.getPremiumAmount();
	
	// convert startDate to expireDate
	Date startDate = myPolicy.getStartDate();
	LocalDate ld = LocalDate.parse(startDate.toString());
	long days = (long)(myPolicy.getTenure()* 365.0);
	ld = ld.plusDays(days);
	Date expireDate = Date.valueOf(ld);
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Policy</title>
<style>
body {
	margin: 10px;
}

#policy-details {
	text-align: center;
}

table {
	margin: 25px auto 25px auto;
	text-align: left;
}

td {
	padding: 5px 15px;
}

.tbl-labels {
	font-weight: bold;
}

button {
	text-align: center;
	margin: 10px 20px 10px 20px;
	padding: 10px 20px;
}
</style>
</head>
<body>
	<div id="policy-details">
		<h1>Policy Details</h1>
		<table>
			<tr>
				<td class="tbl-labels">Policy ID</td>
				<td class="tbl-data"><%= policyId %></td>
			</tr>
			<tr>
				<td class="tbl-labels">Policy Name</td>
				<td class="tbl-data"><%= policyName %></td>
			</tr>
			<tr>
				<td class="tbl-labels">Tenure</td>
				<td class="tbl-data"><%= policyTenure %> Year(s)</td>
			</tr>
			<tr>
				<td class="tbl-labels">Premium Type</td>
				<td class="tbl-data"><%= premiumType %></td>
			</tr>
			<tr>
				<td class="tbl-labels">Premium Amount</td>
				<td class="tbl-data">$<%= premiumAmount %></td>
			</tr>
			<%
				for (int i = 0; i < myNominees.size(); i++) {
			%>
			<tr>
				<td class="tbl-labels">Nominee</td>
	 				<td class="tbl-data"><%= myNominees.get(i).getNomineeName() %></td>
 				</tr>
			<%
				}
			%>
			<tr>
				<td class="tbl-labels">Sum Assured</td>
				<td class="tbl-data"><%= sumAssured %></td>
			</tr>
			<tr>
				<td class="tbl-labels">Policy Expire Date</td>
				<td class="tbl-data"><%= expireDate.toString() %></td>
			</tr>
		</table>
		<button id="go-back-home">Main Menu</button>
		<%if (session.getAttribute("role").equals("customer")){ %>
		<button id="update-nominees">Update Nominees</button>
		<%} %>
	</div>
	<script>
		// Button click event listener for go back button;
		// When clicked, redirect page to customer home page
		<% if (session.getAttribute("user") instanceof Manager){
			%>
				document.getElementById("go-back-home").addEventListener(
					"click", function() {
						window.location.href = "admin.jsp";
					});
			<%
		} 
		else{ 
			%> document.getElementById("go-back-home").addEventListener(
				"click", function() {
					window.location.href = "customer.jsp";
				});<%
		}%>
		
		
		// Button click event listener for update nominees;
		// When clicked, redirect page to "updateNominees.jsp"
		document.getElementById("update-nominees").addEventListener("click",
				function() {
					window.location.href = "updateNominee.jsp";
				});
	</script>
</body>
</html>