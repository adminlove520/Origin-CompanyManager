<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:if test="#attr.direct!=null && #attr.direct.direct_id!=0">编辑</s:if><s:else>添加</s:else>通讯录信息</title>
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
	 var user_sex = "<s:property value='#attr.direct.user_sex' />";
	 if(user_sex!=''){
		 $("#sex"+user_sex).attr('checked','checked');
	 }else{
		 $("#sex1").attr('checked','checked');
	 }
	 
	 var num = /^\d+$/;
	 $("#addBtn").bind('click',function(){
		if($("#paramsDirect\\.user_name").val()==''){
			alert('员工编号不能为空');
			return;
		}
		if($("#paramsDirect\\.real_name").val()==''){
			alert('姓名不能为空');
			return;
		}
		if($("#paramsDirect\\.depart_id").val()=='0'){
			alert('部门不能为空');
			return;
		}
		
		$("#paramsDirect\\.direct_id").val(0);
		$("#info").attr('action','Admin_addDirect.action').submit();
		 
	 });
	 
	 $("#editBtn").bind('click',function(){
		if($("#paramsDirect\\.real_name").val()==''){
			alert('姓名不能为空');
			return;
		}
		if($("#paramsDirect\\.depart_id").val()=='0'){
			alert('部门不能为空');
			return;
		}
		$("#info").attr('action','Admin_saveDirect.action').submit();
			 
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
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white">通讯录管理&gt;&gt;<s:if test="#attr.direct!=null && #attr.direct.direct_id!=0">编辑</s:if><s:else>添加</s:else>通讯录</span>
</div>
<form id="info" name="info" action="Admin_addDirect.action" method="post">   
<s:hidden id="paramsDirect.direct_id" name="paramsDirect.direct_id" value="%{#attr.direct.direct_id}" /> 
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
          <td width="25%" align="right" style="padding-right:5px"><font color="red">*</font> 员工编号：</td>
          <td width="75%">
          	<s:if test="#attr.direct!=null && #attr.direct.direct_id!=0"><s:property value="#attr.direct.user_name" /></s:if>
          	<s:else><s:textfield name="paramsDirect.user_name"  cssClass="form-control" id="paramsDirect.user_name" value="%{#attr.direct.user_name}"/> </s:else>
          </td>
        </tr> 
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 员工姓名：</td>
          <td>
           <s:textfield name="paramsDirect.real_name" id="paramsDirect.real_name" value="%{#attr.direct.real_name}" cssClass="form-control"/>
          </td>
        </tr>   
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 员工性别：</td>
          <td>
            <input type="radio" id="sex1" name="paramsDirect.user_sex" value="1"/>男&nbsp;&nbsp;
            <input type="radio" id="sex2" name="paramsDirect.user_sex" value="2"/>女
          </td>
        </tr>  
         <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 所在部门：</td>
          <td>
              <s:select list="#attr.departs" id="paramsDirect.depart_id" name="paramsDirect.depart_id" cssClass="form-control" value="%{#attr.direct.depart_id}"
		      		listKey="depart_id" listValue="depart_name"
		      		headerKey="0" headerValue="请选择" >
		      </s:select>
          </td>
        </tr>   
        <tr>
          <td align="right" style="padding-right:5px">员工电话：</td>
          <td>
            <s:textfield name="paramsDirect.user_phone" id="paramsDirect.user_phone" value="%{#attr.direct.user_phone}" cssClass="form-control"/>
          </td> 
        </tr>
        <tr>
          <td align="right" style="padding-right:5px">员工QQ：</td>
          <td>
            <s:textfield name="paramsDirect.user_qq" id="paramsDirect.user_qq" value="%{#attr.direct.user_qq}" cssClass="form-control"/>
          </td> 
        </tr>
        <tr>
          <td align="right" style="padding-right:5px">员工邮箱：</td>
          <td>
            <s:textfield name="paramsDirect.user_mail" id="paramsDirect.user_mail" value="%{#attr.direct.user_mail}" cssClass="form-control"/>
          </td> 
        </tr>
        <tr>
          <td align="right" style="padding-right:5px">员工住址：</td>
          <td>
            <s:textfield   name="paramsDirect.user_address" id="paramsDirect.user_address" value="%{#attr.direct.user_address}" cssClass="form-control"/>
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
          	<s:if test="#attr.direct!=null && #attr.direct.direct_id!=0">
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