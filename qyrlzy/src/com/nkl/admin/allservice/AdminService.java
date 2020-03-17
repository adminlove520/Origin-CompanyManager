package com.nkl.admin.allservice;

import java.io.InputStream;
import java.sql.Connection;
import java.util.Arrays;
import java.util.List;

import com.nkl.admin.bean.Award;
import com.nkl.admin.bean.Depart;
import com.nkl.admin.bean.Direct;
import com.nkl.admin.bean.Manager;
import com.nkl.admin.bean.Salary;
import com.nkl.admin.bean.Toach;
import com.nkl.admin.bean.User;
import com.nkl.admin.dao.AwardDao;
import com.nkl.admin.dao.DepartDao;
import com.nkl.admin.dao.DirectDao;
import com.nkl.admin.dao.ExcelDao;
import com.nkl.admin.dao.ManagerDao;
import com.nkl.admin.dao.SalaryDao;
import com.nkl.admin.dao.ToachDao;
import com.nkl.admin.dao.UserDao;
import com.nkl.common.dao.BaseDao;
import com.nkl.common.util.Md5;
import com.nkl.common.util.StringUtil;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class AdminService {
	// 整合在一起
	ManagerDao managerDao = new ManagerDao();
	DepartDao departDao = new DepartDao();
	UserDao userDao = new UserDao();
	SalaryDao salaryDao = new SalaryDao();
	AwardDao awardDao = new AwardDao();
	DirectDao directDao = new DirectDao();
	ToachDao toachDao = new ToachDao();
	ExcelDao excelDao = new ExcelDao();

	/**
	 * @Title: queryManager
	 * @Description: 管理员查询
	 * @param manager
	 * @return Manager
	 */
	public Manager queryManager(Manager manager) {
		//System.out.println("已执行");
		Connection conn = BaseDao.getConnection();
		Manager _manager = managerDao.getManager(manager, conn);
		BaseDao.closeDB(null, null, conn);
		return _manager;
	}

	
	
	/**
	 * @Title: listManagers
	 * @Description: 查询管理员信息
	 * @param manager
	 * @return List<Manger>
	 */
	public List<Manager> listManagers(Manager manager){
		Connection conn=BaseDao.getConnection();
		List<Manager> managers=managerDao.listManagers(manager, conn);
		BaseDao.closeDB(null, null, conn);
		return managers;
		
	}
	/**
	 * @Title: addManager
	 * @Description: 添加管理员信息
	 * @param manager
	 * @return void
	 */
	public void addManager(Manager manager) {
		Connection conn = BaseDao.getConnection();
		if (!StringUtil.isEmptyString(manager.getManager_pass())) {
			manager.setManager_pass(Md5.makeMd5(manager.getManager_pass()));
		}
		managerDao.addManager(manager, conn);
		BaseDao.closeDB(null, null, conn);
	}
	
	/**
	 * @Title: queryManager
	 * @Description: 管理员修改
	 * @param manager
	 * @return void
	 */
	public void updateManager(Manager manager) {
		Connection conn = BaseDao.getConnection();
		if (!StringUtil.isEmptyString(manager.getManager_pass())) {
			manager.setManager_pass(Md5.makeMd5(manager.getManager_pass()));
		}
		int an=managerDao.updateManager(manager, conn);
		BaseDao.closeDB(null, null, conn);
	}

	/**
	 * @Title: delManagers
	 * @Description: 管理员删除
	 * @param manager
	 * @return void
	 */
	public void delManagers(Manager manager) {
		Connection conn = BaseDao.getConnection();
		managerDao.delManagers(manager.getIds().split(","), conn);
		BaseDao.closeDB(null, null, conn);
	}
	
	/**
	 * @Title: listUsers
	 * @Description: 员工查询
	 * @param user
	 * @return List<User>
	 */
	public List<User> listUsers(User user, int[] sum) {
		Connection conn = BaseDao.getConnection();
		if (sum != null) {
			sum[0] = userDao.listUsersCount(user, conn);
		}
		List<User> users = userDao.listUsers(user, conn);

		BaseDao.closeDB(null, null, conn);
		return users;
	}

	/**
	 * @Title: queryUser
	 * @Description: 员工查询
	 * @param user
	 * @return User
	 */
	public User queryUser(User user) {
		Connection conn = BaseDao.getConnection();
		User _user = userDao.getUser(user, conn);
		BaseDao.closeDB(null, null, conn);
		return _user;
	}

	/**
	 * @Title: addUser
	 * @Description: 添加员工
	 * @param user
	 * @return void
	 */
	public void addUser(User user) {
		Connection conn = BaseDao.getConnection();
		if (!StringUtil.isEmptyString(user.getUser_pass())) {
			user.setUser_pass(Md5.makeMd5(user.getUser_pass()));
		}
		userDao.addUser(user, conn);
		BaseDao.closeDB(null, null, conn);
	}

	/**
	 * @Title: updateUser
	 * @Description: 更新员工信息
	 * @param user
	 * @return void
	 */
	public void updateUser(User user) {
		Connection conn = BaseDao.getConnection();
		if (!StringUtil.isEmptyString(user.getUser_pass())) {
			user.setUser_pass(Md5.makeMd5(user.getUser_pass()));
		}
		userDao.updateUser(user, conn);
		BaseDao.closeDB(null, null, conn);
	}
	
	public void updateStatue(User user) {
		Connection conn = BaseDao.getConnection();
		userDao.updateStatue(user, conn);
		BaseDao.closeDB(null, null, conn);
	}

	/**
	 * @Title: delUsers
	 * @Description: 删除员工信息
	 * @param user
	 * @return void
	 */
	public void delUsers(User user) {
		Connection conn = BaseDao.getConnection();
		userDao.delUsers(user.getIds().split(","), conn);
		BaseDao.closeDB(null, null, conn);
	}

	/**
	 * @Title: listDeparts
	 * @Description: 部门查询
	 * @param depart
	 * @return List<Depart>
	 */
	public List<Depart> listDeparts(Depart depart, int[] sum) {
		Connection conn = BaseDao.getConnection();
		if (sum != null) {
			sum[0] = departDao.listDepartsCount(depart, conn);
		}
		List<Depart> departs = departDao.listDeparts(depart, conn);

		BaseDao.closeDB(null, null, conn);
		return departs;
	}

	/**
	 * @Title: queryDepart
	 * @Description: 部门查询
	 * @param depart
	 * @return Depart
	 */
	public Depart queryDepart(Depart depart) {
		Connection conn = BaseDao.getConnection();
		Depart _depart = departDao.getDepart(depart, conn);
		BaseDao.closeDB(null, null, conn);
		return _depart;
	}

	/**
	 * @Title: addDepart
	 * @Description: 添加部门
	 * @param depart
	 * @return void
	 */
	public void addDepart(Depart depart) {
		Connection conn = BaseDao.getConnection();
		departDao.addDepart(depart, conn);
		BaseDao.closeDB(null, null, conn);
	}

	/**
	 * @Title: updateDepart
	 * @Description: 更新部门信息
	 * @param depart
	 * @return void
	 */
	public void updateDepart(Depart depart) {
		Connection conn = BaseDao.getConnection();
		departDao.updateDepart(depart, conn);
		BaseDao.closeDB(null, null, conn);
	}

	/**
	 * @Title: delDepart
	 * @Description: 删除部门信息
	 * @param depart
	 * @return void
	 */
	public void delDeparts(Depart depart) {
		Connection conn = BaseDao.getConnection();
		departDao.delDeparts(depart.getIds().split(","), conn);
		BaseDao.closeDB(null, null, conn);
	}

	/**
	 * @Title: listSalarys
	 * @Description: 工资查询
	 * @param salary
	 * @return List<Salary>
	 */
	public List<Salary> listSalarys(Salary salary, int[] sum) {
		Connection conn = BaseDao.getConnection();
		if (sum != null) {
			sum[0] = salaryDao.listSalarysCount(salary, conn);
		}
		List<Salary> salarys = salaryDao.listSalarys(salary, conn);

		BaseDao.closeDB(null, null, conn);
		return salarys;
	}

	/**
	 * @Title: listSalarysDesc
	 * @Description: 按绩效降序工资查询
	 * @param salary
	 * @return List<Salary>
	 */
	public List<Salary> listSalarysDesc(Salary salary, int[] sum) {
		Connection conn = BaseDao.getConnection();
		if (sum != null) {
			sum[0] = salaryDao.listSalarysCount(salary, conn);
		}
		List<Salary> salarys = salaryDao.listSalarysDesc(salary, conn);

		BaseDao.closeDB(null, null, conn);
		return salarys;
	}

	/**
	 * @Title: listSalarysAsc
	 * @Description: 按绩效升序工资查询
	 * @param salary
	 * @return List<Salary>
	 */
	public List<Salary> listSalarysAsc(Salary salary, int[] sum) {
		Connection conn = BaseDao.getConnection();
		if (sum != null) {
			sum[0] = salaryDao.listSalarysCount(salary, conn);
		}
		List<Salary> salarys = salaryDao.listSalarysAsc(salary, conn);

		BaseDao.closeDB(null, null, conn);
		return salarys;
	}

	/**
	 * @Title: querySalary
	 * @Description: 工资查询
	 * @param salary
	 * @return Salary
	 */
	public Salary querySalary(Salary salary) {
		Connection conn = BaseDao.getConnection();
		Salary _salary = salaryDao.getSalary(salary, conn);
		BaseDao.closeDB(null, null, conn);
		return _salary;
	}

	/**
	 * @Title: addSalary
	 * @Description: 添加工资
	 * @param salary
	 * @return void
	 */
	public void addSalary(Salary salary) {
		Connection conn = BaseDao.getConnection();
		double salary_money = salary.getSalary_basic()
				+ salary.getSalary_award() + salary.getSalary_subsidy()
				+ salary.getSalary_baoxian() + salary.getSalary_yanglao()
				+ salary.getSalary_zhufang() - salary.getSalary_punish();
		if (salary.getSalary_attend() == 2) {
			salary_money += 200;// 全勤加200，黑心老板
		}
		salary.setSalary_money(salary_money);
		salaryDao.addSalary(salary, conn);
		BaseDao.closeDB(null, null, conn);
	}

	/**
	 * @Title: updateSalary
	 * @Description: 批量添加工资信息
	 * @param stream
	 * @return void
	 */
	public void addinfoBatch(InputStream stream) {
		Connection conn = BaseDao.getConnection();
		try {
			excelDao.importSalarys(stream, conn);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			BaseDao.closeDB(null, null, conn);
		}

	}

	/**
	 * @Title: updateSalary
	 * @Description: 更新工资信息
	 * @param salary
	 * @return void
	 */
	public void updateSalary(Salary salary) {
		Connection conn = BaseDao.getConnection();
		double salary_money = salary.getSalary_basic()
				+ salary.getSalary_award() + salary.getSalary_subsidy()
				+ salary.getSalary_baoxian() + salary.getSalary_yanglao()
				+ salary.getSalary_zhufang() - salary.getSalary_punish();
		if (salary.getSalary_attend() == 2) {
			salary_money += 200;
		}
		salary.setSalary_money(salary_money);
		salaryDao.updateSalary(salary, conn);
		BaseDao.closeDB(null, null, conn);
	}

	/**
	 * @Title: delSalary
	 * @Description: 删除工资信息
	 * @param salary
	 * @return void
	 */
	public void delSalarys(Salary salary) {
		Connection conn = BaseDao.getConnection();
		salaryDao.delSalarys(salary.getIds().split(","), conn);
		BaseDao.closeDB(null, null, conn);
	}

	/**
	 * @Title: listToachs
	 * @Description: 培训查询
	 * @param toach
	 * @return List<Toach>
	 */
	public List<Toach> listToachs(Toach toach, int[] sum) {
		Connection conn = BaseDao.getConnection();
		if (sum != null) {
			sum[0] = toachDao.listToachsCount(toach, conn);
		}
		List<Toach> toachs = toachDao.listToachs(toach, conn);

		BaseDao.closeDB(null, null, conn);
		return toachs;
	}

	/**
	 * @Title: queryToach
	 * @Description: 培训查询
	 * @param toach
	 * @return Toach
	 */
	public Toach queryToach(Toach toach) {
		Connection conn = BaseDao.getConnection();
		Toach _toach = toachDao.getToach(toach, conn);
		BaseDao.closeDB(null, null, conn);
		return _toach;
	}

	/**
	 * @Title: addToach
	 * @Description: 添加培训
	 * @param toach
	 * @return void
	 */
	public void addToach(Toach toach) {
		Connection conn = BaseDao.getConnection();
		toachDao.addToach(toach, conn);
		BaseDao.closeDB(null, null, conn);
	}

	/**
	 * @Title: updateToach
	 * @Description: 更新培训信息
	 * @param toach
	 * @return void
	 */
	public void updateToach(Toach toach) {
		Connection conn = BaseDao.getConnection();
		toachDao.updateToach(toach, conn);
		BaseDao.closeDB(null, null, conn);
	}

	/**
	 * @Title: delToach
	 * @Description: 删除培训信息
	 * @param toach
	 * @return void
	 */
	public void delToachs(Toach toach) {
		Connection conn = BaseDao.getConnection();
		toachDao.delToachs(toach.getIds().split(","), conn);
		BaseDao.closeDB(null, null, conn);
	}

	/**
	 * @Title: listAwards
	 * @Description: 奖惩查询
	 * @param award
	 * @return List<Award>
	 */
	public List<Award> listAwards(Award award, int[] sum) {
		Connection conn = BaseDao.getConnection();
		if (sum != null) {
			sum[0] = awardDao.listAwardsCount(award, conn);
		}
		List<Award> awards = awardDao.listAwards(award, conn);

		BaseDao.closeDB(null, null, conn);
		return awards;
	}

	/**
	 * @Title: queryAward
	 * @Description: 奖惩查询
	 * @param award
	 * @return Award
	 */
	public Award queryAward(Award award) {
		Connection conn = BaseDao.getConnection();
		Award _award = awardDao.getAward(award, conn);
		BaseDao.closeDB(null, null, conn);
		return _award;
	}

	/**
	 * @Title: addAward
	 * @Description: 添加奖惩
	 * @param award
	 * @return void
	 */
	public void addAward(Award award) {
		Connection conn = BaseDao.getConnection();
		awardDao.addAward(award, conn);
		BaseDao.closeDB(null, null, conn);
	}

	/**
	 * @Title: updateAward
	 * @Description: 更新奖惩信息
	 * @param award
	 * @return void
	 */
	public void updateAward(Award award) {
		Connection conn = BaseDao.getConnection();
		awardDao.updateAward(award, conn);
		BaseDao.closeDB(null, null, conn);
	}

	/**
	 * @Title: delAward
	 * @Description: 删除奖惩信息
	 * @param award
	 * @return void
	 */
	public void delAwards(Award award) {
		Connection conn = BaseDao.getConnection();
		awardDao.delAwards(award.getIds().split(","), conn);
		BaseDao.closeDB(null, null, conn);
	}

	/**
	 * @Title: listDirects
	 * @Description: 通讯录查询
	 * @param direct
	 * @return List<Direct>
	 */
	public List<Direct> listDirects(Direct direct, int[] sum) {
		Connection conn = BaseDao.getConnection();
		if (sum != null) {
			sum[0] = directDao.listDirectsCount(direct, conn);
		}
		List<Direct> directs = directDao.listDirects(direct, conn);

		BaseDao.closeDB(null, null, conn);
		return directs;
	}

	/**
	 * @Title: queryDirect
	 * @Description: 通讯录查询
	 * @param direct
	 * @return Direct
	 */
	public Direct queryDirect(Direct direct) {
		Connection conn = BaseDao.getConnection();
		Direct _direct = directDao.getDirect(direct, conn);
		BaseDao.closeDB(null, null, conn);
		return _direct;
	}

	/**
	 * @Title: addDirect
	 * @Description: 添加通讯录
	 * @param direct
	 * @return void
	 */
	public void addDirect(Direct direct) {
		Connection conn = BaseDao.getConnection();
		directDao.addDirect(direct, conn);
		BaseDao.closeDB(null, null, conn);
	}

	/**
	 * @Title: updateDirect
	 * @Description: 更新通讯录信息
	 * @param direct
	 * @return void
	 */
	public void updateDirect(Direct direct) {
		Connection conn = BaseDao.getConnection();
		directDao.updateDirect(direct, conn);
		BaseDao.closeDB(null, null, conn);
	}

	/**
	 * @Title: delDirect
	 * @Description: 删除通讯录信息
	 * @param direct
	 * @return void
	 */
	public void delDirects(Direct direct) {
		Connection conn = BaseDao.getConnection();
		directDao.delDirects(direct.getIds().split(","), conn);
		BaseDao.closeDB(null, null, conn);
	}
	/**
	 * @Title: convert
	 * @Description: 将数组转换成字符串
	 * @param manager_power
	 * @return String
	 */
	public String convert(String[] manager_power) {
		//String[] array = {"123","abc","xyz","666"};  
//        String s = Arrays.toString(manager_power);  
//        System.out.println("将数组直接转化为字符串的格式：");  
//        System.out.println(s);  
        StringBuilder build = new StringBuilder();  
        for (int i = 0; i < manager_power.length; i++) {  
            build.append(manager_power[i]);  
        }  	
        String powerString=build.toString().toLowerCase();
		return powerString;
	}
}
