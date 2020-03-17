package com.nkl.admin.bean;

import com.nkl.common.domain.BaseDomain;

public class Direct extends BaseDomain {
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 4097148084084640717L;
	private int direct_id; //
	private String user_name; //
	private String real_name; //
	private int user_sex; //
	private int depart_id; //
	private String user_phone; //
	private String user_qq; //
	private String user_mail; //
	private String user_address; //

	private String depart_name; //
	private String ids;
	private String random;

	public String getUser_sexDesc() {
		switch (user_sex) {
		case 1:
			return "男";
		case 2:
			return "女";
		default:
			return "男";
		}
	}

	public void setDirect_id(int direct_id) {
		this.direct_id = direct_id;
	}

	public int getDirect_id() {
		return direct_id;
	}

	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}

	public String getReal_name() {
		return real_name;
	}

	public void setUser_sex(int user_sex) {
		this.user_sex = user_sex;
	}

	public int getUser_sex() {
		return user_sex;
	}

	public void setDepart_id(int depart_id) {
		this.depart_id = depart_id;
	}

	public int getDepart_id() {
		return depart_id;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_qq(String user_qq) {
		this.user_qq = user_qq;
	}

	public String getUser_qq() {
		return user_qq;
	}

	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}

	public String getUser_mail() {
		return user_mail;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public String getUser_address() {
		return user_address;
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

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getDepart_name() {
		return depart_name;
	}

	public void setDepart_name(String depart_name) {
		this.depart_name = depart_name;
	}

}
