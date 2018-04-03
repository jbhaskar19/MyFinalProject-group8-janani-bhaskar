<%@ page import="com.MyServlet"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SPECTRUM AUTOMOBILES</title>
<style>
body {
	font-family: Arial;
}

/* Style the tab */
.tab {
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #4CAF50;
}

.dropdown-content a:hover {
	background-color: #ddd
}

.dropdown:hover .dropdown-content {
	display: block;
}

/* Create an active/current tablink class */
.tab button.active {
	/*     background-color: #ccc; */
	background-color: #4CAF50;
}

/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
	border-top: none;
	
}

.Rdropdown-content {
    display: none;
    position: absolute;
    background-color: #f1f1f1;
    min-width: 160px;
    overflow: auto;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    right: 0;
    z-index: 1;
}

.Rdropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.Rdropdown a:hover {background-color: #ddd}

.Rshow {display:block;}
/* .Mheader {
    background-color: #f1f1f1;
    padding: 20px;
    text-align: center;
}
table {
    width: 100%;
    color:green;
} */
</style>
</head>
<body onload="openView(event, 'inventory')" >
<!-- <div class="Mheader">
<table>
  <tr style="width:500%" >
    <th align="left">SPECTRUM AUTOMOBILES</th>
    <th align="right"><a href="#">LOCATION:302 NE 79TH AVENUE</a></th>
  </tr>
  <tr>
  <td></td>
    <td align="right">SALES:9717245917</td>
  </tr>
  <tr>
  <td></td>
    <td align="right">PARTS:9717245917</td>
  </tr>
</table>
</div> -->
<div>
<%@include file="myHeader.jsp"%>
</div>
		<div class="tab">
		<button  class="tablinks" onclick="openView(event, 'inventory')">Inventory</button>
		<button  class="tablinks" onclick="openView(event, 'services')">Car Parts</button>		
<!-- 		<button  class="tablinks" onclick="openView(event, 'financing')">Financing</button>
		<button  class="tablinks" onclick="openView(event, 'about')">Cart</button> -->
 <%
 if((request.getSession().getAttribute("loogedintype")!=null)&&(request.getSession().getAttribute("loogedintype").toString().equals("admin"))){
	%>
	<button  class="tablinks" onclick="openView(event, 'adminservices')">Manage Account</button>
	<button  class="tablinks" onclick="openView(event, 'ManageDealerships')">Manage Dealerships</button>
	<%

 }
%>


 <%
 if((request.getSession().getAttribute("loogedintype")!=null)&&(request.getSession().getAttribute("loogedintype").toString().equals("customer"))){
	%>
	<button  class="tablinks" onclick="openView(event, 'customerservices')">Manage Profile</button>
	<button  class="tablinks" onclick="openView(event, 'customersell')">Sell Parts</button>
	<button  class="tablinks" onclick="openView(event, 'myorders')">SEE MY ORDERS</button>
	<%

 }
%>


 <%
 if((request.getSession().getAttribute("loogedintype")!=null)&&(request.getSession().getAttribute("loogedintype").toString().equals("dealer"))){
	 
	%>
	<button  class="tablinks" onclick="openView(event, 'dealerManageAccount')">Manage Account</button>
	<button  class="tablinks" onclick="openView(event, 'dealerservices')">Manage Dealership</button>

	<%

 }
%>

 <button  style="Float:right;" class="dropbtn" id = "logout" onclick="logoutUser()" >Logout-<% String  currentUser =  request.getAttribute("currentSessionUser").toString();%>
            <%= currentUser.toUpperCase() %></button>		
</div>

	<div id="home" class="tabcontent">
		<%@include file="Home.jsp"%>
	</div>

	<div id="inventory" class="tabcontent">
		<%@include file="inventory.jsp"%>
	</div>

	<div id="services" class="tabcontent">
		<%@include file="carPartsServices.jsp"%>
	</div> 

	<div id="dealerservices" class="tabcontent">
		<%@include file="dealerservices.jsp"%>
	</div>
	
		<div id="dealerManageAccount" class="tabcontent">
	<%@include file="dealerProfile.jsp"%>
	</div>
	
		<div id="customerservices" class="tabcontent">
		<%@include file="customerprofile.jsp"%>
	</div>

		<div id="customersell" class="tabcontent">
		<%@include file="customersell.jsp"%>
	</div>	
	
		<div id="myorders" class="tabcontent">
		<%@include file="PaymentPlan.jsp"%>
	</div>
	
		<div id="adminservices" class="tabcontent">
<%@include file="adminprofile.jsp"%>
	</div>
	
		<div id="ManageDealerships" class="tabcontent">

<%@include file="ManageDealerships.jsp"%>
	</div>
	
	<div id="about" class="tabcontent">
		<%@include file="About.jsp"%>
	</div>
	<div id="login" class="tabcontent">

		<%@include file="Login.jsp"%>
	</div>
	<script>

	function logoutUser(){
		window.location = 'Root.jsp';
		<% request.setAttribute("currentSessionUser",null);
		%>
	}
	
function openView(evt, service) {
	
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(service).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>

</body>
</html>

