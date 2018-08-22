/**
 * Controls the cancel button to go back to view policy details page when clicked.
 */
document.getElementById("btn-cancel-change-nominee").addEventListener("click",
		function() {
			window.location.href = "customerViewPolicy.jsp";
		});

/**
 * Toggle the view of add-new-nominee form
 */
const addNomineeSection = document.getElementById("add-new-nominee");
document.getElementById("btn-show-add-nominee").addEventListener("click",
		function() {
			if (addNomineeSection.style.display === "none") {
				addNomineeSection.style.display = "block";
			} else {
				addNomineeSection.style.display = "none";
			}
		});

/**
 * Hide the view of add-new-nominee section if 
 * the button btn-cancel-add-nominee is clicked.
 */
document.getElementById("btn-cancel-add-nominee").addEventListener("click",
		function() {
			addNomineeSection.style.display = "none";
		});


var newPreview = document.querySelector("#new-upload-file-preview");
var updatePreview = document.querySelector("#update-upload-file-preview");
let newList = document.createElement('ol');
newList.id = 'newUploadFileList';
let updateList = document.createElement('ol');
updateList.id = 'updateUploadFileList';

let newFileIndex = 0;
let updateFileIndex = 0;

/** 
 * Create and update the UI of the file uploading section for adding new nominee.
 * @see validFileType(file), returnFileSize(size)
 */
function updateFilesDisplayNew(curFiles) {
	if (curFiles.length === 0) {
		var para = document.createElement('p');
		para.textContent = 'No files currently selected for upload';
		para.id = "new-no-file-message";
		newPreview.appendChild(para);
	} else {
		while(newList.firstChild) {
			newList.removeChild(newList.firstChild);
		}
		if (newPreview.contains(document.getElementById('new-no-file-message'))) {
			newPreview.removeChild(document.getElementById('new-no-file-message'));
	    }
	    if (!newPreview.contains(newList)) {
	    	newPreview.appendChild(newList);
	    }

		for (let i = 0, len = curFiles.length; i < len; i++) {
			var listItem = document.createElement('li');
			var fileInfo = document.createElement('p');
			var removeBtn = document.createElement('button');
			if (validFileType(curFiles[i])) {
				listItem.id = "newListItem" + newFileIndex;
				fileInfo.textContent = curFiles[i].name + ' ('
						+ returnFileSize(curFiles[i].size) + ')';
				removeBtn.innerHTML = "X";
				removeBtn.type = "button";
				removeBtn.class = "removeBtn";
				removeBtn.id = "newRemoveBtn-" + newFileIndex;
				newFileIndex++;
				removeBtn.onclick = function() {
					const uploadItemId = (this.id).split("-")[1];
					const newItemToRemove = document.getElementById("newListItem" + uploadItemId);
					if(newItemToRemove) {
						newItemToRemove.outerHTML = "";
					}

					const numOfListItems = newList.childElementCount;
					if (numOfListItems === 0) {
						if(newPreview.contains(newList)){
							while(newList.firstChild) {
								newList.removeChild(newList.firstChild);
							}
							// Destroy newList
							newList.outerHTML = "";
						}
						

						// Display no file message
						var para = document.createElement('p');
						para.textContent = 'No files currently selected for upload';
						para.id = "new-no-file-message";
						newPreview.appendChild(para);
					}
				};

				listItem.appendChild(fileInfo);
				listItem.appendChild(removeBtn);
				
				newList.appendChild(listItem);
			} else {
				fileInfo.textContent = curFiles[i].name
						+ ': Not a valid file type. Update your selection.';
				listItem.appendChild(fileInfo);
			}
		}
	}
}

/**
 * Create and update the UI of the file uploading section for updating nominee.
 * @see validFileType(file), returnFileSize(size)
 */
