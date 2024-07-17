package ch06;

import java.sql.*;
import java.util.*;
public class EXPool {
private DBConnectionMgr pool = null;
	
	public EXPool() {
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
			rs = st.executeQuery("select * "
					+ " from EMPLOYEE, job"
					+ " where employee.job_code = job.job_code"
					+ " order by emp_id");
			while(rs.next()) { 
				Bean bean = new Bean();
				bean.setEMP_ID(rs.getString("emp_id"));
				bean.setEMP_NAME(rs.getString("emp_name"));
				bean.setEMAIL(rs.getString("email"));
				bean.setPHONE(rs.getString("phone"));
				bean.setJOB_NAME(rs.getString("job_name"));
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
