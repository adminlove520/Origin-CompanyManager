<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:if test="#attr.depart!=null && #attr.depart.depart_id!=0">编辑</s:if><s:else>添加</s:else>部门信息</title>
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
	 
	 var num = /^\d+(\.\d+)?$/;
	 $("#addBtn").bind('click',function(){
		if($("#paramsDepart\\.depart_name").val()==''){
			alert('部门名称不能为空');
			return;
		}
		$("#paramsDepart\\.depart_id").val(0);
		$("#info").attr('action','Admin_addDepart.action').submit();
		 
	 });
	 
	 $("#editBtn").bind('click',function(){
	 	if($("#paramsDepart\\.depart_name").val()==''){
			alert('部门名称不能为空');
			return;
		}
		$("#info").attr('action','Admin_saveDepart.action').submit();
		 
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
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white;font-size:12px;">部门管理&gt;&gt;<s:if test="#attr.depart!=null && #attr.depart.depart_id!=0">编辑</s:if><s:else>添加</s:else>部门</span>
</div>
<form id="info" name="info" action="Admin_addDepart.action" method="post">   
<s:hidden id="paramsDepart.depart_id" name="paramsDepart.depart_id" value="%{#attr.depart.depart_id}" /> 
<table width="400" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
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
          <td width="25%" align="right" style="padding-right:5px;height:50px;"><font color="red">*</font> 部门名称：</td>
          <td width="75%">
          	<s:textfield name="paramsDepart.depart_name" id="paramsDepart.depart_name" cssClass="form-control" value="%{#attr.depart.depart_name}"/>
          </td>
        </tr> 
        <tr>
          <td width="25%" align="right" style="padding-right:5px">部门描述：</td>
          <td width="75%">
          	<s:textarea style="height:100px;" name="paramsDepart.depart_note" id="paramsDepart.depart_note" cssClass="form-control" value="%{#attr.depart.depart_note}"/>
          </td>
        </tr>
     </table>
     </td>
   </tr>  
   <tr>  <td height="6px" bgcolor="#DFEDFF"></td></tr>
   <tr>
     <td>
       <table width="100%" align="center" cellpadding="0" cellspacing="0" class="editbody">
        <tr class="editbody">
          <td align="center" height="40">
          	<s:if test="#attr.depart!=null && #attr.depart.depart_id!=0">
          	<input type="button" id="editBtn" Class="btn btn-primary btn-sm" value="保存"/> 
          	</s:if>
          	<s:else>
          	<input type="button" id="addBtn" Class="btn btn-primary btn-sm" value="添 加" />
          	</s:else>
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