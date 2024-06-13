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
<%@page import="com.saran.test.RolesAccess "%>

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
	 RolesAccess roles = new RolesAccess();
	 String role = roles.getRole(uid);
 %> 
  <div class="container-fluid title">
    <div class="col-lg-6">
      <img class = "title-image" src="Images/logo.png" alt="">
    </div>
    <div class="col-lg-6">
      <h1 align="center">Welcome!!</h1>
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
        <a class="nav-link" href="RemoveEmpDetails">Remove</a>
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
  <section class="white-section" id="features">

    <div class="container-fluid">

      <div class="row">
      <% if(role.equals("ADMIN")){
      %>
        <div class="feature-box col-lg-4">
          <span class="material-symbols-outlined icon" style="font-size:60px;"> person_add</span>
          <h3 class="feature-title"><a href="InsertEmpDetails.jsp">Add Employee</a></h3>
          <p>Add newly joined employee details to the database.</p>
        </div>
      <%}
      if(role.equals("ADMIN")||role.equals("HR")){
      %>
        <div class="feature-box col-lg-4">
          <span class="material-symbols-outlined icon" style="font-size:60px;">update</span>
          <h3 class="feature-title"><a href="UpdateEmpDetails.jsp">Update</a></h3>
          <p>Update employee details in the database.</p>
        </div>
	<%
      }
      if(role.equals("ADMIN")){
	%>
        <div class="feature-box col-lg-4">
          <span class="material-symbols-outlined icon" style="font-size:60px;">person_remove</span>
          <h3 class="feature-title"><a href="RemoveEmpDetails.jsp">Delete</a></h3>
          <p>Remove the employee entry from the database.</p>
        </div>
     <%
      }
     %>
      </div>
      <div class="row">
      <%if(role.equals("ADMIN")||role.equals("HR")){ %>
        <div class="feature-box col-lg-4">
          <span class="material-symbols-outlined icon" style="font-size:60px;">dvr</span>
          <h3 class="feature-title"><a href="Test.jsp">View Employees</a></h3>
          <p>Get employee details who is working in the company.</p>
        </div>
      <%} %>
      <%if(role.equals("EMPLOYEE")){ %>
        <div class="feature-box col-lg-4">
          <span class="material-symbols-outlined icon" style="font-size:60px;">dvr</span>
          <h3 class="feature-title"><a href="viewProfile.jsp">View Employees</a></h3>
          <p>Get employee details who is working in the company.</p>
        </div>
      <%} %>
      <%if(role.equals("ADMIN")){ %>
        <div class="feature-box col-lg-4">
          <span class="material-symbols-outlined icon" style="font-size:60px;">dvr</span>
          <h3 class="feature-title"><a href="AssignTeam.jsp">Assign Team</a></h3>
          <p>Assign employees to their respective teams.</p>
        </div>
      <%} %>
      </div>
    </div>
  </section>
<%}}%>
</body>
</html>
