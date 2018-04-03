<%@page import="com.service.model.CarPartsInventory"%>
<%@page import="com.service.model.Cart"%>
<%@page import="com.service.model.CarInventory"%>
<%@page import="com.service.model.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BillingAndShipping</title>
<script>
function validatePaymentFormBilling(){

	
	var visavalidation = /^(?:4[0-9]{12}(?:[0-9]{3})?)$/;
	var mastercard = /^(?:5[1-5][0-9]{14})$/
	var validation=true;

	alert(document.getElementById("cardname").value+" "+document.getElementById("cvv").value);
if(document.getElementById("cardname").value=="" || document.getElementById("cvv").value=="" || document.getElementById("expyear").value=="" || document.getElementById("expmonth").value=="" || 
		document.getElementById("ccnum").value=="" || document.getElementById("firstname").value=="" || document.getElementById("ueemail").value=="" || document.getElementById("ubaddress").value=="" ||
		 document.getElementById("bcity").value=="" || document.getElementById("bstate").value=="" || document.getElementById("bzip").value=="" ){
alert("please fill all fields");
return false;
}
	
	  if(!document.getElementById("ccnum").value.match(visavalidation)){
	        alert("Not a valid Visa credit card number!");
	  validation= false;
	        } 

      if(!document.getElementById("ccnum").value.match(mastercard)){
      alert("Not a valid Mastercard number!");
      validation= false;
      }
      
  return validation;    
}
</script>
<style>
.boxa {
/* 	background-color: #f1f1f1;
	color: #fff;
	padding: 20px;
	font-size: 80%;
	height: 900px;
	width: 97%;
	color: black ;*/
		background-color: #f2f2f2;
	padding: 5px 20px 15px 20px;
	border: 1px solid lightgrey;
	border-radius: 7px;
	width: 96%;
}

.fbtn {
	background-color: #4CAF50;
	color: white;
	padding: 12px;
	margin: 10px 0;
	border: none;
	width: 100%;
	border-radius: 3px;
	cursor: pointer;
	font-size: 17px;
}

.fbtn:hover {
	background-color: #45a049;
}

span.fprice {
	float: right;
	color: grey;
}

.flabel {
	margin-bottom: 10px;
	display: block;
	margin-right:10px
}

.fcontainer {
	background-color: #f2f2f2;
	padding: 5px 20px 15px 20px;
	border: 1px solid lightgrey;
	border-radius: 7px;
	width: 96%;
}

.fcol-50 {
	-ms-flex: 50%; /* IE10 */
	flex: 50%;
}

.formText{
  width: 80%;
  margin-bottom: 20px;
    margin-left: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}
</style>
</head>
<body>
			<h3>Payment</h3>
	<div class="col-25">
		<div class="fcontainer">

				<h4>
					Cart <span class="fprice" style="color: black"> </span>
				</h4>
<%-- <%

System.out.println("*************"+session.getAttribute("myprice"));%>
<jsp:useBean id="user" class="com.service.model.CarInventory" scope="session" ></jsp:useBean>
<input value=<%= user.getPrice()%>> --%>
<%-- <%

CarInventory cc = new CarInventory();
cc.setExterior("df");
request.setAttribute("OBJECT_NAME", cc);

//forward the request to Servlet2
RequestDispatcher reqDispatcher = request.getRequestDispatcher("Financing.jsp");
reqDispatcher.forward(request,response);
%> --%>

<%
Cart checkoutCart =(Cart) request.getSession().getAttribute("mycart");
int am=0;

List<CarInventory> carscheckout=checkoutCart.getCarInCart();
List<CarPartsInventory> carpartscheckout=checkoutCart.getCarPartsInCart();

