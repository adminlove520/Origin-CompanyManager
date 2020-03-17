package com.nkl.admin.action;

import com.nkl.admin.bean.Manager;
import com.nkl.admin.bean.User;
import com.nkl.admin.allservice.LoginService;
import com.nkl.common.action.BaseAction;
import com.nkl.common.util.Param;

public class LoginAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	LoginService loginService = new LoginService();
	Manager params;// 根据对象方式进行属性赋值，自动注入封装 代理员工和管理员 strut2自动new Manager
	String admin_type;
	String tip;

	public void setParams(Manager params) {
		this.params = params;
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public String getAdmin_type() {
		return admin_type;
	}

	public void setAdmin_type(String admin_type) {
		this.admin_type = admin_type;
	}

	/**
	 * @Title: InSystem
	 * @Description: 用户员工登录
	 * @return String
	 */
	public String InSystem() {
		try {
			//System.out.println("进入程序");debug
			// 验证码验证
			String random = (String) Param.getSession("random");
			if (!random.equals(params.getRandom())) {
				tip = "验证码错误";
				return "error";
			}

			// 员工登录查询  只有1才进入程序   并没有给管理员赋值2
			if ("1".equals(admin_type)) {
				User user = new User();
				user.setUser_name(params.getManager_name());// 自动装配params的两个属性.Manager_name()==user_name值
															// 前台输入的
				user.setUser_pass(params.getManager_pass());
				User admin = loginService.getUser(user);
				if (admin != null) {
					Param.setSession("admin", admin);// 查询成功保存在session中。完成一次会话
					Param.setSession("admin_type", "1");								
				} else {
					tip = "用户名或密码错误";
					return "error";
				}
			}
			// 管理员登录查询
			else {
				Manager admin = loginService.getManager(params);
				if (admin != null) {
					Param.setSession("admin", admin);
					Param.setSession("admin_type", "2");					
					//System.out.println("权限");					
					String str=admin.getManager_power();
					boolean power1=loginService.contains1(str);	
					boolean power2=loginService.contains2(str);
					boolean power3=loginService.contains3(str);
					boolean power4=loginService.contains4(str);
					boolean power5=loginService.contains5(str);
					boolean power6=loginService.contains6(str);
					boolean power7=loginService.contains7(str);
					boolean power8=loginService.contains8(str);
					Param.setSession("power1", power1);
					Param.setSession("power2", power2);
					Param.setSession("power3", power3);
					Param.setSession("power4", power4);
					Param.setSession("power5", power5);
					Param.setSession("power6", power6);
					Param.setSession("power7", power7);
					Param.setSession("power8", power8);					
				} else {
					tip = "用户名或密码错误";
					return "error";
				}
			}
		} catch (Exception e) {
			tip = "登录异常，请稍后重试";
			return "error";
		}
		return "success";
	}
	/**
	 * @Title: OutSystem
	 * @Description: 退出登录
	 * @return String
	 */
	public String OutSystem() {
		try {
			// 用户查询 判断用户身份
			String admin_type = (String) Param.getSession("admin_type");
			if ("1".equals(admin_type)) {
				User user = (User) Param.getSession("admin");
				if (user != null) {
					// 退出登录
					Param.removeSession("admin");
				}
			} else {
				Manager manager = (Manager) Param.getSession("admin");
				if (manager != null) {
					// 退出登录
					Param.removeSession("admin");
				}
			}

		} catch (Exception e) {
			return "logout";
		}

		return "logout";
	}

	/**
	 * @Title: RegSystem
	 * @Description: 用户注册：管理员
	 * @return String
	 */
	public String RegSystem() {
		try {
			// 查询验证码，Randon.jsp中有具体的方法，获取RS随机数=random（这是自己填入的前者是自动生成封装进session的）
			// String random = (String)Param.getSession("random");
			// if (!random.equals(params.getRandom())) {
			// setErrorReason("验证码不正确");
			// return "regerror";
			// }
			// 查询用户名是否被占用
			Manager manager = new Manager();
			manager.setManager_name(params.getManager_name());
			Manager manager_temp = loginService.getManager(manager);
			if (manager_temp != null) {
				setErrorReason("注册失败，用户名已被注册：" + params.getManager_name());
				return "regerror";
			}

			// 添加用户入库
			loginService.addManager(params);
			System.out.println(params.getManager_name());
			// 用户登录查询
			Manager regmanager = new Manager();//
			regmanager.setManager_name(params.getManager_name());
			regmanager = loginService.getManager(regmanager);
			if (regmanager != null) {
				Param.setSession("admin", regmanager);
			}

		} catch (Exception e) {
			setErrorReason("注册异常，请稍后重试");
			return "regerror";
		}

		return "addSuccess";
	}

	

	public Manager getParams() {
		return params;
	}

}
