/**
 * 
 */
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

/**
 * Ask for confirmation before adding new nominee
 * if the button btn-confirm-add-nominee is clicked.
 */
document.getElementById("btn-confirm-add-nominee").addEventListener("click",
		function() {
			var choice;
			if (confirm("Do you confirm to delete the selected nominee?")) {
				choice = true;
			} else {
				choice = false;
			}
		});

const newSelectFileBtn = document.querySelector("#new-upload-identification");
const updateSelectFileBtn = document
		.querySelector("#update-upload-identification");
var newPreview = document.querySelector("#new-upload-file-preview");
var updatePreview = document.querySelector("#update-upload-file-preview");

/** 
 * Make the select file button to be invisible 
 * and make the label to act as a button.
 */
newSelectFileBtn.style.opacity = 0;
updateSelectFileBtn.style.opacity = 0;

newSelectFileBtn.addEventListener("change", updateFilesDisplayNew);
updateSelectFileBtn.addEventListener("change", updateFilesDisplayUpdate);

/** 
 * Create and update the UI of the file uploading section for adding new nominee.
 * @see validFileType(file), returnFileSize(size)
 */
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

					const fileList = document
							.querySelector("#newUploadFileList");
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
				fileInfo.textContent = curFiles[i].name
						+ ': Not a valid file type. Update your selection.';
				listItem.appendChild(fileInfo);
			}

			list.appendChild(listItem);
		}
	}
}

/**
 * Create and update the UI of the file uploading section for updating nominee.
 * @see validFileType(file), returnFileSize(size)
 */
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

					const fileList = document
							.querySelector("#updateUploadFileList");
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
				fileInfo.textContent = 'File name ' + curFiles[i].name
						+ ': Not a valid file type. Update your selection.';
				listItem.appendChild(fileInfo);
			}

			list.appendChild(listItem);
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
		return number + 'bytes';
	} else if (number >= 1024 && number < 1048576) {
		return (number / 1024).toFixed(1) + 'KB';
	} else if (number >= 1048576) {
		return (number / 1048576).toFixed(1) + 'MB';
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