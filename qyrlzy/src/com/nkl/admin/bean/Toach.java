package com.nkl.admin.bean;

import com.nkl.common.domain.BaseDomain;

public class Toach extends BaseDomain {
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 672789561403008511L;
	private int toach_id; //
	private int user_id; //
	private String toach_date1; //
	private String toach_date2; //
	private String toach_title; //
	private String toach_content; //
	private String toach_note; //

	private String user_name; //
	private String real_name; //
	private String ids;
	private String random;

	public void setToach_id(int toach_id) {
		this.toach_id = toach_id;
	}

	public int getToach_id() {
		return toach_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setToach_date1(String toach_date1) {
		this.toach_date1 = toach_date1;
	}

	public String getToach_date1() {
		return toach_date1;
	}

	public void setToach_date2(String toach_date2) {
		this.toach_date2 = toach_date2;
	}

	public String getToach_date2() {
		return toach_date2;
	}

	public void setToach_title(String toach_title) {
		this.toach_title = toach_title;
	}

	public String getToach_title() {
		return toach_title;
	}

	public void setToach_content(String toach_content) {
		this.toach_content = toach_content;
	}

	public String getToach_content() {
		return toach_content;
	}

	public void setToach_note(String toach_note) {
		this.toach_note = toach_note;
	}

	public String getToach_note() {
		return toach_note;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getIds() {
		return ids;
	}

	public void setRandom(String random) {
		this.random = random;
	}

	public String getRandom() {
		return random;
	}

	public String getUser_name() {
		return user_name;
	}

	public String getReal_name() {
		return real_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}

}
