package com.nkl.admin.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.nkl.admin.bean.Manager;
import com.nkl.common.dao.BaseDao;
import com.nkl.common.util.StringUtil;

public class ManagerDao {

	public int addManager(Manager manager, Connection conn) {
		String sql = "INSERT INTO manager(manager_id,manager_name,manager_pass,real_name,manager_sex,manager_power) values(null,?,?,?,?,?)";
		Object[] params = new Object[] { manager.getManager_name(),
				manager.getManager_pass(), manager.getReal_name(),
				manager.getManager_sex(),manager.getManager_power()

		};
		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int delManager(String manager_id, Connection conn) {
		String sql = "DELETE FROM manager WHERE manager_id=?";

		Object[] params = new Object[] { new Integer(manager_id) };
		return BaseDao.executeUpdate(sql, params, conn);
	}
   //批量删除
	public int delManagers(String[] manager_ids, Connection conn) {
		StringBuilder sBuilder = new StringBuilder();
		for (int i = 0; i < manager_ids.length; i++) {
			sBuilder.append("?");
			if (i != manager_ids.length - 1) {
				sBuilder.append(",");
			}
		}
		String sql = "DELETE FROM manager WHERE manager_id IN("
				+ sBuilder.toString() + ")";

		Object[] params = manager_ids;

		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int updateManager(Manager manager, Connection conn) {
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("UPDATE manager SET manager_id = "
				+ manager.getManager_id() + " ");

		if (!StringUtil.isEmptyString(manager.getManager_name())) {
			sBuilder.append(" ,manager_name ='" + manager.getManager_name() + "' ");
		}
		if (!StringUtil.isEmptyString(manager.getManager_pass())) {
			sBuilder.append(" ,manager_pass ='" + manager.getManager_pass()
					+ "' ");
		}
		if (!StringUtil.isEmptyString(manager.getReal_name())) {
			sBuilder.append(" ,real_name ='" + manager.getReal_name() + "' ");
		}
		if (manager.getManager_sex() != 0) {
			sBuilder.append(" ,manager_sex =" + manager.getManager_sex() + " ");
		}
		if (!StringUtil.isEmptyString(manager.getManager_power())) {
			sBuilder.append(" ,manager_power ='" + manager.getManager_power() + "' ");
		}
		sBuilder.append("where manager_id = " + manager.getManager_id() + " ");
		Object[] params = null;
		return BaseDao.executeUpdate(sBuilder.toString(), params, conn);
	}

	public Manager getManager(Manager manager, Connection conn) {
		Manager _manager = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT u.* from manager u WHERE 1=1");
		if (manager.getManager_id() != 0) {
			sBuilder.append(" and manager_id = " + manager.getManager_id()
					+ " ");
		}
		if (!StringUtil.isEmptyString(manager.getManager_pass())) {
			sBuilder.append(" and manager_pass ='" + manager.getManager_pass()
					+ "' ");
		}
		//只需要通过用户名对比就可以  真实名字可以重复
		if (!StringUtil.isEmptyString(manager.getManager_name())) {
			sBuilder.append(" and manager_name ='" + manager.getManager_name()
					+ "' ");
		}

		List<Object> list = BaseDao.executeQuery(Manager.class.getName(),
				sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			_manager = (Manager) list.get(0);//第一个就是
		}
		return _manager;
	}

	public List<Manager> listManagers(Manager manager, Connection conn) {
		List<Manager> managers = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT * FROM (");
		sBuilder.append("SELECT u.* from manager u  WHERE 1=1");

		if (manager.getManager_id() != 0) {
			sBuilder.append(" and u.manager_id = " + manager.getManager_id()
					+ " ");
		}
		if (!StringUtil.isEmptyString(manager.getManager_pass())) {
			sBuilder.append(" and u.manager_pass ='"
					+ manager.getManager_pass() + "' ");
		}
		if (!StringUtil.isEmptyString(manager.getManager_name())) {
			sBuilder.append(" and u.manager_name like '%"
					+ manager.getManager_name() + "%' ");
		}
		if (!StringUtil.isEmptyString(manager.getReal_name())) {
			sBuilder.append(" and u.real_name like '%" + manager.getReal_name()
					+ "%' ");
		}

		sBuilder.append(" order by u.manager_id asc) t");

		if (manager.getStart() != -1) {
			sBuilder.append(" limit " + manager.getStart() + ","
					+ manager.getLimit());
		}

		List<Object> list = BaseDao.executeQuery(Manager.class.getName(),
				sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			managers = new ArrayList<Manager>();
			for (Object object : list) {
				managers.add((Manager) object);
			}
		}
		return managers;
	}

	public int listManagersCount(Manager manager, Connection conn) {
		int sum = 0;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT count(*) FROM manager u WHERE 1=1");

		if (manager.getManager_id() != 0) {
			sBuilder.append(" and u.manager_id = " + manager.getManager_id()
					+ " ");
		}
		if (!StringUtil.isEmptyString(manager.getManager_pass())) {
			sBuilder.append(" and u.manager_pass ='"
					+ manager.getManager_pass() + "' ");
		}
		if (!StringUtil.isEmptyString(manager.getManager_name())) {
			sBuilder.append(" and u.manager_name like '%"
					+ manager.getManager_name() + "%' ");
		}
		if (!StringUtil.isEmptyString(manager.getReal_name())) {
			sBuilder.append(" and u.real_name like '%" + manager.getReal_name()
					+ "%' ");
		}

		long count = (Long) BaseDao.executeQueryObject(sBuilder.toString(),
				null, conn);
		sum = (int) count;
		return sum;
	}

}
