    <%@ page import="com.service.model.Customer" %>
        <%@ page import="com.service.model.Dealer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AddCarParts</title>

<style type="text/css">
input[type=visible] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: right;
	width:100%;
	text-align: center;
	
}

input[type=visible]:hover {
	background-color: #45a049;
}
</style>
<script >

function UploadCarPartsImage() {
    //Get reference of FileUpload.
    var fileUpload = document.getElementById("filecarpartUpload");
 if(document.getElementById("filecarpartUpload").value!=""){
    //Check whether the file is valid Image.
    var regex = new RegExp("([a-zA-Z0-9\s_\\.\-:])+(.jpg)$");
    if (regex.test(fileUpload.value.toLowerCase())) {
 
        //Check whether HTML5 is supported.
        if (typeof (fileUpload.files) != "undefined") {
            //Initiate the FileReader object.
            var reader = new FileReader();
            //Read the contents of Image File.
            reader.readAsDataURL(fileUpload.files[0]);
            reader.onload = function (e) {
                //Initiate the JavaScript Image object.
                var image = new Image();
 
                //Set the Base64 string return from FileReader as source.
                image.src = e.target.result;
                       
                //Validate the File Height and Width.
                image.onload = function () {
                    var height = this.height;
                    var width = this.width;
                    alert(height+" "+width)
                    if ((height != 250) && (width != 300)) {
                        alert("Height and Width must not exceed 300X250.");
                        document.getElementById("addcarpart").type="hidden";
                        return false;
                    }else{
                    alert("Uploaded image has valid Height and Width.");
                    document.getElementById("addcarpart").type="visible";
                    return true;
                   }
                };
 
            }
        } else {
            alert("This browser does not support HTML5.");
            document.getElementById("addcarpart").type="hidden";
            return false;
        }
    } else {
        alert("Please upload JPG image file only.");
        document.getElementById("addcarpart").type="hidden";
        return false;
    }



    }else{
    	  alert("Please upload JPG image, Cannot save without image");
          document.getElementById("addcarpart").type="hidden";
          return false;
        }



}

function validateNewCarPartsForm(){

	//newcarmake newcarmodel newcaryear newcarprice newcarengine newcartrans  newcarvin newcarext newcarinter newcarHMil newcarCMil newcarDis
//newcarpartname newcarpartmake newcarpartmodel newcarpartyear newcarpartprice newcarparttype newcarpartcategory newcarpartquantity

	if(document.getElementById("newcarpartname").value=="" && document.getElementById("newcarpartmake").value=="" &&
		document.getElementById("newcarpartmodel").value==""&& document.getElementById("newcarpartyear").value=="" &&
		document.getElementById("newcarpartprice").value=="" && document.getElementById("newcarparttype").value=="" &&
		document.getElementById("newcarpartcategory").value =="" && document.getElementById("newcarpartquantity").value=="" &&
		document.getElementById("filecarpartUpload").value==""){
alert("CANNOT SUBMIT EMPTY FORM");
return false;
		}else
			{
			alert(document.getElementById("newcarpartname").value+" "+document.getElementById("newcarpartmake").value+" "+
					document.getElementById("newcarpartmodel").value+" "+document.getElementById("newcarpartyear").value+" "+
					document.getElementById("newcarpartprice").value+" "+document.getElementById("newcarparttype").value+" "+
					document.getElementById("newcarpartcategory").value+" "+document.getElementById("newcarpartquantity").value+" "+
					document.getElementById("newcarHMil").value+" "+ document.getElementById("filecarpartUpload").value);
document.addnewcarpart.submit();
			}
}

</script>
</head>
<body>

<!-- UPDATE `ITMD_515`.`car_parts_inventory`
SET

 -->
<form method="post" action="addCarPartstoInventory" style="border:0" name="addnewcarpart">
	<table>
			<tr>
			<td><label >PART NAME</label></td>
			<td><input type="text" id="newcarpartname" name="newcarpartname"></td>
		</tr>
		<tr>
			<td><label>MAKE</label></td>
			<td><input type="text" id="newcarpartmake" name="newcarpartmake"></td>
		</tr>
		<tr>
			<td><label >MODEL</label></td>
			<td><input type="text" id="newcarpartmodel" name="newcarpartmodel"></td>
		</tr>
		<tr>
			<td><label>YEAR</label></td>
			<td><input type="text" id="newcarpartyear" name="newcarpartyear"></td>
		</tr>

		<tr>
			<td><label >PRICE</label></td>
			<td><input type="text" id="newcarpartprice" name="newcarpartprice"></td>
		</tr>

		<tr>
			<td><label >TYPE</label></td>
			<td><input type="text" id="newcarparttype" name="newcarparttype"></td>
		</tr>

		<tr>
			<td><label>CATEGORY</label></td>
			<td><input type="text" id="newcarpartcategory" name="newcarpartcategory"></td>
		</tr>
		<tr>
			<td><label >QUANTITY</label></td>
			<td><input type="text" id="newcarpartquantity" name="newcarpartquantity"></td>
		</tr>
		

		
 <% if((request.getSession().getAttribute("loogedintype")!=null)&&(request.getSession().getAttribute("loogedintype").toString().equals("dealer"))){
	 Dealer  dealSell= (Dealer)request.getSession().getAttribute("loogedindealer");
%>

		<tr>
			<td><label >SELLER</label></td>
			<td><input type="text" id="newcarpartseller" name="newcarpartseller" value=<%=dealSell.getDid()%> disabled></td>
		</tr>
<%
} %>

		<tr>
			<td><label>IMAGE</label></td>
			
			<td> <input type="file" id="filecarpartUpload"  name="filecarpartUpload" />
  <input type="button" value="Upload" onclick="return UploadCarPartsImage()" /> 
			</td>
		</tr>

		<tr>
			<td colspan="2"><input id="addcarpart" value="Add Car to Inventory" onclick="return validateNewCarPartsForm()" type="hidden"></td>
		</tr>

	</table>
				</form>		
</body>
</html>