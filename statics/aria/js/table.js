
function wipeRows(tableID) {
	let tableRef = document.getElementById(tableID);
	for(i=0;i<items.length;i++){
		tableRef.deleteRow(1);
	}
}

function addRow(tableID, foodName) {
	let tableRef = document.getElementById(tableID);
	let newRow = tableRef.insertRow(-1);
	order = items.length-1;
	item = items[order];
	// alimento
	let newCell = newRow.insertCell(0);
	let newText = document.createTextNode(foodName);
	var jsonItem = JSON.stringify(item);
	jsonItem = jsonItem.split(',').join('#');
	jsonItem = jsonItem.split('"').join('');
	jsonItem = jsonItem.split('{').join('');
	jsonItem = jsonItem.split('}').join('');
	newCell.appendChild(newText);
	//alert(item.id+", "+item.qtdMedida);
	newCell.innerHTML = '<input type="hidden" name="item'+item.id+'" value="'+jsonItem+'"/>'+newCell.innerHTML;
	newCell.innerHTML = '<input type="hidden" name="foodid" value="'+item.foodId+'"/>'+newCell.innerHTML;
	newCell.innerHTML = '<input type="hidden" name="id" value="'+item.id+'"/>'+newCell.innerHTML;
	newCell.innerHTML = '<input type="hidden" name="order" value="'+order+'"/>'+newCell.innerHTML;
	// qtdMedida
	newCell = newRow.insertCell(1);
	// alert(item.qtdMedida);
	newText = document.createTextNode(item.qtdMedida);
	newCell.appendChild(newText);
	// qtd
	newCell = newRow.insertCell(2);
	//alert(item.qtd);
	newText = document.createTextNode(item.qtd);
	newCell.appendChild(newText);
	// cho
	newCell = newRow.insertCell(3);
	// alert(item.cho);
	newText = document.createTextNode(item.cho);
	newCell.appendChild(newText);
	// kcal
	newCell = newRow.insertCell(4);
	// alert(item.kcal);
	newText = document.createTextNode(item.kcal);
	newCell.appendChild(newText);
	// Botões
	newCell = newRow.insertCell(5);
	// Botão Editar
	var btnEditar = document.createElement('input');
	btnEditar.type = "button";
	btnEditar.style = "margin-right: 10px";
	btnEditar.className = "w3-btn w3-teal";
	btnEditar.value = "Editar";
	btnEditar.onclick = function() {updateitem(btnEditar)};
	newCell.appendChild(btnEditar);
	// Botão Apagar
	var btnApagar = document.createElement('input');
	btnApagar.type = "button";
	btnApagar.className = "w3-btn w3-red";
	btnApagar.value = "Apagar";
	btnApagar.onclick = function() {showDeleteItemForm(btnApagar)};
	newCell.appendChild(btnApagar);
}

function updateRow(tableID, order, foodName){
	let tableRef = document.getElementById(tableID);
	let rowNumber = 3+parseInt(order);
	let row = tableRef.childNodes[1].childNodes[rowNumber];
	let celula = row.childNodes[0];
	celula.innerText = foodName;
	var jsonItem = JSON.stringify(items[order]);
	jsonItem = jsonItem.split(',').join('#');
	jsonItem = jsonItem.split('"').join('');
	jsonItem = jsonItem.split('{').join('');
	jsonItem = jsonItem.split('}').join('');
	celula.innerHTML = '<input type="hidden" name="item'+order+'" value="'+jsonItem+'"/>'+celula.innerHTML;
	celula.innerHTML = '<input type="hidden" name="foodid" value="'+items[order].foodId+'"/>'+celula.innerHTML;
	celula.innerHTML = '<input type="hidden" name="id" value="'+items[order].id+'"/>'+celula.innerHTML;
	celula.innerHTML = '<input type="hidden" name="order" value="'+order+'"/>'+celula.innerHTML;
	row.childNodes[1].innerText = items[order].qtdMedida;
	row.childNodes[2].innerText = items[order].qtd;
	row.childNodes[3].innerText = items[order].cho;
	row.childNodes[4].innerText = items[order].kcal;
}