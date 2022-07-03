<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>New/Edit Student</title>
	</head>

	<script>
		function validateForm() {
		  var nm = document.forms["myForm"]["name"].value;
		  var dp = document.forms["myForm"]["department"].value;
		  var cu = document.forms["myForm"]["country"].value;
		  if (nm == "" || nm == null || dp == "" || dp == null || cu == "" || cu == null) {
		    alert("All fields must be filled out.");
		    return false;
		  }
		}
	</script>
	
	<style>
		.myDiv {
			height: 100px;
			width: 100%;
			background-color: limeGreen;
		}
	
		h1 {
			color: white;
			font-family: verdana;
		}
	
		td {
			width: 150px;
			font-size: 20px;
		}
	</style>

	<body>
	    <div align="center">
	        <div class="myDiv">
				<h1 style="position: relative; top: 30%;">New/Edit Student</h1>
			</div>
			<h2>Save Student</h2>
	        <form:form name="myForm" action="saveStudent" method="post" modelAttribute="student" onsubmit="return validateForm()">
		        <table>
		            <form:hidden path="id"/>
		            <tr>
		                <td>Name:</td>
		                <td><form:input path="name" style="height:20px;width:350px"/></td>
		            </tr>
		            <tr>
		                <td>Department:</td>
		                <td><form:input path="department" style="height:20px;width:350px"/></td>
		            </tr>
		            <tr>
		                <td>Country:</td>
		                <td><form:input path="country" style="height:20px;width:350px"/></td>
		            </tr>
		            <tr>
		                <td colspan="2" align="center" style="height: 80px">
		                <input type="submit" style="height: 30px; width: 100px" value="Save Student"></td>
		            </tr>
		        </table>
	        </form:form>
	    </div>
	    <div>
			<a href="listStudents" style="font-size: 20px;"> Back to List</a>
		</div>
	</body>
</html>