package com.nobanryeo.petpal.user.dto;


public class UserInfoDTO { 
	
	private int code; //유저코드
	private String id; //아이디
	private String phone; //폰
	private String name; //이름
	private String nikname; //닉네임
	private String pwd; //비밀번호
	private String email; //이메일
	private String replyYn; //댓글알림여부
	private String emailYn; //이메일송신동의여부
	private String withdrawYn; //탈퇴여부
	private int reportCount; //신고횟수
	private int permisson; //권한
	
	public UserInfoDTO() {
		
	}
	
	public UserInfoDTO(int code, String id, String phone, String name, String nikname, String pwd, String email,
			String emailYn, String replyYn, String withdrawYn, int reportCount, int permisson) {
		super();
		this.code = code;
		this.id = id;
		this.phone = phone;
		this.name = name;
		this.nikname = nikname;
		this.pwd = pwd;
		this.email = email;
		this.emailYn = emailYn;
		this.replyYn = replyYn;
		this.withdrawYn = withdrawYn;
		this.reportCount = reportCount;
		this.permisson = permisson;
	}
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNikname() {
		return nikname;
	}
	public void setNikname(String nikname) {
		this.nikname = nikname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmailYn() {
		return emailYn;
	}
	public void setEmailYn(String emailYn) {
		this.emailYn = emailYn;
	}
	public String getReplyYn() {
		return replyYn;
	}
	public void setReplyYn(String replyYn) {
		this.replyYn = replyYn;
	}
	public String getWithdrawYn() {
		return withdrawYn;
	}
	public void setWithdrawYn(String withdrawYn) {
		this.withdrawYn = withdrawYn;
	}
	public int getReportCount() {
		return reportCount;
	}
	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}
	public int getPermisson() {
		return permisson;
	}
	public void setPermisson(int permisson) {
		this.permisson = permisson;
	}
	
	@Override
	public String toString() {
		return "UserInfoDTO [code=" + code + ", id=" + id + ", phone=" + phone + ", name=" + name + ", nikname="
				+ nikname + ", pwd=" + pwd + ", email=" + email + ", emailYn=" + emailYn + ", replyYn=" + replyYn
				+ ", withdrawYn=" + withdrawYn + ", reportCount=" + reportCount + ", permisson=" + permisson + "]";
	}
	
	

	
	
}
