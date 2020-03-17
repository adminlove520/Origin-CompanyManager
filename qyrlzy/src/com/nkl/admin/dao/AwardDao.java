package com.nkl.admin.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.nkl.admin.bean.Award;
import com.nkl.common.dao.BaseDao;
import com.nkl.common.util.StringUtil;

public class AwardDao {

	public int addAward(Award award, Connection conn) {
		String sql = "INSERT INTO award(award_id,user_id,award_date,award_title,award_content,award_note,award_type) values(null,?,?,?,?,?,?)";
		Object[] params = new Object[] { award.getUser_id(),
				award.getAward_date(), award.getAward_title(),
				award.getAward_content(), award.getAward_note(),
				award.getAward_type()

		};
		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int delAward(String award_id, Connection conn) {
		String sql = "DELETE FROM award WHERE award_id=?";

		Object[] params = new Object[] { new Integer(award_id) };
		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int delAwards(String[] award_ids, Connection conn) {
		StringBuilder sBuilder = new StringBuilder();
		for (int i = 0; i < award_ids.length; i++) {
			sBuilder.append("?");
			if (i != award_ids.length - 1) {
				sBuilder.append(",");
			}
		}
		String sql = "DELETE FROM award WHERE award_id IN("
				+ sBuilder.toString() + ")";

		Object[] params = award_ids;

		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int updateAward(Award award, Connection conn) {
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("UPDATE award SET award_id = " + award.getAward_id()
				+ " ");
		if (!StringUtil.isEmptyString(award.getAward_date())) {
			sBuilder.append(", award_date = '" + award.getAward_date() + "' ");
		}
		if (!StringUtil.isEmptyString(award.getAward_title())) {
			sBuilder.append(", award_title = '" + award.getAward_title() + "' ");
		}
		if (!StringUtil.isEmptyString(award.getAward_content())) {
			sBuilder.append(", award_content = '" + award.getAward_content()
					+ "' ");
		}
		if (!StringUtil.isEmptyString(award.getAward_note())) {
			sBuilder.append(", award_note = '" + award.getAward_note() + "' ");
		} else {
			sBuilder.append(", award_note = '' ");
		}
		if (award.getAward_type() != 0) {
			sBuilder.append(", award_type = " + award.getAward_type() + " ");
		}
		sBuilder.append("where award_id = " + award.getAward_id() + " ");

		Object[] params = null;
		return BaseDao.executeUpdate(sBuilder.toString(), params, conn);
	}

	public Award getAward(Award award, Connection conn) {
		Award _award = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT a.*,u.user_name,u.real_name FROM award a ");
		sBuilder.append("  JOIN user u on a.user_id=u.user_id WHERE 1=1");
		if (award.getAward_id() != 0) {
			sBuilder.append(" and award_id = " + award.getAward_id() + " ");
		}

		List<Object> list = BaseDao.executeQuery(Award.class.getName(),
				sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			_award = (Award) list.get(0);
		}
		return _award;
	}

	public List<Award> listAwards(Award award, Connection conn) {
		List<Award> awards = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT * FROM (");
		sBuilder.append("SELECT a.*,u.user_name,u.real_name FROM award a ");
		sBuilder.append("  JOIN user u on a.user_id=u.user_id WHERE 1=1");

		if (award.getAward_id() != 0) {
			sBuilder.append(" and award_id = " + award.getAward_id() + " ");
		}
		if (!StringUtil.isEmptyString(award.getAward_title())) {
			sBuilder.append(" and award_title like '%" + award.getAward_title()
					+ "%' ");
		}
		if (award.getUser_id() != 0) {
			sBuilder.append(" and a.user_id = " + award.getUser_id() + " ");
		}
		if (!StringUtil.isEmptyString(award.getUser_name())) {
			sBuilder.append(" and u.user_name like '%" + award.getUser_name()
					+ "%' ");
		}
		if (!StringUtil.isEmptyString(award.getReal_name())) {
			sBuilder.append(" and u.real_name like '%" + award.getReal_name()
					+ "%' ");
		}
		if (award.getAward_type() != 0) {
			sBuilder.append(" and award_type = " + award.getAward_type() + " ");
		}
		sBuilder.append(" order by award_date desc) t");

		if (award.getStart() != -1) {
			sBuilder.append(" limit " + award.getStart() + ","
					+ award.getLimit());
		}

		List<Object> list = BaseDao.executeQuery(Award.class.getName(),
				sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			awards = new ArrayList<Award>();
			for (Object object : list) {
				awards.add((Award) object);
			}
		}
		return awards;
	}

	public int listAwardsCount(Award award, Connection conn) {
		int sum = 0;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT count(*) FROM award a ");
		sBuilder.append("  JOIN user u on a.user_id=u.user_id WHERE 1=1");

		if (award.getAward_id() != 0) {
			sBuilder.append(" and award_id = " + award.getAward_id() + " ");
		}
		if (!StringUtil.isEmptyString(award.getAward_title())) {
			sBuilder.append(" and award_title like '%" + award.getAward_title()
					+ "%' ");
		}
		if (award.getUser_id() != 0) {
			sBuilder.append(" and a.user_id = " + award.getUser_id() + " ");
		}
		if (!StringUtil.isEmptyString(award.getUser_name())) {
			sBuilder.append(" and u.user_name like '%" + award.getUser_name()
					+ "%' ");
		}
		if (!StringUtil.isEmptyString(award.getReal_name())) {
			sBuilder.append(" and u.real_name like '%" + award.getReal_name()
					+ "%' ");
		}
		if (award.getAward_type() != 0) {
			sBuilder.append(" and award_type = " + award.getAward_type() + " ");
		}

		long count = (Long) BaseDao.executeQueryObject(sBuilder.toString(),
				null, conn);
		sum = (int) count;
		return sum;
	}

}
