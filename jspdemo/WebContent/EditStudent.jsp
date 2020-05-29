<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.jspdemo.dao.StudentDao,com.jspdemo.bean.Student" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<% int rollno=Integer.parseInt(request.getParameter("rollNo"));
StudentDao std= new StudentDao();
 Student st=std.get(rollno);
%>
<div class="container">
<div class="card">
<form class="form-horizontal" action="edit" method="post">
<div class="form-group">
    <div class="col-sm-10">
      <input type="hidden" class="form-control" id="email" value=<%=st.getRollno() %> name="rollNo">
    </div>
</div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="email">Name:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="email" value=<%=st.getName() %> name="name">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">Age:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="pwd" name="age"  value=<%=st.getAge() %>>
    </div>
  </div>
<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-primary">Submit</button>
    </div>
  </div>
  </form>
  </div>
  </div>


</body>
</html>