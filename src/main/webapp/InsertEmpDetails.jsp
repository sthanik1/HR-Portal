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
      <h1 align="center">Add Here!!</h1>
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

<%
TestConnection t = new TestConnection();
%>
<form class="FillForm" action="InsertEmpDetails.jsp" method="GET">
<table class="table table-bordered table-striped">
    <tr><td><label for="fName">First Name: </label></td><td><input type="text" id="fName" name="firstName" ></td></tr>
    <tr><td><label for="lname">Last Name: </label></td><td><input type="text" name="lastName" id="lName" ></td></tr>
    <tr><td><label for="eId">Employee Id: </label></td><td><input type="text" name="employeeId" id="eId" ></td></tr>
    <tr><td><label for="pNo">Phone Number: </label></td><td><input type="text" name="phoneNumber" id="pNo"></td></tr>
    <tr><td><label for="sal">Salary: </label></td><td><input type="text" name="salary" id="sal" ></td></tr>
    <tr><td><label for="email">Email: </label></td><td><input type="text" name="email" id="email" ></td></tr>
    <tr><td><input type="submit" class="btn btn-sm btn-outline-secondary" name="search" value="Insert" ></td></tr>
</table>
</form>

    <%
    if(request.getParameter("search")!=null){
    String eId = request.getParameter("employeeId"); 
    String fName = request.getParameter("firstName");
    String lName = request.getParameter("lastName");
    String pNo = request.getParameter("phoneNumber");
    String sal = request.getParameter("salary");
    String email = request.getParameter("email");
	t.insertEmpDetails(eId,fName,lName,pNo,sal,email);
    }
 }}
	%>


</body>
</html>
