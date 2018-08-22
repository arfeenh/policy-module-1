<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>No Policy Found</title>
<%@ page import = "com.policy.data.Manager" %>
</head>
<body>
<h1>Error</h1>
There exists no mapping between that policy and a customer with that ID.<br>
<%

	if (session.getAttribute("user") instanceof Manager){
	    %><a class="btn btn-primary" href="view/GenerateCertificate.jsp" role="button">Back</a><%

	}
	else{
	    %><a class="btn btn-primary" href="view/GenerateCertificateCustomer.jsp" role="button">Back</a><%
	}

%>



</body>
</html>