/**
 * 
 */

	
	    var i = 0;
	    function updateNumber(){
			var i=document.forms["CreateFormUI"]["display"].value;
			console.log(i[0]);
			console.log(i[0]);
			if(!i.match(/^\d+$/)){
				   document.getElementById("display").value = i.substring(0,i.length-1);
			}
	    	if(i>10){
	    		document.getElementById("display").value=10;
	    	}
	    	else if(i<0){
	    		document.getElementById("display").value=0;
	    	}
	    	
	    	else if(i[0].substring(0,0)=='0' &&i[1].substring(0,0))//exist
	    		document.getElementById("display").value = i.substring(0,i.length-2)
	    		
	    }
	    
	    
	    function incNumber() {
	        if (i < 10) {
	            i++;
	        } else if (i = 10) {
	            i = 10;
	        }
	        document.getElementById("display").value = i;
	    }
	
	    
	    function decNumber() {
	        if (i > 0) {
	            --i;
	        } else if (i = 0) {
	            i = 10;
	        }
	        document.getElementById("display").value = i;
	    }
	    
	    
        function show() { document.getElementById('area').style.display = 'block'; }
        function hide() { document.getElementById('area').style.display = 'none'; }
      
	   function add() {
	     var element = document.createElement("input");
	     element.setAttribute("type", "text");
	     element.setAttribute("name", "mytext");
	     element.setAttribute("placeholder", "Please enter pre-requisite")
	     element.setAttribute("style", "width:300px")
	     element.required=true;
	     var br = document.createElement("br");
	     var spanvar = document.getElementById("myspan");
	     spanvar.appendChild(element);
	     spanvar.appendChild(br);
	    
	   }
	   function remove() {
		     var element = document.createElement("input");
		     var spanvar = document.getElementById("myspan");
		     spanvar.removeChild(myspan.childNodes[0]);
		     spanvar.removeChild(myspan.childNodes[0]);
		   }
	   function validate(){ //function to validate numeric values
		   var checkMin=document.forms["CreateFormUI"]["min"].value;
		   var checkMax=document.forms["CreateFormUI"]["max"].value;
		   var checkTenure=document.forms["CreateFormUI"]["area"].value;
		   
		   document.getElementById("cust").value = checkTenure; //set the custom value field to num entered by user

		   if(!checkMin.match(/^\d+$/)){
			   document.forms["CreateFormUI"]["min"].value= checkMin.substring(0,checkMin.length-1);
		   }
		   else if(!checkMax.match(/^\d+$/)){
			   document.forms["CreateFormUI"]["max"].value= checkMax.substring(0,checkMax.length-1);
		   }
		   else if(!checkTenure.match(/^\d+$/)){
			   document.getElementById("area").value = checkTenure.substring(0,checkTenure.length-1);
			   return;
		   }
		   else if(checkTenure[0].substring(0,0)&&checkTenure[1].substring(0,0))//exist
	    		document.getElementById("area").value = i.substring(0,i.length-2)
		   }