<%@page import="com.service.model.CarInventory"%>
<%@page import="com.service.model.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pay Plan</title>
<!-- <style type="text/css">
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
    -webkit-transition: 0.3s;
    transition: 0.3s;
}

.price:hover {
    box-shadow: 0 8px 12px 0 rgba(0,0,0,0.2)
}

.price .header {
    background-color: #111;
    color: white;
    font-size: 25px;
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
</style> -->
<!-- <script>
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
</script> -->
</head>
<body>
<%-- 	<div>
		<%@include file="myHeader.jsp"%>
	</div> --%>
<%--  <input value=<%=request.getParameter("img") %>>
<input value=<%=request.getParameter("vid") %>>
<input value=<%=request.getParameter("num") %>>
<input value=<%=request.getParameter("year") %>>
<input value=<%=request.getParameter("model") %>>
<input value=<%=request.getParameter("make") %>>
<input value=<%=request.getParameter("extreior") %>>
<input value=<%=request.getParameter("interior") %>>
<input value=<%=request.getParameter("transmi") %>>
<input value=<%=request.getParameter("price") %>>
<input value=<%=request.getParameter("disct") %>>
<input value=<%=request.getParameter("ctmilage") %>>
<input value=<%=request.getParameter("hwmilage") %> >
 <input value=<%=request.getParameter("engine") %> >  --%>
 

<!--   <table>
  <col width="200">
  <col width="200"> 

 <tr>

 <td align="left" ><div class="columns" style="margin-left:60px;">
    <form  action="Financing.jsp" method="POST" name="myfinanceplan" > -->
<%--     <input id="carprice" name="carprice" value=<%=request.getParameter("price") %>>
    <%
    session.setAttribute("myprice", request.getParameter("price")); 

   %> --%>

<%--  <%
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
Cart mycartnow =(Cart) request.getSession().getAttribute("mycart");
mycartnow.addCarToCart(carcart);
mycartnow.printCart();
   %>  --%>
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
   %>  
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
<jsp:setProperty property="discount" name="user" value="<%=vdisct%>"/>  --%>


 <!--   
  <ul class="price">
    <li class="header">Finance</li>
    <li><input type="radio" name="plan" id="fplan1" value="FinancePlan1" style="margin-right:20px" onclick="LoadExplaination()"> 3.99% for 60 months</li>
    <li><input type="radio" name="plan" id="fplan2" value="FinancePlan2" style="margin-right:20px" onclick="LoadExplaination()">2.99% for 48 months</li>
    <li><input type="radio" name="plan" id="fplan3" value="FinancePlan3" style="margin-right:20px" onclick="LoadExplaination()">1.99% for 36 months or less</li>
    <li class="grey"><button class="button" type="submit" onclick="return validatePaymentPlan()">Sign Up</button></li>
  </ul>
   </form>
</div></td>

<td align="left" ><div style="margin-left:10px;">
<textarea id="explain" style="border:0">Make a selection to see plan details</textarea>
</div></td>
</tr>

 <tr><td><div class="columns" style="margin-left:50px">
  <ul class="price">
    <li class="header">Lease</li>
    <li><input type="radio" name="plan" id="fLease" value="LeasePlan1" style="margin-right:20px" onclick="LoadExplaination()">$299 for 36 months </li>
    <li class="grey"><a href="Financing.jsp" class="button" onclick="return validatePaymentPlan()">Sign Up</a></li>
  </ul>
</div></td>
<td align="left" ><div style="margin-left:10px;">
<textarea id="explainLease" style="border:0">Make a selection to see plan details</textarea>
</div></td>
</tr>
 </table>  -->
 
</body>
</html>