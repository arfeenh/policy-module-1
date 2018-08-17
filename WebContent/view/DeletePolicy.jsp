<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.policy.service.PolicyService"%>
<%@ page import="com.policy.data.Policy"%>
<%@ page import="java.util.ArrayList"%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%! ArrayList<String> nameAndIdList = new PolicyService().getAllPoliciesNameAndID();  
	%>

	<form method="get" action="../MainServlet">
	 <div class="form-group">
    <label for="exampleFormControlSelect1">Example select</label>
    <select class="form-control" id="deletePolicy" name="selectPolicy" >
      <% for(int i = 0; i < nameAndIdList.size(); i++){ %>
            <option value = "<%= nameAndIdList.get(i) %>"> <%= nameAndIdList.get(i) %> </option>
      	 <% } %>
    </select>
  </div>
      <button class="btn btn-primary btn-lg" type = "submit" name="action" value="viewDeletePolicySelectPolicy"> View Policy </button>		  
  
  </form>
</body>
</html>