<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DEALERSHIP REGISTRATION</title>
</head>
<style>
.mdcontainer {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}

.subbtn {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: right;
}

}
</style>
<script>
function validateDealershipRegistration(){
	var validation=true;
    var errormsg="";
	var count=0; 
alert("hai");	
//dealshpfirstname dealshpphone dealshpaddress dealshpcity dealshpstate dealshpzip dealshpcountry

alert(document.getElementById("dealshpfirstname").value+" "+document.getElementById("dealshpphone").value+" "+document.getElementById("dealshpaddress").value
		+" "+document.getElementById("dealshpcity").value+" "+document.getElementById("dealshpstate").value+" "+document.getElementById("dealshpzip").value
		+" "+document.getElementById("dealshpcountry").value);
	

 if (document.getElementById("dealshpfirstname").value == "") {
	count+=1;
	errormsg+="First Name must be filled out"+"\n";
validation=false;
}

if (document.getElementById("dealshpphone").value == "") {
		count+=1;
 		errormsg+="Phone cannot be empty"+"\n";
     validation=false;
 }else 
 {
     alert(document.getElementById("dealshpphone").value);
	  var phoneno = /^\(?([0-9]{3})\)?[- ]?([0-9]{3})[- ]?([0-9]{4})$/;
	  if(!document.getElementById("dealshpphone").value.match(phoneno))
	        {
	        alert("Invalid Format,Phone number must be of the format [XXX-XXX-XXXX] or [XXX XXX XXXX]");
	        errormsg+="Invalid Format,Phone number must be of the format [XXX-XXX-XXXX] or [XXX XXX XXXX]"+"\n";
	        validation=false;
	        }
	}
//dealshpfname  dealshplastname dealshpphone dealshpaddress dealshpstate dealshpcountry

 if (document.getElementById("dealshpaddress").value== "") {
 		count+=1;
     		errormsg+="address cannot be empty"+"\n";
         validation=false;
     }

     if (document.getElementById("dealshpstate").value == "") {
 		count+=1;
     		errormsg+="state cannot be empty"+"\n";
        validation=false;
    }

     if (document.getElementById("dealshpzip").value == "") {
 		count+=1;
    		errormsg+="zip cannot be empty"+"\n";
        validation=false;
     }

     if (document.getElementById("dealshpcountry").value== "") {
 		count+=1;
     		errormsg+="country cannot be empty"+"\n";
         validation=false;
     }

if (document.getElementById("dealshpcity").value== "") {
 		count+=1;
     		errormsg+="City cannot be empty"+"\n";
         validation=false;
     }
 if(validation==false)
 { 

	   if(count ==7){
		   alert("Cannot submit empty form");
		   }
	   else
		   {
		   alert(errormsg);
		   }
 }
 else
     {
     document.newDealershipForm.submit(); } 

  
 return validation;
}
</script>
<body>
	<div class="mdcontainer">
<fieldset>
	<legend>NEW DEALERSHIP REGISTRATION</legend>
<!-- 	onsubmit="return validateRegistrationForm()"
 -->			<form name="newDealershipForm" action="dealershipRegistration"  onclick="return validateDealershipRegistration()">
			<div >
				<div >
					<label for="fname">First Name</label>
				</div>
				<div >
					<input type="text" id="dealshpfirstname" name="dealshpfirstname">
				</div>
			</div>
			
			<%-- <div >
				<div >
					<label for="fname">Dealer ID</label>
				</div>
				<div >
					<input type="text" id="dealshpdId" name="dealshpdId" value=<%=request.getSession().getAttribute("newDealaerID") %> disabled>
				</div>
			</div> --%>
			<div >
				<div >
					<label for="Phone">Phone</label>
				</div>
				<div >
					<input type="text" id="dealshpphone" name="dealshpphone">
				</div>
			</div>
			<div >
				<div >
					<label for="Address">Address</label>
				</div>
				<div >
					<input type="text" id="dealshpaddress" name="dealshpaddress">
				</div>
			</div>

			<div >
				<div >
					<label for=City>City</label>
				</div>
				<div >
					<input type="text" id="dealshpcity" name="dealshpcity">
				</div>
			</div>
			<div >
				<div >
					<label for="State">State</label>
				</div>
				<div >
					<input type="text" id="dealshpstate" name="dealshpstate">
				</div>
			</div>

			<div >
				<div >
					<label for="Zip">Zip</label>
				</div>
				<div >
					<input type="text" id="dealshpzip" name="dealshpzip">
				</div>
			</div>

			<div >
				<div >
					<label for="country">Country</label>
				</div>
				<div >
					<input type="text" id="dealshpcountry" name="dealshpcountry">
				</div>
			</div>
			<div >
				<input type="submit" class="subbtn"  value="ADD DEALERSHIP">
			</div>
		</form>
	</fieldset>
		</div>
</body>
</html>