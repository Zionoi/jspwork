package board;

import java.sql.*;
import java.util.*;


public class BoardDao {
	private DBConnectionMgr pool;
	Connection con = null;
	PreparedStatement pstmt = null;
	Statement stmt = null; 
	ResultSet rs = null;
	String sql = null;
	
	public BoardDao() {
		pool=DBConnectionMgr.getInstance();
	}
	
	// 게시판 리스트
	public ArrayList<Board> getBoardList(){
		ArrayList<Board> alist = new ArrayList<>();
		try {
			con = pool.getConnection();
			sql = "select * from board";
			rs = con.createStatement().executeQuery(sql);
			while(rs.next()) {
				Board board = new Board();
				board.setNum(rs.getInt(1));
				board.setName(rs.getString(2));
				board.setSubject(rs.getString(3));
				board.setContent(rs.getString(4));
				board.setPos(rs.getInt(5));
				board.setRef(rs.getInt(6));
				board.setDepth(rs.getInt(7));
				board.setRegdate(rs.getString(8));
				board.setPass(rs.getString(9));
				board.setIp(rs.getString(10));
				board.setCount(rs.getInt(11));
				alist.add(board);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
	

}
