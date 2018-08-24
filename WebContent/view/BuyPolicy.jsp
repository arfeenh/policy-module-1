<!--  Created by Domenic Garreffa August 4:30  -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="com.policy.data.Policy" %>
    <%@ page import="com.policy.dao.*" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../javascript/main.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="../javascript/BuyPolicyLogic.js">
</script>
<%ArrayList<Policy> policies = (ArrayList<Policy>) session.getAttribute("policiesByType");%>
<script>
tenure = 0;
premAmount = 0;
maxNominee=0;
function updatePremAmount(){
	var premDrop = document.getElementById("premium");
	var premVal = premDrop.options[premDrop.selectedIndex].value;
	var sumAssuredDrop = document.getElementById("sumAssured");
	var sumAssuredVal = sumAssuredDrop.options[sumAssuredDrop.selectedIndex].value;
	var tenureVal = document.getElementById("tenure").innerText;
	premAmount = (parseInt(sumAssuredVal) / tenure / parseInt(premVal));
	document.getElementById("premAmount").innerText = "Premium Amount: $" + premAmount;

}

    
$(document).ready(function(){
	$("#premium").change(function(){
		var sumAssuredDrop = document.getElementById("sumAssured");
    	var sumAssuredVal = sumAssuredDrop.options[sumAssuredDrop.selectedIndex].value;
		if(isNaN(parseInt(sumAssuredVal)) != true){
			updatePremAmount();
		}
	});
	
	$("#sumAssured").change(function(){
		var prem = document.getElementById("premium");
    	var premVal = prem.options[prem.selectedIndex].value;
		if(isNaN(parseInt(premVal)) != true){
			updatePremAmount();
		}
	});
	
    $("#policies").change(function(){
    	var dropdown = document.getElementById("policies");
    	var selectedPolicy = dropdown.options[dropdown.selectedIndex].value;
    	<%for(int i =0; i<policies.size(); i++){%>
    		if(selectedPolicy == <%= i%>){
    			tenure = <%= policies.get(i).getTenure()%>;
    			<%session.setAttribute("policy", policies.get(i));%>
    			maxNominee=<%= policies.get(i).getNumberNominees()%>;
    			document.getElementById("tenure").innerText = "Tenure: " + <%= policies.get(i).getTenure()%> + " years";
    		}
    			
    	<%}%>
    	$('#sumAssured').children().remove();
    	
    	<%for(int z =0; z<policies.size(); z++){%>
	    	if(selectedPolicy == <%= z%>){
	    		$('#sumAssured').append($('<option selected>', {value:-1, text:""}))
	    		<%for(int i = 0; i<10; i++){%>
	    			<% double val = policies.get(z).getMinSum() + 
	    			    	((i+1) * ((policies.get(z).getMaxSum() - policies.get(z).getMinSum()) / 10));%>
	    			$('#sumAssured').append($('<option>', {value:<%= val%>, text:"<%= val%>"}));
		    	<%}%>
			}
			
		<%}%>
    	
    	});
});</script>
<title>Buy a policy</title>
</head>
<body>
<h1 align="center"> Purchase <%= session.getAttribute("policyType") %> Policy</h1>

