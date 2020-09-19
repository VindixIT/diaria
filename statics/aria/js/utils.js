function regraDeTresQtd(e, form){
	var a = document.getElementById('alimento-'+form);
	var id = a.options[a.selectedIndex].value;
	for(n=0;n<ar.length;n++){
		if(ar[n].split("#")[0] == id){
			var array = ar[n].split("#")
			var qtd = array[2];
			var cho = array[3];
			var kcal = array[4];
			break;
		}
	}
	var qtdInformada = e.value;
	var qtdMedidaInput = document.getElementById('qtdMedida-'+form);
	qtdMedidaInput.readOnly = true;
	qtdMedidaInput.disabled = true;
	var x = cho*qtdInformada/qtd;
	x = Math.round((x + Number.EPSILON) * 100) / 100
	var y = kcal*qtdInformada/qtd;
	y = Math.round((y + Number.EPSILON) * 100) / 100
	var cho = document.getElementById('cho-'+form);
	cho.value = x;
	var kcal = document.getElementById('kcal-'+form);
	kcal.value = y;
}

function regraDeTresMedida(e,form){
	var id = document.getElementById('alimento-'+form).value;
	for(n=0;n<ar.length;n++){
		if(ar[n].split("#")[0] == id){
			var array = ar[n].split("#")
			var qtd = array[2];
			var cho = array[3];
			var kcal = array[4];
			break;
		}
	}
	var qtdInformada = e.value;
	var qtdInput = document.getElementById('qtd-'+form);
	qtdInput.readOnly = true;
	qtdInput.disabled = true;
	qtdInput.value = qtd*qtdInformada;
	var x = cho*qtdInformada/qtd;
	var y = kcal*qtdInformada/qtd;
	var choInput = document.getElementById('cho-'+form);
	x = Math.round((x + Number.EPSILON) * 100) / 100
	choInput.value = x;
	var kcalInput = document.getElementById('kcal-'+form);
	y = Math.round((y + Number.EPSILON) * 100) / 100
	kcalInput.value = y;
}

function convertDate(dt){
	var parts = dt.split("/");
	var dia = parts[0];
	var mes = parts[1];
	var ano = parts[2];
	return ano+"-"+mes+"-"+dia;
}

function resetFields(form){
	document.getElementById('qtdMedida-'+form).value='';
	document.getElementById('qtd-'+form).value='';
	document.getElementById('cho-'+form).value='';
	document.getElementById('kcal-'+form).value='';
}

function setTime(){
	if(document.getElementById("DateForInsert")){
		var now = new Date();
		document.getElementById("DateForInsert").value= now.format('yyyy-mm-dd');
		dateFormat.masks.hammerTime = 'HH:MM';
		var vl = now.format("hammerTime");
		document.getElementById("StartAtForInsert").value= vl;
	}
}