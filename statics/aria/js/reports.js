function downloadMealsReport(){
	var xmlhttp;
	xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function()
	{
			if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
				window.location = 'downloadReport';
			}
	}
	xmlhttp.open("GET","/downloadReport",true);
	xmlhttp.send();
}