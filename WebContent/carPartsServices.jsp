<%@page import="com.service.model.CarInventory"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import = "com.service.DAO.InventoryDAO"%>
<%@ page import ="java.util.List" %>
<%@ page import =" java.util.Map" %>
<%@ page import =" java.util.Set" %>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="java.util.Iterator" %>
<%@ page import ="com.service.model.CarPartsInventory" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Car Parts Services</title>
<style>

.pagination {
    display: inline-block;
}

.pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
}

.collapsible {
	background-color: #777;
	color: white;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
}

.active, .collapsible:hover {
	background-color: #555;
}

.content {
	padding: 0 18px;
	display: none;
	overflow: hidden;
	background-color: #f1f1f1;
}

/* The container */
.container {
	display: block;
	position: relative;
	padding-left: 35px;
	margin-bottom: 12px;
	cursor: pointer;
	font-size: 22px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

/* Hide the browser's default checkbox */
.container input {
	position: absolute;
	opacity: 0;
	cursor: pointer;
}

/* Create a custom checkbox */
.checkmark {
	position: absolute;
	top: 0;
	left: 0;
	height: 25px;
	width: 25px;
	background-color: #eee;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
	background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
	background-color: green;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
	content: "";
	position: absolute;
	display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
	display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
	left: 9px;
	top: 5px;
	width: 5px;
	height: 10px;
	border: solid white;
	border-width: 0 3px 3px 0;
	-webkit-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	transform: rotate(45deg);
}
 #items{
  overflow-x: scroll;
  width: auto;
      white-space: nowrap;
  }
  
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
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
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

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}

.modal-body {padding: 2px 16px;}

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

</script>
<script type="text/javascript">

function validateCarpartSearch(){	
	var validationForm=true;

	alert(document.getElementById("pmake").value+" "+document.getElementById("pmodel").value+" "+document.getElementById("pyear").value+" "+document.getElementById("part number").value);

// if(document.getElementsByClassName("getAllPartsc")[0].checked){
// 	alert(document.getElementsByClassName("getAllPartsc")[0].value);	
// }
// else
	if((document.getElementById("pmake").value==0) && (document.getElementById("pmodel").value==0) && (document.getElementById("pyear").value==0)&&
			(document.getElementById("part number").value==""))
	{
		alert("Please Select A Criteria for search");
		validationForm=false;
		}
	 return validationForm; 
}
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

var quan;
function getpartchecked(val,val1,val2,val3,val4,val5,val6,v7,v8,v9){
	// Get the modal
	var modal = document.getElementById('myModal');

	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	modal.style.display = "block"; 

	var pd= document.getElementById("pid");
	pd.value=val;
	var pm= document.getElementById("ppmodel");
	pm.value=val1;
	var pma= document.getElementById("ppmake");
	pma.value=val2;
	var py= document.getElementById("ppyear");
	py.value=val3;

	var pp= document.getElementById("pprice");
	pp.value=val4;
	var pdimg= document.getElementById("pimg");
	pdimg.value=val5;
	var psell= document.getElementById("pselle");
	psell.value=val6;
	
	var cap=document.getElementById("capacity");
	cap.value=v7;	
	
	var pnames=document.getElementById("nameofpart");
		pnames.value=v8;

		var dealeridforpart = document.getElementById("dealerPartId");
		dealeridforpart.value=v9;
quan=v7;

}

function checkQuantity(){
	alert(">>>>"+document.getElementById("pquantity").value+" "+document.getElementById("capacity").value);
var myvalid=true;
if(document.getElementById("pquantity").value==""){
	alert("Please enter quantity");
	myvalid=false;
}

if(!(document.getElementById("pquantity").value <=document.getElementById("capacity").value)){
	alert("Only "+document.getElementById("capacity").value+" parts are avialable."+"\n"+"Please choose appropriate quantity");
	myvalid=false;
}

return myvalid;
}

</script>
</head>
<body>

<!-- <button class="collapsible">LOOK UP PARTS</button> -->
<!-- 	 <input type="checkbox"  name="getAllParts" class= "getAllPartsc" value="*"> GET ALL PARTS <br> -->
<%-- <label>MAKE</label>
<select id="pmake" name="pmake">
  <option value="0">Car Make</option>
  <%
  System.out.println("Fetching Car parts make list");
	 InventoryDAO cpdao = new InventoryDAO();
		 List<String> carpartsmake = cpdao.getCarPartsMake();
		 for(int i=0;i<carpartsmake.size();i++)
		  {
			 String make = carpartsmake.get(i);  
			  %>  <option value=  "<%=make %>" > <%=make %> </option>
		<% } %>  
</select>

<label>Model</label>
<select id="pmodel" name="pmodel">
  <option value="0">Car Model</option>
  <%
  System.out.println("Fetching Car parts model list");

		 List<String> carpartsmodel = cpdao.getCarPartsModel();
		 for(int i=0;i<carpartsmodel.size();i++)
		  {
			 String make = carpartsmodel.get(i);  
			  %>  <option value=  "<%=make %>" > <%=make %> </option>
		<% } %>  
</select>

<label>Year</label>
<select  id="pyear" name="pyear">
  <option value="0">year</option>
  <option value="2018">2018</option>
  <option value="2017">2017</option>
  <option value="2016">2016</option>
  <option value="2015">2015</option>
</select>
  
<label>Part Number</label>
  <input id="part number" name="part number" > --%>

