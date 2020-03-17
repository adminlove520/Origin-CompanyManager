<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:if test="#attr.award!=null && #attr.award.award_id!=0">编辑</s:if><s:else>添加</s:else>员工奖惩信息</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	
	 var num = /^\d+(\.\d+)?$/;
	 $("#addBtn").bind('click',function(){
		if($("#paramsAward\\.user_id").val()=='0'){
			alert('员工姓名不能为空');
			return;
		}
		if($("#paramsAward\\.award_type").val()=='0'){
			alert('奖惩类型不能为空');
			return;
		}
		if($("#paramsAward\\.award_title").val()==''){
			alert('奖惩标题不能为空');
			return;
		}
		if($("#paramsAward\\.award_content").val()==''){
			alert('奖惩内容不能为空');
			return;
		}
		if($("#paramsAward\\.award_date").val()==''){
			alert('奖惩时间不能为空');
			return;
		}
		$("#paramsAward\\.award_id").val(0);
		$("#info").attr('action','Admin_addAward.action').submit();
		 
	 });
	 
	 $("#editBtn").bind('click',function(){
		if($("#paramsAward\\.award_type").val()=='0'){
			alert('奖惩类型不能为空');
			return;
		}
		if($("#paramsAward\\.award_title").val()==''){
			alert('奖惩标题不能为空');
			return;
		}
		if($("#paramsAward\\.award_content").val()==''){
			alert('奖惩内容不能为空');
			return;
		}
		if($("#paramsAward\\.award_date").val()==''){
			alert('奖惩时间不能为空');
			return;
		}
		$("#info").attr('action','Admin_saveAward.action').submit();
			 
	});
	 
});
</script>
<style type="text/css">
</style>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white">员工奖惩管理&gt;&gt;<s:if test="#attr.award!=null && #attr.award.award_id!=0">编辑</s:if><s:else>添加</s:else>员工奖惩</span>
</div>
<form id="info" name="info" action="Admin_addAward.action" method="post">   
<s:hidden id="paramsAward.award_id" name="paramsAward.award_id" value="%{#attr.award.award_id}" /> 
<table width="800" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
  <tr> 
     <td height="24">
       <Table border="0" cellspacing="0" cellpadding="0" align="center" width="100%"> 
            <TR>
              <TD height="24" class="edittitleleft">&nbsp;</TD>
              <TD class="edittitle"><s:if test="#attr.award!=null && #attr.award.award_id!=0">编辑</s:if><s:else>添加</s:else>员工奖惩</TD>
              <TD class="edittitleright">&nbsp;</TD>
            </TR>
        </TABLE>
     </td>
   </tr>
   <tr>
     <td height="1" bgcolor="#8f8f8f"></td>
   </tr>
   <tr>
     <td>
     <table width="100%" align="center" cellpadding="1" cellspacing="1" class="editbody">
       <tr>
          <td width="35%" align="right" style="padding-right:5px"><font color="red">*</font> 员工姓名：</td>
          <td width="65%">
          	<s:if test="#attr.award!=null && #attr.award.award_id!=0"><s:property value="#attr.award.real_name" /></s:if>
          	<s:else>
          	<s:select list="#attr.users" id="paramsAward.user_id" name="paramsAward.user_id"  
		      		listKey="user_id" listValue="%{user_name+'|'+real_name}"
		      		headerKey="0" headerValue="请选择" class="selectstyle" cssStyle="width:155px">
		      </s:select>
          	</s:else>
          </td>
        </tr> 
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 奖惩类型：</td>
          <td>
           	  <s:select list="#{'1':'奖励','2':'惩处'}"  id="paramsAward.award_type" name="paramsAward.award_type" value="%{#attr.award.award_type}"
		      		listKey="key" listValue="value" headerKey="0" headerValue="请选择" cssStyle="width:155px">
		      </s:select>
          </td>
        </tr>
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 奖惩标题：</td>
          <td>
           <s:textfield cssStyle="width:350px"  name="paramsAward.award_title" id="paramsAward.award_title" value="%{#attr.award.award_title}"/>
          </td>
        </tr>
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 奖惩内容：</td>
          <td>
           <s:textarea cssStyle="width:350px;height:80px" name="paramsAward.award_content" id="paramsAward.award_content" value="%{#attr.award.award_content}"/>
          </td>
        </tr>   
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 奖惩时间：</td>
          <td>
            <s:textfield cssStyle="width:155px"  name="paramsAward.award_date" id="paramsAward.award_date" value="%{#attr.award.award_date}" 
            										onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/>
          </td> 
        </tr>
        <tr>
          <td align="right" style="padding-right:5px">备注：</td>
          <td>
           <s:textarea cssStyle="width:350px;height:80px" name="paramsAward.award_note" id="paramsAward.award_note" value="%{#attr.award.award_note}"/>
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
          	<s:if test="#attr.award!=null && #attr.award.award_id!=0">
          	<input type="button" id="editBtn" Class="btnstyle" value="保存"/> 
          	</s:if>
          	<s:else>
          	<input type="button" id="addBtn" Class="btnstyle" value="添 加" />
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