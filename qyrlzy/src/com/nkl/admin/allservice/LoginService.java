package com.nkl.admin.allservice;

import java.sql.Connection;
import java.util.List;

import com.nkl.admin.bean.Manager;
import com.nkl.admin.bean.User;
import com.nkl.admin.dao.ManagerDao;
import com.nkl.admin.dao.UserDao;
import com.nkl.common.dao.BaseDao;
import com.nkl.common.util.Md5;
import com.nkl.common.util.StringUtil;

public class LoginService {

	ManagerDao managerDao = new ManagerDao();
	UserDao userDao = new UserDao();

	/**
	 * @Title: listManagers
	 * @Description: 查询管理员集合
	 * @param manager
	 * @return List<Picnews>
	 */
	public List<Manager> listManagers(Manager manager) {
		Connection conn = BaseDao.getConnection();

		List<Manager> managers = managerDao.listManagers(manager, conn);

		BaseDao.closeDB(null, null, conn);
		return managers;
	}

	/**
	 * @Title: getManager
	 * @Description: 查询管理员
	 * @param manager
	 * @return Manager
	 */
	public Manager getManager(Manager manager) {
		Connection conn = BaseDao.getConnection();
		if (!StringUtil.isEmptyString(manager.getManager_pass())) {
			manager.setManager_pass(Md5.makeMd5(manager.getManager_pass()));
		}
		Manager _manager = managerDao.getManager(manager, conn);

		BaseDao.closeDB(null, null, conn);
		return _manager;
	}

	/**
	 * @Title: addManager
	 * @Description: 管理员注册
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
	 * @Title: getUser
	 * @Description: 查询用户
	 * @param user
	 * @return User
	 */
	public User getUser(User user) {
		Connection conn = BaseDao.getConnection();
		// 如果不为空
		if (!StringUtil.isEmptyString(user.getUser_pass())) {// 判断字符串是否为空，为空返回true
			user.setUser_pass(Md5.makeMd5(user.getUser_pass()));// Md5加密后赋值
		}
		User _user = userDao.getUser(user, conn);

		BaseDao.closeDB(null, null, conn);
		return _user;
	}

	/**
	 * @Title: analyze
	 * @Description: 解析字符串（直接在loginAction写即可）测试
	 * @param str
	 * @return string[]
	 */
	public String[] analyze(String str) {
		    String[] array = str.split("");  
	        System.out.println("字符串转化为数组：");  
	        for (int i = 0; i < array.length; i++) {  
	            System.out.print(array[i]+"  ");  
	        }  
	        System.out.println("\n获取字符串索引为0的字符：");  
	        System.out.println(str.charAt(1));  
		
		return array;
	}

	/**
	 * @Title: contains
	 * @Description: 字符串匹配 看是否匹配到相应的权限字符 思想比较烂。。。
	 * @param str
	 * @return boolean
	 */
	public boolean contains1(String str1) {
		boolean status1 = str1.contains("1");
		return status1;
	}
	public boolean contains2(String str2) {
		boolean status1 = str2.contains("2");
		return status1;
	}
	public boolean contains3(String str3) {
		boolean status1 = str3.contains("3");
		return status1;
	}
	public boolean contains4(String str4) {
		boolean status1 = str4.contains("4");
		return status1;
	}
	public boolean contains5(String str5) {
		boolean status1 = str5.contains("5");
		return status1;
	}
	public boolean contains6(String str6) {
		boolean status1 = str6.contains("6");
		return status1;
	}
	public boolean contains7(String str7) {
		boolean status1 = str7.contains("7");
		return status1;
	}
	public boolean contains8(String str8) {
		boolean status1 = str8.contains("8");
		return status1;
	}
}
