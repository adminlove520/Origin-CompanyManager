<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统管理</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
  <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
  <script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	 $("#addBtn").bind('click',function(){
		if($("#manager_name").val()==''){
			alert('用户名不能为空');
			return;
		}
		 if($("#manager_pass").val()==''){
			alert('密码不能为空');
			return;
		}
		$("#info").attr('action','manager_addManager.action').submit();
	 });
});
</script>
<style type="text/css">
.form-control{
width:220px;
}</style>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white;font-size:12px;">系统管理&gt;&gt;添加管理员</span>
</div>
<form id="info" name="info" action="manager_addManager.action" method="post">   
<table width="450"  align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
 <tr> 
     <td height="24">
            <TR>
              <TD height="10px" bgcolor="#DFEDFF"></TD>           
            </TR>
     </td>
   </tr>
   <tr>
     <td >
     <table width="100%" align="center" cellpadding="1" cellspacing="1" class="editbody">
        <tr>
          <td width="25%" align="right" style="padding-right:5px"><font color="red">*</font> 用户名：</td>
          <td width="75%">
          	<s:textfield name="manager_name" id="manager_name" cssClass="form-control" value="%{manager_name}"/>
          </td>
        </tr> 
        <tr>
          <td align="right" style="padding-right:5px">姓名：</td>
          <td>
          	<s:textfield name="real_name" id="real_name" cssClass="form-control" value="%{real_name}" />
          </td>
        </tr>
          <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 性别：</td>
          <td>
            <input type="radio" id="sex1" name="manager_sex" value="1" checked/>男&nbsp;&nbsp;
            <input type="radio" id="sex2" name="manager_sex" value="2"/>女
          </td>
        </tr>  
         <tr>
          <td align="right" style="padding-right:5px">密码：</td>
          <td >
          	<s:password name="manager_pass" id="manager_pass" cssClass="form-control" value="%{manager_pass}" showPassword="true" />
          </td>
        </tr>
           <tr>
          <td  align="right" style="padding-right:5px">权限设置：</td>
          <td >
          <input type="checkbox" name="manager_power" value="1" />用户管理  
          <input type="checkbox" name="manager_power" value="2"/>部门管理 
          <input type="checkbox" name="manager_power" value="3"/>员工管理   
          <input type="checkbox" name="manager_power" value="4"/>工资管理  <br> 
          <input type="checkbox" name="manager_power" value="5"/>培训管理   
          <input type="checkbox" name="manager_power" value="6"/>奖惩管理   
          <input type="checkbox" name="manager_power" value="7"/>通讯管理      
          <input type="checkbox" name="manager_power" value="8" /><b style="color:red;">全部选择</b>
          </td>
        </tr>
     </table>
     </td>
   </tr> 
    </tr>  
   <tr>  <td height="6px" bgcolor="#DFEDFF"></td></tr> 
   <tr>
     <td>
       <table width="100%" align="center" cellpadding="0" cellspacing="0" class="editbody">
        <tr class="editbody">
          <td align="center" height="30">
     
          	<input type="button" id="addBtn" Class="btn btn-primary btn-sm" value="添 加" />
          
            &nbsp;<label style="color:red">${tip}</label>
          </td>
        </tr>
      </table>
     </td>
   </tr>
</table>
</form>
</body>
</html>