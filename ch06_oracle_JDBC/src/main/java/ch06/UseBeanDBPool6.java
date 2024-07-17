package ch06;

import java.sql.*;
import java.util.ArrayList;

public class UseBeanDBPool6 {
	private DBConnectionMgr pool = null;
	
	public UseBeanDBPool6() {
		pool =  DBConnectionMgr.getInstance();
	}
	
	public ArrayList<Bean> getList(){
		ArrayList<Bean> alist = new ArrayList<Bean>();
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			st = con.createStatement();
			rs = st.executeQuery("select * from emp_01 order by emp_id");
			while(rs.next()) {
				Bean bean = new Bean();
				bean.setEMP_ID(rs.getString("emp_id"));
				bean.setEMP_NAME(rs.getString("emp_name"));
				bean.setDEPT_CODE(rs.getString("dept_code"));
				alist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
		
	}

}