<div class = "container">
 	<div class="container-fluid" align="right"> 
				<p>
				Time: <span id="time"></span>
				Date: <span id="date"></span>
				</p>
					<script> var dt = new Date(); document.getElementById("date").innerHTML = dt.toLocaleDateString(); </script>
	</div>
	<form method = "get" action="../MainServlet">
	  <!-- TODO: Fill in with data from DB 
	  		-Domenic Garreffa  9:36 Aug 15, 2018
	  	-->
	  <!--  <div class="form-group">
	    <label for="insuranceTypes">Insurance Types</label>
	    <select class="form-control" id="insuranceTypes" name="insuranceTypes">
	      <option selected></option>
	      <option>Accidental</option>
	      <option>Term</option>
	      <option>Pension Scheme</option>
	    </select>
	  </div>-->
	  
	   
	  <!-- TODO: Fill in with data from DB 
	  		-Domenic Garreffa  9:35 Aug 15, 2018
	  	-->
	  <div class="form-group">
	    <label for="policies">Policies</label>
	    <select class="form-control" id="policies" required="required" name="policies">
	    	<option selected></option>
	    	<%for(int i = 0; i < policies.size(); i++){%>
	    		<option value=<%=i %>><%= policies.get(i).getPolicyName() %></option>
	    	<% }%>
	    </select>
	  </div>
	  
	  <!-- TODO: Fill in with data from DB 
	  		-Domenic Garreffa  9:30 Aug 15, 2018
	  	-->
	  <label id="tenure"></label>
	  
	  <div class="form-group">
	    <label for="premium">Select Premium</label>
	    <select class="form-control" required="required" id="premium" name = "premium">
	      <option selected></option>
	      <option value=4>Quarterly</option>
	      <option value=2>Half-Yearly</option>
	      <option value=1>Annually</option>
	    </select>
	  </div>
	  
	  <!-- TODO: Populate select with data from DB 
	  		-Domenic Garreffa 9:34 Aug 15, 2018
	  	-->  
	  	<!-- Min is 500 and max is 1000. Dynamically
	  	add values in increments of 100?
	  		Domenic Garreffa 4:45 Aug 14, 2018
	   -->
	 <div class="form-group">
	   <label for="sumAssured">Select Sum Assured</label>
	   <select class="form-control" id="sumAssured" name="sumAssured" required="required">
	   <option selected></option>
	   </select>
	 </div>
	  
	  <!-- TODO: Premium value is dynamically shown  
	  		-Domenic Garreffa 9:37 Aug 15, 2018
	  	--> 
	 <label id="premAmount"></label>
	  
	<!-- <div class="form-group">
	   <label for="birthCertificate">Upload birth certificate</label>
	   <input type="file" class="form-control-file" id="birthCertificate" name="birthCertificate">
	</div>
	  
	<div class="form-group">
	    <label for="panCard">Upload PAN card</label>
	    <input type="file" class="form-control-file" id="panCard" name="panCards">
	  </div> -->
	
	 <!-- TODO: Populate the check boxes with medical questions from DB  
	  		-Domenic Garreffa 9:55 Aug 15, 2018
	  	--> 
	<p> Check all that apply </p>
	<div class="form-check">
	  <input class="form-check-input" type="checkbox" value="Over 30" id="medicalDetail1" name="medicalDetails">
	  <label class="form-check-label" for="defaultCheck1">
	    Over 30?
	  </label>
	</div>
	<div class="form-check">
	  <input class="form-check-input" type="checkbox" value="Smoker" id="medicalDetail2" name="medicalDetails">
	  <label class="form-check-label" for="defaultCheck2">
	    Smoker?
	  </label>
	</div>
	
	 <!-- TODO: Populate the drop down with a list of agent IDs/possibly names 
	  		-Domenic Garreffa 10:21 Aug 15, 2018
	  	--> 
		<p>Agent ID: </p><input type="number" name="agentID">
	  
	    <!-- TODO: Policy initiation date to be dynamically added  
	  		-Domenic Garreffa 10:20 Aug 15, 2018
	  	--> 
	  	
	<p>Policy Initiation Date:</p> <input type="date" id="initDate" name="initDate" required="required">
	  <script>
	  var date = new Date();
	  var dateString = date.getFullYear()+"-0"+(date.getMonth()+1)+"-"+date.getDate();
	  console.log(dateString);
	  document.getElementById("initDate").min = dateString;</script> 
	<hr>
	<p> Nominees <p>
	<div class="form-group row">
	    <button type="button" id="addNomineeButton" class="btn btn-primary btn-sm m-2" onclick="addNominee();">Add</button>
		<button type="button" id="removeNomineeButton" class="btn btn-secondary btn-sm m-2" onclick="removeNominee();">Remove</button>
    </div>
	  <div class = "row" id = "nominees">
	  </div>
	<hr>
	<div class="form-group row">
	    <button class="btn btn-primary btn-lg" type = "submit" name="action" value="addPolicyToCustomer"> Buy Policy </button>
		<a href="customer.jsp" class="btn btn-primary btn-lg">Cancel/Back</a>	
    </div>
</form>

<!-- TODO: Redirect only if the user confirmed the purchase.  -->
	
</div>
<script src = "../javascript/PolicyValidation.js"> </script>
</body>
</html>