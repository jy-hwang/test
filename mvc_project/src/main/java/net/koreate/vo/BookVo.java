package net.koreate.vo;

public class BookVo {


	String location;
	String bno;
	String title;
	String author;
	String pulisher;
	int pubdate;
	int bindex;
	boolean borrow;
	boolean reserve;
	
	
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
	public String getPulisher() {
		return pulisher;
	}
	public void setPulisher(String pulisher) {
		this.pulisher = pulisher;
	}
	public int getPubdate() {
		return pubdate;
	}
	public void setPubdate(int pubdate) {
		this.pubdate = pubdate;
	}
	public int getBindex() {
		return bindex;
	}
	public void setBindex(int bindex) {
		this.bindex = bindex;
	}
	public boolean isBorrow() {
		return borrow;
	}
	public void setBorrow(boolean borrow) {
		this.borrow = borrow;
	}
	public boolean isReserve() {
		return reserve;
	}
	public void setReserve(boolean reserve) {
		this.reserve = reserve;
	}
	
	
	@Override
	public String toString() {
		return "BookVo [location=" + location + ", bno=" + bno + ", title=" + title + ", author=" + author
				+ ", pulisher=" + pulisher + ", pubdate=" + pubdate + ", bindex=" + bindex + ", borrow=" + borrow
				+ ", reserve=" + reserve + "]";
	}
	
}	
