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
	
	public ChunBean loginRegister(String id, String pwd) {
		ChunBean cBean = null;
		try {
			con = pool.getConnection();
			sql = "select count(*) from tb_student where student_no=? and st_pwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			//위에 쿼리문이 참이면 true 변환 로그인 성공 및 해당 아이디 컬럼 가져오기
			if (rs.next() && rs.getInt(1)>0 ) {
				System.out.println(rs.getInt(1));
				cBean = new ChunBean();
				sql = "select * from tb_student where student_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					cBean.setStudent_no(rs.getString("student_no"));
					cBean.setStudent_name(rs.getString("student_name"));
					cBean.setStudent_address(rs.getString("student_address"));
					cBean.setStudent_ssn(rs.getString("student_ssn"));
					cBean.setDepartment_no(rs.getString("department_no"));
					cBean.setEntrance_date(rs.getString("entrance_date"));
					cBean.setAbsence_yn(rs.getString("student_no"));
					cBean.setCoach_professor_no(rs.getString("coach_professor_no"));
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return cBean;
	}
}
