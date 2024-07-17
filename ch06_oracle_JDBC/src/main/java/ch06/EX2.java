package ch06;
import java.util.*;
import java.sql.*;
public class EX2 {
	private DBConnectionMgr pool = null;
	
	public EX2() {
		pool =  DBConnectionMgr.getInstance();
	}
	
	public ArrayList<EXBean> getList(){
		ArrayList<EXBean> alist = new ArrayList<EXBean>();
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			st = con.createStatement();
			String query = "select * from TB_PROSTOCK order by TCODE";
			rs = st.executeQuery(query);
			
			while(rs.next()) {
				EXBean ex = new EXBean();
				ex.setPCODE(rs.getString("PCODE"));
				ex.setTDATE(rs.getString("TDATE"));
				ex.setTCODE(rs.getString("TCODE"));
				ex.setSTOCK_PRICE(rs.getString("STOCK_PRICE"));
				ex.setSTOCK_COUNT(rs.getString("STOCK_COUNT"));
				alist.add(ex);
			}
			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
}
