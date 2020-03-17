package com.nkl.admin.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.nkl.admin.bean.Toach;
import com.nkl.common.dao.BaseDao;
import com.nkl.common.util.StringUtil;

public class ToachDao {

	public int addToach(Toach toach, Connection conn) {
		String sql = "INSERT INTO toach(toach_id,user_id,toach_date1,toach_date2,toach_title,toach_content,toach_note) values(null,?,?,?,?,?,?)";
		Object[] params = new Object[] { toach.getUser_id(),
				toach.getToach_date1(), toach.getToach_date2(),
				toach.getToach_title(), toach.getToach_content(),
				toach.getToach_note()

		};
		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int delToach(String toach_id, Connection conn) {
		String sql = "DELETE FROM toach WHERE toach_id=?";

		Object[] params = new Object[] { new Integer(toach_id) };
		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int delToachs(String[] toach_ids, Connection conn) {
		StringBuilder sBuilder = new StringBuilder();
		for (int i = 0; i < toach_ids.length; i++) {
			sBuilder.append("?");
			if (i != toach_ids.length - 1) {
				sBuilder.append(",");
			}
		}
		String sql = "DELETE FROM toach WHERE toach_id IN("
				+ sBuilder.toString() + ")";

		Object[] params = toach_ids;

		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int updateToach(Toach toach, Connection conn) {
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("UPDATE toach SET toach_id = " + toach.getToach_id()
				+ " ");
		if (!StringUtil.isEmptyString(toach.getToach_date1())) {
			sBuilder.append(", toach_date1 = '" + toach.getToach_date1() + "' ");
		}
		if (!StringUtil.isEmptyString(toach.getToach_date2())) {
			sBuilder.append(", toach_date2 = '" + toach.getToach_date2() + "' ");
		}
		if (!StringUtil.isEmptyString(toach.getToach_title())) {
			sBuilder.append(", toach_title = '" + toach.getToach_title() + "' ");
		}
		if (!StringUtil.isEmptyString(toach.getToach_content())) {
			sBuilder.append(", toach_content = '" + toach.getToach_content()
					+ "' ");
		}
		if (!StringUtil.isEmptyString(toach.getToach_note())) {
			sBuilder.append(", toach_note = '" + toach.getToach_note() + "' ");
		} else {
			sBuilder.append(", toach_note = '' ");
		}
		sBuilder.append("where toach_id = " + toach.getToach_id() + " ");

		Object[] params = null;
		return BaseDao.executeUpdate(sBuilder.toString(), params, conn);
	}

	public Toach getToach(Toach toach, Connection conn) {
		Toach _toach = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT a.*,u.user_name,u.real_name FROM toach a ");
		sBuilder.append("  JOIN user u on a.user_id=u.user_id WHERE 1=1");
		if (toach.getToach_id() != 0) {
			sBuilder.append(" and toach_id = " + toach.getToach_id() + " ");
		}

		List<Object> list = BaseDao.executeQuery(Toach.class.getName(),
				sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			_toach = (Toach) list.get(0);
		}
		return _toach;
	}

	public List<Toach> listToachs(Toach toach, Connection conn) {
		List<Toach> toachs = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT * FROM (");
		sBuilder.append("SELECT a.*,u.user_name,u.real_name FROM toach a ");
		sBuilder.append("  JOIN user u on a.user_id=u.user_id WHERE 1=1");

		if (toach.getToach_id() != 0) {
			sBuilder.append(" and toach_id = " + toach.getToach_id() + " ");
		}
		if (!StringUtil.isEmptyString(toach.getToach_title())) {
			sBuilder.append(" and toach_title like '%" + toach.getToach_title()
					+ "%' ");
		}
		if (toach.getUser_id() != 0) {
			sBuilder.append(" and a.user_id = " + toach.getUser_id() + " ");
		}
		if (!StringUtil.isEmptyString(toach.getUser_name())) {
			sBuilder.append(" and u.user_name like '%" + toach.getUser_name()
					+ "%' ");
		}
		if (!StringUtil.isEmptyString(toach.getReal_name())) {
			sBuilder.append(" and u.real_name like '%" + toach.getReal_name()
					+ "%' ");
		}
		sBuilder.append(" order by toach_date1 desc) t");

		if (toach.getStart() != -1) {
			sBuilder.append(" limit " + toach.getStart() + ","
					+ toach.getLimit());
		}

		List<Object> list = BaseDao.executeQuery(Toach.class.getName(),
				sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			toachs = new ArrayList<Toach>();
			for (Object object : list) {
				toachs.add((Toach) object);
			}
		}
		return toachs;
	}

	public int listToachsCount(Toach toach, Connection conn) {
		int sum = 0;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT count(*) FROM toach a ");
		sBuilder.append("  JOIN user u on a.user_id=u.user_id WHERE 1=1");

		if (toach.getToach_id() != 0) {
			sBuilder.append(" and toach_id = " + toach.getToach_id() + " ");
		}
		if (!StringUtil.isEmptyString(toach.getToach_title())) {
			sBuilder.append(" and toach_title like '%" + toach.getToach_title()
					+ "%' ");
		}
		if (toach.getUser_id() != 0) {
			sBuilder.append(" and a.user_id = " + toach.getUser_id() + " ");
		}
		if (!StringUtil.isEmptyString(toach.getUser_name())) {
			sBuilder.append(" and u.user_name like '%" + toach.getUser_name()
					+ "%' ");
		}
		if (!StringUtil.isEmptyString(toach.getReal_name())) {
			sBuilder.append(" and u.real_name like '%" + toach.getReal_name()
					+ "%' ");
		}

		long count = (Long) BaseDao.executeQueryObject(sBuilder.toString(),
				null, conn);
		sum = (int) count;
		return sum;
	}

}
