<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.jspdemo.dao.StudentDao,com.jspdemo.bean.Student,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container ">
		<a href="AddStudent.jsp" >
			<button type="button" class="btn btn-primary text-center " >Add Student</button>
		</a>
		<div>
		<table class="table">
			<thead>
				<tr>
					<th>RollNo</th>
					<th>Name</th>
					<th>Age</th>
					<th>Action</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					StudentDao std = new StudentDao();
					List<Student> s = std.getStudents();
 for (Student s1 : s) {
 				%>
				<tr>
					<td><%=s1.getRollno() %></td>
					<td><%=s1.getName() %></td>
					<td><%=s1.getAge() %></td>
					<td><a href="EditStudent.jsp?rollNo=<%=s1.getRollno()%>"><button type="button" class="btn btn-primary">Edit</button></a></td>
					<td><a href="delete?rollNo=<%=s1.getRollno()%>"><button type="button" class="btn btn-primary">Delete</button></a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		
	</div>

</body>
</html>