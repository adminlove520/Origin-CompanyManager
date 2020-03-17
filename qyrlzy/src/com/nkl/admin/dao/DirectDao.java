package com.nkl.admin.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.nkl.admin.bean.Direct;
import com.nkl.common.dao.BaseDao;
import com.nkl.common.util.StringUtil;

public class DirectDao {

	public int addDirect(Direct direct, Connection conn) {
		String sql = "INSERT INTO direct(direct_id,user_name,real_name,user_sex,depart_id,user_phone,user_qq,user_mail,user_address) values(null,?,?,?,?,?,?,?,?)";
		Object[] params = new Object[] { direct.getUser_name(),
				direct.getReal_name(), direct.getUser_sex(),
				direct.getDepart_id(), direct.getUser_phone(),
				direct.getUser_qq(), direct.getUser_mail(),
				direct.getUser_address()

		};
		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int delDirect(String direct_id, Connection conn) {
		String sql = "DELETE FROM direct WHERE direct_id=?";

		Object[] params = new Object[] { new Integer(direct_id) };
		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int delDirects(String[] direct_ids, Connection conn) {
		StringBuilder sBuilder = new StringBuilder();
		for (int i = 0; i < direct_ids.length; i++) {
			sBuilder.append("?");
			if (i != direct_ids.length - 1) {
				sBuilder.append(",");
			}
		}
		String sql = "DELETE FROM direct WHERE direct_id IN("
				+ sBuilder.toString() + ")";

		Object[] params = direct_ids;

		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int updateDirect(Direct direct, Connection conn) {
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("UPDATE direct SET direct_id = "
				+ direct.getDirect_id() + " ");
		if (!StringUtil.isEmptyString(direct.getUser_name())) {
			sBuilder.append(", user_name = '" + direct.getUser_name() + "' ");
		}
		if (!StringUtil.isEmptyString(direct.getReal_name())) {
			sBuilder.append(", real_name = '" + direct.getReal_name() + "' ");
		}
		if (direct.getUser_sex() != 0) {
			sBuilder.append(", user_sex = " + direct.getUser_sex() + " ");
		}
		if (direct.getDepart_id() != 0) {
			sBuilder.append(", depart_id = " + direct.getDepart_id() + " ");
		}
		if (!StringUtil.isEmptyString(direct.getUser_phone())) {
			sBuilder.append(", user_phone = '" + direct.getUser_phone() + "' ");
		}
		if (!StringUtil.isEmptyString(direct.getUser_qq())) {
			sBuilder.append(", user_qq = '" + direct.getUser_qq() + "' ");
		} else {
			sBuilder.append(", user_qq = '' ");
		}
		if (!StringUtil.isEmptyString(direct.getUser_mail())) {
			sBuilder.append(", user_mail = '" + direct.getUser_mail() + "' ");
		} else {
			sBuilder.append(", user_mail = '' ");
		}
		if (!StringUtil.isEmptyString(direct.getUser_address())) {
			sBuilder.append(", user_address = '" + direct.getUser_address()
					+ "' ");
		} else {
			sBuilder.append(", user_address = '' ");
		}
		sBuilder.append("where direct_id = " + direct.getDirect_id() + " ");

		Object[] params = null;
		return BaseDao.executeUpdate(sBuilder.toString(), params, conn);
	}

	public Direct getDirect(Direct direct, Connection conn) {
		Direct _direct = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT u.*,d.depart_name FROM direct u ");
		sBuilder.append("  left join depart d on d.depart_id=u.depart_id WHERE 1=1");
		if (direct.getDirect_id() != 0) {
			sBuilder.append(" and direct_id = " + direct.getDirect_id() + " ");
		}
		if (!StringUtil.isEmptyString(direct.getUser_name())) {
			sBuilder.append(" and user_name = '" + direct.getUser_name() + "' ");
		}

		List<Object> list = BaseDao.executeQuery(Direct.class.getName(),
				sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			_direct = (Direct) list.get(0);
		}
		return _direct;
	}

	public List<Direct> listDirects(Direct direct, Connection conn) {
		List<Direct> directs = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT * FROM (");
		sBuilder.append("SELECT u.*,d.depart_name FROM direct u ");
		sBuilder.append("  left join depart d on d.depart_id=u.depart_id WHERE 1=1");

		if (direct.getDirect_id() != 0) {
			sBuilder.append(" and direct_id = " + direct.getDirect_id() + " ");
		}
		if (!StringUtil.isEmptyString(direct.getUser_name())) {
			sBuilder.append(" and u.user_name like '%" + direct.getUser_name()
					+ "%' ");
		}
		if (!StringUtil.isEmptyString(direct.getReal_name())) {
			sBuilder.append(" and u.real_name like '%" + direct.getReal_name()
					+ "%' ");
		}
		if (direct.getDepart_id() != 0) {
			sBuilder.append(" and u.depart_id =" + direct.getDepart_id() + " ");
		}
		sBuilder.append(" order by direct_id asc) t");

		if (direct.getStart() != -1) {
			sBuilder.append(" limit " + direct.getStart() + ","
					+ direct.getLimit());
		}

		List<Object> list = BaseDao.executeQuery(Direct.class.getName(),
				sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			directs = new ArrayList<Direct>();
			for (Object object : list) {
				directs.add((Direct) object);
			}
		}
		return directs;
	}

	public int listDirectsCount(Direct direct, Connection conn) {
		int sum = 0;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT count(*) FROM direct u ");
		sBuilder.append("  left join depart d on d.depart_id=u.depart_id WHERE 1=1");

		if (direct.getDirect_id() != 0) {
			sBuilder.append(" and direct_id = " + direct.getDirect_id() + " ");
		}
		if (!StringUtil.isEmptyString(direct.getUser_name())) {
			sBuilder.append(" and u.user_name like '%" + direct.getUser_name()
					+ "%' ");
		}
		if (!StringUtil.isEmptyString(direct.getReal_name())) {
			sBuilder.append(" and u.real_name like '%" + direct.getReal_name()
					+ "%' ");
		}
		if (direct.getDepart_id() != 0) {
			sBuilder.append(" and u.depart_id =" + direct.getDepart_id() + " ");
		}

		long count = (Long) BaseDao.executeQueryObject(sBuilder.toString(),
				null, conn);
		sum = (int) count;
		return sum;
	}

}
