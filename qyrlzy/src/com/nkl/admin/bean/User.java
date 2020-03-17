package com.nkl.admin.bean;

import com.nkl.common.domain.BaseDomain;

public class User extends BaseDomain {
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = -460922993085630428L;
	private int user_id; //
	private String user_name; //
	private String user_pass; //
	private String real_name; //
	private int user_sex; // 1：男 2：女
	private int user_age; //
	private String user_nation;
	private String user_level;
	private int depart_id; //
	private String user_pose; //
	private String reg_date; //
	private String leave_date;
	private String leave_reason;
	private int user_type; // 1-在职 2-离职
	private int statue;//入职状态（实习，审核中，转正）

	private String depart_name; //
	private String ids;
	private String random;

	
	
	 public String getStatueDesc() {
	    	switch (statue) {
			case 1:
				return "实习";
			case 2:
				return "正式员工";
			case 3:
				return "转正审核中";
			case 4:
				return "转正审核中";
			case 5:
				return "申请转正";
			default:
				return "";
			}
		}
	 
	public int getStatue() {
		return statue;
	}
   
	public void setStatue(int statue) {
		this.statue = statue;
	}

	public String getUser_typeDesc() {
		switch (user_type) {
		case 1:
			return "在职";
		case 2:
			return "离职";
		default:
			return "";
		}
	}

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

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getUser_sex() {
		return user_sex;
	}

	public void setUser_sex(int user_sex) {
		this.user_sex = user_sex;
	}

	public int getUser_age() {
		return user_age;
	}

	public void setUser_age(int user_age) {
		this.user_age = user_age;
	}

	public int getDepart_id() {
		return depart_id;
	}

	public void setDepart_id(int depart_id) {
		this.depart_id = depart_id;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public int getUser_type() {
		return user_type;
	}

	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}

	public String getDepart_name() {
		return depart_name;
	}

	public void setDepart_name(String depart_name) {
		this.depart_name = depart_name;
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

	public String getLeave_date() {
		return leave_date;
	}

	public void setLeave_date(String leave_date) {
		this.leave_date = leave_date;
	}

	public String getLeave_reason() {
		return leave_reason;
	}

	public void setLeave_reason(String leave_reason) {
		this.leave_reason = leave_reason;
	}

	public String getUser_pass() {
		return user_pass;
	}

	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}

	public String getReal_name() {
		return real_name;
	}

	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}

	public String getUser_nation() {
		return user_nation;
	}

	public void setUser_nation(String user_nation) {
		this.user_nation = user_nation;
	}

	public String getUser_level() {
		return user_level;
	}

	public void setUser_level(String user_level) {
		this.user_level = user_level;
	}

	public String getUser_pose() {
		return user_pose;
	}

	public void setUser_pose(String user_pose) {
		this.user_pose = user_pose;
	}

}
