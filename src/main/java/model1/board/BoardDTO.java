package model1.board;

public class BoardDTO {

	private String num;
	private String title;
	private String content;
	private String id;
	private java.sql.Date postdate;
	private java.sql.Date updtdate;
	private String visitcount;
	private String reccount;
	private String name;

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public java.sql.Date getPostdate() {
		return postdate;
	}

	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}

	public java.sql.Date getUpdtdate() {
		return updtdate;
	}

	public void setUpdtdate(java.sql.Date updtdate) {
		this.updtdate = updtdate;
	}

	public String getVisitcount() {
		return visitcount;
	}

	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}

	public String getReccount() {
		return reccount;
	}

	public void setReccount(String reccount) {
		this.reccount = reccount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
