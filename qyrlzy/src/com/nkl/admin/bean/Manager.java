package com.nkl.admin.bean;

import com.nkl.common.domain.BaseDomain;

public class Manager extends BaseDomain {
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = -460922993085630428L;
	private int manager_id; //
	private String manager_name; //
	private String manager_pass; //
	private String real_name; //
	private int manager_sex; // 1：男 2：女
	private String manager_power;//管理员权限

	private String ids;
	private String random;

	public String getManager_sexDesc() {
		switch (manager_sex) {
		case 1:
			return "男";
		case 2:
			return "女";
		default:
			return "男";
		}
	}

	public int getManager_id() {
		return manager_id;
	}

	public void setManager_id(int manager_id) {
		this.manager_id = manager_id;
	}

	public String getManager_name() {
		return manager_name;
	}

	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}

	public String getManager_pass() {
		return manager_pass;
	}

	public void setManager_pass(String manager_pass) {
		this.manager_pass = manager_pass;
	}

	public String getReal_name() {
		return real_name;
	}

	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}

	public int getManager_sex() {
		return manager_sex;
	}

	public void setManager_sex(int manager_sex) {
		this.manager_sex = manager_sex;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getRandom() {
		return random;
	}

	public void setRandom(String random) {
		this.random = random;
	}

	public String getManager_power() {
		return manager_power;
	}

	public void setManager_power(String manager_power) {
		this.manager_power = manager_power;
	}

}
