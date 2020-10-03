function downloadMealsReport(){
	var xmlhttp;
	xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function()
	{
			if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
				console.log("downloadMealsReport OK");
			}
	}
	xmlhttp.open("GET","/downloadMealsReport",true);
	xmlhttp.send();
}