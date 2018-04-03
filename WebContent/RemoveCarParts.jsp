    <%@ page import="com.service.model.Dealer" %>
        <%@ page import="com.service.model.Dealership" %>
        <%@ page import="com.service.model.CarPartsInventory" %>
        <%@page import="java.util.List"%>
        
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REmoveCArPArts</title>

<script type="text/javascript">

//cpid cnameofpart cppmake cppmodel cppyear cpprice cpquantity ccapacity

function validateDealerRemoveCarPart(){
	var myvalid=true;
	if(document.getElementById("cpquantity").value==""){
		alert("Please enter quantity");
		myvalid=false;
	}
	return myvalid;	 	 
}
</script>
</head>
<body>
<%
if((request.getSession().getAttribute("loogedintype")!=null)&& (request.getSession().getAttribute("loogedintype")).equals("dealer")){
Dealer dealer = (Dealer)request.getSession().getAttribute("loogedindealer");
Dealership dsh = (Dealership)request.getSession().getAttribute("dealerDealership");
List<CarPartsInventory> dealersInventory = dealer.getCarParts(dealer,dsh);
%>
<%
for(CarPartsInventory cpi:dealersInventory){
	System.out.println(cpi.getPid());
	%>
<form action="removeCarParts"style="border:0">	
						
<table style="width:100%">
<tr>
<td> 
<fieldset style="border-color:#f1f1f1">
<legend>CAR PART INFO</legend>
<label>ID</label><input id="cpid" name="cpid" style="border:0; padding-left:20px" value=<%=cpi.getPid() %>><br>
<label>NAME</label><input id="cnameofpart" name="cnameofpart" style="border:0; padding-left:20px" value=<%= cpi.getName()%>><br>
<label>MAKE</label><input id="cppmake" name="cppmake" style="border:0 ;padding-left:20px" value=<%= cpi.getMake()%>><br>
<label>MODEL</label><input id="cppmodel" name="ppmodel" style="border:0 ;padding-left:20px" value=<%=cpi.getModel() %>><br>
<label>YEAR</label><input id="cppyear" name="cppyear" style="border:0; padding-left:20px" value=<%=cpi.getYear() %>><br>
<label>PRICE</label><input id="cpprice" name="cpprice" style="border:0; padding-left:20px" value=<%=cpi.getPrice() %>><br>
<label>TYPE</label><input id="cpprice" name="cpprice" style="border:0; padding-left:20px" value=<%=cpi.getType() %>><br>
<label>CATEGORY</label><input id="cpprice" name="cpprice" style="border:0; padding-left:20px" value=<%=cpi.getCategory() %>><br>
<label>QUANTITY</label><input type="number" id="cpquantity" name="cpquantity" max=<%=cpi.getQuantity()%> min=1 style="border:0; padding-left:20px" ><br>

<input id="ccapacity" name="ccapacity" style="border:0; padding-left:20px" type="hidden"><br>
<button style="float:right" onclick="return validateDealerRemoveCarPart()">Remove Car</button>

</fieldset>
</td>
</tr>
</table> 
</form>
<%
}}
%>
</body>
</html>