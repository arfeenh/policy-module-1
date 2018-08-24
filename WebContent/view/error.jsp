<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Found Error</title>
<style>
#errorPage {
	display: flex;
	justify-content: center; /* align horizontal */
	align-items: center; /* align vertical */
	height: 90vh;
	margin: auto;
}
#errorMessage {
	color: red;
	text-align: center;
	font-size: calc(16pt + 1vw);
	font-weight: bold;
}
#signInLink {
	color: blue; 
}
#signInLink:hover {
	border-bottom: 3px solid blue;
	cursor: pointer;
}
</style>
</head>
<body>
	<% session.invalidate(); %>
	<div id="errorPage">
		<p id="errorMessage">Sorry, an error has occured. The previous session is ended. 
			<br />Please <a onclick="window.location.href = '/PolicyModule/view/Login.jsp';" id="signInLink">SIGN IN</a> again.</p>
	</div>
</body>
</html>