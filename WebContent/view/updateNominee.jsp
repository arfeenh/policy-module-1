<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.policy.data.Nominee, java.util.*, com.policy.data.Policy"%>
<%
	// Retrieve Policy object from the session object
	Policy myPolicy = (Policy) session.getAttribute("policy");
	List<Nominee> policyNominees = myPolicy.getNominees();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
</style>
</head>
<body>
	<fieldset>
		<legend>Policy Nominees</legend>
		<div id="show-current-nominees">
			<table>
				<tr>
					<th>Name</th>
					<th>Relationship</th>
					<th>Percentage</th>
					<th>Action</th>
				</tr>
				<%
					for (int i = 0; i < policyNominees.size(); i++) {
				%>
				<tr>
					<td><%=policyNominees.get(i).getNomineeName()%></td>
					<td><%=policyNominees.get(i).getRelationshipToCustomer()%></td>
					<td><%=policyNominees.get(i).getPercentage()%></td>
					<td>
						<% 	int nomineeId = policyNominees.get(i).getNomineeId(); 
							String nomineeName = policyNominees.get(i).getNomineeName();
							String relationship = policyNominees.get(i).getRelationshipToCustomer();
							String purpose = policyNominees.get(i).getPurposeOfChanged();
							double percentage = policyNominees.get(i).getPercentage();
						%>
						<button id="btnUpdate<%= nomineeId %>" onclick="updateNomineeById(
							<%= nomineeId %>, '<%= nomineeName %>' , '<%= relationship %>', '<%= purpose %>', '<%= percentage %>')">Update</button>
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
			<form action="" method="POST" id="form-add-new-nominee">
				<table id="tbl-add-new-nominee">
					<tr>
						<td class="tbl-labels"><label for="new-nominee-name">Enter
								New Nominee Name</label></td>
						<td class="tbl-data"><input type="text"
							name="new-nominee-name" id="new-nominee-name" required></td>
					</tr>
					<tr>
						<td class="tbl-labels"><label for="new-nominee-relationship">Select a relationship</label></td>
						<td class="tbl-data"><select name="new-nominee-relationship"
							id="new-nominee-relationship" required>
								<option value="parent">Parent</option>
								<option value="spouse">Spouse</option>
								<option value="child">Child</option>
						</select></td>
					</tr>
					<tr>
						<td class="tbl-labels"><label for="new-nominee-purpose">Purpose
								of changing the nominee</label></td>
						<td class="tbl-data"><textarea name="new-nominee-purpose"
								id="new-nominee-purpose" rows="3" cols="25"></textarea></td>
					</tr>
					<tr>
						<td class="tbl-labels"><label for="new-nominee-percentage">Enter
								a percentage between 1 and 100</label></td>
						<td class="tbl-data"><input type="text"
							id="new-nominee-percentage" name="new-nominee-percentage"
							required></td>
					</tr>
					<tr>
						<td class="tbl-labels" colspan="2" style="text-align: center;">
							<div>
								<label for="new-upload-identification">Upload
									identification (PNG, JPG, JPEG, PDF)</label> <input type="file"
									id="new-upload-identification"
									name="new-upload-identification"
									accept="image/png, image/jpeg, image/pjpeg, application/pdf"
									required>
							</div>
							<div id="new-upload-file-preview">
								<p id="new-no-file-message">No files currently selected for
									uploading</p>
							</div>
						</td>
					</tr>
				</table>
				<div>
					<button type="submit" id="btn-confirm-add-nominee">Confirm Add Nominee</button>
					<button type="button" id="btn-cancel-add-nominee">Cancel</button>
				</div>
			</form>
		</fieldset>
	</div>
	
	<div id="update-nominee" style="display: none;">
		<fieldset>
			<legend>Update Nominee</legend>
			<form action="" method="POST" id="form-update-nominee">
				<table id="tbl-update-nominee">
					<tr>
						<td class="tbl-labels"><label for="update-nominee-name">Name</label></td>
						<td class="tbl-data"><input type="text"
							name="update-nominee-name" id="update-nominee-name" required></td>
					</tr>
					<tr>
						<td class="tbl-labels"><label for="update-nominee-relationship">Relationship</label></td>
						<td class="tbl-data"><select name="update-nominee-relationship"
							id="update-nominee-relationship" required>
								<option value="parent">Parent</option>
								<option value="spouse">Spouse</option>
								<option value="child">Child</option>
						</select></td>
					</tr>
					<tr>
						<td class="tbl-labels"><label for="update-nominee-purpose">Purpose
								of changing the nominee</label></td>
						<td class="tbl-data"><textarea name="update-nominee-purpose"
								id="update-nominee-purpose" rows="3" cols="25"></textarea></td>
					</tr>
					<tr>
						<td class="tbl-labels"><label for="update-nominee-percentage">Percentage</label></td>
						<td class="tbl-data"><input type="text"
							id="update-nominee-percentage" name="update-nominee-percentage"
							required></td>
					</tr>
					<tr>
						<td class="tbl-labels" colspan="2" style="text-align: center;">
							<div>
								<label for="update-upload-identification">Upload
									identification (PNG, JPG, JPEG, PDF)</label> <input type="file"
									id="update-upload-identification"
									name="update-upload-identification"
									accept="image/png, image/jpeg, image/pjpeg, application/pdf"
									required>
							</div>
							<div id="update-upload-file-preview">
								<p id="update-no-file-message">No files currently selected for
									uploading</p>
							</div>
						</td>
					</tr>
				</table>
				<div>
					<button type="submit" id="btn-confirm-update-nominee">Update Nominee</button>
					<button type="button" id="btn-cancel-update-nominee">Cancel</button>
				</div>
			</form>
		</fieldset>
	</div>

	<script>
		// Controls the cancel button to go back to view policy details page when clicked
		document.getElementById("btn-cancel-change-nominee").addEventListener(
				"click", function() {
					window.location.href = "customerViewPolicy.jsp";
				});

		// Toggle the view of add new nominee page
		const addNomineeSection = document.getElementById("add-new-nominee");
		document.getElementById("btn-show-add-nominee").addEventListener(
				"click", function() {
					if (addNomineeSection.style.display === "none") {
						addNomineeSection.style.display = "block";
					} else {
						addNomineeSection.style.display = "none";
					}
				});

		// Hide the view of add new nominee page
		document.getElementById("btn-cancel-add-nominee").addEventListener(
				"click", function() {
					addNomineeSection.style.display = "none";
				});

		// Ask for confirmation before adding new nominee
		document.getElementById("btn-confirm-add-nominee").addEventListener(
				"click", function() {
					var choice;
				    if (confirm("Do you confirm to delete the selected nominee?")) {
				    	choice = true;
				    } else {
				        choice = false;
				    }
				});

		const newSelectFileBtn = document.querySelector("#new-upload-identification");
		const updateSelectFileBtn = document.querySelector("#update-upload-identification");
		var newPreview = document.querySelector("#new-upload-file-preview");
		var updatePreview = document.querySelector("#update-upload-file-preview");

		// Make the select file button to be invisible and make the label to act as a button
		newSelectFileBtn.style.opacity = 0;
		updateSelectFileBtn.style.opacity = 0;

		newSelectFileBtn.addEventListener("change", updateFilesDisplayNew);
		updateSelectFileBtn.addEventListener("change", updateFilesDisplayUpdate);
		
		// Make the UI of upload file section
		function updateFilesDisplayNew() {
			const curFiles = newSelectFileBtn.files;
			
			if (curFiles.length === 0) {
				var para = document.createElement('p');
				para.textContent = 'No files currently selected for upload';
				para.id = "new-no-file-message";
				newPreview.appendChild(para);
			} else {
				document.getElementById("new-no-file-message").outerHTML = "";
				var list = document.createElement('ol');
				list.id = "newUploadFileList";
				list.style = "list-style-type:none";
				newPreview.appendChild(list);
				
				for (var i = 0; i < curFiles.length; i++) {
					var listItem = document.createElement('li');
					var fileInfo = document.createElement('span');
					var removeBtn = document.createElement('button');
					if (validFileType(curFiles[i])) {
						listItem.id = "newListItem" + i;
						fileInfo.textContent = curFiles[i].name + ' ('
								+ returnFileSize(curFiles[i].size) + ')';
						removeBtn.innerHTML = "X";
						removeBtn.type = "button";
						removeBtn.style = "margin: 20px;";
						removeBtn.id = "newRemoveBtn-" + i;
						removeBtn.onclick = function() {
							const uploadItemId = (this.id).split("-")[1];
							document.getElementById("newListItem" + uploadItemId).outerHTML = "";

							const fileList = document.querySelector("#newUploadFileList");
							const numOfListItems = fileList.childElementCount;
							if (numOfListItems === 0) {
								// Destroy filelist
								fileList.outerHTML = "";

								// Display no file message
								var para = document.createElement('p');
								para.textContent = 'No files currently selected for upload';
								para.id = "new-no-file-message";
								newPreview.appendChild(para);
							}
						};

						listItem.appendChild(fileInfo);
						listItem.appendChild(removeBtn);
					} else {
						fileInfo.textContent = 'File name '
								+ curFiles[i].name
								+ ': Not a valid file type. Update your selection.';
						listItem.appendChild(fileInfo);
					}

					list.appendChild(listItem);
				}
			}
		}
		
		function updateFilesDisplayUpdate() {
			const curFiles = updateSelectFileBtn.files;
			
			if (curFiles.length === 0) {
				var para = document.createElement('p');
				para.textContent = 'No files currently selected for upload';
				para.id = "update-no-file-message";
				updatePreview.appendChild(para);
			} else {
				document.getElementById("update-no-file-message").outerHTML = "";
				var list = document.createElement('ol');
				list.id = "updateUploadFileList";
				list.style = "list-style-type:none";
				updatePreview.appendChild(list);
				
				for (var i = 0; i < curFiles.length; i++) {
					var listItem = document.createElement('li');
					var fileInfo = document.createElement('span');
					var removeBtn = document.createElement('button');
					if (validFileType(curFiles[i])) {
						listItem.id = "updateListItem" + i;
						fileInfo.textContent = curFiles[i].name + ' ('
								+ returnFileSize(curFiles[i].size) + ')';
						removeBtn.innerHTML = "X";
						removeBtn.type = "button";
						removeBtn.style = "margin: 20px;";
						removeBtn.id = "updateRemoveBtn-" + i;
						removeBtn.onclick = function() {
							const uploadItemId = (this.id).split("-")[1];
							document.getElementById("updateListItem" + uploadItemId).outerHTML = "";

							const fileList = document.querySelector("#updateUploadFileList");
							const numOfListItems = fileList.childElementCount;
							if (numOfListItems === 0) {
								// Destroy filelist
								fileList.outerHTML = "";

								// Display no file message
								var para = document.createElement('p');
								para.textContent = 'No files currently selected for upload';
								para.id = "update-no-file-message";
								updatePreview.appendChild(para);
							}
						};

						listItem.appendChild(fileInfo);
						listItem.appendChild(removeBtn);
					} else {
						fileInfo.textContent = 'File name '
								+ curFiles[i].name
								+ ': Not a valid file type. Update your selection.';
						listItem.appendChild(fileInfo);
					}

					list.appendChild(listItem);
				}
			}
		}

		// Define all acceptable file types
		const fileTypes = [ 'application/pdf', 'image/png', 'image/jpeg',
				'image/pjpeg' ]

		// Validate the file type of each file
		function validFileType(file) {
			for (var i = 0; i < fileTypes.length; i++) {
				if (file.type === fileTypes[i]) {
					return true;
				}
			}

			return false;
		}

		// Return a formatted file size with size unit bytes/KB/MB
		function returnFileSize(number) {
			if (number < 1024) {
				return number + 'bytes';
			} else if (number >= 1024 && number < 1048576) {
				return (number / 1024).toFixed(1) + 'KB';
			} else if (number >= 1048576) {
				return (number / 1048576).toFixed(1) + 'MB';
			}
		}
		
		// Display update nominee section
		// @params int id: nominee id
		const updateNomineeSection = document.getElementById("update-nominee");
		function updateNomineeById(id, name, relationship, purpose, percentage) {
			// Show update nominee form
			updateNomineeSection.style.display = "block";
			
			// Populate the info of the selected nominee
			document.querySelector("#update-nominee-name").value = name;
			document.querySelector("#update-nominee-relationship").value = relationship.toLowerCase();
			document.querySelector("#update-nominee-purpose").value = purpose;
			document.querySelector("#update-nominee-percentage").value = percentage;
		};
		
		// Hide update nominee section
		document.querySelector("#btn-cancel-update-nominee").addEventListener("click", function() {
			updateNomineeSection.style.display = "none";
			
		});
		
		// Delete nominee based on nominee id
		// @params int id: nominee id
		function deleteNomineeById(id) {
			var choice;
		    if (confirm("Do you confirm to delete the selected nominee?")) {
		    	choice = true;
		    } else {
		        choice = false;
		    }
		    
		    // Perform the delete action on selected nominee
		}
	</script>
</body>
</html>