
var item_tobe_deleted;
	
class Item {
	constructor(id, mealId, foodId, foodName, qtdMedida, qtd, cho, kcal, star) {
		this.id = id;
		this.mealId = mealId;
		this.foodId = foodId;
		this.foodName = foodName;
		this.qtdMedida = qtdMedida;
		this.qtd = qtd;
		this.cho = cho;
		this.kcal = kcal;
		this.star = star;
	}
}

function criarItem(){
	var a = document.getElementById('alimento-create');
	var foodId = a.options[a.selectedIndex].value;
	var foodName = a.options[a.selectedIndex].text;
	var qtdMedida = document.getElementById('qtdMedida-create').value;
	var qtd = document.getElementById('qtd-create').value;
	var cho = document.getElementById('cho-create').value;
	var kcal = document.getElementById('kcal-create').value;
	var erros = '';
	if(foodId=='' || qtd == ''){
		if(foodId==''){
			erros += 'Falta preencher o alimento.\n';
		}
		if(qtd==''){
			erros += 'Falta preencher a quantidade.\n';
		}
		alert(erros);
		return;
	}
	item = new Item(items.length, "", foodId, "", qtdMedida, qtd, cho, kcal, false);
	items.push(item);
	addRow("table-items-"+contexto, foodName);
	limparCamposItemForm('create');
	document.getElementById('create-item-form').style.display='none';
}

function updateItem(){
	var a = document.getElementById('alimento-edit');
	var id = document.getElementById('id-edit').value;
	var mealid = document.getElementById('meal-id-edit').value;
	var foodid = a.options[a.selectedIndex].value;
	var foodName = a.options[a.selectedIndex].text;
	var qtdMedida = document.getElementById('qtdMedida-edit').value;
	var qtd = document.getElementById('qtd-edit').value;
	var cho = document.getElementById('cho-edit').value;
	var kcal = document.getElementById('kcal-edit').value;
	var order = document.getElementById('order-edit').value;
	var erros = '';
	if(foodid=='' || qtd == ''){
		if(foodid==''){
			erros += 'Falta preencher o alimento.\n';
		}
		if(qtd==''){
			erros += 'Falta preencher a quantidade.\n';
		}
		alert(erros);
		return;
	}
	item = new Item(id, mealid, foodid, "", qtdMedida, qtd, cho, kcal, false);
	items[order]=item;
	updateRow("table-items-"+contexto,order,foodName);
	limparCamposItemForm('edit');
	document.getElementById('edit-item-form').style.display='none';
}

function limparCamposItemForm(form){
	var f = document.getElementById('favItem-'+form);
	f.options[f.selectedIndex].selected = false;
	var a = document.getElementById('alimento-'+form);
	a.options[a.selectedIndex].selected = false;
	document.getElementById('qtdMedida-'+form).value = "";
	document.getElementById('qtd-'+form).value = "";
	document.getElementById('cho-'+form).value = "";
	document.getElementById('kcal-'+form).value = "";
}


function showDeleteItemForm(e){
	var deleteItemForm = document.getElementById('delete-item-form');
	deleteItemForm.style.display = 'block';
	item_tobe_deleted = e;
}

function deleteitem() {
	var order = item_tobe_deleted.parentNode.parentNode.childNodes[0].childNodes[0].value;
	var newItems = [];
	for(i=0;i<items.length;i++){
		if(i != order){
			newItems.push(items[i]);
		}
	}
	items = newItems;
	item_tobe_deleted.parentNode.parentNode.innerHTML = '';
	var deleteItemForm = document.getElementById('delete-item-form');
	deleteItemForm.style.display = 'none';
}


function editItem(e) {
	var editItemForm = document.getElementById('edit-item-form');
	editItemForm.style.display = 'block';
	var id = e.parentNode.parentNode.childNodes[1].childNodes[1].value;
	// alert('id: '+id);
	var mealId = document.getElementById('MealIdForUpdate').value;
	// alert('mealId: '+mealId);
	var foodId = e.parentNode.parentNode.childNodes[1].childNodes[2].value;
	// alert('foodId: '+foodId);
	var order = e.parentNode.parentNode.childNodes[1].childNodes[0].value;
	// alert('order: '+order);
	var qtdMedida = e.parentNode.parentNode.childNodes[2].innerText;
	// alert('qtdMedida: '+qtdMedida);
	var qtd = e.parentNode.parentNode.childNodes[3].innerText;
	// alert('qtd: '+qtd);
	var cho = e.parentNode.parentNode.childNodes[4].innerText;
	// alert('cho: '+cho);
	var kcal = e.parentNode.parentNode.childNodes[5].innerText;
	//alert('kcal: '+kcal);
	// Atribuindo os valores de edit-item-form
	document.getElementById('id-edit').value=id;
	document.getElementById('meal-id-edit').value=mealId;
	var options = document.getElementById('alimento-edit').options;
	for(i=0;i<options.length;i++){
		if(options[i].value == foodId){
			options[i].selected = true;
			break;
		}	
	}
	document.getElementById('qtd-edit').value=qtd;
	document.getElementById('qtdMedida-edit').value=qtdMedida;
	document.getElementById('cho-edit').value=cho;
	document.getElementById('kcal-edit').value=kcal;
	document.getElementById('order-edit').value=order;
}

function loadItensByMealId(idMeal){
	var xmlhttp;
	xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function()
	{
			if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
				var itemsEdit = JSON.parse(xmlhttp.responseText);
				wipeRows("table-items-"+contexto)
				items = [];
				for(order = 0;order<itemsEdit.length;order++){
					items[order]=itemsEdit[order];
					addRow("table-items-"+contexto, items[order].foodName);
				}
			return items;
			}
	}
	xmlhttp.open("GET","/updateMeal?idMeal="+idMeal,true);
	xmlhttp.send();
}


function markItemAsFavorite(item, mealTypeId, starred){
	var xmlhttp;
	xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function()
	{
			if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
				console.log("markAsFavorite OK");
			}
	}
	xmlhttp.open("GET","/markItemAsFavorite?mealTypeId="+mealTypeId+"&foodId="+item.foodId+"&qtd="+item.qtd+"&qtdMedida="+item.qtdMedida+"&selected="+starred,true);
	xmlhttp.send();
}

function preencherItemFavorito(favItemId){
	for(n=0;n<favitems_ar.length;n++){
		favId = favitems_ar[n];
		if(favId){
			// Fiz aqui para saber onde está travando.
			let f = favId.split('#');
			if(f[0]==favItemId){
				// {{$favItem.Id}}#{{$favItem.FoodId}}#{{$favItem.FoodName}}#{{$favItem.MealTypeId}}#{{$favItem.MealTypeName}}#{{$favItem.QtdMedida}}#{{$favItem.Qtd}}#{{$favItem.AuthorId}}
				let foodId = f[1];
				document.getElementById('alimento-'+contexto).value = foodId;
				let qtdMedida = f[5];
				document.getElementById('qtdMedida-'+contexto).value = qtdMedida;
				regraDeTresMedida(document.getElementById('qtdMedida-'+contexto),contexto);
				return;
			}
		}
	}
}