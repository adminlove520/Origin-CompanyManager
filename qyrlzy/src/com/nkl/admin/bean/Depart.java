package com.nkl.admin.bean;

import com.nkl.common.domain.BaseDomain;

public class Depart extends BaseDomain {
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1770185824735782580L;
	private int depart_id; //
	private String depart_name; //
	private String depart_note; //

	private String ids;

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

	public String getDepart_note() {
		return depart_note;
	}

	public void setDepart_note(String depart_note) {
		this.depart_note = depart_note;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

}
