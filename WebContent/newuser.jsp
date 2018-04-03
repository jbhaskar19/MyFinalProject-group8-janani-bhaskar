<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REGISTRATION FORM</title>
<style>
* {
	box-sizing: border-box;
}

input[type=text], input[type=password], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

label {
	padding: 12px 12px 12px 0;
	display: inline-block;
}

input[type=submit] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: right;
}

input[type=submit]:hover {
	background-color: #45a049;
}

.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}

.col-25 {
	float: left;
	width: 25%;
	margin-top: 6px;
}

.col-75 {
	float: left;
	width: 75%;
	margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
	.col-25, .col-75, input[type=submit] {
		width: 100%;
		margin-top: 0;
	}
}
</style>
<script>
function validateRegistrationForm() {
	var validation=true;
    var errormsg="";
	var count=0; 

    var first = document.forms["newuserForm"]["fname"].value;
	var lname = document.forms["newuserForm"]["lname"].value;

	if (first == "") {
		count+=1;
		errormsg+="Name must be filled out"+"\n";
    validation=false;
}

	 if (lname == "") {
			count+=1;
	    	errormsg+="Password cannot be empty"+"\n";
	        validation=false;
	    }
  if (document.forms["newuserForm"]["phone"].value == "") {
 		count+=1;
     		errormsg+="Phone cannot be empty"+"\n";
         validation=false;
     }else 
     {
         alert(document.forms["newuserForm"]["phone"].value);
    	  var phoneno = /^\(?([0-9]{3})\)?[- ]?([0-9]{3})[- ]?([0-9]{4})$/;
    	  if(!document.forms["newuserForm"]["phone"].value.match(phoneno))

    	        {
    	        alert("Invalid Format,Phone number must be of the format [XXX-XXX-XXXX] or [XXX XXX XXXX]");
    	        errormsg+="Invalid Format,Phone number must be of the format [XXX-XXX-XXXX] or [XXX XXX XXXX]"+"\n";
    	        validation=false;
    	        }
    	}

	if(document.forms["newuserForm"]["email"].value == ""){
		count+=1;
 		errormsg+="email cannot be empty"+"\n";
     validation=false;
		}else{
		     var emailvalid= /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			if (!document.forms["newuserForm"]["email"].value.match(emailvalid))
			  {
			    alert("You have entered an invalid email address!");
			    errormsg+="You have entered an invalid email address!";
			    validation=false;
			  }
			}

     if (document.forms["newuserForm"]["address"].value == "") {
 		count+=1;
     		errormsg+="address cannot be empty"+"\n";
         validation=false;
     }

     if (document.forms["newuserForm"]["state"].value == "") {
 		count+=1;
     		errormsg+="state cannot be empty"+"\n";
        validation=false;
    }

     if (document.forms["newuserForm"]["zip"].value == "") {
 		count+=1;
    		errormsg+="zip cannot be empty"+"\n";
        validation=false;
     }

     if (document.forms["newuserForm"]["country"].value == "") {
 		count+=1;
     		errormsg+="country cannot be empty"+"\n";
         validation=false;
     }


     if (document.forms["newuserForm"]["username"].value == "") {
 		count+=1;
     		errormsg+="username cannot be empty"+"\n";
         validation=false;
              }
   
     if (document.forms["newuserForm"]["password"].value == "") {
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
        document.newuserForm.submit(); }

     
    return validation;
    
}
</script>
</head>
<body>
	<h2>NEW USER REGISTRATION</h2>
	<div class="container">
		<form name="newuserForm" onsubmit="return validateRegistrationForm()" action="RegistrationServlet">
			<div class="row">
				<div class="col-25">
					<label for="fname">First Name</label>
				</div>
				<div class="col-75">
					<input type="text" id="fname" name="firstname">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="lname">Last Name</label>
				</div>
				<div class="col-75">
					<input type="text" id="lname" name="lastname">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="Phone">Phone</label>
				</div>
				<div class="col-75">
					<input type="text" id="phone" name="ph">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="Email">Email</label>
				</div>
				<div class="col-75">
					<input type="text" id="email" name="email">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="Address">Address</label>
				</div>
				<div class="col-75">
					<input type="text" id="address" name="address">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="State">State</label>
				</div>
				<div class="col-75">
					<input type="text" id="state" name="state">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="Zip">Zip</label>
				</div>
				<div class="col-75">
					<input type="text" id="zip" name="zip">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="country">Country</label>
				</div>
				<div class="col-75">
					<input type="text" id="country" name="country">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="Username">Username</label>
				</div>
				<div class="col-75">
					<input type="text" id="username" name="username">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="Password">Password</label>
				</div>
				<div class="col-75">
					<input type="password" id="password" name="password">
				</div>
			</div>

			<div class="row">
				<input type="submit" value="Register">
			</div>
		</form>
	</div>
</body>
</html>








