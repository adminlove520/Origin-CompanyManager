package com.nkl.admin.action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.nkl.admin.allservice.AdminService;
import com.nkl.admin.bean.Depart;
import com.nkl.admin.bean.Manager;
import com.nkl.admin.bean.User;
import com.nkl.common.util.Param;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;
import com.nkl.common.action.BaseAction;
/**
 * 
	 * @author 李怀鹏
	 * @Description: 实现权限分离
	 * @date 2018-5-15
	 * @version
 */
public class ManagersAction {	
private static final long serialVersionUID = 1L;
AdminService adminService = new AdminService();
   private int manager_id;
   private String manager_name;
   private String manager_pass;
   private String real_name;
   private String[] manager_power;//获取checkbox中的值
   private int manager_sex;
   private String tip;// 编辑完成后的提示 信息
   private String ids;//删除参数
   
   
public String getIds() {
	return ids;
}
public void setIds(String ids) {
	this.ids = ids;
}
public String getTip() {
	return tip;
}
public void setTip(String tip) {
	this.tip = tip;
}
public int getManager_id() {
	return manager_id;
}
public void setManager_id(int manager_id) {
	this.manager_id = manager_id;
}
public String getManager_name() {
	return manager_name;
}
public void setManager_name(String manager_name) {
	this.manager_name = manager_name;
}
public String getManager_pass() {
	return manager_pass;
}
public void setManager_pass(String manager_pass) {
	this.manager_pass = manager_pass;
}
public String getReal_name() {
	return real_name;
}
public void setReal_name(String real_name) {
	this.real_name = real_name;
}
public String[] getManager_power() {
	return manager_power;
}
public void setManager_power(String[] manager_power) {
	this.manager_power = manager_power;
}
public int getManager_sex() {
	return manager_sex;
}
public void setManager_sex(int manager_sex) {
	this.manager_sex = manager_sex;
}
/**
 * @Title: addManagerShow
 * @Description: 显示添加管理员信息页面
 * @return String
 */
public String addManagerShow() {
	return "addManager";
}
/**
 * @Title: addManager
 * @Description: 添加管理员
 * @return String
 */
public String addManager() {
	try {    
		     Manager manager1=new Manager();//该变量为判断是否存在重复用户
		     Manager manager=new Manager();
		     manager.setManager_name(manager_name);//string类型 的字符串本身是一个对象
		     manager.setManager_pass(manager_pass);
		     manager.setManager_sex(manager_sex);
		     manager.setReal_name(real_name);
		     String power=adminService.convert(this.manager_power);//对象类型数组  转换成字符串形式添加
		     //System.out.println(power);
		     manager.setManager_power(power);
		     manager1=adminService.queryManager(manager);
		     if (manager1!=null) {
				tip="失败，该用户名已经存在！";
				Param.setAttribute("manager1", manager);
				return "addManager";
			}
		    // System.out.println(manager.getManager_power());
		     adminService.addManager(manager);
	         setSuccessTip("添加成功", "manager_listManagers.action");
} catch (Exception e) {
	         setErrorTip("添加管理员异常", "manager_addManagerShow.action");
}     
	return "infoTip";
}
/**
 * @Title: listManagers
 * @Description: 查询管理员
 * @return String
 */
public String listManagers() {
	try {
		Manager manager=new Manager();
		manager.setManager_name(manager_name);
		List<Manager> managers=adminService.listManagers(manager);
		Param.setAttribute("managers", managers);
		
	} catch (Exception e) {
		setErrorTip("查询管理员异常", "main.jsp");
		return "infoTip";
	}
	      
	return "managersShow";
}

/**
 * @Title: delManagers
 * @Description: 删除管理员
 * @return String
 */
public String delManagers() {
	try {
		Manager manager=new Manager();
		manager.setIds(ids);
		adminService.delManagers(manager);
		setSuccessTip("删除管理员成功", "manager_listManagers.action");
	} catch (Exception e) {
		setErrorTip("删除管理员异常", "manager_listManagers.action");
	}
	return "infoTip";
}

/**
 * @Title: updateManager
 * @Description: 修改管理员
 * @return String
 */
public String updateManager(){
	try {
		  Manager manager=new Manager();
		  manager.setManager_id(manager_id);
		  //System.out.println(manager.getManager_id());
		  manager=adminService.queryManager(manager);//查询到显示在文本框中
		  Param.setAttribute("manager", manager);
		  Param.setSession("manager_id", manager_id);//不能放在request中把manager_id放在session中 更新保存的时候界面无该参数 需要先获取提交当做where参数
} catch (Exception e) {
        setErrorTip("更新管理员异常", "manager_updateManager.action");
        return "infoTip";
}
       return "updateManager";
}
/**
 * @Title: saveManager
 * @Description: 保存编辑管理员
 * @return String
 */
public String saveManager() {
	try {
		//System.out.println(manager_name);
		Manager manager=new Manager();
		int id=(Integer)Param.getSession("manager_id");
		//System.out.println(id);
		manager.setManager_id(id);
		manager.setManager_name(manager_name);
		manager.setReal_name(real_name);
		manager.setManager_sex(manager_sex);
		String str=adminService.convert(this.manager_power);//转换成字符串
		manager.setManager_power(str);
		// 保存编辑管理员
		adminService.updateManager(manager);
		setSuccessTip("更新成功", "manager_listManagers.action");
	} catch (Exception e) {
		setErrorTip("更新失败", "manager_listManagers.action");
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
}
