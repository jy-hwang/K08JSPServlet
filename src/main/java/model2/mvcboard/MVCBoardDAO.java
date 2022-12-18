package model2.mvcboard;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import model1.board.BoardDTO;

public class MVCBoardDAO extends DBConnPool{

	public MVCBoardDAO() {
		super();
	}
	

	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "select count(*) from mvcboard ";
		if (map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%'";
		}

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			rs.next();

			totalCount = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}

		return totalCount;
	}

	

	public List<MVCBoardDTO> selectListPage(Map<String, Object> map) {
		List<MVCBoardDTO> board = new Vector<MVCBoardDTO>();

		String query = "select * from ( select tb.* , rownum rNum from ( select * from mvcboard ";

		if (map.get("searchWord") != null) {
			query += "where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%'";
		}

		query += " order by idx desc ) tb ) where rNum between ? and ? ";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			System.out.println(query + " " + map.get("start").toString() + " " + map.get("end").toString() );
			//stmt = con.createStatement();
			rs = psmt.executeQuery();

			while (rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO();

				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setUpdtdate(rs.getDate(6));
				dto.setOfile(rs.getString(7));
				dto.setSfile(rs.getString(8));
				dto.setDowncount(rs.getInt(9));
				dto.setPass(rs.getString(10));
				dto.setVisitcount(rs.getInt(11));
				dto.setLikecount(rs.getInt(12));

				board.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("게시물 페이징 처리 중 예외 발생");
			e.printStackTrace();
		}

		return board;

	}
	
	
	

	public int insertWrite(MVCBoardDTO dto) {
		int result = 0;

		try {
			String query = "insert into mvcboard(idx,name,title,content,ofile,sfile,pass) "
					+ " values ( seq_board_num.nextval,?,?,?,?,?,? )";
			psmt = con.prepareStatement(query);

			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getPass());

			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
