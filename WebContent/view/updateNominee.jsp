<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.policy.data.Nominee, java.util.*, com.policy.data.Policy"%>
<%
	// Retrieve Policy object from the session object
	Policy myPolicy = (Policy) session.getAttribute("policy");
	List<Nominee> policyNominees = myPolicy.getNominees();
	HttpSession hses = request.getSession();
	hses.setAttribute("NomineeList", policyNominees);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Nominees</title>
<style>
body {
	text-align: center;
}

fieldset {
	width: fit-content;
	height: fit-content;
	margin: 20px auto;
	padding: 10px 20px;
}

table {
	margin: 10px auto 10px auto;
	border-collapse: collapse;
}

button {
	margin: 10px 5px;
	padding: 5px 10px;
}

td, th {
	padding: 5px 10px;
}

table, th, td {
	border-bottom: 1px solid black;
}

#tbl-add-new-nominee th, #tbl-add-new-nominee td, #tbl-add-new-nominee {
	border: none;
	text-align: left;
}

li {
	  display: flex;
	  justify-content: space-between;
	  background: yellow;
	  margin-bottom: 15px;
	  padding: 0 15px; 
}

.uploadLbl {
	background: yellowgreen;
	padding: 10px;
}

.uploadSection {
	margin: 10px 5px;
}
</style>
<script>
	function displayOtherNew() { 
		if (document.getElementById('other-new').selected==true){
			document.getElementById('other-relationship-new').style.display = 'block'; 
		}else{
			document.getElementById('other-relationship-new').style.display = 'none'; 
		}
	}
	function displayOtherUpdate() { 
		if (document.getElementById('other-update').selected==true){
			document.getElementById('other-relationship-update').style.display = 'block'; 
		}else{
			document.getElementById('other-relationship-update').style.display = 'none'; 
		}
	}
</script>
</head>