/* if(carscheckout.size()!=0){
	 for(CarInventory c:carscheckout) {
			
			System.out.println("Checkout in car page Car:"+c.getVid());
		} 
}

if(carpartscheckout.size()!=0){
	 for(CarPartsInventory cp:carpartscheckout) {
			System.out.println("Checkout in car page  Carparts:"+cp.getPid());
		} 
} */
/* System.out.println("*************"+    session.getAttribute("myprice")+
session.getAttribute("vimg")+
session.getAttribute("vvid")+
session.getAttribute("vnum")+
session.getAttribute("vy")+ 
session.getAttribute("vmodel")+
session.getAttribute("vmake")+
session.getAttribute("vex")+
session.getAttribute("vint")+
session.getAttribute("vtra")+
session.getAttribute("vdisct")+ 
session.getAttribute("vcmil")+
session.getAttribute("vhmil")+
session.getAttribute("veng")); */
%>

<%

if(carscheckout.size()!=0){
					 for(CarInventory c:carscheckout) {
					 int pricm=c.getPrice().intValue();
					 am+=pricm;
					 %>
						<p>
					<a href="#"><%=c.getMake()+" "+c.getModel() %></a> <span class="fprice"><%=c.getPrice() %></span>
				</p>	
						<%	
						
						} 
				 } %>
				 
				 <%  if(carpartscheckout.size()!=0){
					 for(CarPartsInventory cp:carpartscheckout) {
						 
						 System.out.println("*&*"+Integer.parseInt(cp.getPrice()));
						 System.out.println("*&*"+Integer.parseInt(cp.getQuantity()));
						 int amount=(Integer.parseInt(cp.getPrice()))*(Integer.parseInt(cp.getQuantity()));

						 
			/* 			 int amoutn=Integer.parseInt(cp.getPrice());
					 if(Integer.parseInt(cp.getQuantity())>1){
						 amoutn=Integer.parseInt(cp.getQuantity())*Integer.parseInt(cp.getPrice()) ;
					 } */
					
					 %>
						<p>
										<% am+=amount;
										
				%>
					<a href="#"><%=cp.getName() %></a> <span class="fprice"><%=amount %></span>
				</p>	
						<%	
						} 
				 } %>
				
				<hr>
				<p>

					Total <span class="fprice" style="color: black"><b><%=am %></b></span>
				</p>
		</div>
	</div>
	<br>
	<!-- onclick="return validatePaymentForm()" -->
	<form name="paymentForm" class="boxa"  action="BillingServlet" method="POST">
		<div class="fcol-50">
			<h3>Card Information</h3>
			<label for="cname">Name on Card</label> <input class="formText" type="text" id="cardname" name="cardname" > <br>
			<label for="ccnum">Credit card number</label> <input class="formText" type="text" id="ccnum" name="ccnum" >  <br>
			<label for="expmonth">Exp Month</label> <input class="formText" type="text" id="expmonth" name="expmonth"> <br>
			<div class="row">
				<div class="col-50">
					<label for="expyear">Exp Year</label> 
					<input type="text" id="expyear" name="expyear" class="formText" >
				</div>
				<div class="col-50">
					<label for="cvv">CVV</label> 
					<input type="text" id="cvv" name="cvv" class="formText">
				</div>
			</div>

		<h3>Billing Address</h3>
		<label for="fname"><i class="flabel">  </i> Full Name</label> <input class="formText"	type="text" id="fname" name="firstname"> <br>
		<label for="email"> <i class="fa fa-envelope"> 
		</i> Email</label>  <input class="formText" type="text" id="ueemail" name="ueemail"> <br> 
		<label for="adr"> <i class="fa fa-address-card-o"></i> Address</label>  <input class="formText" type="text" id="ubaddress"	name="ubaddress"> <br>
		<label for="city"> <i	class="fa fa-institution"></i> City</label>  <input  class="formText" type="text" id="bcity"	name="bcity"><br> 
		<label for="zip">Zip</label>  <input class="formText" type="text" id="bzip" name="bzip"><br>
		 <label for="state">State</label> <input	class="formText" type="text" id="bstate" name="bstate">
		<input type="submit" value="Continue to checkout" class="fbtn"  onclick="return validatePaymentFormBilling()" >
		</div>
	</form>
</body>
</html>