function searchByName(str){
	let xhttp=new XMLHttpRequest();
	xhttp.onreadystatechange=function(){
		if(this.readyState==4 && this.status==200)
		{
			let tableBody=document.getElementById("tbody");
			tableBody.innerHTML="";
			let str=this.responseText;
			let jsonArr=JSON.parse(str);
			jsonArr.forEach(cource=>{
				let tr=document.createElement("tr");
				
				let colId=document.createElement("td");
				colId.innerHTML=""+cource.id;
				tr.appendChild(colId);
				
				let colName=document.createElement("td");
				colName.innerHTML=""+cource.courceName;
				tr.appendChild(colName);
				
				 let colDelete = document.createElement("td");
    colDelete.innerHTML =
        "<a href='delCource?cid=" + cource.id + "'>DELETE</a>";
    tr.appendChild(colDelete);
    
     let colUpdate = document.createElement("td");
    colUpdate.innerHTML =
        "<a href='upd?cid=" + cource.id +
        "&cname=" + cource.courceName +
        "'>UPDATE</a>";
    tr.appendChild(colUpdate);
    
    
				tableBody.append(tr);
			});
			console.log(this.responseText);
		}
	};
	xhttp.open("GET","search?name="+str,true);
	xhttp.send();
}