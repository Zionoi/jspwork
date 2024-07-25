package chun;

import java.sql.*;
import java.util.*;


public class chunDao {
	private DBConnectionMgr pool;
	Connection con = null;
	PreparedStatement pstmt = null;
	Statement stmt = null; 
	ResultSet rs = null;
	String sql = null;
	
	public chunDao() {
		pool=DBConnectionMgr.getInstance();
	}
}