function updateFilesDisplayUpdate(curFiles) {
	if (curFiles.length === 0) {
		var para = document.createElement('p');
		para.textContent = 'No files currently selected for upload';
		para.id = "update-no-file-message";
		updatePreview.appendChild(para);
	} else {
		while(updateList.firstChild) {
			updateList.removeChild(updateList.firstChild);
		}
		if (updatePreview.contains(document.getElementById('update-no-file-message'))) {
			updatePreview.removeChild(document.getElementById('update-no-file-message'));
	    }
	    if (!updatePreview.contains(updateList)) {
	    	updatePreview.appendChild(updateList);
	    }

		for (let i = 0, len = curFiles.length; i < len; i++) {
			var listItem = document.createElement('li');
			var fileInfo = document.createElement('p');
			var removeBtn = document.createElement('button');
			if (validFileType(curFiles[i])) {
				listItem.id = "updateListItem" + updateFileIndex;
				fileInfo.textContent = curFiles[i].name + ' ('
						+ returnFileSize(curFiles[i].size) + ')';
				removeBtn.innerHTML = "X";
				removeBtn.type = "button";
				removeBtn.class = "removeBtn";
				removeBtn.id = "updateRemoveBtn-" + updateFileIndex;
				updateFileIndex++;
				removeBtn.onclick = function() {
					const uploadItemId = (this.id).split("-")[1];
					const updateItemToRemove = document.getElementById("updateListItem" + uploadItemId);
					if(updateItemToRemove) {
						updateItemToRemove.outerHTML = "";
					}

					const numOfListItems = updateList.childElementCount;
					if (numOfListItems === 0) {
						if(updatePreview.contains(updateList)){
							while(updateList.firstChild) {
								updateList.removeChild(updateList.firstChild);
							}
							// Destroy updateList
							updateList.outerHTML = "";
						}
						

						// Display no file message
						var para = document.createElement('p');
						para.textContent = 'No files currently selected for upload';
						para.id = "update-no-file-message";
						updatePreview.appendChild(para);
					}
				};

				listItem.appendChild(fileInfo);
				listItem.appendChild(removeBtn);
				
				updateList.appendChild(listItem);
			} else {
				fileInfo.textContent = curFiles[i].name
						+ ': Not a valid file type. Update your selection.';
				listItem.appendChild(fileInfo);
			}
		}
	}
}

// Define all acceptable file types
const fileTypes = [ 'application/pdf', 'image/png', 'image/jpeg', 'image/pjpeg' ];

/** 
 * Validate the file type of each file.
 * @param file 
 * @return boolean if file types are valid, return true, else return false.
 */
function validFileType(file) {
	for (var i = 0; i < fileTypes.length; i++) {
		if (file.type === fileTypes[i]) {
			return true;
		}
	}

	return false;
}

/**
 * Check the file size and format the string based on size
 * @param double number, file size
 * @return String a formatted file size with size unit bytes/KB/MB
 */
function returnFileSize(number) {
	if (number < 1024) {
		return number + ' bytes';
	} else if (number >= 1024 && number < 1048576) {
		return (number / 1024).toFixed(1) + ' KB';
	} else if (number >= 1048576) {
		return (number / 1048576).toFixed(1) + ' MB';
	}
}

const updateNomineeSection = document.getElementById("update-nominee");

/** 
 * Display update nominee section
 * @param int id: nominee id
 * @param String name: nominee name
 * @param String relationship: the relationship between nominee and customer, 
 * 		   options are Parent/Spouse/Child
 * @param String purpose: the purpose of changing a nominee
 * @param double percentage: the percentage value assigned to a nominee in a particular policy
 */
function updateNomineeById(id, name, relationship, purpose, percentage) {
	// Show update nominee form
	updateNomineeSection.style.display = "block";

	// Populate the info of the selected nominee
	document.querySelector("#update-nominee-id").value = id;
	document.querySelector("#update-nominee-name").value = name;
	document.querySelector("#update-nominee-relationship").value = relationship
			.toLowerCase();
	document.querySelector("#update-nominee-purpose").value = purpose;
	document.querySelector("#update-nominee-percentage").value = percentage;
};

// Hide update nominee section
document.querySelector("#btn-cancel-update-nominee").addEventListener("click",
		function() {
			updateNomineeSection.style.display = "none";
		});

/**
 * Delete nominee based on nominee id
 * @param int id: nominee id
 */
function deleteNomineeById(id) {
	var choice;
	if (confirm("Do you confirm to delete the selected nominee?")) {
		choice = true;
	} else {
		choice = false;
	}

	// Perform the delete action on selected nominee
}