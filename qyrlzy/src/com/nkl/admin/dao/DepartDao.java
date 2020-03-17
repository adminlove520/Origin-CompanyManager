package com.nkl.admin.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.nkl.admin.bean.Depart;
import com.nkl.common.dao.BaseDao;
import com.nkl.common.util.StringUtil;

public class DepartDao {

	public int addDepart(Depart depart, Connection conn) {
		String sql = "INSERT INTO depart(depart_id,depart_name,depart_note) values(null,?,?)";
		Object[] params = new Object[] { depart.getDepart_name(),
				depart.getDepart_note() };
		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int delDepart(String depart_id, Connection conn) {
		String sql = "DELETE FROM depart WHERE depart_id=?";

		Object[] params = new Object[] { new Integer(depart_id) };
		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int delDeparts(String[] depart_ids, Connection conn) {
		StringBuilder sBuilder = new StringBuilder();
		for (int i = 0; i < depart_ids.length; i++) {
			sBuilder.append("?");
			if (i != depart_ids.length - 1) {
				sBuilder.append(",");
			}
		}
		String sql = "DELETE FROM depart WHERE depart_id IN("
				+ sBuilder.toString() + ")";

		Object[] params = depart_ids;

		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int updateDepart(Depart depart, Connection conn) {
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("UPDATE depart SET depart_id = "
				+ depart.getDepart_id() + " ");
		if (!StringUtil.isEmptyString(depart.getDepart_name())) {
			sBuilder.append(" ,depart_name = '" + depart.getDepart_name()
					+ "' ");
		}
		if (!StringUtil.isEmptyString(depart.getDepart_note())) {
			sBuilder.append(" ,depart_note = '" + depart.getDepart_note()
					+ "' ");
		} else {
			sBuilder.append(" ,depart_note = '' ");
		}

		sBuilder.append(" where depart_id = " + depart.getDepart_id() + " ");

		Object[] params = null;
		return BaseDao.executeUpdate(sBuilder.toString(), params, conn);
	}

	public Depart getDepart(Depart depart, Connection conn) {
		Depart _depart = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT * FROM depart WHERE 1=1");
		if (depart.getDepart_id() != 0) {
			sBuilder.append(" and depart_id = " + depart.getDepart_id() + " ");
		}
		if (!StringUtil.isEmptyString(depart.getDepart_name())) {
			sBuilder.append(" and depart_name = '" + depart.getDepart_name()
					+ "' ");
		}

		List<Object> list = BaseDao.executeQuery(Depart.class.getName(),
				sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			_depart = (Depart) list.get(0);
		}
		return _depart;
	}

	public List<Depart> listDeparts(Depart depart, Connection conn) {
		List<Depart> departs = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT * FROM (");
		sBuilder.append("SELECT * FROM depart WHERE 1=1");

		if (depart.getDepart_id() != 0) {
			sBuilder.append(" and depart_id = " + depart.getDepart_id() + " ");
		}
		if (!StringUtil.isEmptyString(depart.getDepart_name())) {
			sBuilder.append(" and depart_name like '%"
					+ depart.getDepart_name() + "%' ");
		}
		sBuilder.append(" order by depart_id asc) t");

		if (depart.getStart() != -1) {
			sBuilder.append(" limit " + depart.getStart() + ","
					+ depart.getLimit());
		}

		List<Object> list = BaseDao.executeQuery(Depart.class.getName(),
				sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			departs = new ArrayList<Depart>();
			for (Object object : list) {
				departs.add((Depart) object);
			}
		}
		return departs;
	}

	public int listDepartsCount(Depart depart, Connection conn) {
		int sum = 0;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT count(*) FROM depart WHERE 1=1");

		if (depart.getDepart_id() != 0) {
			sBuilder.append(" and depart_id = " + depart.getDepart_id() + " ");
		}
		if (!StringUtil.isEmptyString(depart.getDepart_name())) {
			sBuilder.append(" and depart_name like '%"
					+ depart.getDepart_name() + "%' ");
		}

		long count = (Long) BaseDao.executeQueryObject(sBuilder.toString(),
				null, conn);
		sum = (int) count;
		return sum;
	}

}
