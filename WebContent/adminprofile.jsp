
    <%@ page import="com.service.model.Admin" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AdminProfile</title>
<style>.adbutton {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

.adbutton:hover, a:hover {
  opacity: 0.7;
}

.admininput:focus {
    background-color: #FDAA98;
	color: black;
}
</style>
<%
Admin currentAdmin = new Admin();
if(request.getSession().getAttribute("loogedinadmin")!=null){ currentAdmin = (Admin)request.getSession().getAttribute("loogedinadmin"); }%>
<script>
function validateUpdate(){
	var validation=true;
    var errormsg="";
	var count=0; 
	
	alert(document.getElementById("adname").value+" "+
	 document.getElementById("adh").value+" "+
	 document.getElementById("ademail").value+" "+
	document.getElementById("adaddress").value+" "+
	document.getElementById("adstate").value+" "+
	document.getElementById("adzip").value+" "+
	document.getElementById("adcity").value+" "+
	document.getElementById("adcountry").value+" "+
	document.getElementById("adpassword").value+" "+
	document.getElementById("newpassword").value)

	if(document.getElementById("adname")==""){
		count+=1;
		errormsg+="Name must be filled out"+"\n";
    validation=false;
		}

    if(document.getElementById("adh").value==""){		
        count+=1;
		errormsg+="Phone cannot be empty"+"\n";
        validation=false;
    }else 
    {
   	  var phoneno = /^\(?([0-9]{3})\)?[- ]?([0-9]{3})[- ]?([0-9]{4})$/;
   	  if(!document.getElementById("adh").value.match(phoneno))
   	        {
          count+=1;
	        
   	        alert("Invalid Format,Phone number must be of the format [XXX-XXX-XXXX] or [XXX XXX XXXX]");
   	        errormsg+="Invalid Format,Phone number must be of the format [XXX-XXX-XXXX] or [XXX XXX XXXX]"+"\n";
   	        validation=false;
   	        }
   	}
	   	

		if( document.getElementById("ademail").value == ""){
			count+=1;
	 		errormsg+="email cannot be empty"+"\n";
	 		alert(errormsg);
	     validation=false;
			}
		else{
			     var emailvalid= /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
				if (! document.getElementById("ademail").value.match(emailvalid))
				  {        count+=1;
				  
				    alert("You have entered an invalid email address!");
				    errormsg+="You have entered an invalid email address!";
				    validation=false;
				  }
				}
		var addr=document.getElementById("adaddress").value;
    if (document.getElementById( "adaddress").value == "") {
 		count+=1;
     		errormsg+="address cannot be empty"+"\n";
         validation=false;
     }

    else if((addr.length < 4) || (addr.length>42)){
    	 count+=1;
  		errormsg+="address must be minimum of length 4 not more than 42 "+"\n";
      validation=false;
         }
   
	
	

    if (document.getElementById( "adstate").value == "") {
 		count+=1;
     		errormsg+="state cannot be empty"+"\n";
        validation=false;
    }
	
	 var isValid = /^[0-9]{5}(?:-[0-9]{4})?$/.test(document.getElementById( "adzip").value);
    if (document.getElementById( "adzip") == "") {
 		count+=1;
    		errormsg+="zip cannot be empty"+"\n";
        validation=false;
     }else if(!isValid){
    	 count+=1;
 		errormsg+="Invalid format , Zip must be [XXXXX] OR [XXXXX-XXXX]"+"\n";
     validation=false;
         }
	

	  if (document.getElementById( "adcity").value == "") {
	 		count+=1;
	     		errormsg+="city cannot be empty"+"\n";
	         validation=false;
	  }
	

	  if (document.getElementById( "adcountry").value == "") {
	 		count+=1;
	     		errormsg+="country cannot be empty"+"\n";
	         validation=false;
	  }

	     if(validation==false)
	     { 

	 	   if(count ==11){
	 		   alert("Cannot submit empty form");
	 		   }
	 	   else
	 		   {
	 		   alert(errormsg);
	 		   }
	     }else{
	    	 myFunction();
		     }
	    
	     return validation;	
	
	
}


function myFunction() {
	
	if (document.getElementById( "newpassword").value != "") {
 		alert("password updated:"+document.getElementById( "newpassword").value+"\n");
 		var confirmation=window.confirm("Confirm change password?");
 } else
	 {alert("PAsswotd not changed");}
}

</script>
</head>

<body>
<h2 style="text-align:center">User Profile Card</h2>
<form action="updateAdminInfo" method="Post"  style="border:0;"> 
<div class="pcard">
<table>
<tr><td><label>USERID</label></td> <td><input type="text" id="adusr" name="adusr" readonly="readonly" value=<%=currentAdmin.getAid() %>></td></tr>
<tr><td><label>NAME</label></td> <td><input class="admininput" type="text" id="adname" name="adname"  value= <%=currentAdmin.getName() %>></td></tr>
<tr><td><label for="Phone">Phone</label></td> <td><input class="admininput" type="text" id="adh" name="adh" value=<%=currentAdmin.getPhone() %>></td></tr>
<tr><td><label for="Email">Email</label></td> <td><input class="admininput" type="text" id="ademail" name="ademail" value=<%=currentAdmin.getEmail() %>></td></tr>
<tr><td><label for="Email">Address</label></td> <td><input class="admininput" type="text" id="adaddress" name="adaddress" value=<%=currentAdmin.getAddress() %>></td></tr>
<tr><td><label for="Email">State</label></td> <td><input class="admininput" type="text" id="adstate" name="adstate" value=<%=currentAdmin.getState() %>></td></tr>
<tr><td><label for="Email">Zip</label></td> <td><input class="admininput" type="text" id="adzip" name="adzip" value=<%=currentAdmin.getZip() %>></td></tr>
<tr><td><label for="Email">City</label></td> <td><input class="admininput" type="text" id="adcity" name="adcity" value=<%=currentAdmin.getCity() %>></td></tr>
<tr><td><label for="Email">Country</label></td> <td><input class="admininput" type="text" id="adcountry" name="adcountry" value=<%=currentAdmin.getCountry() %>></td></tr>
<tr><td><label for="Username">Username</label></td> <td><input class="admininput" type="text" id="aduname" name="aduname" readonly="readonly" value=<%=currentAdmin.getUsername() %>></td></tr>
<tr><td><label for="Email">Password</label></td> <td><input class="admininput" type="password" id="adpassword" readonly="readonly" name="adpassword"value=<%=currentAdmin.getPassword()%>></td></tr>
<tr><td><label for="Email">New Password</label></td> <td><input class="admininput" type="password" id="newpassword" name="newpassword"></td></tr>
 </table>
 <p><button class="adbutton"  type="submit" onclick="return validateUpdate()">SAVE CHANGES</button></p>

</div>
</form>
</body>
</html>