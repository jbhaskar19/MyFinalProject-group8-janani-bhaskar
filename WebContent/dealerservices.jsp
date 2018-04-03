<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.service.model.Dealer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.accordion {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 18px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}

.active, .accordion:hover {
    background-color: #ccc; 
}

.panel {
    padding: 0 18px;
    display: none;
    background-color: white;
    overflow: hidden;
}
</style>
</head>
<body>

<h2>My Activities</h2>

<%if((request.getSession().getAttribute("addstatus")!=null) && (request.getSession().getAttribute("addstatus").toString().equals("success") )) {
	
	%>
	<input type="text" style="border: 0;" value="NEW CAR ADDED TO INVENTORY" >
	<%
}%>

<button class="accordion">ADD CAR TO INVENTORY</button>
<div class="panel">
		<%@include file="AddCar.jsp"%>
</div>

<button class="accordion">ADD CAR PARTS TO INVENTORY</button>
<div class="panel">
		<%@include file="AddCarParts.jsp"%></div>
<button class="accordion">REMOVE CAR FROM INVENTORY</button>
<div class="panel">
		<%@include file="RemoveCar.jsp"%>
</div>

<button class="accordion">REMOVE CAR PARTS FROM INVENTORY</button>
<div class="panel">
		<%@include file="RemoveCarParts.jsp"%></div>		
		

<button class="accordion">SEE SALES REPORT</button>
<div class="panel">
  <p>Future Enhancement</p>
</div>

<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.display === "block") {
            panel.style.display = "none";
        } else {
            panel.style.display = "block";
        }
    });
}
</script>
<%-- <%
Dealer mydealer = new Dealer();
if(request.getSession().getAttribute("loogedindealer")!=null){ mydealer = (Dealer)request.getSession().getAttribute("loogedindealer"); }%> --%>
</body>
</html>