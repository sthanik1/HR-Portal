package com.saran.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class TestConnection {
	//public Statement st;
	public List<Employee> getAllEmps() {
		List<Employee> employees = new ArrayList<Employee>();
		try {
		Connection conn = getConnection();
		Statement st = conn.createStatement();
		String sqlStr = "select * from EMP";
		ResultSet rs = st.executeQuery(sqlStr);
		//System.out.println(rs.next());
		Employee emp = null;
		while(rs.next()) {
			emp = new Employee();
			emp.setEmpId(rs.getInt("EMP_ID")); 
			emp.setfName(rs.getString("FIRST_NAME"));
			emp.setlName(rs.getString("LAST_NAME"));
			emp.setSal(rs.getString("SALARY"));
			emp.setpNo(rs.getString("P_NO"));
			emp.setEmail(rs.getString("EMAIL"));
			employees.add(emp);
			//System.out.println(rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3)+" "+" "+rs.getString(4)+" "+rs.getString("P_NO"));
		}
		}
		catch (Exception e) {e.printStackTrace();}
		return employees;
	}
	
	public List<Employee> getParticularEmp(String op1,String op2) {
		List<Employee> employees = new ArrayList<Employee>();
		try {
			System.out.println(op2);
			Connection conn = getConnection();
			Statement st = conn.createStatement();
			String sqlStr = "";
			if(op1!="" && op2!="") {
				sqlStr = "select * from EMP where FIRST_NAME = '"+op1+"' AND LAST_NAME ='"+op2+"'";
			}
			else if(op1!="" && op2=="") {
				sqlStr = "select * from EMP where FIRST_NAME = '"+op1+"'";
			}
			else if(op1=="" && op2!="") {
				sqlStr = "select * from EMP where LAST_NAME ='"+op2+"'";
			}
			ResultSet rs = st.executeQuery(sqlStr);
			Employee emp = null;
			while(rs.next()) {
				emp = new Employee();
				emp.setEmpId(rs.getInt("EMP_ID"));
				emp.setfName(rs.getString("FIRST_NAME"));
				emp.setlName(rs.getString("LAST_NAME"));
				emp.setSal(rs.getString("SALARY"));
				emp.setpNo(rs.getString("P_NO"));
				emp.setEmail(rs.getString("EMAIL"));
				employees.add(emp);
			}
			}
			catch (Exception e) {e.printStackTrace();}
		return employees;
		
	}
	
	public String getEmpId(String email) {
		String empId = null;
		try {
			Connection conn = getConnection();
			Statement st = conn.createStatement();
			String sqlStr = "select EMP_ID from EMP where EMAIL = '"+email+"'";
			System.out.println("Hey there");
			ResultSet rs = st.executeQuery(sqlStr);
			while(rs.next()) {
				empId = rs.getString("EMP_ID");
			}
			}
			catch (Exception e) {e.printStackTrace();}
		return empId;
	} 
	
	public List<Employee> getEmp(String op1){
		List<Employee> employees = new ArrayList<Employee>();
		try {
			Connection conn = getConnection();
			Statement st = conn.createStatement();
			String sqlStr = "select * from EMP where EMP_ID ="+Integer.parseInt(op1);
			ResultSet rs = st.executeQuery(sqlStr);
			Employee emp = null;
			while(rs.next()) {
				emp = new Employee();
				emp.setEmpId(rs.getInt("EMP_ID"));
				emp.setfName(rs.getString("FIRST_NAME"));
				emp.setlName(rs.getString("LAST_NAME"));
				emp.setSal(rs.getString("SALARY"));
				emp.setpNo(rs.getString("P_NO"));
				emp.setEmail(rs.getString("EMAIL"));
				employees.add(emp);
			}
			}
			catch (Exception e) {e.printStackTrace();}
		return employees;
	}
	
	public void deleteParticularEmp(String op1, String op2) {
		try {
			Connection conn = getConnection();
			Statement st = conn.createStatement();
			String sqlStr = "delete from EMP where FIRST_NAME = '"+op1+"' AND EMP_ID = '"+op2+"'";
			st.executeQuery(sqlStr);
			}
			catch (Exception e) {e.printStackTrace();}
		
	}
	
	public void insertEmpDetails(String op1, String op2, String op3, String op4, String op5, String op6) {
		try {
			Connection conn = getConnection();
			Statement st = conn.createStatement();
			String sqlStr = "insert into EMP values("+op1+",'"+op2+"','"+op3+"',"+op5+","+op4+",'"+op6+"')";
			st.executeQuery(sqlStr);
			}
			catch (Exception e) {e.printStackTrace();}
	}
	
	public void updateEmployeeDetails(String op1, String op2, String op3, String op4, String op5, String op6) {
		try {
			System.out.println(op1);
			Connection conn = getConnection();
			Statement st = conn.createStatement();
			String sqlStr = "update EMP set FIRST_NAME='"+op2+"',LAST_NAME='"+op3+"',P_NO="+Integer.parseInt(op5)+",SALARY="+Integer.parseInt(op5)+", EMAIL='"+op6+"' where EMP_ID ="+Integer.parseInt(op1);
			st.executeQuery(sqlStr);
		}
		catch(Exception e) {e.printStackTrace();}
		
	}
	
	public void updateFirstName(String id, String fName) {
		try {
			Connection conn = getConnection();
			Statement st = conn.createStatement();
			String sqlStr = "update EMP set FIRST_NAME='"+fName+"' where EMP_ID ="+Integer.parseInt(id);
			st.executeQuery(sqlStr);
		}
		catch(Exception e) {e.printStackTrace();}
	}
	
	public void updateLastName(String id, String lName) {
		try {
			System.out.println(lName);
			System.out.println(id);
			Connection conn = getConnection();
			Statement st = conn.createStatement();
			String sqlStr = "update EMP set LAST_NAME='"+lName+"' where EMP_ID ="+Integer.parseInt(id);
			st.executeQuery(sqlStr);
		}
		catch(Exception e) {e.printStackTrace();}
	}
	
	public void updatePhoneNumber(String id, String pNo) {
		try {
			Connection conn = getConnection();
			Statement st = conn.createStatement();
			String sqlStr = "update EMP set P_NO="+Integer.parseInt(pNo)+" where EMP_ID ="+Integer.parseInt(id);
			st.executeQuery(sqlStr);
		}
		catch(Exception e) {e.printStackTrace();}
	}
	
	public void updateSalary(String id, String sal) {
		try {
			Connection conn = getConnection();
			Statement st = conn.createStatement();
			String sqlStr = "update EMP set P_NO="+Integer.parseInt(sal)+" where EMP_ID ="+Integer.parseInt(id);
			st.executeQuery(sqlStr);
		}
		catch(Exception e) {e.printStackTrace();}
	}
	
	public void updateEmail(String id, String email) {
		try {
			Connection conn = getConnection();
			Statement st = conn.createStatement();
			String sqlStr = "update EMP set EMAIL='"+email+"' where EMP_ID ="+Integer.parseInt(id);
			st.executeQuery(sqlStr);
		}
		catch(Exception e) {e.printStackTrace();}
	}
	
	public Connection getConnection() {
		Connection conn = null;
		try {
		Class.forName("oracle.jdbc.OracleDriver");
		System.out.println("hi");
		conn = DriverManager.getConnection("jdbc:oracle:thin:saran/saran@localhost:1521:xe");
		System.out.println("hi");
		if(conn != null) {System.out.println("Success");}
		else {System.out.println("fail");}
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return conn; 
	}
	/*
	public void main(String[] args) {
		try {
			Statement st = null;
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:saran/saran@localhost:1521:xe");
			System.out.println("hi");
			if(conn != null) {System.out.println("Success");}
			else {System.out.println("fail");}
			st = conn.createStatement();
			List<Employee> allEmps = getAllEmps(st);
			for (Iterator<Employee> iterator = allEmps.iterator(); iterator.hasNext();) {
				Employee employee = (Employee) iterator.next();
				System.out.println(employee.getEmpId());
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
}*/
}
