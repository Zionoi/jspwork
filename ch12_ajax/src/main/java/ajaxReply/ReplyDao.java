package ajaxReply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class ReplyDao {
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	Statement stmt = null; 
	ResultSet rs = null;
	String sql = null;
	
	
	public ArrayList<Reply> getReplyList(int ref) {
		ArrayList<Reply> alist = new ArrayList<Reply>();
			try {
				con = pool.getConnection();
				sql = "select no, content, ref, name, to_char(redate, 'YYYY-MM-DD') from reply where ref=? order by no desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				rs= pstmt.executeQuery();
				while(rs.next()) {
					
//					Reply reply = new Reply();
//					reply.setNo(rs.getInt("no"));
//					reply.setName(rs.getString("name"));
//					reply.setRef(rs.getInt("red"));
//					reply.setRedate(rs.getString("redate"));
//					alist.add(reply);
					
					alist.add(new Reply(rs.getInt(1),
										rs.getString(2),
										rs.getInt(3),
										rs.getString(4),
										rs.getString(5)));
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				pool.freeConnection(con);
			}
		return alist;
	}
		
		
		
}
