package net.koreate.vo;

public class BookVo {
  
  String location;
  String bno;
  String title;
  String author;
  String publisher;
  String pubdate;
  
  
  public String getLocation() {
    return location;
  }
  public void setLocation(String location) {
    this.location = location;
  }
  public String getBno() {
    return bno;
  }
  public void setBno(String bno) {
    this.bno = bno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getAuthor() {
    return author;
  }
  public void setAuthor(String author) {
    this.author = author;
  }
  public String getPublisher() {
    return publisher;
  }
  public void setPublisher(String publisher) {
    this.publisher = publisher;
  }
  public String getPubdate() {
    return pubdate;
  }
  public void setPubdate(String pubdate) {
    this.pubdate = pubdate;
  }
  
  
  @Override
  public String toString() {
    return "BookVo [location=" + location + ", bno=" + bno + ", title=" + title + ", author=" + author + ", publisher=" + publisher + ", pubdate=" + pubdate + "]";
  }
  
  
}
