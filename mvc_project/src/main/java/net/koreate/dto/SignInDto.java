package net.koreate.dto;

public class SignInDto {
  
  private int mNo;
  private String mId;
  private String mPassword;
  private boolean useCookie;
  
  public int getmNo() {
    return mNo;
  }
  public void setmNo(int mNo) {
    this.mNo = mNo;
  }
  
  public String getmId() {
    return mId;
  }
  public void setmId(String mId) {
    this.mId = mId;
  }
  public String getmPassword() {
    return mPassword;
  }
  public void setmPassword(String mPassword) {
    this.mPassword = mPassword;
  }
  public boolean isUseCookie() {
    return useCookie;
  }
  public void setUseCookie(boolean useCookie) {
    this.useCookie = useCookie;
  }
  
  
  @Override
  public String toString() {
    return "SignInDto [mNo=" + mNo + ", mId = " + mId + ", mPassword=" + mPassword + ", useCookie=" + useCookie + "]";
  }
 
  
  
  
  
  
  
}
