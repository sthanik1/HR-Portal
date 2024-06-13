<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="com.saran.test.Employee "%>
<%@page import="com.saran.test.TestConnection "%>
<%@page import="com.saran.test.AuthUser "%>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Validate</title>
	</head>
	<body>
		<%
		AuthUser authenicate = new AuthUser();
		String email=request.getParameter("email");
		TestConnection t = new TestConnection();
		String password=request.getParameter("password");
		if(authenicate.emailExists(email)){
		if(authenicate.authenicateUser(email,password)){
			String eId = t.getEmpId(email); 
			session.setAttribute("user", eId);
			response.sendRedirect("Index.jsp");
			
		}
		else{
			response.sendRedirect("Login.jsp");
		}
		}
		else{
		%>
		<script>alert("Email does not exists, please create new one!!!")</script>
		<%
		response.sendRedirect("Login.jsp");
		}
		%>
	</body>
</html>