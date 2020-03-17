package com.nkl.admin.dao;

/**
 * 邮件认证所需
 * @author 李怀鹏
 *
 */
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthenticator extends Authenticator {
	private String userName;
	private String password;

	public MyAuthenticator() {
	}

	public MyAuthenticator(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(userName, password);
	}

}