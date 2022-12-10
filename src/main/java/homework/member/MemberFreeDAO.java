package homework.member;

import java.sql.SQLException;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class MemberFreeDAO extends JDBConnect {

	public MemberFreeDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);

	}

	public MemberFreeDAO(ServletContext application) {
		super(application);

	}

	public MemberFreeDTO getMemberDTO(String uid, String upass) {

		MemberFreeDTO dto = new MemberFreeDTO();
		String query = "select * from member where id = ? and pass = ?";

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

}
