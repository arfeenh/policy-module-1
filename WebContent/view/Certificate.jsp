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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>
<% pol = (Policy)session.getAttribute("CertPolicy"); %>
<%-- 	Policy ID : <%= pol.getPolicyId() %><br> --%>
<%-- 	Policy Name : <%= pol.getPolicyName() %><br> --%>
<%-- 	Policy Tenure : <%= pol.getTenure() %><br> --%>
<%-- 	Premium : <%= (double)session.getAttribute("CertPremium") %><br> --%>
<!-- 	Nominees: <br> -->
	
<%-- 	<% noms = (List<Nominee>)session.getAttribute("CertNominees"); %> --%>
	
<%-- 	<% --%>
<%-- 		for (int x = 0; x < noms.size(); x++){ --%> 
<%-- 			%><%= noms.get(x).getNomineeName() %><br><%  --%>
<%-- // 		} --%>
<%-- 	%> --%>
<%-- 	Minimum sum assured: <%=pol.getMinSum() %><br> --%>
<%-- 	Maximum sum assured: <%=pol.getMaxSum() %><br> --%>
<%-- 	Policy expiry date: <%= session.getAttribute("CertEndDate").toString()  %> --%>
	<table class="table table-striped">
  <thead>
    <tr>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Policy ID : <br></td>
      <td><%= pol.getPolicyId() %></td>
    </tr>
    <tr>
      <td>Policy Name :</td>
      <td><%= pol.getPolicyName() %></td>
    </tr>
    <tr>
      <td>Policy Tenure :</td>
      <td><%= pol.getTenure() %></td>
    </tr>
     <tr>
      <td>Premium :</td>
      <td><%= (double)session.getAttribute("CertPremium") %></td>
    </tr>
     <tr>
      <td>Nominees: </td>
      <td><% noms = (List<Nominee>)session.getAttribute("CertNominees"); %>
	
	<%
		for (int x = 0; x < noms.size(); x++){
			%><%= noms.get(x).getNomineeName() %><br><% 
		}
	%>
	</td>
    </tr>
     <tr>
      <td>Minimum Sum Assured: </td>
      <td><%=pol.getMinSum() %></td>
    </tr>
    <tr>
      <td>Maximum Sum Assured: </td>
      <td><%=pol.getMaxSum() %></td>
    </tr>
    <tr>
      <td>Policy Expiry Date: </td>
      <td><%= session.getAttribute("CertEndDate").toString() %></td>
    </tr>
  </tbody>
</table>
    <a class="btn btn-primary" href="view/GenerateCertificate.jsp" role="button">Back</a>
	
	
	
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>