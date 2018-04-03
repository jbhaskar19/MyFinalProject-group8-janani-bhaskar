<%@page import="com.service.DAO.InventoryDAO"%>
<%@page import="com.service.model.CarInventory"%>
<%@page import="com.service.model.Carsale"%>
<%@page import="com.service.model.CarPartsInventory"%>
<%@page import="com.service.model.Carpartssale"%>
<%@page import="com.service.model.CarInventory"%>
<%@page import="com.service.model.Cart"%>
<%@page import="com.service.model.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pay Plan</title>
<style type="text/css">
.columns {
    float: left;
    width: 50%;
    padding-bottom: 8px;
}

.price {
    list-style-type: none;
    border: 1px solid #eee;
    margin: 0;
    padding: 0;
        width:50%;
    -webkit-transition: 0.3s;
    transition: 0.3s;
margin-top:50px;
margin-left:250px;
}

.price:hover {
    box-shadow: 0 8px 12px 0 rgba(0,0,0,0.2);
}

.price .header {
    background-color: #111;
    color: white;
    font-size: 25px;
    padding-left: 80px;
    
}

.price li {
    border-bottom: 1px solid #eee;
    padding: 20px;
    text-align: center;
}

.price .grey {
    background-color: #eee;
    font-size: 20px;
}

.button {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 10px 25px;
    text-align: center;
    text-decoration: none;
    font-size: 18px;
}
</style>
<script>
function validatePaymentPlan(){
var planValidation =false;

	if (document.getElementById("fplan1").checked == true) {
			alert(document.getElementById("fplan1").value);
			document.getElementById("explain").value="Place explaination here";
			planValidation=true;
		}
		if (document.getElementById("fplan2").checked == true) {
			alert(document.getElementById("fplan2").value);
			planValidation=true;
		}
		if (document.getElementById("fplan3").checked == true) {
			alert(document.getElementById("fplan3").value);
			planValidation=true;
		}

		if (document.getElementById("fLease").checked == true) {
			alert(document.getElementById("fLease").value);
			planValidation=true;
		}

if(planValidation==false){
	alert("Please select a plan,");
}else{
	document.myfinanceplan.submit();
}

return 	planValidation;
	}

function LoadExplaination(){
/* 	document.getElementById("explain").value="Make a selection to see Finance Plan details";
	document.getElementById("explainLease").value="Make a selection to see plan details"; */
	
	if (document.getElementById("fplan1").checked) {
		alert(document.getElementById("fplan1").value);
		document.getElementById("explain").value="Place explaination here-plan1";
		document.getElementById("explainLease").value="Make a selection to see Lease plan details";
	}	

	if (document.getElementById("fplan2").checked == true) {
		alert(document.getElementById("fplan2").value);
		document.getElementById("explain").value="Place explaination here-plan2";
		document.getElementById("explainLease").value="Make a selection to see Lease plan details";
	}
	if (document.getElementById("fplan3").checked == true) {
		alert(document.getElementById("fplan3").value);
	    document.getElementById("explain").value="Place explaination here-plan3";
	    document.getElementById("explainLease").value="Make a selection to see Lease plan details";
	}

	if (document.getElementById("fLease").checked == true) {
		alert(document.getElementById("fLease").value);
		document.getElementById("explainLease").value="Place explaination here-lease plan";
		document.getElementById("explain").value="Make a selection to see Finance Plan details";

	}
}
</script>
</head>
<body>
<!--  <div class="columns" style="margin-left:60px;">
 --><%--     <input id="carprice" name="carprice" value=<%=request.getParameter("price") %>>
    <%
    session.setAttribute("myprice", request.getParameter("price")); 

   %> --%>
<%-- 
 <%
/* session.setAttribute("myprice", request.getParameter("price")); 
session.setAttribute("vimg", request.getParameter("img")); 
session.setAttribute("vvid", request.getParameter("vid")); 
session.setAttribute("vnum", request.getParameter("num")); 
session.setAttribute("vy", request.getParameter("year")); 
session.setAttribute("vmodel", request.getParameter("model")); 
session.setAttribute("vmake", request.getParameter("make")); 
session.setAttribute("vex", request.getParameter("extreior")); 
session.setAttribute("vint", request.getParameter("interior")); 
session.setAttribute("vtra", request.getParameter("transmi")); 
session.setAttribute("vdisct", request.getParameter("disct")); 
session.setAttribute("vcmil", request.getParameter("ctmilage")); 
session.setAttribute("vhmil", request.getParameter("hwmilage")); 
session.setAttribute("veng", request.getParameter("engine")); */ 
System.out.println("####"+request.getParameter("engine"));
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
carcart.setYear(Integer.parseInt("20188"));

