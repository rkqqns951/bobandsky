package homework;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.DB;


public class HomeworkDAO {
	public List<HomeworkDTO> homeworkList() {
		List<HomeworkDTO> items = new ArrayList<>();
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		conn=DB.getConn();
		String sql ="select * from homework order by name";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			HomeworkDTO dto= new HomeworkDTO();
			dto.setUserid(rs.getString("userid"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setName(rs.getString("name"));
			dto.setEmail(rs.getString("email"));
			dto.setHp(rs.getString("hp"));
			dto.setJoin_date(rs.getDate("join_date"));
			items.add(dto);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		try {
			if(rs!=null) rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(pstmt!=null) pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	return items;
	
	
	
	}


	public void insertCrypt(HomeworkDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			conn=DB.getConn();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into homework ");
			sql.append("(userid,passwd,name,email,hp) values ");
			sql.append("(?,PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT(?),?,?,?)");
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getHp());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}//end insertCrypt()


	public String loginCheckOracle(HomeworkDTO dto) {
		String result="";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn = DB.getConn();
			String sql ="select * from homework " + "where userid=? "
					+ "and passwd=PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT(?)";
			System.out.println(sql);
			System.out.println(dto);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPasswd());
			rs=pstmt.executeQuery();
			if(rs.next()) {//로그인 성공
				result=rs.getString("name")+"님 환영합니다.";
			}else {//로그인 실패
				result="로그인 실패";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(pstmt!=null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}



	

}
