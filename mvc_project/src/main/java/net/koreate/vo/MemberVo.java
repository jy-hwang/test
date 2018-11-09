package net.koreate.vo;

import java.util.Date;

public class MemberVo {
  
    
  private int mNo;
  private String mId;
  private String mName;
  private String mEmail;
  private String mPassword;
  private String mPhone;
  private int mBirth;
  private String mGender;
  private String mCate;
  private Date regdate;
  private Date updatedate;
  
  
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
  public String getmName() {
    return mName;
  }
  public void setmName(String mName) {
    this.mName = mName;
  }
  public String getmEmail() {
    return mEmail;
  }
  public void setmEmail(String mEmail) {
    this.mEmail = mEmail;
  }
  public String getmPassword() {
    return mPassword;
  }
  public void setmPassword(String mPassword) {
    this.mPassword = mPassword;
  }
  public String getmPhone() {
    return mPhone;
  }
  public void setmPhone(String mPhone) {
    this.mPhone = mPhone;
  }
  public int getmBirth() {
    return mBirth;
  }
  public void setmBirth(int mBirth) {
    this.mBirth = mBirth;
  }
  public String getmGender() {
    return mGender;
  }
  public void setmGender(String mGender) {
    this.mGender = mGender;
  }
  public String getmCate() {
    return mCate;
  }
  public void setmCate(String mCate) {
    this.mCate = mCate;
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
    return "MemberVo [mNo=" + mNo + ", mId=" + mId + ", mName=" + mName + ", mEmail=" + mEmail
        + ", mPassword=" + mPassword + ", mPhone=" + mPhone + ", mBirth=" + mBirth + ", mGender="
        + mGender + ", mCate=" + mCate + ", regdate=" + regdate + ", updatedate=" + updatedate +"]";
  }
  
  
  
  
  
  
  
  
}
