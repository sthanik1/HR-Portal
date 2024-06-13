<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="com.saran.test.Employee "%>
<%@page import="com.saran.test.TestConnection "%>

<head>
  <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
  <link rel="stylesheet" href="styles/Index.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<%
if(request.getParameter("logout")!=null ){
	session.invalidate(); %>
	<jsp:forward page="Login.jsp"/>
<%
}
else{
  String uid = (String)session.getAttribute("user");
  if (uid == null){
%>
<jsp:forward page="Login.jsp"/>
<%	
  }
 else{
 %> 

  <div class="container-fluid title">
    <div class="col-lg-6">
      <img class = "title-image" src="Images/logo.png" alt="">
    </div>
    <div class="col-lg-6">
      <h1 align="center">View details!!</h1>
    </div>
  </div>

  <hr>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="Index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="InsertEmpDetails.jsp">Add</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="UpdateEmpDetails.jsp">Update</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="RemoveEmpDetails.jsp">Remove</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Test.jsp">Search</a>
      </li>
	  </ul>
	  
 <form class="form-inline my-2 my-lg-0" action="Index.jsp" method="POST">
      <button class="btn btn-outline-success my-2 my-sm-0" name="logout" type="submit">Logout</button>
    </form>
  </div>
  </nav>
  <hr>
<p>Type something in the input field to search the table:</p>
<form action="Test.jsp" method="GET">
<table class="table table-bordered table-striped">
    <tr><td><label for="fName">First Name: </label></td><td><input type="text" id="fName" name="firstName" ></td></tr>
    <tr><td><label for="lname">Last Name: </label></td><td><input type="text" name="lastName" id="lName" ></td></tr>
    <tr><td><input type="submit" class="btn btn-sm btn-outline-secondary" name="searchMain" value="Search" ></td></tr>
</table>
</form>
<div class="card">
<table align="center" class="table table-bordered table-striped">
<thead>
<tr>
<td><b>First Name</b></td>
<td><b>Last Name</b></td>
<td><b>Phone Number</b></td>
<td><b>Salary</b></td>
<td><b>Profile</b></td>
</tr>
</thead>


<tbody id="myTable">
<%
TestConnection t = new TestConnection();
String fName="";
String lName="";
fName = request.getParameter("firstName");
lName = request.getParameter("lastName");

if(fName=="" && lName==""){
%>
	<script>alert("Please enter first name or last name to initiate the search")</script>

<%
}
else{
List<Employee> allEmps = t.getParticularEmp(fName, lName);
for (Iterator<Employee> iterator = allEmps.iterator(); iterator.hasNext();) {
	Employee employee = (Employee) iterator.next();
%>
<tr class="temp">
<td><%=employee.getfName() %></td>
<td><%=employee.getlName() %></td>
<td><%=employee.getpNo() %></td>
<td><%=employee.getSal() %></td>
<td><%=employee.getEmail() %></td>
<% String eid = "viewProfile.jsp?eId="+employee.getEmpId(); %>
<td><a href=<%=eid %>><b>view profile</b></a></td>
</tr>
<%
}
}
 }}
%>
</tbody>
</table>
</div>
</body>
</html>
