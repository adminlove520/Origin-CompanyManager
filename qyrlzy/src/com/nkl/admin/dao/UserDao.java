package com.nkl.admin.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.nkl.admin.bean.User;
import com.nkl.common.dao.BaseDao;
import com.nkl.common.util.StringUtil;

public class UserDao {

	public int addUser(User user, Connection conn) {
		String sql = "INSERT INTO user(user_id,user_name,user_pass,real_name,user_sex,user_age,user_nation,user_level,depart_id,user_pose,reg_date,leave_date,leave_reason,user_type) values(null,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = new Object[] { user.getUser_name(),
				user.getUser_pass(), user.getReal_name(), user.getUser_sex(),
				user.getUser_age(), user.getUser_nation(),
				user.getUser_level(), user.getDepart_id(), user.getUser_pose(),
				user.getReg_date(), user.getLeave_date(),
				user.getLeave_reason(), user.getUser_type()

		};
		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int delUser(String user_id, Connection conn) {
		String sql = "DELETE FROM user WHERE user_id=?";

		Object[] params = new Object[] { new Integer(user_id) };
		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int delUsers(String[] user_ids, Connection conn) {
		StringBuilder sBuilder = new StringBuilder();
		for (int i = 0; i < user_ids.length; i++) {
			sBuilder.append("?");
			if (i != user_ids.length - 1) {
				sBuilder.append(",");
			}
		}
		String sql = "DELETE FROM user WHERE user_id IN(" + sBuilder.toString()
				+ ")";

		Object[] params = user_ids;

		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int updateUser(User user, Connection conn) {
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("UPDATE user SET user_id = " + user.getUser_id() + " ");
		if (!StringUtil.isEmptyString(user.getUser_name())) {
			sBuilder.append(" ,user_name ='" + user.getUser_name() + "' ");
		}
		if (!StringUtil.isEmptyString(user.getUser_pass())) {
			sBuilder.append(" ,user_pass ='" + user.getUser_pass() + "' ");
		}
		if (!StringUtil.isEmptyString(user.getReal_name())) {
			sBuilder.append(" ,real_name ='" + user.getReal_name() + "' ");
		}
		if (user.getUser_type() != 0) {
			sBuilder.append(" ,user_type =" + user.getUser_type() + " ");
		}
		if (user.getUser_sex() != 0) {
			sBuilder.append(" ,user_sex =" + user.getUser_sex() + " ");
		}
		if (user.getUser_age() != 0) {
			sBuilder.append(" ,user_age =" + user.getUser_age() + " ");
		}
		if (!StringUtil.isEmptyString(user.getUser_nation())) {
			sBuilder.append(" ,user_nation ='" + user.getUser_nation() + "' ");
		} else {
			sBuilder.append(" ,user_nation ='' ");
		}
		if (!StringUtil.isEmptyString(user.getUser_level())) {
			sBuilder.append(" ,user_level ='" + user.getUser_level() + "' ");
		}
		if (user.getDepart_id() != 0) {
			sBuilder.append(" ,depart_id =" + user.getDepart_id() + " ");
		}
		if (!StringUtil.isEmptyString(user.getUser_pose())) {
			sBuilder.append(" ,user_pose ='" + user.getUser_pose() + "' ");
		}
		if (!StringUtil.isEmptyString(user.getReg_date())) {
			sBuilder.append(" ,reg_date = str_to_date('" + user.getReg_date()
					+ "','%Y-%m-%d') ");
		}
		if (!StringUtil.isEmptyString(user.getLeave_date())) {
			sBuilder.append(" ,leave_date = str_to_date('"
					+ user.getLeave_date() + "','%Y-%m-%d') ");
		}
		if (!StringUtil.isEmptyString(user.getLeave_reason())) {
			sBuilder.append(" ,leave_reason ='" + user.getLeave_reason() + "' ");
		}

		sBuilder.append("where user_id = " + user.getUser_id() + " ");

		Object[] params = null;
		return BaseDao.executeUpdate(sBuilder.toString(), params, conn);
	}

	/**
	 * 通过判断是哪位管理员从而改变员工的状态值
	 * @param user
	 * @param conn
	 * @return  
	 */
	public int updateStatue(User user, Connection conn) {
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("UPDATE user SET user_id = " + user.getUser_id() + " ");
		if (user.getStatue() != 0) {
			sBuilder.append(" ,statue =" + user.getStatue() + " ");
		}
		sBuilder.append("where user_id = " + user.getUser_id() + " ");

		Object[] params = null;
		return BaseDao.executeUpdate(sBuilder.toString(), params, conn);
	}
	
	public User getUser(User user, Connection conn) {
		User _user = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT u.*,d.depart_name from user u ");
		sBuilder.append("  left join depart d on d.depart_id=u.depart_id WHERE 1=1");// LEFT
																						// JOIN:
																						// 即使右表中没有匹配，也从左表返回所有的行
		if (user.getUser_id() != 0) {
			sBuilder.append(" and user_id = " + user.getUser_id() + " ");
		}
		if (!StringUtil.isEmptyString(user.getUser_name())) {
			sBuilder.append(" and user_name ='" + user.getUser_name() + "' ");
		}

		List<Object> list = BaseDao.executeQuery(User.class.getName(),
				sBuilder.toString(), null, conn);// 类名,sql,参数,连接对象
		if (list != null && list.size() > 0) {
			_user = (User) list.get(0);
		}
		return _user;
	}

	public List<User> listUsers(User user, Connection conn) {
		List<User> users = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT * FROM (");
		sBuilder.append("SELECT u.*,d.depart_name from user u ");
		sBuilder.append("  left join depart d on d.depart_id=u.depart_id  WHERE 1=1");

		if (user.getUser_id() != 0) {
			sBuilder.append(" and u.user_id = " + user.getUser_id() + " ");
		}
		if (!StringUtil.isEmptyString(user.getUser_name())) {
			sBuilder.append(" and u.user_name like '%" + user.getUser_name()
					+ "%' ");
		}
		if (!StringUtil.isEmptyString(user.getReal_name())) {
			sBuilder.append(" and u.real_name like '%" + user.getReal_name()
					+ "%' ");
		}
		if (user.getUser_type() != 0) {
			sBuilder.append(" and u.user_type =" + user.getUser_type() + " ");
		}
		if (user.getDepart_id() != 0) {
			sBuilder.append(" and u.depart_id =" + user.getDepart_id() + " ");
		}

		sBuilder.append(" order by u.user_id asc) t");

		if (user.getStart() != -1) {
			sBuilder.append(" limit " + user.getStart() + "," + user.getLimit());
		}

		List<Object> list = BaseDao.executeQuery(User.class.getName(),
				sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			users = new ArrayList<User>();
			for (Object object : list) {
				users.add((User) object);
			}
		}
		return users;
	}

	public int listUsersCount(User user, Connection conn) {
		int sum = 0;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT count(*) from user u ");
		sBuilder.append("  left join depart d on d.depart_id=u.depart_id WHERE 1=1");

		if (user.getUser_id() != 0) {
			sBuilder.append(" and u.user_id = " + user.getUser_id() + " ");
		}
		if (!StringUtil.isEmptyString(user.getUser_name())) {
			sBuilder.append(" and u.user_name like '%" + user.getUser_name()
					+ "%' ");
		}
		if (!StringUtil.isEmptyString(user.getReal_name())) {
			sBuilder.append(" and u.real_name like '%" + user.getReal_name()
					+ "%' ");
		}
		if (user.getUser_type() != 0) {
			sBuilder.append(" and u.user_type =" + user.getUser_type() + " ");
		}
		if (user.getDepart_id() != 0) {
			sBuilder.append(" and u.depart_id =" + user.getDepart_id() + " ");
		}

		long count = (Long) BaseDao.executeQueryObject(sBuilder.toString(),
				null, conn);
		sum = (int) count;
		return sum;
	}

}
