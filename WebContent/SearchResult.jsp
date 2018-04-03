<%@page import="com.CarSearch"%>
<%@page import="com.service.model.Customer"%>
<%@page import="com.service.model.CarInventory"%>
<%@page import="com.service.DAO.InventoryDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SEARCH RESULT</title>

<style>
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	max-width: 350px;
	text-align: center;
	font-family: arial;
	font-size: 10px;
	float: left;
	margin-right: 7px;
	margin-bottom: 7px;
	margin-bottom: 20px;
}

.searchtitle {
	color: grey;
	font-size: 18px;
}

.buy {
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

.buy:hover {
	opacity: 0.7;
}
/* .MSheader {
    background-color: #f1f1f1;
    padding: 20px;
    text-align: center;
    	border: 1px solid #ccc;
    margin-bottom:5px
} */
logo {
	height: 100px;
	width: 200px;
	overflow: hidden;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	position: relative;
	background-color: #fefefe;
	margin: auto;
	padding: 0;
	border: 1px solid #888;
	width: 80%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	-webkit-animation-name: animatetop;
	-webkit-animation-duration: 0.4s;
	animation-name: animatetop;
	animation-duration: 0.4s
}

/* The Close Button */
.close {
	color: white;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.modal-header {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
}

.modal-body {
	padding: 2px 16px;
}

.modal-footer {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
}

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
function displayFunction(myval,myvalu,en,pr,mk,disc,ctm,hwm,ex,it,yr,tr,vinnum,ir,vdid){
 	// Get the modal
	var modal = document.getElementById('myModal');

	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	var s = document.getElementById("vid");
	 s.value=myval;

		var s = document.getElementById("model");
		 s.value=myvalu;

			var e = document.getElementById("engine");
			e.value=en;
			var p = document.getElementById("price");
		 p.value=pr;
			var vmk = document.getElementById("make");
			vmk.value=mk;
				var vdisc = document.getElementById("disct");
				vdisc.value=disc;
					var vctm = document.getElementById("ctmilage");
					vctm.value=ctm;
						var vhwm = document.getElementById("hwmilage");
						vhwm.value=hwm;
				
						var vex = document.getElementById("extreior");
						vex.value=ex;
						var vit = document.getElementById("interior");
						vit.value=it;
						var vtr = document.getElementById("transmi");
						vtr.value=tr;
						var vvinnum = document.getElementById("num");
						vvinnum.value=vinnum;
						var vyr = document.getElementById("year");
						vyr.value=yr;
						var vir = document.getElementById("img");
						vir.src="images/carimages/"+ir+".jpg"; 
						var vdsid = document.getElementById("dshipIDnum");
						vdsid.value=vdid;
	modal.style.display = "block"; 
}
</script>

<script>

function spanclick() {
	//Get the modal
	var modal = document.getElementById('myModal');

	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");
	//Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	//When the user clicks on <span> (x), close the modal
    modal.style.display = "none";

  //When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
}
}

function make(){
	var s = document.getElementById("model");
	var f = document.getElementById("vid");
	var e = document.getElementById("engine");
	var p = document.getElementById("price");
	//document.form1.submit();  
}
</script>
</head>
<body>

	<div>
		<%@include file="myHeader.jsp"%>
	</div>
	<div style="position: absolute; top: 150px;">	
		<% CarInventory car = new CarInventory();	
InventoryDAO searchdao = new InventoryDAO();
if(request.getParameter("make")!=null){
	System.out.println(">>>>>>>>>>"+request.getParameter("make"));

car.setMake(request.getParameter("make"));}
if(request.getParameter("model")!=null)
{
	System.out.println(">>>>>>>>>>"+request.getParameter("model"));

car.setModel(request.getParameter("model"));}
if(request.getParameter("year")!=null){
	System.out.println(">>>>>>>>>>"+request.getParameter("year"));

car.setYear(Integer.parseInt(request.getParameter("year")));
}
System.out.println(">>>>>>>>>>"+request.getParameter("dealer"));

car.setDsId(request.getParameter("dealer"));

List<CarInventory> resultcars = searchdao.SearchCarInventory(car);
CarInventory carselected=new CarInventory();
for(CarInventory mycar: resultcars){
	String carimageid = "images/carimages/"+mycar.getIr().toLowerCase()+".jpg"; 
	//String carimageid =  "images/carimages/redcrv.jpg";
	 System.out.println(">>>>>>>>>>"+carimageid);
%>
		<div class="card">
			<div class="logo">
				<img src=<%= carimageid%> alt="car image" style="width: 50%; height: 50%">
			</div>
			<h1>Car Name:<%= mycar.getModel()%></h1>
			<p class="searchtitle">
				Price:<%= mycar.getPrice().toString()%></p>
			<p class="searchtitle">
				Make:<%= mycar.getMake()%></p>
			<p class="searchtitle">
				Model:<%= mycar.getModel()%></p>
			<p class="searchtitle">
				Transmission:<%= mycar.getTransmission()%></p>
			<p>
				<button class="buy" id="myBtn" value="<%= mycar.getVid()%>"
					onclick="displayFunction('<%= mycar.getVid()%>','<%= mycar.getModel()%>','<%= mycar.getEngine()%>',
	  						  '<%= mycar.getPrice()%>','<%= mycar.getMake()%>','<%= mycar.getDiscount()%>',
	                           '<%= mycar.getCitymilage()%>','<%= mycar.getHwymilage()%>','<%= mycar.getExterior()%>',
	                           '<%= mycar.getInterior()%>','<%= mycar.getYear()%>',
	                           '<%= mycar.getTransmission()%>','<%= mycar.getVinNumber()%>','<%= mycar.getIr()%>','<%= mycar.getDsId()%>')">info</button>
			</p>
		</div>

		<%} %>

	</div>


	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<span class="close" onclick="spanclick()">&times;</span>
				<h2>Modal Header</h2>
			</div>
			<div class="modal-body">
				<form action="CarPurchaseServlet" method="POST" name="form1">	
						
