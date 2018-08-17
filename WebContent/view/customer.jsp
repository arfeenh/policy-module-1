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
</head>
<body>
<% 
	Customer u = (Customer) session.getAttribute("user"); 
	ArrayList<Policy> policies = new PolicyDao().getPoliciesByCustomerID(u.getCustomerId());
	//ArrayList<Policy> policies = new ArrayList<Policy>();
	
	Policy policy = new Policy();
	policy.setPolicyId(1);
	policy.setPolicyName("Dummy Policy");
	policy.setTenure(2.0);
	policy.setMinSum(220.50);
	policy.setMaxSum(21000000.50);
	policy.setPaymentsPerYear(1);
	policy.setPremiumAmonut(30000);
	policy.setStartDate(new Date());
	
	// Nominee data
	List<Nominee> myNominees = new ArrayList<Nominee>();
	myNominees.add(new Nominee());
	myNominees.add(new Nominee());
	myNominees.add(new Nominee());
	myNominees.get(0).setNomineeName("Nominee 1");
	myNominees.get(1).setNomineeName("Nominee 2");
	myNominees.get(2).setNomineeName("Nominee 3");
	policy.setNominees(myNominees);
	policy.setNumberNominees(myNominees.size());
	
	Policy policy2 = new Policy();
	policy2.setPolicyId(1);
	policy2.setPolicyName("Dummy Policy Two");
	policy2.setTenure(5.0);
	policy2.setMinSum(55520.50);
	policy2.setMaxSum(5500000.50);
	policy2.setPaymentsPerYear(2);
	policy2.setPremiumAmonut(800000);
	policy2.setStartDate(new Date());
	
	// Nominee data
	List<Nominee> myNominees2 = new ArrayList<Nominee>();
	myNominees2.add(new Nominee());
	myNominees2.add(new Nominee());
	myNominees2.add(new Nominee());
	myNominees2.get(0).setNomineeName("Nominee 11");
	myNominees2.get(1).setNomineeName("Nominee 22");
	myNominees2.get(2).setNomineeName("Nominee 33");
	policy2.setNominees(myNominees2);
	policy2.setNumberNominees(myNominees2.size());
	
	policies.add(policy);
	policies.add(policy2);
	
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
		<td>
  			<form  method = "get" action="../MainServlet">
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