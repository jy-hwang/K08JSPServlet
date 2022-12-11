package homework.member;

import java.sql.SQLException;

import javax.servlet.ServletContext;

import common.JDBConnect;
import homework.boardFree.BoardFreeDTO;

public class MemberFreeDAO extends JDBConnect {

	public MemberFreeDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);

	}

	public MemberFreeDAO(ServletContext application) {
		super(application);

	}

	public boolean dupChkUid(String uid) {
		
		boolean isDup = false;
		
		String query = "select id from member_free where id = ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			System.out.println("쿼리 , 아이디 : "+query + uid);
			if (rs.next()) {
				System.out.println("중복된 아이디 : "+rs.getString("id"));
				isDup = true;

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		
		return isDup;
	}
	
	
	public MemberFreeDTO getMemberDTO(String uid, String upass) {

		MemberFreeDTO dto = new MemberFreeDTO();
		String query = "select * from member_free where id = ? and pass = ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();

			if (rs.next()) {

				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
				dto.setUpdtdate(rs.getString(5));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dto;

	}
	
	public int insertMember(MemberFreeDTO dto) {
		int result = 0;

		try {
			String query = "insert into member_free(id,pass,name) "
					+ " values (?,?,? )";
			psmt = con.prepareStatement(query);

			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());

			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
