package ch06;

import java.sql.*;
import java.util.ArrayList;

public class UseBeanDB4 {
	private final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "tjoeun";
	private final String PASS = "1234";
	
	public UseBeanDB4() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Bean> getList(){
		ArrayList<Bean> alist = new ArrayList<Bean>();
		try {
			Connection con = DriverManager.getConnection(JDBC_URL, USER, PASS);
			Statement st = con.createStatement();
			String query = "select * from emp_01 ORDER BY EMP_ID";
			ResultSet rs = st.executeQuery(query);
			while(rs.next()){
				Bean bean = new Bean();
				bean.setEMP_ID(rs.getString("EMP_ID"));
				bean.setEMP_NAME(rs.getString("EMP_NAME"));
				bean.setDEPT_CODE(rs.getString("DEPT_CODE"));
				alist.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return alist;
	}
}
