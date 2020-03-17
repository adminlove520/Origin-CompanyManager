<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:if test="#attr.toach!=null && #attr.toach.toach_id!=0">编辑</s:if><s:else>添加</s:else>员工培训信息</title>
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
		if($("#paramsToach\\.user_id").val()=='0'){
			alert('员工姓名不能为空');
			return;
		}
		if($("#paramsToach\\.toach_title").val()==''){
			alert('培训主题不能为空');
			return;
		}
		if($("#paramsToach\\.toach_content").val()==''){
			alert('培训内容不能为空');
			return;
		}
		if($("#paramsToach\\.toach_date1").val()==''){
			alert('培训起始不能为空');
			return;
		}
		if($("#paramsToach\\.toach_date2").val()==''){
			alert('培训截止不能为空');
			return;
		}
		$("#paramsToach\\.toach_id").val(0);
		$("#info").attr('action','Admin_addToach.action').submit();
		 
	 });
	 
	 $("#editBtn").bind('click',function(){
		if($("#paramsToach\\.toach_title").val()==''){
			alert('培训主题不能为空');
			return;
		}
		if($("#paramsToach\\.toach_content").val()==''){
			alert('培训内容不能为空');
			return;
		}
		if($("#paramsToach\\.toach_date1").val()==''){
			alert('培训起始不能为空');
			return;
		}
		if($("#paramsToach\\.toach_date2").val()==''){
			alert('培训截止不能为空');
			return;
		}
		$("#info").attr('action','Admin_saveToach.action').submit();
			 
	});
	 
});
</script>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white;font-size:12px;">员工培训管理&gt;&gt;<s:if test="#attr.toach!=null && #attr.toach.toach_id!=0">编辑</s:if><s:else>添加</s:else>员工培训</span>
</div>
<form id="info" name="info" action="Admin_addToach.action" method="post">   
<s:hidden id="paramsToach.toach_id" name="paramsToach.toach_id" value="%{#attr.toach.toach_id}" /> 
<table width="600" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
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
          <td width="13%" align="right" style="padding-right:5px"><font color="red">*</font> 员工姓名：</td>
          <td width="87%">
          	<s:if test="#attr.toach!=null && #attr.toach.toach_id!=0"><s:property value="#attr.toach.real_name" /></s:if>
          	<s:else>
          	<s:select list="#attr.users" id="paramsToach.user_id" name="paramsToach.user_id"  
		      		listKey="user_id" listValue="%{user_name+'|'+real_name}"
		      		headerKey="0" headerValue="请选择" cssClass="form-control">
		      </s:select>
          	</s:else>
          </td>
        </tr> 
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 培训主题：</td>
          <td>
           <s:textfield  name="paramsToach.toach_title" id="paramsToach.toach_title"  cssClass="form-control" value="%{#attr.toach.toach_title}"/>
          </td>
        </tr>
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 培训内容：</td>
          <td>
           <s:textarea cssStyle="height:100px;" name="paramsToach.toach_content" cssClass="form-control" id="paramsToach.toach_content" value="%{#attr.toach.toach_content}"/>
          </td>
        </tr>   
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 培训起始：</td>
          <td>
            <s:textfield  name="paramsToach.toach_date1" id="paramsToach.toach_date1" value="%{#attr.toach.toach_date1}" 
            										onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" cssClass="form-control"/>
          </td> 
        </tr>
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 培训截止：</td>
          <td>
            <s:textfield name="paramsToach.toach_date2" id="paramsToach.toach_date2" value="%{#attr.toach.toach_date2}" 
            										onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" cssClass="form-control"/>
          </td> 
        </tr>
        <tr>
          <td align="right" style="padding-right:5px">备注：</td>
          <td>
           <s:textarea cssStyle="height:100px;" name="paramsToach.toach_note" id="paramsToach.toach_note" value="%{#attr.toach.toach_note}" cssClass="form-control"/>
          </td>
        </tr>   
     </table>
     </td>
   </tr>  
   <tr>  <td height="6px" bgcolor="#DFEDFF"></td></tr>
   <tr>
   <tr>
     <td>
       <table width="100%" align="center" cellpadding="0" cellspacing="0" class="editbody">
        <tr class="editbody">
          <td align="center" height="30">
          	<s:if test="#attr.toach!=null && #attr.toach.toach_id!=0">
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