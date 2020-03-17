<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:if test="#attr.salary!=null && #attr.salary.salary_id!=0">编辑</s:if><s:else>添加</s:else>员工工资信息</title>
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
	
	 var salary_attend = "<s:property value='#attr.salary.salary_attend' />";
	 if(salary_attend!=''){
		 $("#salary_attend"+salary_attend).attr('checked','checked');
	 }else{
		 $("#salary_attend1").attr('checked','checked');
	 }
	
	 var num = /^\d+(\.\d+)?$/;
	 $("#addBtn").bind('click',function(){
		if($("#paramsSalary\\.user_id").val()=='0'){
			alert('员工姓名不能为空');
			return;
		}
		if($("#paramsSalary\\.salary_month").val()==''){
			alert('工资月份不能为空');
			return;
		}
		if(!num.exec($("#paramsSalary\\.salary_basic").val())){
			alert('底薪必须为数字');
			return;
		}
		if(!num.exec($("#paramsSalary\\.salary_award").val())){
			alert('绩效必须为数字');
			return;
		}
		if(!num.exec($("#paramsSalary\\.salary_subsidy").val())){
			alert('补助必须为数字');
			return;
		}
			if(!num.exec($("#paramsSalary\\.salary_baoxian").val())){
			alert('保险必须为数字');
			return;
		}
		if(!num.exec($("#paramsSalary\\.salary_yanglao").val())){
			alert('养老金必须为数字');
			return;
		}
		if(!num.exec($("#paramsSalary\\.salary_zhufang").val())){
			alert('住房公积金必须为数字');
			return;
		}
		if(!num.exec($("#paramsSalary\\.salary_punish").val())){
			alert('处罚克扣金额必须为数字');
			return;
		}
		$("#paramsSalary\\.salary_id").val(0);
		$("#info").attr('action','Admin_addSalary.action').submit();
		 
	 });
	 
	 $("#editBtn").bind('click',function(){
		if($("#paramsSalary\\.salary_month").val()==''){
			alert('工资月份不能为空');
			return;
		}
		if(!num.exec($("#paramsSalary\\.salary_basic").val())){
			alert('底薪必须为数字');
			return;
		}
		if(!num.exec($("#paramsSalary\\.salary_award").val())){
			alert('绩效必须为数字');
			return;
		}
		if(!num.exec($("#paramsSalary\\.salary_subsidy").val())){
			alert('补助必须为数字');
			return;
		}
		if(!num.exec($("#paramsSalary\\.salary_baoxian").val())){
			alert('保险必须为数字');
			return;
		}
		if(!num.exec($("#paramsSalary\\.salary_yanglao").val())){
			alert('养老金必须为数字');
			return;
		}
		if(!num.exec($("#paramsSalary\\.salary_zhufang").val())){
			alert('住房公积金必须为数字');
			return;
		}
		if(!num.exec($("#paramsSalary\\.salary_punish").val())){
			alert('处罚克扣金额必须为数字');
			return;
		}
		$("#info").attr('action','Admin_saveSalary.action').submit();
			 
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
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white;font-size:12px;">员工工资管理&gt;&gt;<s:if test="#attr.salary!=null && #attr.salary.salary_id!=0">编辑</s:if><s:else>添加</s:else>员工工资</span>
</div>
<form id="info" name="info" action="Admin_addSalary.action" method="post">   
<s:hidden id="paramsSalary.salary_id" name="paramsSalary.salary_id" value="%{#attr.salary.salary_id}" /> 
<table width="400" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
  <tr> 
     <td height="24">
            <TR>
              <TD height="10px" bgcolor="#DFEDFF"></TD>           
            </TR>
     </td>
   </tr>
   <tr>
   <tr>
     <td>
     <table width="100%" align="center" cellpadding="1" cellspacing="1" class="editbody">
       <tr>
          <td width="25%" align="right" style="padding-right:5px"><font color="red">*</font> 员工姓名：</td>
          <td width="75%">
          	<s:if test="#attr.salary!=null && #attr.salary.salary_id!=0"><s:property value="#attr.salary.real_name" /></s:if>
          	<s:else>
          	<s:select list="#attr.users" id="paramsSalary.user_id" name="paramsSalary.user_id"  
		      		listKey="user_id" listValue="%{user_name+'|'+real_name}"
		      		headerKey="0" headerValue="请选择"  cssClass="form-control">
		      </s:select>
          	</s:else>
          </td>
        </tr> 
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 工资月份：</td>
          <td>
            <s:textfield name="paramsSalary.salary_month" id="paramsSalary.salary_month" value="%{#attr.salary.salary_month}" 
            										onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM'})" cssClass="form-control"/>
          </td> 
        </tr>
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 底薪：</td>
          <td>
           <s:textfield name="paramsSalary.salary_basic" id="paramsSalary.salary_basic" value="%{#attr.salary.salary_basic}" cssClass="form-control"/>
          </td>
        </tr> 
        
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 补助：</td>
          <td>
           <s:textfield name="paramsSalary.salary_subsidy" id="paramsSalary.salary_subsidy" value="%{#attr.salary.salary_subsidy}" cssClass="form-control"/>
          </td>
        </tr>  
         <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 保险：</td>
          <td>
           <s:textfield name="paramsSalary.salary_baoxian" id="paramsSalary.salary_baoxian" value="%{#attr.salary.salary_baoxian}" cssClass="form-control"/>
          </td>
        </tr>
         <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 养老金：</td>
          <td>
           <s:textfield name="paramsSalary.salary_yanglao" id="paramsSalary.salary_yanglao" value="%{#attr.salary.salary_yanglao}" cssClass="form-control"/>
          </td>
        </tr>
         <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 住房公积金：</td>
          <td>
           <s:textfield name="paramsSalary.salary_zhufang" id="paramsSalary.salary_zhufang" value="%{#attr.salary.salary_zhufang}" cssClass="form-control"/>
          </td>
        </tr>
        <tr>
          <td align="right" style="padding-right:15px"><font color="red">*</font> 考勤奖（200）：</td>
          <td>
            <input type="radio" id="salary_attend1" name="paramsSalary.salary_attend" value="1" />无&nbsp;&nbsp;
            <input type="radio" id="salary_attend2" name="paramsSalary.salary_attend" value="2" checked/>有
          </td>
        </tr>   
         <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 绩效：</td>
          <td>
           <s:textfield name="paramsSalary.salary_award" id="paramsSalary.salary_award" value="%{#attr.salary.salary_award}" cssClass="form-control"/>
          </td>
        </tr> 
         <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 克扣：</td>
          <td>
           <s:textfield name="paramsSalary.salary_punish" id="paramsSalary.salary_punish" value="%{#attr.salary.salary_punish}" cssClass="form-control"/>
          </td>
        </tr> 
        <tr>
          <td align="right" style="padding-right:5px">备注：</td>
          <td>
           <s:textfield name="paramsSalary.salary_note" id="paramsSalary.salary_note" value="%{#attr.salary.salary_note}" cssClass="form-control"/>
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
          <td align="center" height="30">
          	<s:if test="#attr.salary!=null && #attr.salary.salary_id!=0">
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