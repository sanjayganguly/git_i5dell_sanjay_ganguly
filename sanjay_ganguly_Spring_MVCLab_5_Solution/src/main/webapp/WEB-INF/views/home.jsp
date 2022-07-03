<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Student Debate</title>
	</head>

	<style>
		.myDiv {
			height: 100px;
			width: 100%;
			background-color: limeGreen;
		}
		
		h1 {
			color: black;
			font-family: verdana;
		}
		
		table {
			border-collapse: collapse;
			border: 1px solid black;
			text-align: center;
			vertical-align: middle;
			font-family: verdana;
		}
		
		th {
			height: 40px;
			width: 200px;
			background-color: limeGreen;
			color: white;
		}
		
		td {
			height: 40px;
		}
		
		tr:nth-child(odd) {
			background: #C0C0C0;
		}
	</style>
	
	<body>
		<div align="center">
		
			<div class="myDiv" >
	        	<h1 style="position:relative;top:30%;">STUDNET LIST</h1>
        	</div>
        	<br><br>
			
			<form>
	        	<button type="submit" style="align:left;height:40px;width:150px;font-family:verdana" formaction="newStudent"> New Student </button>
	        </form>
	        <br><br>        	
        	
			<table border="1">
				<th>Student Id</th>
				<th>Name</th>
				<th>Department</th>
				<th>Country</th>
				<th>Action</th>
	
				<c:forEach var="student" items="${students}">
					<tr>
						<td>${student.id}</td>
						<td>${student.name}</td>
						<td>${student.department}</td>
						<td>${student.country}</td>
						<td><a href="editStudent?id=${student.id}">Update</a> | <a
							href="deleteStudent?id=${student.id}">Delete</a></td>
	
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
</html>