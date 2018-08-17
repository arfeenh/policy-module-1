<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@page import="com.policy.data.Policy" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import = "com.policy.data.Nominee" %>
<%@page import = "java.sql.Date" %>
<%! Policy pol; %>
<%! List<Nominee> noms;%>
</head>
<body>
	<% pol = (Policy)session.getAttribute("CertPolicy"); %>
	Policy ID : <%= pol.getPolicyId() %><br>
	Policy Name : <%= pol.getPolicyName() %><br>
	Policy Tenure : <%= pol.getTenure() %><br>
	Premium : <%= (double)session.getAttribute("CertPremium") %><br>
	Nominees: <br>
	
	<% noms = (List<Nominee>)session.getAttribute("CertNominees"); %>
	
	<%
		for (int x = 0; x < noms.size(); x++){
			%><%= noms.get(x).getNomineeName() %><br><% 
		}
	%>
	Minimum sum assured: <%=pol.getMinSum() %><br>
	Maximum sum assured: <%=pol.getMaxSum() %><br>
	Policy expiry date: <%= session.getAttribute("CertEndDate").toString()  %>
	
	
	
	
	
</body>
</html>