<!-- <button >SEE MY CART</button> -->
<!-- </div>
	<div class="content">
			<label class="container"><br>DISPLAY PART NAME HERE 
			<input type="checkbox" checked="checked" value="item checked"> 
			<span class="checkmark"></span> </label>
			<div class="card">
				<img src="/w3images/team2.jpg" alt="John" style="width: 20%">
				<h1>Part Name: John Doe</h1>
				<p class="searchtitle">Price: John Doe</p>
				<p class="searchtitle">Stock No:</p>
				<p>
					<button class="buy" >BUY CAR</button>
				</p>
	</div>
-->
<% 
InventoryDAO cpdao = new InventoryDAO();
List<CarPartsInventory> myinventory = cpdao.getCarPartsInventory(); 
HashMap<String, String> hmap=cpdao.getCategoriesandType(myinventory);
Set set = hmap.entrySet();
/* for(CarPartsInventory part:myinventory){
	//System.out.println(part.getType());
	while(iterator.hasNext()) {
   Map.Entry mentry = (Map.Entry)iterator.next();
   String cate=mentry.getKey().toString();
   String ty=mentry.getValue().toString();
   System.out.println("key is: "+cate + " & Value is: "+ty);
}}
 */
for (String  categ: hmap.keySet()){
    String key =categ.toString();
    String value = hmap.get(categ).toString();  
    System.out.println(key); 
    %>
    <button class="collapsible" ><%=key%></button>
       <div id="items">   
    <%
    for(CarPartsInventory part:myinventory){
   
    	if(part.getCategory().equalsIgnoreCase(key)){
    
    		System.out.println("****"+part.getPid()+"imag name:"+part.getIr());
    		String carpartimageid = "images/carparts/"+part.getIr().toLowerCase()+".jpg"; 
    		%>
    		 
    		<div class="card" style="padding: 0 18px; display: inline-block; margin-left:5px">
    			<%-- <input type="checkbox"  id="partchecked" value=<%=part.getPid()%>>  --%>
			<span class="checkmark"></span>

			 <img src=<%=carpartimageid%> alt="car part image" style="width: 20%">

				<p class="searchtitle">Product Name: <%=part.getName() %></p>
				<p class="searchtitle">Stock No:<%=part.getPid()%></p>
				<p class="searchtitle">Price:<%=part.getPrice()%></p>

 		<p>
					<button class="buy" onclick="getpartchecked('<%=part.getPid()%>','<%=part.getMake()%>','<%=part.getModel()%>','<%=part.getYear()%>','<%=part.getPrice()%>','<%=part.getIr()%>','<%=part.getSeller()%>','<%=part.getQuantity()%>','<%=part.getName() %>','<%=part.getDsid()%>')">view info</button>
				</p>

			 </div>

    		<%

    	}	             
    	
    }
   %>
</div>  
    <%
}

/*  for(CarPartsInventory part:myinventory){
	//System.out.println(part.getType()); */	 

	%>
	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<span class="close" onclick="spanclick()">&times;</span>
				<h2>Modal Header</h2>
			</div>
			<div class="modal-body">
				<form method="POST" action="carpartCart">	
						
<table style="width:100%">
  <tr>
    <td rowspan="16"><img id="pimg" name="pimg" src="/w3images/team2.jpg"></td>
  </tr>

<tr>
<td> 
<fieldset style="border-color:#f1f1f1">
<legend>VEHICLE INFO</legend>
<label>ID</label><input id="pid" name="pid" style="border:0; padding-left:20px"><br>
<label>MAKE</label><input id="ppmake" name="ppmake" style="border:0 ;padding-left:20px"><br>
<label>MODEL</label><input id="ppmodel" name="ppmodel" style="border:0 ;padding-left:20px"><br>
<label>YEAR</label><input id="ppyear" name="ppyear" style="border:0; padding-left:20px"><br>
<label>PRICE</label><input id="pprice" name="pprice" style="border:0; padding-left:20px"><br>
<label>QUANTITY</label><input id="pquantity" name="pquantity" style="border:0; padding-left:20px" ><br>
<label>SELLER</label><input id="pselle" name="pselle" style="border:0; padding-left:20px"><br>
<label>NAME</label><input id="nameofpart" name="nameofpart" style="border:0; padding-left:20px"><br>
<input id="capacity" name="capacity" style="border:0; padding-left:20px" type="hidden"><br>
<input id="dealerPartId" name="dealerPartId" style="border:0; padding-left:20px" type="hidden"><br>



</fieldset>
</td>
</tr>
</table> 
<button class="buttonB buyButtonModal" onclick="return checkQuantity()">Add to cart</button>
</form>
</div>
</div>
</div>

<!-- <table style="width:100%">
  <tr>
    <td rowspan="16"><img id="img" name="img"></td>
  </tr>

<tr>
<td>
<fieldset style="border-color:#f1f1f1">
<legend>Part INFO</legend>
<label>ID</label>:<input id="pid" name="pid" style="border:0; padding-left:20px"><br>
<label>MAKE</label> <input id="pmake" name="pmake" style="border:0 ;padding-left:20px"><br>
<label>MODEL</label><input id="pmodel" name="pmodel" style="border:0 ;padding-left:20px"><br>
<label>YEAR</label><input id="pyear" name="pyear" style="border:0; padding-left:20px"><br>
</fieldset>
</td>
</tr>
</table> -->

	<script>
var coll = document.getElementsByClassName("collapsible");
var i;
for (i = 0; i < coll.length; i++) {
    coll[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var content = this.nextElementSibling;
        if (content.style.display === "block") {
            content.style.display = "none";
        } else {
            content.style.display = "block";
        }
    });
}
</script>
</body>
</html>