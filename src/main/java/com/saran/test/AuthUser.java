package com.saran.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;



import com.saran.test.TestConnection;
import com.saran.test.Employee;

public class AuthUser{
	
	public List<Employee> getAllEmails() {
		List<Employee> employees = new ArrayList<Employee>();
		try {
		TestConnection t = new TestConnection();
		Connection conn = t.getConnection();
		Statement st = conn.createStatement();
		String sqlStr = "select EMP_ID, EMAIL from AUTHENICATION natural join EMP";
		
		ResultSet rs = st.executeQuery(sqlStr);
		//System.out.println(rs.next());
		Employee emp = null;
		while(rs.next()) {
			emp = new Employee();
			emp.setEmpId(rs.getInt("EMP_ID")); 
			emp.setEmail(rs.getString("EMAIL"));
			employees.add(emp);
			//System.out.println(rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3)+" "+" "+rs.getString(4)+" "+rs.getString("P_NO"));
		}
		}
		catch (Exception e) {e.printStackTrace();}

		return employees;
	}
	
	public List<Integer> matchEmail(List<Employee> emp, String email){
		List<Integer> employees = new ArrayList<Integer>();
		try {
			System.out.println("here .........");
			for (int i=0;i<emp.size();i++) {
				emp.get(i).getEmail();
				System.out.println("test......");
				System.out.println(emp.get(i).getEmail());
				System.out.println(email);
				if(emp.get(i).getEmail().equals(email)) {
					employees.add(emp.get(i).getEmpId());
					break;
					}
				else {
					continue;
				}
				}
		}
		catch(Exception e) {e.printStackTrace();}
		return employees;
	}
	
	public Boolean emailExists(String email) {
		boolean result = false;
		try {
			List<Employee> allEmps = getAllEmails();
			for (Iterator<Employee> iterator = allEmps.iterator(); iterator.hasNext();) {
				Employee employee = (Employee) iterator.next();
				System.out.println(employee.getEmail());
				if(employee.getEmail().equals(email)) {
					result = true;
					break;
					}
				else {
					continue;
				}
				}
		}
		catch(Exception e) {e.printStackTrace();}
		
		return result;
	}
	
	public Boolean authenicateUser(String email, String pwd) {
		boolean result = false;
		List<Integer> employees = new ArrayList<Integer>();
		try {
			//System.out.println(pwd);
			String pswd = null;
			TestConnection t = new TestConnection();
			Connection conn = t.getConnection();
			Statement st = conn.createStatement();
			System.out.println("hhhhhh");
			List<Employee> allEmps = getAllEmails();
			System.out.println("here..........");
			employees = matchEmail(allEmps,email);
			System.out.println(employees.get(0));
			String sqlStr = " select PASSWORD FROM AUTHENICATION NATURAL JOIN EMP WHERE EMP_ID="+employees.get(0);
			ResultSet rs = st.executeQuery(sqlStr);
			while(rs.next()) {
			pswd = rs.getString("PASSWORD");
			}
			System.out.println(pswd);
			System.out.println(pwd);
			if(pswd.equals(pwd)) {
				result=true;
			}
			else {
				result = false;
			}
		}
		catch(Exception e) {e.printStackTrace();}
	return result;
	}
}