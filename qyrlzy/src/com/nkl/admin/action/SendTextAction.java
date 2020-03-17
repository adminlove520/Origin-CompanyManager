package com.nkl.admin.action;

import com.nkl.admin.bean.MailSenderInfo;
import com.nkl.admin.dao.SimpleMailSender;
import com.opensymphony.xwork2.ActionSupport;

public class SendTextAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String to;
	private String qq;
	private String password;
	private String subject;
	private String content;

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String execute() throws Exception {
		MailSenderInfo mailInfo = new MailSenderInfo();
		mailInfo.setMailServerHost("smtp.qq.com");
		mailInfo.setMailServerPort("25");// 25
		mailInfo.setValidate(true);
		mailInfo.setFromAddress(qq + "@qq.com");
		mailInfo.setToAddress(to);
		mailInfo.setUserName(qq + "@qq.com");
		mailInfo.setPassword(password);
		mailInfo.setSubject(subject);
		mailInfo.setContent(content);
		boolean isSend = SimpleMailSender.sendTextMail(mailInfo);
		if (isSend)
			return SUCCESS;
		addActionError("发送失败!");
		return INPUT;
	}
}