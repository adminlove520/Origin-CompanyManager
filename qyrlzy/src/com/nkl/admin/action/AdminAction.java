package com.nkl.admin.action;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.nkl.admin.allservice.AdminService;
import com.nkl.admin.allservice.LoginService;
import com.nkl.admin.bean.Award;
import com.nkl.admin.bean.Depart;
import com.nkl.admin.bean.Direct;
import com.nkl.admin.bean.Manager;
import com.nkl.admin.bean.Salary;
import com.nkl.admin.bean.Toach;
import com.nkl.admin.bean.User;
import com.nkl.common.action.BaseAction;
import com.nkl.common.util.Param;

//相当于servlet
public class AdminAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	AdminService adminService = new AdminService();
	LoginService loginService = new LoginService();
	// 抓取页面参数，获取表单数据
	Manager paramsManager;
	User paramsUser;
	Depart paramsDepart;
	Salary paramsSalary;
	Toach paramsToach;
	Award paramsAward;
	Direct paramsDirect;
	String tip;// 编辑完成后的提示 信息
	ByteArrayInputStream excelStream;//字节数组输入流
	HttpServletRequest request;// 批量导入的请求
	String manager_pass1;
    
	
	public String getManager_pass1() {
		return manager_pass1;
	}

	public void setManager_pass1(String manager_pass1) {
		this.manager_pass1 = manager_pass1;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public ByteArrayInputStream getExcelStream() {
		return excelStream;
	}

	public void setExcelStream(ByteArrayInputStream excelStream) {
		this.excelStream = excelStream;
	}

	public Manager getParamsManager() {
		return paramsManager;
	}

	public void setParamsManager(Manager paramsManager) {
		this.paramsManager = paramsManager;
	}

	public User getParamsUser() {
		return paramsUser;
	}

	public void setParamsUser(User paramsUser) {
		this.paramsUser = paramsUser;
	}

	public Depart getParamsDepart() {
		return paramsDepart;
	}

	public void setParamsDepart(Depart paramsDepart) {
		this.paramsDepart = paramsDepart;
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public Salary getParamsSalary() {
		return paramsSalary;
	}

	public void setParamsSalary(Salary paramsSalary) {
		this.paramsSalary = paramsSalary;
	}

	public Toach getParamsToach() {
		return paramsToach;
	}

	public Award getParamsAward() {
		return paramsAward;
	}

	public Direct getParamsDirect() {
		return paramsDirect;
	}

	public void setParamsToach(Toach paramsToach) {
		this.paramsToach = paramsToach;
	}

	public void setParamsAward(Award paramsAward) {
		this.paramsAward = paramsAward;
	}

	public void setParamsDirect(Direct paramsDirect) {
		this.paramsDirect = paramsDirect;
	}

	/**
	 * @Title: saveAdmin
	 * @Description: 保存修改个管理员人信息 修改姓名之类
	 * @return String
	 */
	public String saveAdmin() {
		try {
			// 保存修改个人信息
			adminService.updateManager(paramsManager);
			// 更新session
			Manager admin = new Manager();
			admin.setManager_id(paramsManager.getManager_id());
			admin = adminService.queryManager(admin);
			Param.setSession("admin", admin);

			setSuccessTip("编辑成功", "modifyInfo.jsp");

		} catch (Exception e) {
			setErrorTip("编辑异常", "modifyInfo.jsp");
		}

		return "infoTip";
	}

	/**
	 * @Title: saveAdminPass
	 * @Description: 保存修改用户（管理员和员工）密码
	 * @return String
	 */
	public String saveAdminPass() {
		String admin_type = (String) Param.getSession("admin_type");
		try {
			// 保存修改个人密码
			if ("1".equals(admin_type)) {// 员工
				adminService.updateUser(paramsUser);
				// 更新session
				User admin = (User) Param.getSession("admin");//获取当前用户
				if (admin != null) {
					admin.setUser_pass(paramsUser.getUser_pass());
					Param.setSession("admin", admin);
				}
			} else {
				Manager admin = (Manager) Param.getSession("admin");
				if (admin != null) {
				Manager manager=new Manager();
				manager.setManager_name(admin.getManager_name());//用户名
				manager.setManager_pass(this.manager_pass1);//密码
				Manager manager1=loginService.getManager(manager);//通过旧密码查询是否存在该用户			
				if (manager1 != null) {
					adminService.updateManager(paramsManager);
					admin.setManager_pass(paramsManager.getManager_pass());
					Param.setSession("admin", admin);// 更新session
				}
				else {
					tip = "旧密码错误";
					return "modifyPwd2";
				}
				}
			}
			setSuccessTip("修改成功", "modifyPwd" + admin_type + ".jsp");
		} catch (Exception e) {
			setErrorTip("修改异常", "modifyPwd" + admin_type + ".jsp");
		}

		return "infoTip";
	}

	/**
	 * @Title: listUsers
	 * @Description: 查询在职员工
	 * @return String
	 */
	public String listUsers() {
		try {
			if (paramsUser == null) {
				paramsUser = new User();
			}
			// 设置分页信息
			setPagination(paramsUser);
			// 总的条数
			int[] sum = { 0 };
			// 查询员工列表
			paramsUser.setUser_type(1);
			List<User> users = adminService.listUsers(paramsUser, sum);
			Param.setAttribute("users", users);
			Param.setSession("zzusers", users);//统计离职率
			setTotalCount(sum[0]);

			// 查询部门
			Depart depart = new Depart();
			depart.setStart(-1);
			List<Depart> departs = adminService.listDeparts(depart, null);
			if (departs == null) {
				departs = new ArrayList<Depart>();
			}
			Param.setAttribute("departs", departs);

		} catch (Exception e) {
			setErrorTip("查询在职员工异常", "main.jsp");
			return "infoTip";
		}

		return "userShow";
	}

	/**
	 * @Title: addUserShow
	 * @Description: 显示添加在职员工页面
	 * @return String
	 */
	public String addUserShow() {
		// 查询部门
		Depart depart = new Depart();
		depart.setStart(-1);
		List<Depart> departs = adminService.listDeparts(depart, null);
		if (departs == null) {
			departs = new ArrayList<Depart>();
		}
		Param.setAttribute("departs", departs);

		return "userEdit";
	}

	/**
	 * @Title: addUser
	 * @Description: 添加在职员工
	 * @return String
	 */
	public String addUser() {
		try {
			// 检查员工编号是否存在
			User user = new User();
			user.setUser_name(paramsUser.getUser_name());
			user = adminService.queryUser(user);
			if (user != null) {
				tip = "失败，该用户名已经存在！";
				Param.setAttribute("user", paramsUser);

				// 查询部门
				Depart depart = new Depart();
				depart.setStart(-1);
				List<Depart> departs = adminService.listDeparts(depart, null);
				Param.setAttribute("departs", departs);// 放在request中所以前台要加#去数据。因为不是根对象（action）

				return "userEdit";
			}

			// 添加员工
			paramsUser.setUser_type(1);
			adminService.addUser(paramsUser);

			setSuccessTip("添加成功", "Admin_listUsers.action");
		} catch (Exception e) {
			setErrorTip("添加在职员工异常", "Admin_listUsers.action");
		}

		return "infoTip";
	}

	/**
	 * @Title: editUser
	 * @Description: 编辑在职员工
	 * @return String
	 */
	public String editUser() {
		try {
			// 得到员工
			User user = adminService.queryUser(paramsUser);
			Param.setAttribute("user", user);

			// 查询部门
			Depart depart = new Depart();
			depart.setStart(-1);
			List<Depart> departs = adminService.listDeparts(depart, null);
			if (departs == null) {
				departs = new ArrayList<Depart>();
			}
			Param.setAttribute("departs", departs);

		} catch (Exception e) {
			setErrorTip("查询在职员工异常", "Admin_listUsers.action");
			return "infoTip";
		}

		return "userEdit";
	}

	/**
	 * @Title: saveUser
	 * @Description: 保存编辑在职员工
	 * @return String
	 */
	public String saveUser() {
		try {
			// 保存编辑在职员工
			adminService.updateUser(paramsUser);

			setSuccessTip("编辑成功", "Admin_listUsers.action");
		} catch (Exception e) {
			setErrorTip("编辑失败", "Admin_listUsers.action");
		}

		return "infoTip";
	}
	/**
	 * @Title: zhuanzUser
	 * @Description: 转正实习员工状态转化
	 * @return String
	 */
	public String zhuanzUser() {
		try {  
			Manager admin=(Manager)Param.getSession("admin");
			String admin_type=(String)Param.getSession("admin_type");
			String manger_name=admin.getManager_name();
			if ("admin1".equals(manger_name)) {
				paramsUser.setStatue(3);//3代表管理员1首先修改同意				
			}else if ("admin2".equals(manger_name)) {
				paramsUser.setStatue(4);
			}else if ("admin3".equals(manger_name)) {
				paramsUser.setStatue(2);
			}
			//修改员工状态值
			adminService.updateStatue(paramsUser);
			setSuccessTip("操作成功", "Admin_listUsers.action");
		} catch (Exception e) {
		
			setErrorTip("操作失败", "Admin_listUsers.action");
		}

		return "infoTip";
	}
	/**
	 * @Title: zhuanzUser1
	 * @Description: 转正实习员工状态转化
	 * @return String
	 */
	public String zhuanzUser1() {
		try {  
			User user=(User)Param.getSession("admin");
			user.setStatue(5);
			adminService.updateStatue(user);
			setSuccessTip("已成功发出申请", "Admin_zhuanzheng.action");
		} catch (Exception e) {
			e.printStackTrace();
			setErrorTip("操作失败", "Admin_zhuanzheng.action");
		}

		return "infoTip";
	}
	/**
	 * @Title: zhuanzheng
	 * @Description: 查询转正申请状态
	 * @return String
	 */
	public String zhuanzheng() {
		User user=(User)Param.getSession("admin");
		int statue=user.getStatue();
		if (1==statue) {//int 类型比较用==
			return "zhuanzheng1";
		}else if (2==statue) {
			return "zhuanzheng2";
		}else if (3==statue) {
			return "zhuanzheng3";
		}
		else if (4==statue) {
			return "zhuanzheng4";
		}else if (5==statue) {
			return "zhuanzheng5";
		}else {
			return "";
		}
	}
	/**
	 * @Title: delUsers
	 * @Description: 删除在职员工
	 * @return String
	 */
	public String delUsers() {
		try {
			// 删除在职员工
			adminService.delUsers(paramsUser);

			setSuccessTip("删除在职员工成功", "Admin_listUsers.action");
		} catch (Exception e) {
			setErrorTip("删除在职员工异常", "Admin_listUsers.action");
		}

		return "infoTip";
	}

	/**
	 * @Title: listUsers2
	 * @Description: 查询离职员工
	 * @return String
	 */
	public String listUsers2() {
		try {
			if (paramsUser == null) {
				paramsUser = new User();
			}
			// 设置分页信息
			setPagination(paramsUser);
			// 总的条数
			int[] sum = { 0 };
			// 查询员工列表
			paramsUser.setUser_type(2);
			List<User> users = adminService.listUsers(paramsUser, sum);
			Param.setAttribute("users", users);
			Param.setSession("lzusers", users);//统计离职率
			setTotalCount(sum[0]);

		} catch (Exception e) {
			setErrorTip("查询离职员工异常", "main.jsp");
			return "infoTip";
		}

		return "userShow2";
	}

	/**
	 * @Title: addUserShow2
	 * @Description: 显示添加离职员工页面
	 * @return String
	 */
	public String addUserShow2() {
		// 查询在职用户
		User user = new User();
		user.setStart(-1);
		user.setUser_type(1);
		List<User> users = adminService.listUsers(user, null);
		if (users == null) {
			users = new ArrayList<User>();
		}
		Param.setAttribute("users", users);
		if (paramsUser != null) {
			Param.setAttribute("user_id", paramsUser.getUser_id());
		}

		return "userEdit2";
	}

	/**
	 * @Title: addUser2
	 * @Description: 添加离职员工
	 * @return String
	 */
	public String addUser2() {
		try {
			// 添加员工
			paramsUser.setUser_type(2);
			adminService.updateUser(paramsUser);

			setSuccessTip("添加成功", "Admin_listUsers2.action");
		} catch (Exception e) {
			setErrorTip("添加离职员工异常", "Admin_listUsers2.action");
		}

		return "infoTip";
	}

	/**
	 * @Title: delUsers2
	 * @Description: 删除离职员工
	 * @return String
	 */
	public String delUsers2() {
		try {
			// 删除离职员工
			adminService.delUsers(paramsUser);

			setSuccessTip("删除离职员工成功", "Admin_listUsers2.action");
		} catch (Exception e) {
			setErrorTip("删除离职员工异常", "Admin_listUsers2.action");
		}

		return "infoTip";
	}

	/**
	 * @Title: listDeparts
	 * @Description: 查询部门
	 * @return String
	 */
	public String listDeparts() {
		try {
			if (paramsDepart == null) {
				paramsDepart = new Depart();
			}

			// 设置分页信息
			setPagination(paramsDepart);
			// 总的条数
			int[] sum = { 0 };
			// 查询部门列表
			List<Depart> departs = adminService.listDeparts(paramsDepart, sum);
			Param.setAttribute("departs", departs);
			setTotalCount(sum[0]);

		} catch (Exception e) {
			setErrorTip("查询部门异常", "main.jsp");
			return "infoTip";
		}

		return "departShow";
	}

	/**
	 * @Title: addDepartShow
	 * @Description: 显示添加部门页面
	 * @return String
	 */
	public String addDepartShow() {
		return "departEdit";
	}

	/**
	 * @Title: addDepart
	 * @Description: 添加部门
	 * @return String
	 */
	public String addDepart() {
		try {
			// 检查部门是否存在
			Depart depart = new Depart();
			depart.setDepart_name(paramsDepart.getDepart_name());
			depart = adminService.queryDepart(depart);
			if (depart != null) {
				tip = "失败，该部门已经存在！";
				Param.setAttribute("depart", paramsDepart);
				return "departEdit";
			}

			// 添加部门
			adminService.addDepart(paramsDepart);

			setSuccessTip("添加成功", "Admin_listDeparts.action");
		} catch (Exception e) {
			setErrorTip("添加部门异常", "Admin_listDeparts.action");
		}

		return "infoTip";
	}

	/**
	 * @Title: editDepart
	 * @Description: 编辑部门
	 * @return String
	 */
	public String editDepart() {
		try {
			// 得到部门
			Depart depart = adminService.queryDepart(paramsDepart);
			Param.setAttribute("depart", depart);

		} catch (Exception e) {
			setErrorTip("查询部门异常", "Admin_listDeparts.action");
			return "infoTip";
		}

		return "departEdit";
	}

	/**
	 * @Title: saveDepart
	 * @Description: 保存编辑部门
	 * @return String
	 */
	public String saveDepart() {
		try {
			// 检查部门是否存在
			Depart depart = new Depart();
			depart.setDepart_name(paramsDepart.getDepart_name());
			depart = adminService.queryDepart(depart);
			if (depart != null
					&& depart.getDepart_id() != paramsDepart.getDepart_id()) {
				tip = "失败，该部门已经存在！";
				Param.setAttribute("depart", paramsDepart);
				return "departEdit";
			}

			// 保存编辑部门
			adminService.updateDepart(paramsDepart);

			setSuccessTip("编辑成功", "Admin_listDeparts.action");
		} catch (Exception e) {
			tip = "编辑失败";
			Param.setAttribute("depart", paramsDepart);
			return "departEdit";
		}

		return "infoTip";
	}

	/**
	 * @Title: delDeparts
	 * @Description: 删除部门
	 * @return String
	 */
	public String delDeparts() {
		try {
			// 删除部门
			adminService.delDeparts(paramsDepart);

			setSuccessTip("删除部门成功", "Admin_listDeparts.action");
		} catch (Exception e) {
			setErrorTip("删除部门异常", "Admin_listDeparts.action");
		}

		return "infoTip";
	}

	/**
	 * @Title: listSalarys
	 * @Description: 查询工资
	 * @return String
	 */
	public String listSalarys() {
		try {
			if (paramsSalary == null) {
				paramsSalary = new Salary();
			}
			// 设置分页信息
			setPagination(paramsSalary);
			// 总的条数
			int[] sum = { 0 };
			// 用户身份限制
			String admin_type = (String) Param.getSession("admin_type");
			if ("1".equals(admin_type)) {
				User admin = (User) Param.getSession("admin");
				paramsSalary.setUser_id(admin.getUser_id());
			}
			// 查询工资列表
			List<Salary> salarys = adminService.listSalarys(paramsSalary, sum);
			Param.setAttribute("salarys", salarys);
			setTotalCount(sum[0]);

			// 查询部门
			Depart depart = new Depart();
			depart.setStart(-1);
			List<Depart> departs = adminService.listDeparts(depart, null);
			if (departs == null) {
				departs = new ArrayList<Depart>();
			}
			Param.setAttribute("departs", departs);

		} catch (Exception e) {
			setErrorTip("查询工资异常", "main.jsp");
			return "infoTip";
		}

		return "salaryShow";
	}

	/**
	 * @Title: listSalarysAsc
	 * @Description: 按绩效升序查询工资
	 * @return String
	 */
	public String listSalarysAsc() {
		try {
			if (paramsSalary == null) {
				paramsSalary = new Salary();
			}
			// 设置分页信息
			setPagination(paramsSalary);
			// 总的条数
			int[] sum = { 0 };
			// 用户身份限制
			String admin_type = (String) Param.getSession("admin_type");
			if ("1".equals(admin_type)) {
				User admin = (User) Param.getSession("admin");
				paramsSalary.setUser_id(admin.getUser_id());
			}
			// 查询工资列表
			List<Salary> salarys = adminService.listSalarysAsc(paramsSalary,
					sum);
			Param.setAttribute("salarys", salarys);
			setTotalCount(sum[0]);

		} catch (Exception e) {
			setErrorTip("查询工资异常", "main.jsp");
			return "infoTip";
		}

		return "salaryShow";
	}

	/**
	 * @Title: listSalarysDesc
	 * @Description: 按绩效降序查询工资
	 * @return String
	 */
	public String listSalarysDesc() {
		try {
			if (paramsSalary == null) {
				paramsSalary = new Salary();
			}
			// 设置分页信息
			setPagination(paramsSalary);
			// 总的条数
			int[] sum = { 0 };
			// 用户身份限制
			String admin_type = (String) Param.getSession("admin_type");
			if ("1".equals(admin_type)) {
				User admin = (User) Param.getSession("admin");
				paramsSalary.setUser_id(admin.getUser_id());
			}
			// 查询工资列表
			List<Salary> salarys = adminService.listSalarysDesc(paramsSalary,
					sum);
			Param.setAttribute("salarys", salarys);
			setTotalCount(sum[0]);

		} catch (Exception e) {
			setErrorTip("查询工资异常", "main.jsp");
			return "infoTip";
		}

		return "salaryShow";
	}

	/**
	 * @Title: addSalaryShow
	 * @Description: 显示添加工资页面
	 * @return String
	 */
	public String addSalaryShow() {
		// 查询在职用户
		User user = new User();
		user.setStart(-1);
		user.setUser_type(1);// 下拉菜单显示员工姓名
		List<User> users = adminService.listUsers(user, null);
		if (users == null) {
			users = new ArrayList<User>();
		}
		Param.setAttribute("users", users);

		return "salaryEdit";
	}

	/**
	 * @Title: addSalary
	 * @Description: 添加工资
	 * @return String
	 */
	public String addSalary() {
		try {
			// 检查工资是否存在
			Salary salary = new Salary();
			salary.setUser_id(paramsSalary.getUser_id());
			salary.setSalary_month(paramsSalary.getSalary_month());
			salary = adminService.querySalary(salary);// 根据以上参数查询得到一个工资信息
			if (salary != null) {
				tip = "失败，该员工本月工资已经存在！";
				Param.setAttribute("salary", paramsSalary);
				// 查询在职用户
				User user = new User();
				user.setStart(-1);
				user.setUser_type(1);
				List<User> users = adminService.listUsers(user, null);
				if (users == null) {
					users = new ArrayList<User>();
				}
				Param.setAttribute("users", users);

				return "salaryEdit";
			}

			// 添加工资
			adminService.addSalary(paramsSalary);

			setSuccessTip("添加成功", "Admin_listSalarys.action");
		} catch (Exception e) {
			setErrorTip("添加工资异常", "Admin_listSalarys.action");
		}

		return "infoTip";
	}

	/**
	 * @Title: addSalary
	 * @Description: 批量添加工资（暂时有一定问题，有BUG）
	 * @return String
	 * @throws IOException
	 */
	public String addinfoBatch() throws IOException {
		System.out.println("3333333");
		InputStream stream = null;
		try {
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);// 判断请求中是否有enctype="multipart/form-data“这种标示。
			if (isMultipart == true) {// (2)1
				// 首先得到文件的输入流，并不上传文件
				ServletFileUpload upload = new ServletFileUpload();// 文件上传组件处理文件上传的核心高级
				// isMultipartContent方法方法用于判断请求消息中的内容是否是“multipart/form-data”类型，是则返回true，
				// 否则返回false。isMultipartContent方法是一个静态方法，不用创建ServletFileUpload类的实例对象即可被调用。
				upload.setHeaderEncoding("UTF-8");// 解决文件名中文乱码
				FileItemIterator iter = upload.getItemIterator(request);
				if (iter.hasNext()) {
					FileItemStream item = iter.next();
					stream = item.openStream();// 读取
					adminService.addinfoBatch(stream);
				}
			} else {
				throw new Exception("导入文件表单属性应为enctype='multipart/form-data'");
			}
		} catch (Exception e) {
			setErrorTip("添加工资异常", "Admin_listSalarys.action");
			e.printStackTrace();
		} finally {
			if (stream != null)
				stream.close();
		}
		return "infoTip";
	}

	/**
	 * @Title: editSalary
	 * @Description: 编辑工资
	 * @return String
	 */
	public String editSalary() {
		try {
			// 得到工资
			Salary salary = adminService.querySalary(paramsSalary);
			Param.setAttribute("salary", salary);

		} catch (Exception e) {
			setErrorTip("查询工资异常", "Admin_listSalarys.action");
			return "infoTip";
		}

		return "salaryEdit";
	}

	/**
	 * @Title: saveSalary
	 * @Description: 保存编辑工资
	 * @return String
	 */
	public String saveSalary() {
		try {
			// 保存编辑工资
			adminService.updateSalary(paramsSalary);
			// return "salaryShow";
			setSuccessTip("编辑成功", "Admin_listSalarys.action");
		} catch (Exception e) {
			tip = "编辑失败";
			Param.setAttribute("salary", paramsSalary);
			return "salaryEdit";
		}

		return "infoTip";
	}

	/**
	 * @Title: delSalarys
	 * @Description: 删除工资
	 * @return String
	 */
	public String delSalarys() {
		try {
			// 删除工资
			adminService.delSalarys(paramsSalary);

			setSuccessTip("删除工资成功", "Admin_listSalarys.action");
		} catch (Exception e) {
			setErrorTip("删除工资异常", "Admin_listSalarys.action");
		}

		return "infoTip";
	}

	/**
	 * @Title: listToachs
	 * @Description: 查询培训
	 * @return String
	 */
	public String listToachs() {
		try {
			if (paramsToach == null) {
				paramsToach = new Toach();
			}

			// 设置分页信息
			setPagination(paramsToach);
			// 总的条数
			int[] sum = { 0 };
			// 查询培训列表
			List<Toach> toachs = adminService.listToachs(paramsToach, sum);

			Param.setAttribute("toachs", toachs);
			setTotalCount(sum[0]);

		} catch (Exception e) {
			setErrorTip("查询培训异常", "main.jsp");
			return "infoTip";
		}

		return "toachShow";
	}

	/**
	 * @Title: queryToach
	 * @Description: 查看培训
	 * @return String
	 */
	public String queryToach() {
		try {
			// 得到培训
			Toach toach = adminService.queryToach(paramsToach);
			Param.setAttribute("toach", toach);

		} catch (Exception e) {
			setErrorTip("查询培训异常", "Admin_listToachs.action");
			return "infoTip";
		}

		return "toachDetail";
	}

	/**
	 * @Title: addToachShow
	 * @Description: 显示添加培训页面
	 * @return String
	 */
	public String addToachShow() {
		// 查询在职用户
		User user = new User();
		user.setStart(-1);
		user.setUser_type(1);
		List<User> users = adminService.listUsers(user, null);
		if (users == null) {
			users = new ArrayList<User>();
		}
		Param.setAttribute("users", users);

		return "toachEdit";
	}

	/**
	 * @Title: addToach
	 * @Description: 添加培训
	 * @return String
	 */
	public String addToach() {
		try {
			// 添加培训
			adminService.addToach(paramsToach);

			setSuccessTip("添加成功", "Admin_listToachs.action");
		} catch (Exception e) {
			setErrorTip("添加培训异常", "Admin_listToachs.action");
		}

		return "infoTip";
	}

	/**
	 * @Title: editToach
	 * @Description: 编辑培训
	 * @return String
	 */
	public String editToach() {
		try {
			// 得到培训
			Toach toach = adminService.queryToach(paramsToach);
			Param.setAttribute("toach", toach);

		} catch (Exception e) {
			setErrorTip("查询培训异常", "Admin_listToachs.action");
			return "infoTip";
		}

		return "toachEdit";
	}

	/**
	 * @Title: saveToach
	 * @Description: 保存编辑培训
	 * @return String
	 */
	public String saveToach() {
		try {
			// 保存编辑培训
			adminService.updateToach(paramsToach);

			setSuccessTip("编辑成功", "Admin_listToachs.action");
		} catch (Exception e) {
			tip = "编辑失败";
			Param.setAttribute("toach", paramsToach);

			// 查询在职用户
			User user = new User();
			user.setStart(-1);
			user.setUser_type(1);
			List<User> users = adminService.listUsers(user, null);
			if (users == null) {
				users = new ArrayList<User>();
			}
			Param.setAttribute("users", users);

			return "toachEdit";
		}

		return "infoTip";
	}

	/**
	 * @Title: delToachs
	 * @Description: 删除培训
	 * @return String
	 */
	public String delToachs() {
		try {
			// 删除培训
			adminService.delToachs(paramsToach);

			setSuccessTip("删除培训成功", "Admin_listToachs.action");
		} catch (Exception e) {
			setErrorTip("删除培训异常", "Admin_listToachs.action");
		}

		return "infoTip";
	}

	/**
	 * @Title: listAwards
	 * @Description: 查询奖惩
	 * @return String
	 */
	public String listAwards() {
		try {
			if (paramsAward == null) {
				paramsAward = new Award();
			}
			// 设置分页信息
			setPagination(paramsAward);
			// 总的条数
			int[] sum = { 0 };
			// 查询奖惩列表
			List<Award> awards = adminService.listAwards(paramsAward, sum);

			Param.setAttribute("awards", awards);
			setTotalCount(sum[0]);

		} catch (Exception e) {
			setErrorTip("查询奖惩异常", "main.jsp");
			return "infoTip";
		}

		return "awardShow";
	}

	/**
	 * @Title: queryAward
	 * @Description: 查看奖惩
	 * @return String
	 */
	public String queryAward() {
		try {
			// 得到奖惩
			Award award = adminService.queryAward(paramsAward);
			Param.setAttribute("award", award);

		} catch (Exception e) {
			setErrorTip("查询奖惩异常", "Admin_listAwards.action");
			return "infoTip";
		}

		return "awardDetail";
	}

	/**
	 * @Title: addAwardShow
	 * @Description: 显示添加奖惩页面
	 * @return String
	 */
	public String addAwardShow() {
		// 查询在职用户
		User user = new User();
		user.setStart(-1);
		user.setUser_type(1);
		List<User> users = adminService.listUsers(user, null);
		if (users == null) {
			users = new ArrayList<User>();
		}
		Param.setAttribute("users", users);

		return "awardEdit";
	}

	/**
	 * @Title: addAward
	 * @Description: 添加奖惩
	 * @return String
	 */
	public String addAward() {
		try {
			// 添加奖惩
			adminService.addAward(paramsAward);

			setSuccessTip("添加成功", "Admin_listAwards.action");
		} catch (Exception e) {
			setErrorTip("添加奖惩异常", "Admin_listAwards.action");
		}

		return "infoTip";
	}

	/**
	 * @Title: editAward
	 * @Description: 编辑奖惩
	 * @return String
	 */
	public String editAward() {
		try {
			// 得到奖惩
			Award award = adminService.queryAward(paramsAward);
			Param.setAttribute("award", award);

		} catch (Exception e) {
			setErrorTip("查询奖惩异常", "Admin_listAwards.action");
			return "infoTip";
		}

		return "awardEdit";
	}

	/**
	 * @Title: saveAward
	 * @Description: 保存编辑奖惩
	 * @return String
	 */
	public String saveAward() {
		try {
			// 保存编辑奖惩
			adminService.updateAward(paramsAward);

			setSuccessTip("编辑成功", "Admin_listAwards.action");
		} catch (Exception e) {
			tip = "编辑失败";
			Param.setAttribute("award", paramsAward);

			// 查询在职用户
			User user = new User();
			user.setStart(-1);
			user.setUser_type(1);
			List<User> users = adminService.listUsers(user, null);
			if (users == null) {
				users = new ArrayList<User>();
			}
			Param.setAttribute("users", users);

			return "awardEdit";
		}

		return "infoTip";
	}

	/**
	 * @Title: delAwards
	 * @Description: 删除奖惩
	 * @return String
	 */
	public String delAwards() {
		try {
			// 删除奖惩
			adminService.delAwards(paramsAward);

			setSuccessTip("删除奖惩成功", "Admin_listAwards.action");
		} catch (Exception e) {
			setErrorTip("删除奖惩异常", "Admin_listAwards.action");
		}

		return "infoTip";
	}

	/**
	 * @Title: listDirects
	 * @Description: 查询通讯录
	 * @return String
	 */
	public String listDirects() {
		try {
			if (paramsDirect == null) {
				paramsDirect = new Direct();
			}

			// 设置分页信息
			setPagination(paramsDirect);
			// 总的条数
			int[] sum = { 0 };
			// 查询通讯录列表
			List<Direct> directs = adminService.listDirects(paramsDirect, sum);
			Param.setAttribute("directs", directs);
			setTotalCount(sum[0]);

			// 查询部门
			Depart depart = new Depart();
			depart.setStart(-1);
			List<Depart> departs = adminService.listDeparts(depart, null);
			// 不存在部门的话new一个
			if (departs == null) {
				departs = new ArrayList<Depart>();
			}
			Param.setAttribute("departs", departs);
		} catch (Exception e) {
			setErrorTip("查询通讯录异常", "main.jsp");
			return "infoTip";
		}

		return "directShow";
	}

	/**
	 * @Title: addDirectShow
	 * @Description: 显示添加通讯录页面
	 * @return String
	 */
	public String addDirectShow() {
		// 查询部门
		Depart depart = new Depart();
		depart.setStart(-1);
		List<Depart> departs = adminService.listDeparts(depart, null);
		if (departs == null) {
			departs = new ArrayList<Depart>();
		}
		Param.setAttribute("departs", departs);

		return "directEdit";
	}

	/**
	 * @Title: addDirect
	 * @Description: 添加通讯录
	 * @return String
	 */
	public String addDirect() {
		try {
			// 检查通讯录是否存在
			Direct direct = new Direct();
			direct.setUser_name(paramsDirect.getUser_name());
			direct = adminService.queryDirect(direct);
			if (direct != null) {
				tip = "失败，该雇员编号已经在通讯录中存在！";
				Param.setAttribute("direct", paramsDirect);
				return "directEdit";
			}

			// 添加通讯录
			adminService.addDirect(paramsDirect);

			setSuccessTip("添加成功", "Admin_listDirects.action");
		} catch (Exception e) {
			setErrorTip("添加通讯录异常", "Admin_listDirects.action");
		}

		return "infoTip";
	}

	/**
	 * @Title: editDirect
	 * @Description: 编辑通讯录
	 * @return String
	 */
	public String editDirect() {
		try {
			// 得到通讯录
			Direct direct = adminService.queryDirect(paramsDirect);
			Param.setAttribute("direct", direct);

			// 查询部门
			Depart depart = new Depart();
			depart.setStart(-1);
			List<Depart> departs = adminService.listDeparts(depart, null);
			if (departs == null) {
				departs = new ArrayList<Depart>();
			}
			Param.setAttribute("departs", departs);

		} catch (Exception e) {
			setErrorTip("查询通讯录异常", "Admin_listDirects.action");
			return "infoTip";
		}

		return "directEdit";
	}

	/**
	 * @Title: saveDirect
	 * @Description: 保存编辑通讯录
	 * @return String
	 */
	public String saveDirect() {
		try {
			// 保存编辑通讯录
			adminService.updateDirect(paramsDirect);

			setSuccessTip("编辑成功", "Admin_listDirects.action");
		} catch (Exception e) {
			tip = "编辑失败";
			Param.setAttribute("direct", paramsDirect);

			// 查询部门
			Depart depart = new Depart();
			depart.setStart(-1);
			List<Depart> departs = adminService.listDeparts(depart, null);
			if (departs == null) {
				departs = new ArrayList<Depart>();
			}
			Param.setAttribute("departs", departs);

			return "directEdit";
		}

		return "infoTip";
	}

	/**
	 * @Title: delDirects
	 * @Description: 删除通讯录
	 * @return String
	 */
	public String delDirects() {
		try {
			// 删除通讯录
			adminService.delDirects(paramsDirect);

			setSuccessTip("删除通讯录成功", "Admin_listDirects.action");
		} catch (Exception e) {
			setErrorTip("删除通讯录异常", "Admin_listDirects.action");
		}

		return "infoTip";
	}

	/**
	 * @Title: validateAdmin
	 * @Description: admin登录验证
	 * @return boolean
	 */
	@SuppressWarnings("unused")
	private boolean validateAdmin() {
		Manager admin = (Manager) Param.getSession("admin");
		if (admin != null) {
			return true;
		} else {
			return false;
		}
	}

	private void setErrorTip(String tip, String url) {
		Param.setAttribute("tipType", "error");
		Param.setAttribute("tip", tip);
		Param.setAttribute("url1", url);
		Param.setAttribute("value1", "确 定");
	}

	private void setSuccessTip(String tip, String url) {
		Param.setAttribute("tipType", "success");
		Param.setAttribute("tip", tip);
		Param.setAttribute("url1", url);
		Param.setAttribute("value1", "确 定");
	}

	/**
	 * @Title: excel
	 * @Description: 导出excel表
	 * @return string
	 */
	public String excel() throws Exception {
		try {
			if (paramsDepart == null) {
				paramsDepart = new Depart();
			}
			// 总的条数
			int[] sum = { 0 };
			// 查询部门列表
			List<Depart> departs = adminService.listDeparts(paramsDepart, sum);
			// System.out.println(departs.size());
			StringBuffer excelBuf = new StringBuffer();
			excelBuf.append("序号").append("\t").append("部门名称").append("\t")
					.append("部门描述").append("\n");
			for (int i = 0; i < departs.size(); i++) {
				excelBuf.append(departs.get(i).getDepart_id()).append("\t")
						.append(departs.get(i).getDepart_name()).append("\t")
						.append(departs.get(i).getDepart_note()).append("\n");
			}
			String excelString = excelBuf.toString();
			excelStream = new ByteArrayInputStream(excelString.getBytes(), 0,
					excelString.getBytes().length);
		} catch (Exception e) {
			setErrorTip("查询部门异常", "main.jsp");
			return "infoTip";
		}

		// System.out.println(excelStream);
		return "excel";
	}

	/**
	 * @Title: salaryExcel
	 * @Description: 导出工资excel表
	 * @return string
	 */
	public String salaryExcel() throws Exception {
		try {
			if (paramsSalary == null) {
				paramsSalary = new Salary();
			}
			int[] sum = { 0 };
			List<Salary> salarys = adminService.listSalarys(paramsSalary, sum);
			// System.out.println(salarys.get(0).getSalary_month());
			StringBuffer excelBuffer = new StringBuffer();
			excelBuffer.append("员工姓名").append("\t").append("月份").append("\t")
					.append("底薪").append("\t").append("补助").append("\t")
					.append("保险").append("\t");
			excelBuffer.append("养老金").append("\t").append("住房公积金").append("\t")
					.append("考勤奖").append("\t").append("绩效").append("\t")
					.append("克扣").append("\t").append("合计工资").append("\t")
					.append("备注").append("\n");
			for (int i = 0; i < salarys.size(); i++) {
				excelBuffer.append(salarys.get(i).getReal_name()).append("\t")
						.append(salarys.get(i).getSalary_month()).append("\t")
						.append(salarys.get(i).getSalary_basic()).append("\t")
						.append(salarys.get(i).getSalary_subsidy())
						.append("\t")
						.append(salarys.get(i).getSalary_baoxian())
						.append("\t");
				excelBuffer.append(salarys.get(i).getSalary_yanglao())
						.append("\t")
						.append(salarys.get(i).getSalary_zhufang())
						.append("\t")
						.append(salarys.get(i).getSalary_attendDesc())
						.append("\t").append(salarys.get(i).getSalary_award())
						.append("\t").append(salarys.get(i).getSalary_punish())
						.append("\t").append(salarys.get(i).getSalary_money())
						.append("\t").append(salarys.get(i).getSalary_note())
						.append("\n");
			}
			String excelString = excelBuffer.toString();
			excelStream = new ByteArrayInputStream(excelString.getBytes(), 0,
					excelString.getBytes().length);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			setErrorTip("查询导出异常", "main.jsp");
			return "infoTip";//该界面是接受异常信息以及成功提示信息
		}
		return "salaryExcel";
	}

	/**
	 * @Title: awardExcel
	 * @Description: 导出奖惩信息excel表 基本要求之一
	 * @return string
	 */
	public String awardExcel() throws Exception {
		try {
			if (paramsAward == null) {
				paramsAward = new Award();
			}
			int[] sum = { 0 };
			List<Award> awards = adminService.listAwards(paramsAward, sum);
			StringBuffer excelBuffer = new StringBuffer();
			excelBuffer.append("员工姓名").append("\t").append("奖惩类型").append("\t")
					.append("奖惩标题").append("\t").append("奖惩内容").append("\t")
					.append("奖惩时间").append("\t").append("备注").append("\n");
			for (int i = 0; i < awards.size(); i++) {
				excelBuffer.append(awards.get(i).getReal_name()).append("\t")
						.append(awards.get(i).getAward_typeDesc()).append("\t")
						.append(awards.get(i).getAward_title()).append("\t")
						.append(awards.get(i).getAward_content()).append("\t")
						.append(awards.get(i).getAward_date()).append("\t")
						.append(awards.get(i).getAward_note()).append("\n");
			}
			String excelString = excelBuffer.toString();
			excelStream = new ByteArrayInputStream(excelString.getBytes(), 0,
					excelString.getBytes().length);//得到的byte[]组
		} catch (Exception e) {
			e.printStackTrace();
			setErrorTip("查询导出异常", "main.jsp");
			return "infoTip";
		}
		return "awardExcel";
	}

	/**
	 * @Title: fileupload
	 * @Description: 员工上传相关的文件
	 * @return string
	 */
	public String fileupload() {
		return "fileUpload";
	}

	/**
	 * @Title: sendEmail
	 * @Description: 类似于校长信箱，提建议等。
	 * @return string
	 */
	public String sendEmail() {
		return "sendEmail";
	}
	/**
	 * @Title: tongji
	 * @Description: 返回统计界面
	 * @return string
	 */
	public String tongji() {
		try {
			int a = 0,b=0,c=0,d=0;//对应四个部门初始	在职人数
			int a1=0,b1=0,c1=0,d1=0;//部门离职人员人数
			int m1=0,m2=0,m3=0,m4=0;
			if (paramsUser == null) {
				paramsUser = new User();
			}
			// 设置分页信息
			setPagination(paramsUser);
			// 总的条数
			int[] sum = { 0 };
			// 查询员工列表
			paramsUser.setUser_type(1);
			List<User> zzlists = adminService.listUsers(paramsUser, sum);
			User paramsUser1 =new User();
			paramsUser1.setUser_type(2);
			List<User> lzlists = adminService.listUsers(paramsUser1, sum);
			//获取各部门在职员工人数
			for (int i = 0; i < zzlists.size(); i++) {
				if (1==zzlists.get(i).getDepart_id()) {//软件部
				    a++;
				}else if (2==zzlists.get(i).getDepart_id()) {//市场部
					b++;
				}else if (3==zzlists.get(i).getDepart_id()) {//财政部
					c++;
				}else if (6==zzlists.get(i).getDepart_id()) {//人事部
					d++;
				}
			} 
			for (int i = 0; i < zzlists.size(); i++) {
				 if ((1==zzlists.get(i).getDepart_id())&&(2==zzlists.get(i).getStatue())) {//软件部转正率
					m1++;
				}else if ((2==zzlists.get(i).getDepart_id())&&(2==zzlists.get(i).getStatue())) {//市场部转正率
					m2++;
				}
				else if ((3==zzlists.get(i).getDepart_id())&&(2==zzlists.get(i).getStatue())) {//财政部转正率
					m3++;
				}
				else if ((6==zzlists.get(i).getDepart_id())&&(2==zzlists.get(i).getStatue())) {//人事部转正率
					m4++;
				}
			}
			//获取各部门离职员工人数
					for (int i = 0; i < lzlists.size(); i++) {
						if (1==lzlists.get(i).getDepart_id()) {//软件部
						    a1++;
						}else if (2==lzlists.get(i).getDepart_id()) {//市场部
							b1++;
						}else if (3==lzlists.get(i).getDepart_id()) {//财政部
							c1++;
						}else if (6==lzlists.get(i).getDepart_id()) {//人事部
							d1++;
						}
					}
					//计算各部门离职率
			int n1=a+a1;int a2=a1*100/n1;int n2=b+b1;int b2=b1*100/n2;int n3=c+c1;int c2=c1*100/n3;int n4=d+d1;int d2=d1*100/n4;
			int e1=m1*100/a;int e2=m2*100/b;int e3=m3*100/c;int e4=m4*100/d;
			Param.setAttribute("a2", a2);//代码有待优化 先实现功能
			Param.setAttribute("b2", b2);
			Param.setAttribute("c2", c2);
			Param.setAttribute("d2", d2);
			Param.setAttribute("e1", e1);
			Param.setAttribute("e2", e2);
			Param.setAttribute("e3", e3);
			Param.setAttribute("e4", e4);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return "tongji";
	}
	
	
}
