package net.koreate.vo;

import java.util.Date;

public class FreeBoardVo {
  
  int fNo;
  String fTitle;
  String fContent;
  String fWriter;
  int origin;
  int depth;
  int seq;
  int fViewcnt;
  int fRecomcnt;
  Date fRegdate;
  Date fUpdatedate;
  int mno;
  int fCommentcnt;
  String mcate;
  
  
  public int getfNo() {
    return fNo;
  }
  public void setfNo(int fNo) {
    this.fNo = fNo;
  }
  public String getfTitle() {
    return fTitle;
  }
  public void setfTitle(String fTitle) {
    this.fTitle = fTitle;
  }
  public String getfContent() {
    return fContent;
  }
  public void setfContent(String fContent) {
    this.fContent = fContent;
  }
  public String getfWriter() {
    return fWriter;
  }
  public void setfWriter(String fWriter) {
    this.fWriter = fWriter;
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
  public int getfViewcnt() {
    return fViewcnt;
  }
  public void setfViewcnt(int fViewcnt) {
    this.fViewcnt = fViewcnt;
  }
  public int getfRecomcnt() {
    return fRecomcnt;
  }
  public void setfRecomcnt(int fRecomcnt) {
    this.fRecomcnt = fRecomcnt;
  }
  public Date getfRegdate() {
    return fRegdate;
  }
  public void setfRegdate(Date fRegdate) {
    this.fRegdate = fRegdate;
  }
  public Date getfUpdatedate() {
    return fUpdatedate;
  }
  public void setfUpdatedate(Date fUpdatedate) {
    this.fUpdatedate = fUpdatedate;
  }
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }
  public int getfCommentcnt() {
    return fCommentcnt;
  }
  public void setfCommentcnt(int fCommentcnt) {
    this.fCommentcnt = fCommentcnt;
  }
  public String getMcate() {
    return mcate;
  }
  public void setMcate(String mcate) {
    this.mcate = mcate;
  }
  
  
  @Override
  public String toString() {
    return "FreeBoardVo [fNo=" + fNo + ", fTitle=" + fTitle + ", fContent=" + fContent + ", fWriter=" + fWriter + ", origin=" + origin + ", depth=" + depth + ", seq=" + seq + ", fViewcnt=" + fViewcnt + ", fRecomcnt=" + fRecomcnt + ", fRegdate=" + fRegdate + ", fUpdatedate=" + fUpdatedate + ", mno=" + mno + ", fCommentcnt=" + fCommentcnt + ", mcate=" + mcate + "]";
  }
  
  
  
  
  
}