//request.setAttribute("carobject", carcart);

//forward the request to Servlet2

Cart mycart=new Cart();
mycart.addCarToCart(carcart);
mycart.printCart();
/* RequestDispatcher reqDispatcher = request.getRequestDispatcher("pathToyourServlet2");
reqDispatcher.forward(request, response); */


   %> --%>
<%-- <%Long valp= Long.parseLong(request.getParameter("price"));
String vimg=request.getParameter("img");
String vvid=request.getParameter("vid") ;
String vnum =request.getParameter("num");
String vy=request.getParameter("year") ;
String vmodel=request.getParameter("model") ;
String vmake=request.getParameter("make");
String vex=request.getParameter("extreior") ;
String vint=request.getParameter("interior") ;
String vtra=request.getParameter("transmi") ;
//double vdisct=Double.parseDouble(request.getParameter("disct")) ;
//int vcmil =Integer.parseInt(request.getParameter("ctmilage") );
//int vhmil=Integer.parseInt(request.getParameter("hwmilage")) ;
double vdisct=Double.parseDouble("20") ;
int vcmil =Integer.parseInt("121" );
int vhmil=Integer.parseInt("12") ;
String veng=request.getParameter("engine") ;
   %>  --%>
<%--    <jsp:useBean id="user" class="com.service.model.CarInventory" scope="session" ></jsp:useBean>
<jsp:setProperty property="vid" name="user" value="<%=vvid%>"/> 
<jsp:setProperty property="vinNumber" name="user" value="<%=vnum%>"/> 
<jsp:setProperty property="make" name="user" value="<%=vmake%>"/> 
<jsp:setProperty property="model" name="user" value="<%=vmodel%>"/> 
<jsp:setProperty property="year" name="user" value="<%=vy%>"/> 
<jsp:setProperty property="price" name="user" value="<%=valp%>"/> 
<jsp:setProperty property="exterior" name="user" value="<%=vex%>"/> 
<jsp:setProperty property="ir" name="user" value="<%=vimg%>"/> 
<jsp:setProperty property="interior" name="user" value="<%=vint%>"/> 
<jsp:setProperty property="engine" name="user" value="<%=veng%>"/> 
<jsp:setProperty property="transmission" name="user" value="<%=vtra%>"/> 
<jsp:setProperty property="citymilage" name="user" value="<%=vcmil%>"/> 
<jsp:setProperty property="hwymilage" name="user" value="<%=vhmil%>"/> 
<jsp:setProperty property="discount" name="user" value="<%=vdisct%>"/>  
--%>
<div class="price">
<div class="header">CAR PURCHASE DETAILS</div>
<%
InventoryDAO mydaoAfterPurchase = new InventoryDAO();
if(request.getSession().getAttribute("loogedintype").toString().equals("customer")){
	Customer getUserHistory =(Customer) request.getSession().getAttribute("loogedincustomer");
	List<Carsale> carscheckout = mydaoAfterPurchase.getCarsPurchased(getUserHistory.getCid());

//List<CarPartsInventory> carpartscheckout = mydaoAfterPurchase.getCarPartsPurchased(); %>
<!--    <ul class="price">
    <li class="header">CARS PURCHASED</li> -->
    <%		if (carscheckout.size() != 0) {
    	
		for (Carsale ciitems : carscheckout) {
					System.out.println(ciitems.getDsId() + "Checkout in car page Car:" + ciitems.getVId());
		%>
			    <%=ciitems.getVId()%>
			    <%=ciitems.getDsId()%>
			     <%=ciitems.getPrice()%>
			    <%=ciitems.getOrderDate()%>
			    <%=ciitems.getDelivaryDate()%>
		<hr>
		<% }
		
	}else{
		%>
	     <input type="text"  style="margin-right:20px">NO CARS PURCHASED 
<%	
	}
    
    %>
    
    </div><div class="price"><div class="header">CAR PARTS PURCHASE DETAILS</div>
    <% 

    List<Carpartssale> carpartscheckout = mydaoAfterPurchase.getCarPartsPurchased(getUserHistory.getCid());

   		if (carpartscheckout.size() != 0) {
		for (Carpartssale cpiitems : carpartscheckout) {
					System.out.println(cpiitems.getDsId() + "Checkout in car part Car:" + cpiitems.getPartId());
		%>

<%=cpiitems.getDsId()%>
<%=cpiitems.getPrice()%>
<%=cpiitems.getClientId() %>
<%=cpiitems.getDatePurchased() %>
		<hr>
		<% }
		
	}else{
		%>
	     <input type="text"  style="margin-right:20px">NO CAR PARTS PURCHASED 
<%	
	}
} %>
</div>
</body>
</html>