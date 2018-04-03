<%@ page import = "com.service.DAO.InventoryDAO"%>
<%@ page import ="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
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
</style>
</head>
<body>
<form action="" style = "width:100%">
	<button class="collapsible">INTERIOR ASCCESSORIES</button>
	<div class="content">
		<fieldset>
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
		</fieldset>
	</div>

	<button class="collapsible">EXTERIOR ASCCESSORIES</button>
	<div class="content">
		<p>display db contents here</p>
	</div>
	<button class="collapsible">LIGHTS</button>
	<div class="content">
		<p>display db contents here</p>
	</div>
<button class="collapsible">OTHER SERVICES</button>
	<div class="content">
		<p>SELL PARTS</p>
	</div>
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
</form>
</body>
</html>

