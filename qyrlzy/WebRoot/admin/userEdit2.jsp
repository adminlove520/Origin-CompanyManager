<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加离职员工信息</title>
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

	var num = /^\d+$/;
	 $("#addBtn").bind('click',function(){
		if($("#paramsUser\\.user_id").val()=='0'){
			alert('员工姓名不能为空');
			return;
		}
		if($("#paramsUser\\.leave_date").val()==''){
			alert('离职日期不能为空');
			return;
		}
		if($("#paramsUser\\.leave_reason").val()==''){
			alert('离职原因不能为空');
			return;
		}
		
		$("#info").attr('action','Admin_addUser2.action').submit();
		 
	 });
	 
	 var user_id = '<s:property value="#attr.user_id"/>';
	 if(user_id!=''){
		 $("#paramsUser\\.user_id").val(user_id);
	 }
	 
	 
});
</script>
<style type="text/css">
.form-control{
width:220px;
}</style>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white;font-size:12px;">离职员工管理&gt;&gt;添加离职员工</span>
</div>
<form id="info" name="info" action="Admin_addUser2.action" method="post">   
<table width="400" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
   <tr> 
     <td height="24">
            <TR>
              <TD height="10px" bgcolor="#DFEDFF"></TD>           
            </TR>
     </td>
   </tr>
   <tr>
     <td>
     <table width="100%" align="center" cellpadding="1" cellspacing="1" class="editbody">
       <tr>
          <td width="25%" align="right" style="padding-right:5px"><font color="red">*</font> 员工姓名：</td>
          <td width="75%">
            <s:select list="#attr.users" id="paramsUser.user_id" name="paramsUser.user_id"  
		      		listKey="user_id" listValue="%{user_name+'|'+real_name}"
		      		headerKey="0" headerValue="请选择" cssClass="form-control" >
		      </s:select>
          </td>
        </tr> 
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 离职日期：</td>
          <td>
            <s:textfield name="paramsUser.leave_date" id="paramsUser.leave_date"  
            										onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" cssClass="form-control" />
          </td> 
        </tr>
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 离职原因：</td>
          <td>
           <s:textfield name="paramsUser.leave_reason" id="paramsUser.leave_reason" cssClass="form-control"  />
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