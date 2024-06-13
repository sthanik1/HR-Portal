package com.saran.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RolesAccess {
	
	List<String> roles = new ArrayList<String>();
	
	public String getRole(String eId) {
		String role = null;
		TestConnection t = new TestConnection();
		try {
			System.out.println(eId);
			Connection conn = t.getConnection();
			Statement st = conn.createStatement();
			String sqlStr = "select ROLE from EMP NATURAL JOIN ROLE where EMP_ID ="+Integer.parseInt(eId);
			ResultSet rs = st.executeQuery(sqlStr);
			while(rs.next()) {
				role = rs.getString("ROLE");
			}
			}
			catch (Exception e) {e.printStackTrace();}
		return role;
	}
	
	
}