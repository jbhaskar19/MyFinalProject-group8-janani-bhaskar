
    <%@ page import="com.service.model.Customer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Profile</title>
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
Customer currentCustomer = new Customer();
if(request.getSession().getAttribute("loogedincustomer")!=null){ currentCustomer = (Customer)request.getSession().getAttribute("loogedincustomer"); }%>
<script>
         
function validateCustomerUpdate(){
	var validation=true;
    var errormsg="";
	var count=0; 
	
	alert(document.getElementById("cstname").value+" "+
	document.getElementById("csth").value+" "+
	document.getElementById("cstmail").value+" "+
	document.getElementById("cstaddress").value+" "+
	document.getElementById("cststate").value+" "+
	document.getElementById("cstzip").value+" "+
	document.getElementById("cstcity").value+" "+
	document.getElementById("cstcountry").value+" "+
	document.getElementById("cstpassword").value+" "+
	document.getElementById("cstnewpassword").value);
	
	if(document.getElementById("cstname").value==""){
		count+=1;
		errormsg+="Name must be filled out"+"\n";
    validation=false;
		}

    if(document.getElementById("csth").value==""){		
        count+=1;
		errormsg+="Phone cannot be empty"+"\n";
        validation=false;
    }else 
    {
   	  var phoneno = /^\(?([0-9]{3})\)?[- ]?([0-9]{3})[- ]?([0-9]{4})$/;
   	  if(!document.getElementById("csth").value.match(phoneno))
   	        {
          count+=1;
	        
   	        alert("Invalid Format,Phone number must be of the format [XXX-XXX-XXXX] or [XXX XXX XXXX]");
   	        errormsg+="Invalid Format,Phone number must be of the format [XXX-XXX-XXXX] or [XXX XXX XXXX]"+"\n";
   	        validation=false;
   	        }
   	}
	   	

		if( document.getElementById("cstmail").value == ""){
			count+=1;
	 		errormsg+="email cannot be empty"+"\n";
	 		alert(errormsg);
	     validation=false;
			}
		else{
			     var emailvalid= /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
				if (! document.getElementById("cstmail").value.match(emailvalid))
				  {        count+=1;
				  
				    alert("You have entered an invalid email address!");
				    errormsg+="You have entered an invalid email address!";
				    validation=false;
				  }
				}
		var caddr=document.getElementById("cstaddress").value;
    if (document.getElementById( "cstaddress").value == "") {
 		count+=1;
     		errormsg+="address cannot be empty"+"\n";
         validation=false;
     }

    else if((caddr.length < 4) || (caddr.length>42)){
    	 count+=1;
  		errormsg+="address must be minimum of length 4 not more than 42 "+"\n";
      validation=false;
         }
  

    if (document.getElementById( "cststate").value == "") {
 		count+=1;
     		errormsg+="state cannot be empty"+"\n";
        validation=false;
    }
	
	 var isValid = /^[0-9]{5}(?:-[0-9]{4})?$/.test(document.getElementById( "cstzip").value);
    if (document.getElementById( "cstzip") == "") {
 		count+=1;
    		errormsg+="zip cannot be empty"+"\n";
        validation=false;
     }else if(!isValid){
    	 count+=1;
 		errormsg+="Invalid format , Zip must be [XXXXX] OR [XXXXX-XXXX]"+"\n";
     validation=false;
         }
	

	  if (document.getElementById( "cstcity").value == "") {
	 		count+=1;
	     		errormsg+="city cannot be empty"+"\n";
	         validation=false;
	  }
	

	  if (document.getElementById( "cstcountry").value == "") {
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
	    	 myCustomerPasswordFunction();
		     }
	    
	     return validation;	
}
 
function myCustomerPasswordFunction(){
	if (document.getElementById( "cstnewpassword").value != "") {
 		alert("password updated:"+document.getElementById( "cstnewpassword").value+"\n");
 		var confirmation=window.confirm("Confirm change password?");
 } else
	 {alert("PAsswotd not changed");}	
}
</script>
</head>
<body>
<h2 style="text-align:center">User Profile Card</h2>
<form action="updateCustomerInfo" method="Post"  style="border:0;"> 
 <div class="pcard">
<table>
<tr><td><label>USERID</label></td> <td><input type="text" id="cstusr" name="cstusr" readonly="readonly" value=<%=currentCustomer.getCid() %>></td></tr>
<tr><td><label>NAME</label></td> <td><input class="admininput" type="text" id="cstname" name="cstname"  value= <%=currentCustomer.getName() %>></td></tr>
<tr><td><label >Phone</label></td> <td><input class="admininput" type="text" id="csth" name="csth" value=<%=currentCustomer.getPhone() %>></td></tr>
<tr><td><label>Email</label></td> <td><input class="admininput" type="text" id="cstmail" name="cstmail" value=<%=currentCustomer.getEmail() %>></td></tr>
<tr><td><label>Address</label></td> <td><input class="admininput" type="text" id="cstaddress" name="cstaddress" value=<%=currentCustomer.getAddress() %>></td></tr>
<tr><td><label >State</label></td> <td><input class="admininput" type="text" id="cststate" name="cststate" value=<%=currentCustomer.getState() %>></td></tr>
<tr><td><label >Zip</label></td> <td><input class="admininput" type="text" id="cstzip" name="cstzip" value=<%=currentCustomer.getZip() %>></td></tr>
<tr><td><label >City</label></td> <td><input class="admininput" type="text" id="cstcity" name="cstcity" value=<%=currentCustomer.getCity() %>></td></tr>
<tr><td><label >Country</label></td> <td><input class="admininput" type="text" id="cstcountry" name="cstcountry" value=<%=currentCustomer.getCountry() %>></td></tr>
<tr><td><label>Username</label></td> <td><input class="admininput" type="text" id="cstuname" name="cstuname" readonly="readonly" value=<%=currentCustomer.getUsername() %>></td></tr>
<tr><td><label>Password</label></td> <td><input class="admininput" type="password" id="cstpassword" readonly="readonly" name="cstpassword"value=<%=currentCustomer.getPassword()%>></td></tr>
<tr><td><label >New Password</label></td> <td><input class="admininput" type="password" id="cstnewpassword" name="cstnewpassword"></td></tr>
 </table>
 <p><button class="adbutton"  type="submit" onclick="return validateCustomerUpdate()">SAVE CHANGES</button></p>
</div>
</form>
</body>
</html>