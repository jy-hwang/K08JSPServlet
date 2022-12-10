package homework.boardFree;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardFreeDAO extends JDBConnect {
	public BoardFreeDAO(ServletContext application) {
		super(application);
	}

	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "select count(*) from board_free ";
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

	public List<BoardFreeDTO> selectList(Map<String, Object> map) {
		List<BoardFreeDTO> bbs = new Vector<BoardFreeDTO>();

		String query = "select * from board_free ";

		if (map.get("searchWord") != null) {
			query += "where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%'";
		}

		query += " order by num desc";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				BoardFreeDTO dto = new BoardFreeDTO();

				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setUpdtdate(rs.getDate("updtdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setReccount(rs.getString("reccount"));

				bbs.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}

		return bbs;

	}

	public int insertWrite(BoardFreeDTO dto) {
		int result = 0;

		try {
			String query = "insert into board_free(num,title,content,id) "
					+ " values ( seq_board_free_num.nextval,?,?,? )";
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

	public BoardFreeDTO selectView(String num) {
		BoardFreeDTO dto = new BoardFreeDTO();

		String query = "select bf.* , mf.name,mf.email from member_free mf inner join board_free bf on mf.id = bf.id where num = ?";

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
				dto.setReccount(rs.getString("reccount"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
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
	
	public int updateEdit(BoardFreeDTO dto) {
		int result = 0 ;
		String query = "update board_free set title = ?, content =? where num = ? ";
		
		try {
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Query 오류" +  query);
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
		
		
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
	
	public int deletePost(BoardFreeDTO dto) {
		int result = 0 ;
		
		try {
			String query = "delete from board where num = ? ";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			result = psmt.executeUpdate();
					
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception e) {
			System.out.println("게시물 삭제 중 예외발생");
			e.printStackTrace();
		}
		
		
		return result;
	}
	
}
