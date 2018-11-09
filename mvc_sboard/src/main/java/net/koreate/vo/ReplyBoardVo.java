package net.koreate.vo;

import java.util.Arrays;
import java.util.Date;

public class ReplyBoardVo {

	int bno;
	String title;
	String content;
	String writer;
	Date regdate;
	int viewcnt;
	int origin;
	int depth;
	int seq;
	Date updatedate;

	String [] files;
	
	int commentCnt;
	
	int uno;
	
	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public int getOrigin() {
		return origin;
	}

	public void setOrigin(int origin) {
		this.origin = origin;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
	public String[] getFiles() {
    return files;
  }

  public void setFiles(String[] files) {
    this.files = files;
  }

  public int getCommentCnt() {
    return commentCnt;
  }

  public void setCommentCnt(int commentCnt) {
    this.commentCnt = commentCnt;
  }

  public int getUno() {
    return uno;
  }

  public void setUno(int uno) {
    this.uno = uno;
  }

	@Override
	public String toString() {
		return "ReplyBoardVo [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regdate=" + regdate + ", viewcnt=" + viewcnt + ", origin=" + origin + ", depth=" + depth + ", seq="
				+ seq + ", updatedate=" + updatedate + ", files = " + Arrays.toString(files) 
				+ ", commentCnt=" + commentCnt + ", uno =" + uno + "]";
	}



	

}
