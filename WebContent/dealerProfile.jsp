
    <%@ page import="com.service.model.Dealer" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dealer Profile</title>
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
Dealer deal = new Dealer();
if(request.getSession().getAttribute("loogedindealer")!=null){ deal = (Dealer)request.getSession().getAttribute("loogedindealer"); }%>
<script>
function validateDealerUpdate(){
	alert("VAlidte dealer");
	alert(document.getElementById("delname").value+" "+document.getElementById("delh").value+" "+document.getElementById("delemail").value+" "
			+document.getElementById("deladdress").value+" "+document.getElementById("delstate").value+" "+document.getElementById("delzip").value
			+" "+document.getElementById("delcity").value+" "+document.getElementById("delcountry").value+" "+document.getElementById("delnewpassword").value);
	var validation=true;
    var errormsg="";
	var count=0;
	

	if(document.getElementById("delname").value==""){
		count+=1;
		errormsg+="Name must be filled out"+"\n";
    validation=false;
		}

	 if(document.getElementById("delh").value==""){		
	        count+=1;
			errormsg+="Phone cannot be empty"+"\n";
	        validation=false;
	    }else 
	    {
	   	  var phoneno = /^\(?([0-9]{3})\)?[- ]?([0-9]{3})[- ]?([0-9]{4})$/;
	   	  if(!document.getElementById("delh").value.match(phoneno))
	   	        {
	          count+=1;
		        
	   	        alert("Invalid Format,Phone number must be of the format [XXX-XXX-XXXX] or [XXX XXX XXXX]");
	   	        errormsg+="Invalid Format,Phone number must be of the format [XXX-XXX-XXXX] or [XXX XXX XXXX]"+"\n";
	   	        validation=false;
	   	        }
	   	}

	 if( document.getElementById("delemail").value == ""){
			count+=1;
	 		errormsg+="email cannot be empty"+"\n";
	 		alert(errormsg);
	     validation=false;
			}
		else{
			     var emailvalid= /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
				if (! document.getElementById("delemail").value.match(emailvalid))
				  {        count+=1;
				  
				    alert("You have entered an invalid email address!");
				    errormsg+="You have entered an invalid email address!";
				    validation=false;
				  }
				}

	 var deladdr=document.getElementById("deladdress").value;
	    if (document.getElementById( "deladdress").value == "") {
	 		count+=1;
	     		errormsg+="address cannot be empty"+"\n";
	         validation=false;
	     }

	    else if((deladdr.length < 4) || (deladdr.length>42)){
	    	 count+=1;
	  		errormsg+="address must be minimum of length 4 not more than 42 "+"\n";
	      validation=false;
	         }

	    if (document.getElementById( "delstate").value == "") {
	 		count+=1;
	     		errormsg+="state cannot be empty"+"\n";
	        validation=false;
	    }
		
		 var isValid = /^[0-9]{5}(?:-[0-9]{4})?$/.test(document.getElementById( "delzip").value);
	    if (document.getElementById( "delzip") == "") {
	 		count+=1;
	    		errormsg+="zip cannot be empty"+"\n";
	        validation=false;
	     }else if(!isValid){
	    	 count+=1;
	 		errormsg+="Invalid format , Zip must be [XXXXX] OR [XXXXX-XXXX]"+"\n";
	     validation=false;
	         }
		
		
		 if (document.getElementById( "delcity").value == "") {
		 		count+=1;
		     		errormsg+="city cannot be empty"+"\n";
		         validation=false;
		  }
		

		  if (document.getElementById( "delcountry").value == "") {
		 		count+=1;
		     		errormsg+="country cannot be empty"+"\n";
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
		     }else{
checkPassword();
			     }
		  
		     return validation;

}
function checkPassword(){
	if(document.getElementById( "delnewpassword").value!="" ){
		alert("password updated:"+document.getElementById( "delnewpassword").value+"\n");
 		var confirmation=window.confirm("Confirm change password?");
		}else{
alert("password not changed");
			}
}
</script>
</head>

<body>
<h2 style="text-align:center">User Profile Card</h2>
<form action="updateDealerInfo" method="Post" style="border:0;"> 

<div class="pcard">
<table>
<tr><td><label>USERID</label></td> <td><input type="text" id="delusr" name="delusr" readonly="readonly" value=<%=deal.getDid() %>></td></tr>
<tr><td><label>NAME</label></td> <td><input class="admininput" type="text" id="delname" name="delname"  value= <%=deal.getName() %>></td></tr>
<tr><td><label for="Phone">Phone</label></td> <td><input class="admininput" type="text" id="delh" name="delh" value=<%=deal.getPhone() %>></td></tr>
<tr><td><label for="Email">Email</label></td> <td><input class="admininput" type="text" id="delemail" name="delemail" value=<%=deal.getEmail() %>></td></tr>
<tr><td><label for="Email">Address</label></td> <td><input class="admininput" type="text" id="deladdress" name="deladdress" value=<%=deal.getAddress() %>></td></tr>
<tr><td><label for="Email">State</label></td> <td><input class="admininput" type="text" id="delstate" name="delstate" value=<%=deal.getState() %>></td></tr>
<tr><td><label for="Email">Zip</label></td> <td><input class="admininput" type="text" id="delzip" name="delzip" value=<%=deal.getZip() %>></td></tr>
<tr><td><label for="Email">City</label></td> <td><input class="admininput" type="text" id="delcity" name="delcity" value=<%=deal.getCity() %>></td></tr>
<tr><td><label for="Email">Country</label></td> <td><input class="admininput" type="text" id="delcountry" name="delcountry" value=<%=deal.getCountry() %>></td></tr>
<tr><td><label for="Username">Username</label></td> <td><input class="admininput" type="text" id="deluname" name="deluname" readonly="readonly" value=<%=deal.getUsername() %>></td></tr>
<tr><td><label for="Email">Password</label></td> <td><input class="admininput" type="text" id="delpassword" readonly="readonly" name="adpassword"value=<%=deal.getPassword()%>></td></tr>
<tr><td><label for="Email">New Password</label></td> <td><input class="admininput" type="text" id="delnewpassword" name="delnewpassword"></td></tr>
 </table>
 <p><button class="adbutton"  type="submit" onclick="return validateDealerUpdate()">SAVE CHANGES</button></p>

</div>
</form>
</body>
</html>