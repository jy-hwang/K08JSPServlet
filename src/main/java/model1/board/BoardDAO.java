package model1.board;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect {
	public BoardDAO(ServletContext application) {
		super(application);
	}

	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "select count(*) from board ";
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

	public List<BoardDTO> selectList(Map<String, Object> map) {
		List<BoardDTO> bbs = new Vector<BoardDTO>();

		String query = "select * from board ";

		if (map.get("searchWord") != null) {
			query += "where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%'";
		}

		query += " order by num desc";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				BoardDTO dto = new BoardDTO();

				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setUpdtdate(rs.getDate("updtdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setLikecount(rs.getString("likecount"));

				bbs.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}

		return bbs;

	}

	public int insertWrite(BoardDTO dto) {
		int result = 0;

		try {
			String query = "insert into board(num,title,content,id,visitcount,likecount) "
					+ " values ( seq_board_num.nextval,?,?,?,0,0 )";
			psmt = con.prepareStatement(query);

			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());

			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();

		String query = "select B.* , M.name from member M inner join board b on m.id = b.id where num = ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);

			rs = psmt.executeQuery();

			if (rs.next()) {

				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setLikecount(rs.getString("likecount"));
				dto.setName(rs.getString("name"));

			}

		} catch (SQLException e) {
			System.out.println("쿼리오류");
			e.printStackTrace();
		}catch(Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}

		return dto;

	}
	
	public void updateVisitCount(String num) {
		
		String query = "update board set visitcount = visitcount + 1 where num = ? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);;
			psmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch(Exception e) {
			System.out.println("게시물 조회수 증가 중 예외발생");
			e.printStackTrace();
		}
		
		
	}
	
}
