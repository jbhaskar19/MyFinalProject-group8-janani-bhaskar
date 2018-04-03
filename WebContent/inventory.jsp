<%@page import="com.service.model.CarInventory"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import = "com.service.DAO.InventoryDAO"%>
<%@ page import = "com.service.model.Dealer"%>

<%@ page import ="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Inventory</title>
<script>

function validateFormSearch() {
var validationForm=true;
if(document.getElementById("dealer").value==0)
{
	alert("Please Select A Dealership");
	validationForm=false;
	}
	if(validationForm){
		openSearchView(event, 'searchI');
		}
 return validationForm;   
}
</script>
<style>
.mySlides {
	display: none;
}</style>
<script>

function openSearchView(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("searchResult");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("search");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active"; 
}
</script>
<style>
.searchbar {
    background-color: #f1f1f1;
    padding: 20px;
    text-align: left;
}
body {font-family: Arial;}

/* Style the tab */
.lookupInventory {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
    padding: 20px;
    
}

/* Style the buttons inside the tab */
.lookupInventory button {
    background-color: inherit;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 20px;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of buttons on hover */
.lookupInventory button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
.lookupInventory button.active {
    background-color: #ccc;
}

/* Style the tab content */
.searchResult {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 350px;
  text-align: center;
  font-family: arial;
  font-size: 10px;
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
</style>
</head>
<body>
<!-- onclick="return validateFormSearch()" class="search" -->
<form method="POST" action="CarSearch" onsubmit="return validateFormSearch()">
 <div class="lookupInventory">
<label>MAKE</label>
<select id="make" name="make">
  <option value="0">Car Make</option>
  <%
  System.out.println("Fetching Car make list");
	 InventoryDAO dao = new InventoryDAO();
		 List<String> carmake = dao.getCarMake();
		 for(int i=0;i<carmake.size();i++)
		  {
			 String make = carmake.get(i);  
			  %>  <option value=  "<%=make %>" > <%=make %> </option>
		<% } %>  
</select>


<label>MODEL</label>
<select id="model" name="model"  >
  <option value="0">Car Model</option>
  <%  System.out.println("Fetching Car Model list");

		 List<String> cars = dao.getCarModels();	  
		 for(int i=0;i<cars.size();i++)
		  {
			 String model = cars.get(i);  
			  %>  <option value=  "<%=model %>" > <%=model %> </option>
		<% } %>  
</select>

<label>DEALERSHIP</label>
<select id="dealer" name="dealer">
  <option value="0">Dealership</option>
  <%  System.out.println("Fetching Car Dealership list");

		 List<Object> dealership = dao.getDealership();	  

		 for(int i=0;i<dealership.size();i++)
		  {
			 Object[] deal =  (Object[]) dealership.get(i); 
			String dealershipname= deal[0].toString();
			  %>  <option value=  "<%=deal[1].toString() %>" > <%=dealershipname %> </option>
		<% } %>  
</select>
<label>YEAR</label>
<select  id="year" name="year">
  <option value="0">year</option>
  <option value="2018">2018</option>
  <option value="2017">2017</option>
  <option value="2016">2016</option>
  <option value="2015">2015</option>
</select>
  <!-- onclick="return validateFormSearch()" class="search" -->
  <button> SEARCH</button>
</div>
<%--  <div id="searchI" class="searchResult" style="position: absolute; top: 300px; ">
		<%@include file="SearchResult.jsp"%></div>  --%>
</form>
 
<%-- <%
String[] names={"AAA", "BBB", "CCC", "DDD", "EEE"};
for(int i=0;i<names.length;i++){
	String name=names[i];
	%>
	<input id="myid" value="return dealerSelected()" type="hidden"></input>
	<div>Loading search result</div>
	<div class="card">
	  <img src="" alt="John" style="width:100%">
	  <h1>Car Name: John Doe</h1>

	  <p class="title">Exterior Color: John Doe <%= name%></p>
	  
	    <p class="title">Interior Color: John Doe <%= name%></p>
	        <p class="title">Stock No:</p>
	    
	  <p>Harvard University</p>
	 <p><button class="buy" type="submit">BUY CAR</button></p>
	</div>
	<%
}
%> --%>
 
</body>
</html>