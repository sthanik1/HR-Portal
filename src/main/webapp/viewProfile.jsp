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
<title>Profile</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body id="container">
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
	 String empId = null;
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
  <button type="button" id="change1" class="btn" name="button"><span class="material-symbols-outlined">edit</span></button>
  <% String val = request.getParameter("eId"); 
  	TestConnection t = new TestConnection();
  	if(request.getParameter("search")!=null){
  	  //String eId = request.getParameter("employeeId"); 
  	  String fName = request.getParameter("firstName");
  	  String lName = request.getParameter("lastName");
  	  String pNo = request.getParameter("phoneNumber");
  	  String sal = request.getParameter("salary");
  	  String email = request.getParameter("email");
  	  if(fName!=null && fName.length()>0){
  		t.updateFirstName(val,fName);
  	  }
  	  if(lName!=null && lName.length()>0){
  			t.updateLastName(val,lName);
  	  }
  	  if(pNo!=null && pNo.length()>0){
  			t.updatePhoneNumber(val,pNo);
  	  }
  	  if(sal!=null && sal.length()>0){
  			t.updateSalary(val,sal);
  	  }
  	  if(email!=null && email.length()>0){
  		  t.updateEmail(val,email);
  	  }
  	  }
  	if(role.equals("EMPLOYEE")){
  		empId = uid;
  	}
  	else{
  		empId = val;
  	}
  	List<Employee> allEmps = t.getEmp(empId);
  %>
  <section class="white-section" id="features">
  <form class="FillForm" action="viewProfile.jsp" method="GET">
    <table class="table table-bordered table-striped">
      <tr><td><label for="eId">Employee Id: </label></td><td><input type="text" id="nochange" value=<%=empId %> name="eId" id="eId" readonly></td></tr>
      <tr><td><label for="fName">First Name: </label></td><td><input type="text" id="Button" value=<%=allEmps.get(0).getfName() %> id="fName" name="firstName" readonly></td></tr>
      <tr><td><label for="lname">Last Name: </label></td><td><input type="text" id="Button" value=<%=allEmps.get(0).getlName() %> name="lastName" id="lName" readonly></td></tr>
      <tr><td><label for="pNo">Phone Number: </label></td><td><input type="text" id="Button" value=<%=allEmps.get(0).getpNo() %> name="phoneNumber" id="pNo" readonly></td></tr>
      <tr><td><label for="sal">Salary: </label></td><td><input type="text" id="Button" value=<%=allEmps.get(0).getSal() %> name="salary" id="sal"></td></tr>
      <tr><td><label for="email">Email: </label></td><td><input type="text" id="Button" value=<%=allEmps.get(0).getEmail() %> name="email" id="email"></td></tr>
      <tr><td><input type="submit" class="btn btn-sm btn-outline-secondary" id="update" name="search" value="Update" disabled></td></tr>
    </table>
  </form>
  </section>
  <script type="text/javascript">
    var button = document.getElementById("change1");
    button.addEventListener("click",change);
    function change() {
      var change = document.querySelectorAll("#Button");
      console.log(change);
      for (var i = 0; i < change.length; i++) {
        change[i].removeAttribute("readonly");
        console.log(change[i]);
      }
      var update = document.querySelector("#update");
      update.removeAttribute("disabled");
    }
  </script>
<%}} %>
</body>
</html>
