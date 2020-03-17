package com.nkl.admin.bean;

import com.nkl.common.domain.BaseDomain;

public class Salary extends BaseDomain {
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = -460922993085630428L;
	private int salary_id;
	private int user_id; //
	private String salary_month; //
	private double salary_basic;
	private double salary_award;
	private double salary_subsidy;
	private int salary_attend; // 1-无 2-有考勤
	private double salary_money;
	private String salary_note;
	private double salary_baoxian;
	private double salary_zhufang;
	private double salary_yanglao;
	private double salary_punish;
	private int depart_id;
	private String depart_name;

	private String user_name; //
	private String real_name; //
	private String ids;// 前台参数
	private String random;

	// 判断是否全勤
	public String getSalary_attendDesc() {
		switch (salary_attend) {
		case 1:
			return "无";
		case 2:
			return "有";
		default:
			return "";
		}
	}

	public int getSalary_id() {
		return salary_id;
	}

	public void setSalary_id(int salary_id) {
		this.salary_id = salary_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getSalary_month() {
		return salary_month;
	}

	public void setSalary_month(String salary_month) {
		this.salary_month = salary_month;
	}

	public double getSalary_money() {
		return salary_money;
	}

	public void setSalary_money(double salary_money) {
		this.salary_money = salary_money;
	}

	public String getSalary_note() {
		return salary_note;
	}

	public void setSalary_note(String salary_note) {
		this.salary_note = salary_note;
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

	public String getReal_name() {
		return real_name;
	}

	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}

	public double getSalary_basic() {
		return salary_basic;
	}

	public void setSalary_basic(double salary_basic) {
		this.salary_basic = salary_basic;
	}

	public double getSalary_award() {
		return salary_award;
	}

	public void setSalary_award(double salary_award) {
		this.salary_award = salary_award;
	}

	public double getSalary_subsidy() {
		return salary_subsidy;
	}

	public void setSalary_subsidy(double salary_subsidy) {
		this.salary_subsidy = salary_subsidy;
	}

	public double getSalary_baoxian() {
		return salary_baoxian;
	}

	public void setSalary_baoxian(double salary_baoxian) {
		this.salary_baoxian = salary_baoxian;
	}

	public double getSalary_zhufang() {
		return salary_zhufang;
	}

	public void setSalary_zhufang(double salary_zhufang) {
		this.salary_zhufang = salary_zhufang;
	}

	public double getSalary_yanglao() {
		return salary_yanglao;
	}

	public void setSalary_yanglao(double salary_yanglao) {
		this.salary_yanglao = salary_yanglao;
	}

	public int getSalary_attend() {
		return salary_attend;
	}

	public void setSalary_attend(int salary_attend) {
		this.salary_attend = salary_attend;
	}

	public double getSalary_punish() {
		return salary_punish;
	}

	public void setSalary_punish(double salary_punish) {
		this.salary_punish = salary_punish;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getDepart_id() {
		return depart_id;
	}

	public void setDepart_id(int depart_id) {
		this.depart_id = depart_id;
	}

	public String getDepart_name() {
		return depart_name;
	}

	public void setDepart_name(String depart_name) {
		this.depart_name = depart_name;
	}

}
