function updatefood(e) {
	resetUpdateFood();
    var editForm = document.getElementById('edit-form');
    // display update form
    editForm.style.display = 'block';
    // get food id to update
    var foodId = e.parentNode.parentNode.childNodes[3].innerText;
    var foodName = e.parentNode.parentNode.childNodes[5].innerText;
	if(e.parentNode.parentNode.childNodes[7].childNodes[2]){
    	var foodMeasureId = e.parentNode.parentNode.childNodes[7].childNodes[1].value;
    	var measure = e.parentNode.parentNode.childNodes[7].childNodes[3].value;
	} else {
    	var foodMeasureId = e.parentNode.parentNode.childNodes[7].childNodes[0].value;
    	var measure = e.parentNode.parentNode.childNodes[7].childNodes[1].value;
	}
	var measureId = foodMeasureId.replaceAll("\{","").replaceAll("\}","").split(" ")[0];
    var foodQtd = e.parentNode.parentNode.childNodes[9].innerText;
    var foodCho = e.parentNode.parentNode.childNodes[11].innerText;
    var foodKcal = e.parentNode.parentNode.childNodes[13].innerText;
	document.getElementById('foodIdToUpdate').value = foodId;
    document.getElementById('foodName').value = foodName;
    document.getElementById('foodMeasure').value = measure;
	for(n=0;n<document.getElementById('SelectMeasureForUpdate').options.length;n++){
		if(document.getElementById('SelectMeasureForUpdate').options[n].value == measureId){
			document.getElementById('SelectMeasureForUpdate').options[n].selected = true;
			break;
		}
	}
    document.getElementById('foodQtd').value = foodQtd;
    document.getElementById('foodCho').value = foodCho;
    document.getElementById('foodKcal').value = foodKcal;
}

function deletefood(e) {
    var deleteForm = document.getElementById('delete-form');
    deleteForm.style.display = 'block';
    var foodId = e.parentNode.parentNode.childNodes[3].innerText;
    document.getElementById('foodIdToDelete').value = foodId;
}

function resetUpdateFood(){
	document.getElementById('foodIdToUpdate').value = '';
    document.getElementById('foodName').value = '';
    document.getElementById('foodMeasure').value = '';
	document.getElementById('SelectMeasureForUpdate').selectedIndex = 0;
    document.getElementById('foodQtd').value = '';
    document.getElementById('foodCho').value = '';
    document.getElementById('foodKcal').value = '';
}