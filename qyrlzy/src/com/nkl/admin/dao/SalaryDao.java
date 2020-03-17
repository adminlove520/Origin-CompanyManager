package com.nkl.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import com.nkl.admin.bean.Salary;
import com.nkl.common.dao.BaseDao;
import com.nkl.common.util.StringUtil;

public class SalaryDao {
	// 添加工资信息
	public int addSalary(Salary salary, Connection conn) {
		String sql = "INSERT INTO salary(salary_id,user_id,salary_month,salary_basic,salary_award,salary_subsidy,salary_baoxian,salary_yanglao,salary_zhufang,salary_attend,salary_punish,salary_money,salary_note) values(null,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = new Object[] { salary.getUser_id(),
				salary.getSalary_month(), salary.getSalary_basic(),
				salary.getSalary_subsidy(), salary.getSalary_baoxian(),
				salary.getSalary_yanglao(), salary.getSalary_zhufang(),
				salary.getSalary_attend(), salary.getSalary_award(),
				salary.getSalary_punish(), salary.getSalary_money(),
				salary.getSalary_note() };
		return BaseDao.executeUpdate(sql, params, conn);
	}

	// 批量录入学生基本信息（导入文件调用）
	public void addinfoBatch(List<Salary> Salarys, Connection conn)
			throws Exception {
		conn.setAutoCommit(false);
		PreparedStatement pstmt = null;
		try {
			Iterator<Salary> it = Salarys.iterator();// 获取迭代器 游标
			String sql = "INSERT INTO salary(salary_id,user_id,salary_month,salary_basic,salary_award,salary_subsidy,salary_baoxian,salary_yanglao,salary_zhufang,salary_attend,salary_punish,salary_money,salary_note) values(null,?,?,?,?,?,?,?,?,?,?,?,?)";
			while (it.hasNext()) {// 下一条还有数据的话
				Salary temp = it.next();
				pstmt.setString(1, temp.getUser_name());
				pstmt.setString(2, temp.getSalary_month());
				pstmt.setDouble(3, temp.getSalary_basic());
				pstmt.setDouble(4, temp.getSalary_award());
				pstmt.setDouble(5, temp.getSalary_subsidy());
				pstmt.setDouble(6, temp.getSalary_baoxian());
				pstmt.setDouble(7, temp.getSalary_yanglao());
				pstmt.setDouble(8, temp.getSalary_zhufang());
				pstmt.setDouble(9, temp.getSalary_attend());
				pstmt.setDouble(10, temp.getSalary_punish());
				pstmt.setDouble(11, temp.getSalary_money());
				pstmt.setString(12, temp.getSalary_note());
				pstmt.addBatch();// 再添加一次预定义参数 为了批量执行
			}
			pstmt.executeBatch();// 循环完 批量执行 爽歪歪！
			conn.commit();
		} catch (Exception e) {
			conn.rollback();
			throw e;
		} finally {
			conn.setAutoCommit(true);
			BaseDao.closeDB(null, pstmt, conn);
		}
	}

	// 删除工资
	public int delSalary(String salary_id, Connection conn) {
		String sql = "DELETE FROM salary WHERE salary_id=?";

		Object[] params = new Object[] { new Integer(salary_id) };
		return BaseDao.executeUpdate(sql, params, conn);
	}

	// 批量删除工资
	public int delSalarys(String[] salary_ids, Connection conn) {
		StringBuilder sBuilder = new StringBuilder();
		for (int i = 0; i < salary_ids.length; i++) {
			sBuilder.append("?");
			if (i != salary_ids.length - 1) {
				sBuilder.append(",");
			}
		}
		// 批量删除
		String sql = "DELETE FROM salary WHERE salary_id IN("
				+ sBuilder.toString() + ")";

		Object[] params = salary_ids;

		return BaseDao.executeUpdate(sql, params, conn);
	}

	// 更新工资
	public int updateSalary(Salary salary, Connection conn) {
		StringBuilder sBuilder = new StringBuilder();
		// 拼接sql语句
		sBuilder.append("UPDATE salary SET salary_id = "
				+ salary.getSalary_id() + " ");

		if (!StringUtil.isEmptyString(salary.getSalary_month())) {
			sBuilder.append(" ,salary_month ='" + salary.getSalary_month()
					+ "' ");
		}
		if (salary.getSalary_basic() != -1) {
			sBuilder.append(" ,salary_basic =" + salary.getSalary_basic() + " ");
		}
		if (salary.getSalary_award() != -1) {
			sBuilder.append(" ,salary_award =" + salary.getSalary_award() + " ");
		}
		if (salary.getSalary_subsidy() != -1) {
			sBuilder.append(" ,salary_subsidy =" + salary.getSalary_subsidy()
					+ " ");
		}
		if (salary.getSalary_baoxian() != -1) {
			sBuilder.append(" ,salary_baoxian =" + salary.getSalary_baoxian()
					+ " ");
		}
		if (salary.getSalary_yanglao() != -1) {
			sBuilder.append(" ,salary_yanglao =" + salary.getSalary_yanglao()
					+ " ");
		}
		if (salary.getSalary_zhufang() != -1) {
			sBuilder.append(" ,salary_zhufang =" + salary.getSalary_zhufang()
					+ " ");
		}
		if (salary.getSalary_punish() != -1) {
			sBuilder.append(" ,salary_punish =" + salary.getSalary_punish()
					+ " ");
		}
		if (salary.getSalary_money() != -1) {
			sBuilder.append(" ,salary_money =" + salary.getSalary_money() + " ");
		}
		if (salary.getSalary_attend() != 0) {
			sBuilder.append(" ,salary_attend =" + salary.getSalary_attend()
					+ " ");
		}
		if (!StringUtil.isEmptyString(salary.getSalary_note())) {// 判断字符串是否为空，空的话就不添加更新
			sBuilder.append(" ,salary_note ='" + salary.getSalary_note() + "' ");
		}

		sBuilder.append("where salary_id = " + salary.getSalary_id() + " ");

		Object[] params = null;// 参数全，不需要
		return BaseDao.executeUpdate(sBuilder.toString(), params, conn);
	}

	// 根据条件查询工资
	public Salary getSalary(Salary salary, Connection conn) {
		Salary _salary = null;
		StringBuilder sBuilder = new StringBuilder();// 可变字符串
		sBuilder.append("SELECT s.*,u.real_name,u.user_name from salary s ");
		sBuilder.append("  join user u on u.user_id=s.user_id WHERE 1=1");
		if (salary.getSalary_id() != 0) {
			sBuilder.append(" and salary_id = " + salary.getSalary_id() + " ");
		}
		if (salary.getUser_id() != 0) {
			sBuilder.append(" and s.user_id = " + salary.getUser_id() + " ");
		}
		if (!StringUtil.isEmptyString(salary.getSalary_month())) {
			sBuilder.append(" and salary_month ='" + salary.getSalary_month()
					+ "' ");
		}

		List<Object> list = BaseDao.executeQuery(Salary.class.getName(),
				sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			_salary = (Salary) list.get(0);
		}
		return _salary;
	}

	// 查询全部工资信息
	public List<Salary> listSalarys(Salary salary, Connection conn) {
		List<Salary> salarys = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT * FROM (");
		sBuilder.append("SELECT s.*,u.real_name,u.user_name from salary s ");// ==as
																				// s
																				// 别名
		sBuilder.append("  join user u on u.user_id=s.user_id WHERE 1=1");// join如果表中有至少一个匹配，则返回行
																			// 1=1防止下列条件不符合报错

		if (salary.getSalary_id() != 0) {
			sBuilder.append(" and s.salary_id = " + salary.getSalary_id() + " ");
		}
		if (salary.getUser_id() != 0) {
			sBuilder.append(" and s.user_id = " + salary.getUser_id() + " ");
		}
		if (!StringUtil.isEmptyString(salary.getUser_name())) {
			sBuilder.append(" and u.user_name like '%" + salary.getUser_name()
					+ "%' ");
		}
		if (!StringUtil.isEmptyString(salary.getReal_name())) {
			sBuilder.append(" and u.real_name like '%" + salary.getReal_name()
					+ "%' ");
		}
		if (!StringUtil.isEmptyString(salary.getSalary_month())) {
			sBuilder.append(" and salary_month = '" + salary.getSalary_month()
					+ "' ");
		}
		if (salary.getSalary_attend() != 0) {
			sBuilder.append(" and salary_attend =" + salary.getSalary_attend()
					+ " ");
		}

		sBuilder.append(" order by salary_month desc,s.salary_id asc) t");

		if (salary.getStart() != -1) {
			sBuilder.append(" limit " + salary.getStart() + ","
					+ salary.getLimit());
		}
		// 这里可以按照需求进行排序
		List<Object> list = BaseDao.executeQuery(Salary.class.getName(),
				sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			salarys = new ArrayList<Salary>();
			for (Object object : list) {
				salarys.add((Salary) object);
			}
		}
		return salarys;
	}

	// 按照工资奖金绩效的降序排序
	public List<Salary> listSalarysDesc(Salary salary, Connection conn) {
		List<Salary> salarys = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT * FROM (");
		sBuilder.append("SELECT s.*,u.real_name,u.user_name from salary s ");
		sBuilder.append("  join user u on u.user_id=s.user_id WHERE 1=1");

		if (salary.getSalary_id() != 0) {
			sBuilder.append(" and s.salary_id = " + salary.getSalary_id() + " ");
		}
		if (salary.getUser_id() != 0) {
			sBuilder.append(" and s.user_id = " + salary.getUser_id() + " ");
		}
		if (!StringUtil.isEmptyString(salary.getUser_name())) {
			sBuilder.append(" and u.user_name like '%" + salary.getUser_name()
					+ "%' ");
		}
		if (!StringUtil.isEmptyString(salary.getReal_name())) {
			sBuilder.append(" and u.real_name like '%" + salary.getReal_name()
					+ "%' ");
		}
		if (!StringUtil.isEmptyString(salary.getSalary_month())) {
			sBuilder.append(" and salary_month = '" + salary.getSalary_month()
					+ "' ");
		}
		if (salary.getSalary_attend() != 0) {
			sBuilder.append(" and salary_attend =" + salary.getSalary_attend()
					+ " ");
		}

		sBuilder.append(" order by salary_award desc,s.salary_id asc) t");

		if (salary.getStart() != -1) {
			sBuilder.append(" limit " + salary.getStart() + ","
					+ salary.getLimit());
		}

		List<Object> list = BaseDao.executeQuery(Salary.class.getName(),
				sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			salarys = new ArrayList<Salary>();
			for (Object object : list) {
				salarys.add((Salary) object);
			}
		}
		return salarys;
	}

	// 按照员工绩效的升序排序 从小到大
	public List<Salary> listSalarysAsc(Salary salary, Connection conn) {
		List<Salary> salarys = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT * FROM (");
		sBuilder.append("SELECT s.*,u.real_name,u.user_name from salary s ");
		sBuilder.append("  join user u on u.user_id=s.user_id WHERE 1=1");

		if (salary.getSalary_id() != 0) {
			sBuilder.append(" and s.salary_id = " + salary.getSalary_id() + " ");
		}
		if (salary.getUser_id() != 0) {
			sBuilder.append(" and s.user_id = " + salary.getUser_id() + " ");
		}
		if (!StringUtil.isEmptyString(salary.getUser_name())) {
			sBuilder.append(" and u.user_name like '%" + salary.getUser_name()
					+ "%' ");
		}
		if (!StringUtil.isEmptyString(salary.getReal_name())) {
			sBuilder.append(" and u.real_name like '%" + salary.getReal_name()
					+ "%' ");
		}
		if (!StringUtil.isEmptyString(salary.getSalary_month())) {
			sBuilder.append(" and salary_month = '" + salary.getSalary_month()
					+ "' ");
		}
		if (salary.getSalary_attend() != 0) {
			sBuilder.append(" and salary_attend =" + salary.getSalary_attend()
					+ " ");
		}

		sBuilder.append(" order by salary_award asc,s.salary_id asc) t");

		if (salary.getStart() != -1) {
			sBuilder.append(" limit " + salary.getStart() + ","
					+ salary.getLimit());
		}

		List<Object> list = BaseDao.executeQuery(Salary.class.getName(),
				sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			salarys = new ArrayList<Salary>();
			for (Object object : list) {
				salarys.add((Salary) object);
			}
		}
		return salarys;
	}

	// 工资条数，分页
	public int listSalarysCount(Salary salary, Connection conn) {
		int sum = 0;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT count(*) from salary s ");
		sBuilder.append("  join user u on u.user_id=s.user_id WHERE 1=1");

		if (salary.getSalary_id() != 0) {
			sBuilder.append(" and u.salary_id = " + salary.getSalary_id() + " ");
		}
		if (salary.getUser_id() != 0) {
			sBuilder.append(" and s.user_id = " + salary.getUser_id() + " ");
		}
		if (!StringUtil.isEmptyString(salary.getReal_name())) {
			sBuilder.append(" and u.real_name like '%" + salary.getReal_name()
					+ "%' ");
		}
		if (!StringUtil.isEmptyString(salary.getSalary_month())) {
			sBuilder.append(" and salary_month = '" + salary.getSalary_month()
					+ "' ");
		}
		if (salary.getSalary_attend() != 0) {
			sBuilder.append(" and salary_attend =" + salary.getSalary_attend()
					+ " ");
		}

		long count = (Long) BaseDao.executeQueryObject(sBuilder.toString(),
				null, conn);
		sum = (int) count;
		return sum;
	}

}
