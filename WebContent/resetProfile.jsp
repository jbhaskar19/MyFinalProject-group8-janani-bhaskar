<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RESET PASSWORD FORM</title>
<style>
.white-box {
    background-color: white;
    width:50%;
    height:250px;
    color: green;
 margin-left:250px;
  border: 1px solid #aaaaaa;
}
input {
padding-top:20px;
  width: 60%;
  font-size: 17px;
  font-family: Raleway;
  border: 1px solid #aaaaaa;
}
</style>
</head>
<body >
<h3 style="color:green; margin-top:180px; margin-left:250px;">RESET PASSWORD FORM</h3>
<form method="POST" action="manageActivities">
<div class="white-box">
<label style="padding-right:20px;padding-left:10px">Username:</label><input id="rusername" name="rusername">
<button type="submit"> CHANGE PASSWORD </button>
</div>
</form>
</body>
</html>