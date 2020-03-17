<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:if test="#attr.user!=null && #attr.user.user_id!=0">编辑</s:if><s:else>添加</s:else>在职员工信息</title>
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
	 var user_sex = "<s:property value='#attr.user.user_sex' />";
	 if(user_sex!=''){
		 $("#sex"+user_sex).attr('checked','checked');
	 }else{
		 $("#sex1").attr('checked','checked');
	 }
	 
	 var num = /^\d+$/;
	 $("#addBtn").bind('click',function(){
		if($("#paramsUser\\.user_name").val()==''){
			alert('员工编号不能为空');
			return;
		}
		if($("#paramsUser\\.real_name").val()==''){
			alert('姓名不能为空');
			return;
		}
		if(!num.exec($("#paramsUser\\.user_age").val())){
			alert('年龄必须为数字');
			return;
		}
		if($("#paramsUser\\.depart_id").val()=='0'){
			alert('部门不能为空');
			return;
		}
		if($("#paramsUser\\.user_pose").val()==''){
			alert('职位不能为空');
			return;
		}
		if($("#paramsUser\\.reg_date").val()==''){
			alert('入职日期不能为空');
			return;
		}
		
		$("#paramsUser\\.user_id").val(0);
		$("#info").attr('action','Admin_addUser.action').submit();
		 
	 });
	 
	 $("#editBtn").bind('click',function(){
		if($("#paramsUser\\.real_name").val()==''){
			alert('姓名不能为空');
			return;
		}
		if(!num.exec($("#paramsUser\\.user_age").val())){
			alert('年龄必须为数字');
			return;
		}
		if($("#paramsUser\\.depart_id").val()=='0'){
			alert('部门不能为空');
			return;
		}
		if($("#paramsUser\\.user_pose").val()==''){
			alert('职位不能为空');
			return;
		}
		if($("#paramsUser\\.reg_date").val()==''){
			alert('入职日期不能为空');
			return;
		}
		$("#info").attr('action','Admin_saveUser.action').submit();
			 
	});
	 
});

$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});
</script>
<style type="text/css">
.form-control{
width:220px;
}</style>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white;font-size:12px;">在职员工管理&gt;&gt;<s:if test="#attr.user!=null && #attr.user.user_id!=0">编辑</s:if><s:else>添加</s:else>在职员工</span>
</div>
<form id="info" name="info" action="Admin_addUser.action" method="post">   
<s:hidden id="paramsUser.user_id" name="paramsUser.user_id" value="%{#attr.user.user_id}" /> 
<table width="400" align="center" cellpadding="0" cellspacing="0" style="margin-top:0px;margin-bottom:10px;" >
  <tr> 
     <td height="24">
            <TR>
              <TD height="10px" bgcolor="#DFEDFF"></TD>           
            </TR>
     </td>
   </tr>
   <tr>
     <td>
     <table width="100%" align="center" cellpadding="1" cellspacing="1" class="editbody" >
       <tr>
          <td width="25%" align="right" style="padding-right:5px"><font color="red">*</font> 员工编号：</td>
          <td width="75%">
          	<s:if test="#attr.user!=null && #attr.user.user_id!=0"><s:property value="#attr.user.user_name" /></s:if>
          	<s:else>
          	<input type="text" name="paramsUser.user_name" id="paramsUser.user_name" class="form-control" value="${user.user_name}" >
          	</s:else>
          </td>
        </tr> 
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 密码：</td>
          <td>
            <s:if test="#attr.user!=null && #attr.user.user_id!=0">
          	<s:password name="paramsUser.user_pass" id="paramsUser.user_pass" value="" cssClass="form-control"  showPassword="true"/>
          	</s:if>
          	<s:else>
          	<s:password name="paramsUser.user_pass" id="paramsUser.user_pass" value="111111" cssClass="form-control"  showPassword="true"/>         
          	</s:else>
          </td>
        </tr> 
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 姓名：</td>
          <td>
           <input type="text" name="paramsUser.real_name" id="paramsUser.real_name" value="${user.real_name}" class="form-control" />
          </td>
        </tr>   
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 性别：</td>
          <td>
            <input type="radio" id="sex1" name="paramsUser.user_sex" value="1" class=""/>男&nbsp;&nbsp;
            <input type="radio" id="sex2" name="paramsUser.user_sex" value="2" class=""/>女
          </td>
        </tr>   
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 年龄：</td>
          <td>
            <s:textfield name="paramsUser.user_age" id="paramsUser.user_age" value="%{#attr.user.user_age}" cssClass="form-control"/>
          </td> 
        </tr>
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font>籍贯：</td>
          <td>
            <s:textfield name="paramsUser.user_nation" id="paramsUser.user_nation" value="%{#attr.user.user_nation}" cssClass="form-control"/>
          </td> 
        </tr>
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font>学历：</td>
          <td>
            <s:textfield name="paramsUser.user_level" id="paramsUser.user_level" value="%{#attr.user.user_level}" cssClass="form-control"/>
          </td> 
        </tr>
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 部门：</td>
          <td>
              <s:select list="#attr.departs" cssClass="form-control" id="paramsUser.depart_id" name="paramsUser.depart_id" value="%{#attr.user.depart_id}"
		      		listKey="depart_id" listValue="depart_name"
		      		headerKey="0" headerValue="请选择">
		      </s:select>
          </td>
        </tr>   
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 职位：</td>
          <td>
              <s:textfield name="paramsUser.user_pose" id="paramsUser.user_pose" value="%{#attr.user.user_pose}" cssClass="form-control"/>
          </td>
        </tr>   
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 入职日期：</td>
          <td>
            <s:textfield name="paramsUser.reg_date" cssClass="form-control" id="paramsUser.reg_date" value="%{#attr.user.reg_date}" 
            										onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/>
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
          &nbsp;<label style="color:red">${tip}</label>
          	<s:if test="#attr.user!=null && #attr.user.user_id!=0">
          	<input type="button" id="editBtn" Class="btn btn-primary btn-sm" value="保存"/> 
          	</s:if>
          	<s:else>
          	<input type="button" id="addBtn" Class="btn btn-primary btn-sm" value="添 加" />
          	</s:else>
            
          </td>
        </tr>
      </table>
     </td>
   </tr>
</table>
</form>
</body>
</html>