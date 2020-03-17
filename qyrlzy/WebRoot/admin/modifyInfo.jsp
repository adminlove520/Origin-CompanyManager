<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改个人信息</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src=""></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript"> 
$(document).ready(function(){
	 var admin_type = "${admin_type}";
	 if(admin_type=='2'){
		 var manager_sex = $("#manager_sex").val();
		 $("#sex"+manager_sex).attr('checked','checked');
	 }
	 
	 var num = /^\d+$/;
	 $("#saveBtn").bind('click',function(){
		if($("#paramsManager\\.real_name").val()==''){
			alert('姓名不能为空');
			return;
		}
		$("#info").submit();
	 });
	
});	 
	
</script>
<style type="text/css">
</style>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white">系统管理&gt;&gt;个人信息</span>
</div>
<form id="info" name="info" action="Admin_saveAdmin.action" method="post">    
<c:if test="${admin_type=='2'}">
<input type="hidden" name="paramsManager.manager_id" value="${admin.manager_id}"/>
<input type="hidden" id="manager_sex" value="${admin.manager_sex}"/>
</c:if>
<table width="800" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
  <tr> 
     <td height="24">
       <Table border="0" cellspacing="0" cellpadding="0" align="center" width="100%"> 
            <TR>
              <TD height="24" class="edittitleleft">&nbsp;</TD>
              <TD class="edittitle">${admin_type=='1'?'查看':'编辑'}个人信息</TD>
              <TD class="edittitleright">&nbsp;</TD>
            </TR>
        </TABLE>
     </td>
   </tr>
   <tr>
     <td height="1" bgcolor="#8f8f8f"></td>
   </tr>
   <!-- 员工个人信息界面 -->
   <c:if test="${admin_type=='1'}">
   <tr>
     <td >
     <table width="100%" align="center" cellpadding="1" cellspacing="1" class="editbody">
        <tr>
          <td width="15%" align="right" style="padding-right:5px">用户名：</td>
          <td width="35%">${admin.user_name}</td>
          <td width="15%" align="right" style="padding-right:5px">入职状态</td>
          <td width="35%">${admin.statueDesc}</td>
        </tr> 
        <tr>
          <td align="right" style="padding-right:5px">姓名：</td>
          <td>${admin.real_name}</td>
          <td align="right" style="padding-right:5px">性别：</td>
          <td>${admin.user_sexDesc}</td>
        </tr>   
        <tr>
          <td align="right" style="padding-right:5px">年龄：</td>
          <td>${admin.user_age}</td>
          <td align="right" style="padding-right:5px">学历：</td>
          <td>${admin.user_level}</td>
        </tr> 
        <tr>
          <td align="right" style="padding-right:5px">部门：</td>
          <td>${admin.depart_name}</td>
          <td align="right" style="padding-right:5px">职务：</td>
          <td>${admin.user_pose}</td>
        </tr> 
        <tr>
          <td align="right" style="padding-right:5px">学历：</td>
          <td>${admin.user_level}</td>
          <td align="right" style="padding-right:5px">籍贯：</td>
          <td>${admin.user_nation}</td>
        </tr> 
        <tr>
          <td align="right" style="padding-right:5px">入职时间：</td>
          <td colspan="3">${admin.reg_date}</td>
        </tr> 
     </table>
     </td>
   </tr>  
   </c:if>
   <!-- 管理员界面 -->
   <c:if test="${admin_type=='2'}">
   <tr>
     <td >
     <table width="100%" align="center" cellpadding="1" cellspacing="1" class="editbody">
        <tr>
          <td width="15%" align="right" style="padding-right:5px">用户名：</td>
          <td width="35%">${admin.manager_name}</td>
          <td width="15%" align="right" style="padding-right:5px"></td>
          <td width="35%"></td>
        </tr> 
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 姓名：</td>
          <td>
             <input type="text" id="paramsManager.real_name" name="paramsManager.real_name" value="${admin.real_name}"/>
          </td>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 性别：</td>
          <td>
             <input type="radio" name="paramsManager.manager_sex" id="sex1" value="1"/>男&nbsp;&nbsp;
             <input type="radio" name="paramsManager.manager_sex" id="sex2" value="2"/>女
          </td>
        </tr>   
     </table>
     </td>
   </tr>  
   <tr>
     <td>
       <table width="100%" align="center" cellpadding="0" cellspacing="0" class="editbody">
        <tr class="editbody">
          <td align="center" height="30">
            <input type="button" id="saveBtn" Class="btnstyle" value="保存"/> 
          </td>
        </tr>
      </table>
     </td>
   </tr>
   </c:if>
</table>
</form>
</body>
</html>