<body>
	<fieldset>
		<legend>Policy Nominees</legend>
		<div id="show-current-nominees">
			<table>
				<tr>
					<th>Name</th>
					<th>Relationship</th>
					<th>Action</th>
				</tr>
				<%
					for (int i = 0; i < policyNominees.size(); i++) {
				%>
				<tr>
					<td><%=policyNominees.get(i).getNomineeName()%></td>
					<td><%=policyNominees.get(i).getRelationshipToCustomer()%></td>
					<td>
						<% 	
							int nomineeId = policyNominees.get(i).getNomineeId();
							String nomineeName = policyNominees.get(i).getNomineeName();
							String relationship = policyNominees.get(i).getRelationshipToCustomer();
							String purpose = policyNominees.get(i).getPurposeOfChanged();
						%>
						<button id="btnUpdate<%= nomineeId %>" onclick="updateNomineeById(
							<%= nomineeId %>, '<%= nomineeName %>' , '<%= relationship %>', '<%= purpose %>')">Update</button>
						<button id="btnDelete<%= nomineeId %>" onclick="deleteNomineeById(<%= nomineeId %>)">Delete</button>
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
		<div id="section-btns">
			<button type="submit" id="btn-show-add-nominee">Add Nominee</button>
			<button type="button" id="btn-cancel-change-nominee">Cancel</button>
		</div>
	</fieldset>
	
	<div id="add-new-nominee" style="display: none;">
		<fieldset>
			<legend>Add New Nominee</legend>
			<form method="get" id="form-add-new-nominee" enctype="multipart/form-data" action="../MainServlet">
				<table id="tbl-add-new-nominee">
					<tr>
						<td class="tbl-labels"><label for="new-nominee-name">Enter New Nominee Name</label></td>
						<td class="tbl-data"><input type="text"
							name="new-nominee-name" id="new-nominee-name" required></td>
					</tr>
					<tr>
						<td class="tbl-labels"><label for="new-nominee-relationship">Select a relationship</label></td>
						<td class="tbl-data"><select name="new-nominee-relationship"
							id="new-nominee-relationship" required onchange="displayOtherNew();">
								<option value="parent">Parent</option>
								<option value="spouse">Spouse</option>
								<option value="child">Child</option>
								<option id="other-new" value="other-new">Other</option>
						</select>
						<input type="text" name="other-relationship-new" id="other-relationship-new" style="display: none;">
						</td>
						
					</tr>
					<tr>
						<td class="tbl-labels"><label for="new-nominee-purpose">Purpose of changing the nominee</label></td>
						<td class="tbl-data"><textarea name="new-nominee-purpose"
								id="new-nominee-purpose" rows="3" cols="25"></textarea></td>
					</tr>
					<tr>
						<td class="tbl-labels" colspan="2" style="text-align: center;">
							<div class="uploadSection">
								<label class="uploadLbl" for="new-upload-identification">Upload identification (PNG, JPG, JPEG, PDF)</label> 
									<input type="file" id="new-upload-identification" name="new-upload-identification"
										accept="image/png, image/jpeg, image/pjpeg, application/pdf" 
										style="display: none;" onchange="updateFilesDisplayNew(this.files)" required>
							</div>
							<div id="new-upload-file-preview">
								<p id="new-no-file-message">No files currently selected for uploading</p>
							</div>
						</td>
					</tr>
				</table>
				<div>
					<button type="submit" id="btn-confirm-add-nominee" name="action" value="AddNominee">Add Nominee</button>
					<button type="button" id="btn-cancel-add-nominee">Cancel</button>
				</div>
			</form>
		</fieldset>
	</div>
	
	<div id="update-nominee" style="display: none;">
		<fieldset>
			<legend>Update Nominee</legend>
			<form method="get" id="form-update-nominee" enctype="multipart/form-data" action="../MainServlet">
				<table id="tbl-update-nominee">
					<tr>
						<td> </td>
						<td class="tbl-data"><input style="display:none;" type="text"
							name="update-nominee-id" id="update-nominee-id" required></td>
					</tr>
					<tr>
						<td class="tbl-labels"><label for="update-nominee-name">Name</label></td>
						<td class="tbl-data"><input type="text"
							name="update-nominee-name" id="update-nominee-name" required></td>
					</tr>
					<tr>
						<td class="tbl-labels"><label for="update-nominee-relationship">Relationship</label></td>
						<td class="tbl-data"><select name="update-nominee-relationship"
							id="update-nominee-relationship" onchange=displayOtherUpdate();>
								<option value="parent" selected>Parent</option>
								<option value="spouse">Spouse</option>
								<option value="child">Child</option>
								<option id="other-update" value="other-update">Other</option>
						</select>
						<input type="text" name="other-relationship-update" id="other-relationship-update" style="display: none;">
						</td>
					</tr>
					<tr>
						<td class="tbl-labels"><label for="update-nominee-purpose">Purpose of changing the nominee</label></td>
						<td class="tbl-data"><textarea name="update-nominee-purpose"
								id="update-nominee-purpose" rows="3" cols="25"></textarea></td>
					</tr>
					<tr>
						<td class="tbl-labels" colspan="2" style="text-align: center;">
							<div class="uploadSection">
								<label class="uploadLbl" for="update-upload-identification">Upload identification (PNG, JPG, JPEG, PDF)
								</label> 
								<input type="file" id="update-upload-identification" name="update-upload-identification"
									accept="image/png, image/jpeg, image/pjpeg, application/pdf"
									style="display: none;" onchange="updateFilesDisplayUpdate(this.files)" required>
							</div>
							<div id="update-upload-file-preview">
								<p id="update-no-file-message">No files currently selected for uploading</p>
							</div>
						</td>
					</tr>
				</table>
				<div>
					<button type="submit" id="btn-confirm-update-nominee" name="action" value="UpdateNominee">Update Nominee</button>
					<button type="button" id="btn-cancel-update-nominee">Cancel</button>
				</div>
			</form>
		</fieldset>
	</div>
	<script src="../javascript/updateNomineeDOM.js"></script>
	
</body>
</html>