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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
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
	width: 95%;
}


</style>
<style>
.buttonB {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
    width: 100%;
}

.buyButtonModal {
    background-color: white; 
    color: black; 
    border: 2px solid #4CAF50;
}

.buyButtonModal:hover {
    background-color: #4CAF50;
    color: white;
}  
</style>
<script>
function goBack(){
	history.back();
}
</script>
</head>
<body>
<%-- <%		System.out.println("***********************************************");
System.out.println(request.getSession().getAttribute("addingtocard"));
System.out.println("***********************************************");

CarPartsInventory carPart=new CarPartsInventory();
carPart.setPid(request.getParameter("pid"));
carPart.setMake(request.getParameter("ppmake"));
carPart.setModel(request.getParameter("ppmodel"));
carPart.setYear(request.getParameter("ppyear"));
carPart.setPrice(request.getParameter("pprice"));

carPart.setSeller(request.getParameter("pselle"));

Cart mycartnow =(Cart) request.getSession().getAttribute("mycart");
mycartnow.addCarPartToCart(carPart);
mycartnow.printCart(); %>

<%
System.out.println(request.getParameter("num"));
CarInventory carcart = new CarInventory();
carcart.setCitymilage(Integer.parseInt("20"));
carcart.setDiscount(Double.parseDouble("20"));
carcart.setEngine(request.getParameter("engine"));
carcart.setExterior(request.getParameter("extreior"));
carcart.setHwymilage(Integer.parseInt("20"));
carcart.setInterior(request.getParameter("interior"));
carcart.setMake(request.getParameter("make"));
carcart.setModel(request.getParameter("model"));
carcart.setPrice(Long.parseLong(request.getParameter("price")));
carcart.setVid(request.getParameter("vid"));
carcart.setTransmission(request.getParameter("transmi"));
carcart.setVinNumber(request.getParameter("num"));
carcart.setYear(Integer.parseInt(request.getParameter("year")));

System.out.println(carcart.getYear()+carcart.getMake()+carcart.getModel());
mycartnow =(Cart) request.getSession().getAttribute("mycart");
mycartnow.addCarToCart(carcart);
mycartnow.printCart();
%> --%>
<%
int tot=0;
Cart mycartnow =(Cart) request.getSession().getAttribute("mycart");

 List<CarInventory> carspurchased=mycartnow.getCarInCart();
 List<CarPartsInventory> carpartspurchased=mycartnow.getCarPartsInCart();
 
/*  if(carspurchased.size()!=0){
	 for(CarInventory c:carspurchased) {
			
			System.out.println("in car page Car:"+c.getVid());
		} 
 }
 
 if(carpartspurchased.size()!=0){
	 for(CarPartsInventory cp:carpartspurchased) {
			System.out.println("in car page  Carparts:"+cp.getPid());
		} 
 }
  */
//mycartnow.printCart();
%>
		<div class="fcontainer" style="position: relative;">

				<h4>
					Cart <span class="fprice" style="color: black"> </span>
				</h4>
				
				<% if(carspurchased.size()!=0){
					 for(CarInventory c:carspurchased) {
						 int pri=c.getPrice().intValue();
						 tot+=pri;
					 %>
						<p>
					<a href="#"><%=c.getMake()+" "+c.getModel() %></a> <span class="fprice"><%=c.getPrice() %></span>
				</p>	
						<%	
						} 
				 } %>
				 
				 <%  if(carpartspurchased.size()!=0){
					 for(CarPartsInventory cp:carpartspurchased) {
						 System.out.println("*&*"+Integer.parseInt(cp.getPrice()));
						 System.out.println("*&*"+Integer.parseInt(cp.getQuantity()));
						 int value=(Integer.parseInt(cp.getPrice()))*(Integer.parseInt(cp.getQuantity()));

						 
			/* 			 int amoutn=Integer.parseInt(cp.getPrice());
					 if(Integer.parseInt(cp.getQuantity())>1){
						 amoutn=Integer.parseInt(cp.getQuantity())*Integer.parseInt(cp.getPrice()) ;
					 } */
					tot+=value;
					 %>
						<p>
					<a href="#"><%=cp.getName() %></a> <span class="fprice"><%=value %></span>
				</p>	
						<%	
						} 
				 } %>
				
				<hr>
				<p>
					Total <span class="fprice" style="color: black"><b><%=tot %></b></span>
				</p>
				<button class="buttonB buyButtonModal" onclick="goBack()">continue shopping</button>
				<form action="Financing.jsp" method="post"><button class="buttonB buyButtonModal" >checkout</button></form>
		</div>


</body>
</html>