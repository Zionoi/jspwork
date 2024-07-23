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
	public ArrayList<Board> getBoardList(String keyField, String keyWord, int start, int end) {
		ArrayList<Board> alist = new ArrayList<Board>();
		System.out.println(keyField);
		System.out.println(keyWord);
		
		try {
			con = pool.getConnection();
			//키필드와 키워드에 값이 없을땐 리스트 전체목록 첫페이지 출력
			if(keyWord == null || keyWord.equals("")) {
				sql = "select * "
						+ " from (select ROWNUM AS RNUM, BT1. * "
						//ref는 최상위부모번호 내림차순, pos는 바로위 부모번호보다 하나 위 오름차순(댓글 정렬을 위함)
						+ " 	from (select * from board order by ref desc, pos) BT1" 
						+ " 	) "
						+ " where RNUM between ? and ?";
				pstmt= con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			}else {
				sql = "select * "
						+ " from (select ROWNUM AS RNUM, BT1. * "
						//ref는 최상위부모번호 내림차순, pos는 바로위 부모번호보다 하나 위 오름차순(댓글 정렬을 위함)
						+ " 	from (select * from board order by ref desc, pos) BT1"
						+ "		where "+ keyField + " like ?"
						+ " 	) "
						+ " where RNUM between ? and ?";
				pstmt= con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
				
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setNum(rs.getInt("num"));
				board.setSubject(rs.getString("subject"));
				board.setName(rs.getString("name"));
				board.setRegdate(rs.getString("regdate"));
				board.setCount(rs.getInt("count"));
				board.setRef(rs.getInt("ref"));
				board.setPos(rs.getInt("pos"));
				board.setDepth(rs.getInt("depth"));
				alist.add(board);
				//System.out.println(board.getName());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
	
	// 게시물 총 레코드 수
	public int getTotalCount(String keyField, String keyWord) {
		int totalCount = 0;
		
		try {
			con = pool.getConnection();
			if(keyWord == null || keyWord.equals("")) {
				sql = "select count(num) from board";
				pstmt = con.prepareStatement(sql);
			}else {
				sql = "select count(num) from board where " + keyField + " like ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,"%"+ keyWord+"%");
			}

			rs = pstmt.executeQuery();
						
			if(rs.next())
				totalCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return totalCount;
	}
	
	//게시물 조회수 증가
	public void upCount(int num) { //primary key num 넘겨받음 
		int totalCount = 0;
		
		try {
			con = pool.getConnection();
			sql = "update board set count = count+1 where num="+num;
			con.createStatement().executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		
	}
	
	
	
	// 선택한 게시물의 프라이머리키 num DB한 행 정보 가져오기
	public Board getOneBoard(int num) {
		Board board = new Board();
				
		try {
			con = pool.getConnection();
			sql = "select * from board where num="+num;
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				board.setContent(rs.getString("Content"));
				board.setCount(rs.getInt("Count"));
				board.setDepth(rs.getInt("Depth"));
				board.setIp(rs.getString("Ip"));
				board.setName(rs.getString("Name"));
				board.setNum(rs.getInt("Num"));
				board.setPass(rs.getString("Pass"));
				board.setPos(rs.getInt("Pos"));
				board.setRef(rs.getInt("Ref"));
				board.setRegdate(rs.getString("Regdate"));
				board.setSubject(rs.getString("Subject"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return board;
	}
	
	
	
	public int getTotalCount2() {
		int totalCount = 0;
		
		try {
			con = pool.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return totalCount;
	}
	

}
