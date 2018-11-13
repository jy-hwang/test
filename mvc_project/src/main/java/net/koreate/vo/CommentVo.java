package net.koreate.vo;

import java.util.Date;

public class CommentVo {
  
  private int cno;
  private int fno;
  private int mno;
  private String commentText;
  private String commentAuth;
  private Date regdate;
  private Date updatedate;
  
  public int getCno() {
    return cno;
  }
  public void setCno(int cno) {
    this.cno = cno;
  }
  public int getFno() {
    return fno;
  }
  public void setFno(int fno) {
    this.fno = fno;
  }
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }
  public String getCommentText() {
    return commentText;
  }
  public void setCommentText(String commentText) {
    this.commentText = commentText;
  }
  public String getCommentAuth() {
    return commentAuth;
  }
  public void setCommentAuth(String commentAuth) {
    this.commentAuth = commentAuth;
  }
  public Date getRegdate() {
    return regdate;
  }
  public void setRegdate(Date regdate) {
    this.regdate = regdate;
  }
  public Date getUpdatedate() {
    return updatedate;
  }
  public void setUpdatedate(Date updatedate) {
    this.updatedate = updatedate;
  }
  @Override
  public String toString() {
    return "CommentVo [cno=" + cno + ", fno=" + fno + ", mno=" + mno + ", commentText=" + commentText + ", commentAuth=" + commentAuth + ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
  }
 
  
  
}