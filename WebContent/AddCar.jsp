<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AddCar</title>
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

function Upload() {
    //Get reference of FileUpload.
    var fileUpload = document.getElementById("fileUpload");
 if(document.getElementById("fileUpload").value!=""){
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
                    if ((height != 300) && (width != 500)) {
                        alert("Height and Width must not exceed 100px.");
                        document.getElementById("addcar").type="hidden";
                        return false;
                    }else{
                    alert("Uploaded image has valid Height and Width.");
                    document.getElementById("addcar").type="visible";
                    return true;
                   }
                };
 
            }
        } else {
            alert("This browser does not support HTML5.");
            document.getElementById("addcar").type="hidden";
            return false;
        }
    } else {
        alert("Please upload JPG image file only.");
        document.getElementById("addcar").type="hidden";
        return false;
    }



    }else{
    	  alert("Please upload JPG image, Cannot save without image");
          document.getElementById("addcar").type="hidden";
          return false;
        }



}

function validateNewCarForm(){

	//newcarmake newcarmodel newcaryear newcarprice newcarengine newcartrans  newcarvin newcarext newcarinter newcarHMil newcarCMil newcarDis

	if(document.getElementById("newcarmake").value=="" && document.getElementById("newcarmodel").value=="" &&
		document.getElementById("newcaryear").value==""&& document.getElementById("newcarprice").value=="" &&
		document.getElementById("newcarengine").value=="" && document.getElementById("newcartrans").value=="" &&
		document.getElementById("newcarvin").value =="" && document.getElementById("newcarinter").value=="" &&
		document.getElementById("newcarHMil").value =="" && document.getElementById("newcarCMil").value=="" &&
		document.getElementById("newcarDis").value =="" && document.getElementById("fileUpload").value==""){
alert("CANNOT SUBMIT EMPTY FORM");
return false;
		}else
			{
			alert(document.getElementById("newcarmake").value+" "+document.getElementById("newcarmodel").value+" "+
					document.getElementById("newcaryear").value+" "+document.getElementById("newcarprice").value+" "+
					document.getElementById("newcarengine").value+" "+document.getElementById("newcartrans").value+" "+
					document.getElementById("newcarvin").value+" "+document.getElementById("newcarinter").value+" "+
					document.getElementById("newcarHMil").value+" "+document.getElementById("newcarCMil").value+" "+
					document.getElementById("newcarDis").value +">>>>"+ document.getElementById("fileUpload").value);
			document.addnewcar.submit();

			}
}

</script>
</head>
<body>
<form method="post" action="addCartoInventory" style="border:0" name="addnewcar">
	<table>
		<tr>
			<td><label>MAKE</label></td>
			<td><input type="text" id="newcarmake" name="newcarmake"></td>
		</tr>
		<tr>
			<td><label >MODEL</label></td>
			<td><input type="text" id="newcarmodel" name="newcarmodel"></td>
		</tr>
		<tr>
			<td><label>YEAR</label></td>
			<td><input type="text" id="newcaryear" name="newcaryear"></td>
		</tr>

		<tr>
			<td><label >PRICE</label></td>
			<td><input type="text" id="newcarprice" name="newcarprice"></td>
		</tr>

		<tr>
			<td><label >ENGINE</label></td>
			<td><input type="text" id="newcarengine" name="newcarengine"></td>
		</tr>

		<tr>
			<td><label>TRANSMISSION</label></td>
			<td><input type="text" id="newcartrans" name="newcartrans"></td>
		</tr>

		<tr>
			<td><label >VIN NUMBER</label></td>
			<td><input type="text" id="newcarvin" name="newcarvin"></td>
		</tr>

		<tr>
			<td><label >EXTERIOR</label></td>
			<td><input type="text" id="newcarext" name="newcarext"></td>
		</tr>
		<tr>
			<td><label>INTERIOR</label></td>
			<td><input type="text" id="newcarinter" name="newcarinter"></td>
		</tr>

		<tr>
			<td><label >HIGHWAY MILEGAE</label></td>
			<td><input type="text" id="newcarHMil" name="newcarHMil">
			</td>
		</tr>
		
		<tr>
			<td><label >CITY MILEGAE</label></td>
			<td><input type="text" id="newcarCMil" name="newcarCMil">
			</td>
		</tr>

		<tr>
			<td><label >DISCOUNT</label></td>
			<td><input type="text" id="newcarDis" name="newcarDis">
			</td>
		</tr>
		<tr>
			<td><label>IMAGE</label></td>
			
			<td> <input type="file" id="fileUpload"  name="fileUpload" />
  <input type="button" value="Upload" onclick="return Upload()" /> 
			</td>
		</tr>

		<tr>
			<td colspan="2"><input id="addcar" value="Add Car to Inventory" onclick="return validateNewCarForm()" type="hidden"></td>
		</tr>

	</table>
				</form>		
</body>
</html>