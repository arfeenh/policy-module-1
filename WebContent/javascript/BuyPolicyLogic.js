/*
 * Created by Domenic Garreffa on August 15, 2018
 */

var nomineeForm = `
	<div class="card-header">
	<!--  Name  -->
	 	<div class="form-group">
		    <label for="name">Enter nominee name</label>
		    <input type="text" required="required" class="form-control" id="name" name="nomineeName" >
	 	</div>
	</div>
	<div class="col card-body">
	 	<!-- Relationship -->
	 	<div class="form-group">
		   <label for="relationship">Select relationship</label>
		   <select class="form-control" required="required" id="relationship" name="relationship">
			    <option>Parent</option>
			    <option>Spouse</option>
		      	<option>Child</option>
		   </select>
		 </div>
		 
		 <!--  Purpose  -->
	 	<div class="form-group">
		    <label for="purpose">Purpose</label>
			<textarea id="purpose" name="purpose" required="required" class="form-control" rows="2" id="comment"></textarea>  	
	   </div>
	</div>
	</div>`;

	var numberOfNominees = 0;
	//TODO - Change this number based off 
	var maxNumberOfNominees = 3; //Get from DB

	function addNominee(){
		numberOfNominees++;
		if(numberOfNominees > maxNominee){
			numberOfNominees = maxNominee;
			return;
		}
		
		var updatedNomineeForm = '<div class="col card m-1" id = "nominee' + numberOfNominees + '">' + nomineeForm; 
		var nominees = document.getElementById("nominees");
		nominees.insertAdjacentHTML('beforeend', updatedNomineeForm);
	}
	
	function removeNominee(){
		if(numberOfNominees <= 0){
			return;
		}
		var nominee = document.getElementById("nominee" + numberOfNominees);
		numberOfNominees--;
		nominee.remove();
		
	}
	
	
	function promptUserBeforeBuying(){
		window.confirm("Are you sure you want to submit?");
	}