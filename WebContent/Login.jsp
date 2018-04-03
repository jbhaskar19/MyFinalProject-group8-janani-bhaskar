<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.alert {
    padding: 20px;
    color: white;
}
body {
	font-family: Arial, Helvetica, sans-serif;
}

form {
	border: 5px solid #f1f1f1;
}

input[type=text], input[type=password] {
	width: 100%;
	height: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

.Lcancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

.Lcontainer {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

.myB {
	background-color: #4CAF50;
	padding: 12px 14px;
	transition: 0.3s;
	font-size: 12px;
}
</style>
<script>
function validateForm() {
	var validation=true;
    var name = document.forms["myForm"]["uname"].value;
    var pwd = document.forms["myForm"]["psw"].value;
    var errormsg="";
	var count; 
    
    if (name == "") {
    		count+=1;
    		errormsg+="Name must be filled out"+"\n";
        validation=false;
    }


    if (pwd == "") {
		count+=1;
    	errormsg+="Password cannot be empty"+"\n";
        validation=false;
    }

     if ( ( myForm.userType[0].checked == false ) && ( myForm.userType[1].checked == false ) && ( myForm.userType[2].checked == false ) ) 
    {
 		count+=1;
    	 errormsg+="Please choose your user type"+"\n"; 
    validation=false;
    }
     
    if(validation==false)
    { 
    	            alert(errormsg);

    }
    else
        {

        document.myForm.submit(); }

     
    return validation;
    
}
</script>
</head>
<body>

	<h2>Login Form</h2>
	 Not Registered Yet <a href="newuser.jsp">Register Here</a>
		<div> 
  <strong >
	  ${requestScope.utilOutput}
	  </strong>
</div>
	<form name="myForm" onsubmit="return validateForm()"action=LoginServlet  style="border:0;">
		<div class="Lcontainer">
			<label for="uname"><b>Username</b></label> <input type="text"
				placeholder="Enter Username" name="uname" id="username" required>
			<label for="psw"><b>Password</b></label> <input type="password"
				style="bottom: 25px" placeholder="Enter Password" name="psw"
				id="password" required><br>
				 <label>Customer <input
				type="radio" name="userType" value="Customer"> 
				<span
				class="checkmark"></span>
			</label> 
			<label>Administrator <input type="radio" name="userType"
				value="Admin"> <span  class="checkmark"></span>
			</label> 
			<label style="bottom: 25px" >Dealer <input type="radio"
				name="userType" value="Dealer"> <span class="checkmark"></span>
			</label> <br>
			<button class="myB" type="submit">Login</button>
			
		</div>
		<div class="container" style="background-color: #f1f1f1">
			<button type="button" class="Lcancelbtn">Cancel</button>
			<span class="psw">Forgot/ResetPassword <a href="resetProfile.jsp">password?</a></span>
		</div>
	</form>
			

</body>
</html>

