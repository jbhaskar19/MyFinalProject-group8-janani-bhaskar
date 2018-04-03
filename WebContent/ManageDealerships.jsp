<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
function validateDealerRegistrationForm(){
	var validation=true;
    var errormsg="";
	var count=0; 
//aDealerpassword aDealerusername aDealercountry aDealerzip aDealeremail aDealeraddress aDealerstate aDealercity aDealerphone aDealerlname aDealerfirstname

	alert("validate new dealer");
    var first = document.getElementById("aDealerfirstname").value;
	var lname = document.getElementById("aDealerlname").value;

	if (first == "") {
		count+=1;
		errormsg+="First Name must be filled out"+"\n";
    validation=false;
}

	 if (lname == "") {
			count+=1;
	    	errormsg+="Last name cannot be empty"+"\n";
	        validation=false;
	    }
	    
  if (document.getElementById("aDealerphone").value == "") {
 		count+=1;
     		errormsg+="Phone cannot be empty"+"\n";
         validation=false;
     }else 
     {
         alert(document.getElementById("aDealerphone").value);
    	  var phoneno = /^\(?([0-9]{3})\)?[- ]?([0-9]{3})[- ]?([0-9]{4})$/;
    	  if(!document.getElementById("aDealerphone").value.match(phoneno))
    	        {
    	        alert("Invalid Format,Phone number must be of the format [XXX-XXX-XXXX] or [XXX XXX XXXX]");
    	        errormsg+="Invalid Format,Phone number must be of the format [XXX-XXX-XXXX] or [XXX XXX XXXX]"+"\n";
    	        validation=false;
    	        }
    	}

	if(document.getElementById("aDealeremail").value == ""){
		count+=1;
 		errormsg+="email cannot be empty"+"\n";
     validation=false;
		}else{
		     var emailvalid= /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			if (!document.getElementById("aDealeremail").value.match(emailvalid))
			  {
			    alert("You have entered an invalid email address!");
			    errormsg+="You have entered an invalid email address!";
			    validation=false;
			  }
			}

     if (document.getElementById("aDealeraddress").value == "") {
 		count+=1;
     		errormsg+="address cannot be empty"+"\n";
         validation=false;
     }

     if (document.getElementById("aDealerstate").value == "") {
 		count+=1;
     		errormsg+="state cannot be empty"+"\n";
        validation=false;
    }

     if (document.getElementById("aDealerzip").value == "") {
 		count+=1;
    		errormsg+="zip cannot be empty"+"\n";
        validation=false;
     }

     if (document.getElementById("aDealercountry").value == "") {
 		count+=1;
     		errormsg+="country cannot be empty"+"\n";
         validation=false;
     }


     if (document.getElementById("aDealerusername").value == "") {
 		count+=1;
     		errormsg+="username cannot be empty"+"\n";
         validation=false;
              }
   
     if (document.getElementById("aDealerpassword").value == "") {
 		count+=1;
     		errormsg+="password cannot be empty"+"\n";
         validation=false;
     } 

   if(validation==false)
    { 

	   if(count ==10){
		   alert("Cannot submit empty form");
		   }
	   else
		   {
		   alert(errormsg);
		   }
    }
    else
        {
        document.newdealerForm.submit(); }

     
    return validation;
}
</script>
</head>
<body>
	<div class="mdcontainer">
	<fieldset>
	<legend>NEW DEALER REGISTRATION</legend>
		<form name="newdealerForm" onsubmit="return validateDealerRegistrationForm()" action="dealerRegistration">
			<div >
				<div >
					<label for="fname">First Name</label>
				</div>
				<div >
					<input type="text" id="aDealerfirstname" name="aDealerfirstname">
				</div>
			</div>
			
			<div >
				<div >
					<label for="lname">Last Name</label>
				</div>
				<div >
					<input type="text" id="aDealerlname" name="aDealerlname">
				</div>
			</div>

			<div >
				<div >
					<label for="Phone">Phone</label>
				</div>
				<div >
					<input type="text" id="aDealerphone" name="aDealerphone">
				</div>
			</div>
			<div >
				<div>
					<label for="Email">Email</label>
				</div>
				<div >
					<input type="text" id="aDealeremail" name="aDealeremail">
				</div>
			</div>

			<div >
				<div >
					<label for="Address">Address</label>
				</div>
				<div >
					<input type="text" id="aDealeraddress" name="aDealeraddress">
				</div>
			</div>

			<div >
				<div >
					<label for="State">State</label>
				</div>
				<div >
					<input type="text" id="aDealerstate" name="aDealerstate">
				</div>
			</div>
			
			<div >
				<div >
					<label for="State">City</label>
				</div>
				<div >
					<input type="text" id="aDealercity" name="aDealercity">
				</div>
			</div>

			<div >
				<div >
					<label for="Zip">Zip</label>
				</div>
				<div >
					<input type="text" id="aDealerzip" name="aDealerzip">
				</div>
			</div>

			<div >
				<div >
					<label for="country">Country</label>
				</div>
				<div >
					<input type="text" id="aDealercountry" name="aDealercountry">
				</div>
			</div>

			<div>
				<div>
					<label for="Username">Username</label>
				</div>
				<div >
					<input type="text" id="aDealerusername" name="aDealerusername">
				</div>
			</div>

			<div >
				<div >
					<label for="Password">Password</label>
				</div>
				<div >
					<input type="password" id="aDealerpassword" name="aDealerpassword">
				</div>
			</div>

			<div >
				<input type="submit" class="subbtn" value="ADD DEALER">
			</div>
		</form>
		</fieldset>
	</div>
</body>
</html>