<table style="width:100%">
  <tr>
    <td rowspan="16"><img id="img" name="img"></td>
  </tr>

<tr>
<td>
<fieldset style="border-color:#f1f1f1">
<legend>VEHICLE INFO</legend>
<label>ID</label>:<input id="vid" name="vid" style="border:0; padding-left:20px"><br>
<label>MAKE</label> <input id="make" name="make" style="border:0 ;padding-left:20px"><br>
<label>MODEL</label><input id="model" name="model" style="border:0 ;padding-left:20px"><br>
<label>YEAR</label><input id="year" name="year" style="border:0; padding-left:20px"><br>
<label>ENGINE</label><input id="engine" name="engine" style="border:0; padding-left:20px"><br>
<label>TRANSMISSION</label><input id="transmi" name="transmi" style="border:0; padding-left:20px" ><br>
<label>CITY MILEAGE</label><input id="ctmilage" name="ctmilage" style="border:0; padding-left:20px"><br>
<label>HIGHWAY MILAGE</label><input id="hwmilage" name="hwmilage" style="border:0; padding-left:20px"><br>
<label>VIN NUMBER</label><input id="num" name="num" style="border:0"><br>
<input id="dshipIDnum" name="dshipIDnum" style="border:0" type="hidden"><br>

</fieldset>
</td>
</tr>

 <tr>
 <td>
 <fieldset style="border-color:#f1f1f1">
<legend>Color Info</legend>
<label>Exterior</label> <input id="extreior" name="extreior" style="border:0; padding-left:20px"> <br>
<label>Interior</label>  <input id="interior"	name="interior" style="border:0; padding-left:20px"><br>
</fieldset>
</td>
</tr>  


<tr>
<td> 
<fieldset style="border-color:#f1f1f1">
<legend>Price Info</legend>
<label>VPRICE</label><input id="price" name="price" style="border:0; padding-left:20px"><br>
<label>DISCOUNT</label><input id="disct" name="disct" style="border:0; padding-left:20px"><br>
</fieldset>
</td>
</tr>  
</table>
<button onclick="make()" class="buttonB buyButtonModal">Add to cart</button>
</form>
</div>
</div>
</div>
</body>
</html>