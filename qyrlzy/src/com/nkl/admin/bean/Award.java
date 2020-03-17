package com.nkl.admin.bean;

import com.nkl.common.domain.BaseDomain;

public class Award extends BaseDomain {
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = -2789097870538860544L;
	private int award_id; //
	private int user_id; //
	private String award_date; //
	private String award_title; //
	private String award_content; //
	private String award_note; //
	private int award_type; // 1：奖励 2：惩处

	private String user_name; //
	private String real_name; //
	private String ids;
	private String random;

	public String getAward_typeDesc() {
		switch (award_type) {
		case 1:
			return "奖励";
		case 2:
			return "惩处";
		default:
			return "";
		}
	}

	public void setAward_id(int award_id) {
		this.award_id = award_id;
	}

	public int getAward_id() {
		return award_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setAward_date(String award_date) {
		this.award_date = award_date;
	}

	public String getAward_date() {
		return award_date;
	}

	public void setAward_title(String award_title) {
		this.award_title = award_title;
	}

	public String getAward_title() {
		return award_title;
	}

	public void setAward_content(String award_content) {
		this.award_content = award_content;
	}

	public String getAward_content() {
		return award_content;
	}

	public void setAward_note(String award_note) {
		this.award_note = award_note;
	}

	public String getAward_note() {
		return award_note;
	}

	public void setAward_type(int award_type) {
		this.award_type = award_type;
	}

	public int getAward_type() {
		return award_type;
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
