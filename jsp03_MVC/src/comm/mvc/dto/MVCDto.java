package comm.mvc.dto;

import java.util.Date;

public class MVCDto {
	
	private int seq;
	private String writer;
	private String title;
	private String content;
	private Date regdate;
	
	public MVCDto() {
		
	}

	public MVCDto(int seq, String writer, String title, String content, Date regdate) {
		
	}
	
	public int getSeq() {
		return seq;
	}
	
	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getWriter() {
		return writer;
	}
	
	public void setWriter(String writer) {
		this.writer=writer;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title= title;
	}
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}
	
	public void setRegdate(Date regdate) {
		this.regdate=regdate;
	}
	
	
	
	
	
}

