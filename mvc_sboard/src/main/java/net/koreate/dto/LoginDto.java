package net.koreate.dto;

public class LoginDto {
  
  private String uid;
  private String upw;
  boolean useCookie;
  
  
  public String getUid() {
    return uid;
  }
  public void setUid(String uid) {
    this.uid = uid;
  }
  public String getUpw() {
    return upw;
  }
  public void setUpw(String upw) {
    this.upw = upw;
  }
  public boolean isUseCookie() {
    return useCookie;
  }
  public void setUseCookie(boolean useCookie) {
    this.useCookie = useCookie;
  }
  
  @Override
  public String toString() {
    return "LoginDto [uid=" + uid + ", upw=" + upw + ", useCookie=" + useCookie + "]";
  }
  
  
  
}
