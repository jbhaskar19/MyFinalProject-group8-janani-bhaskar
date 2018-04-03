    <%@ page import="com.service.model.Dealer" %>
        <%@ page import="com.service.model.Dealership" %>
        <%@ page import="com.service.model.CarInventory" %>
        <%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RemoveCar</title>
</head>
<script>
function getvidofCar(){
	 var x = document.getElementById("removeMyCar").value;
	 alert(x);
}
</script>
<body>



<form action="removeCar" method="POST" style="border:0">
<fieldset>
<legend>REMOVE CAR</legend>
<select id = "removeMyCar" name="removeMyCar" onchange="getvidofCar()">
<%
String usrType=request.getSession().getAttribute("loogedintype").toString();
if((usrType!=null)&&(usrType.equals("dealer")) && request.getSession().getAttribute("dealerDealership")!=null && request.getSession().getAttribute("loogedindealer")!=null ){
Dealer dealerRemoveCar = (Dealer)request.getSession().getAttribute("loogedindealer");
Dealership dshRemoveCar = (Dealership)request.getSession().getAttribute("dealerDealership");
List<CarInventory> dealersInventoryRemoveCar = dealerRemoveCar.getCar(dealerRemoveCar,dshRemoveCar);
for(CarInventory removethiscar:dealersInventoryRemoveCar){
%>
<option value=<%=removethiscar.getVid()%>><%=removethiscar.getVid()%></option>
<%}} %>
</select>

<button type="submit">remove car</button>
</fieldset>
</form>	
</body>
</html>