<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="header.js"></script>
<style>
.mySlides {
	display: none;
}</style>
</head>
<body onLoad="return loadHeader();">
<div style="position: absolute; top: 150px; left:25px">
	<h1>HOME</h1>
		<div class="w3-content w3-section" style="max-width: 500px">
			<img class="mySlides" src="images/homePage/q.jpg" style="width: 100%"> 
			<img class="mySlides" src="images/homePage/a.jpg" style="width: 100%"> 
			<img class="mySlides" src="images/homePage/z.jpg" style="width: 100%">
			<img class="mySlides" src="images/homePage/w.jpg" style="width: 100%"> 
			<img class="mySlides" src="images/homePage/s.jpg" style="width: 100%"> 
			<img class="mySlides" src="images/homePage/x.jpg" style="width: 100%">
		</div>
		</div>
 		<script>
			var myIndex = 0;
			carousel();

			function carousel() {
				var i;
				var x = document.getElementsByClassName("mySlides");
				for (i = 0; i < x.length; i++) {
					x[i].style.display = "none";
				}
				myIndex++;
				if (myIndex > x.length) {
					myIndex = 1
				}
				x[myIndex - 1].style.display = "block";
				setTimeout(carousel, 4000); // Change image every 2 seconds
			}
		</script>
</body>
</html>