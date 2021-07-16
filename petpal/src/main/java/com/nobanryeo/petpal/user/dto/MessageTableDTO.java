package com.nobanryeo.petpal.user.dto;

import java.sql.Date;

public class MessageTableDTO {

	private int messageCode;
	private String messageContent;
	private Date messageDate;
	private int userCode1;
	private int userCode;
	private String sendUserNick;
	private String receiveUserNick;
	
	public MessageTableDTO() {}

	public MessageTableDTO(int messageCode, String messageContent, Date messageDate, int userCode1, int userCode,
			String sendUserNick, String receiveUserNick) {
		super();
		this.messageCode = messageCode;
		this.messageContent = messageContent;
		this.messageDate = messageDate;
		this.userCode1 = userCode1;
		this.userCode = userCode;
		this.sendUserNick = sendUserNick;
		this.receiveUserNick = receiveUserNick;
	}

	public int getMessageCode() {
		return messageCode;
	}

	public void setMessageCode(int messageCode) {
		this.messageCode = messageCode;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public Date getMessageDate() {
		return messageDate;
	}

	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}

	public int getUserCode1() {
		return userCode1;
	}

	public void setUserCode1(int userCode1) {
		this.userCode1 = userCode1;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public String getSendUserNick() {
		return sendUserNick;
	}

	public void setSendUserNick(String sendUserNick) {
		this.sendUserNick = sendUserNick;
	}

	public String getReceiveUserNick() {
		return receiveUserNick;
	}

	public void setReceiveUserNick(String receiveUserNick) {
		this.receiveUserNick = receiveUserNick;
	}

	@Override
	public String toString() {
		return "MessageTableDTO [messageCode=" + messageCode + ", messageContent=" + messageContent + ", messageDate="
				+ messageDate + ", userCode1=" + userCode1 + ", userCode=" + userCode + ", sendUserNick=" + sendUserNick
				+ ", receiveUserNick=" + receiveUserNick + "]";
	}

	
	
}
