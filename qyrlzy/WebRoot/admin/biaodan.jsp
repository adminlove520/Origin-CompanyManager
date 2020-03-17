<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>htm5+CSS3表单美化以及输入验证特效代码</title>
<link rel="stylesheet" href="css/biaodanstyle.css" media="" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
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
</head>

<body>
<form id="info" name="info" action="Admin_addUser.action" method="post">   

<div class="container">  
	<form id="contact"  name="info" action="Admin_addUser.action"method="post">
	<s:hidden id="paramsUser.user_id" name="paramsUser.user_id" value="%{#attr.user.user_id}" />
		<h3>留言咨询</h3>
		<h4>请留下您的联系方式，我们会在24小时内与您回复!</h4>
		<fieldset>
			<input placeholder="用户名" type="text" tabindex="1" required autofocus>
		</fieldset>
		<fieldset>
			<input placeholder="邮箱地址" type="email" tabindex="2" required>
		</fieldset>
		<fieldset>
			<input placeholder="电话号码" type="tel" tabindex="3" required>
		</fieldset>
		<fieldset>
			<input placeholder="网站地址 http://" type="url" tabindex="4" required>
		</fieldset>
		<fieldset>
			<textarea placeholder="留言内容" tabindex="5" required></textarea>
		</fieldset>
		<fieldset>
			<button name="submit" type="submit" id="contact-submit" data-submit="...Sending">提交</button>
		</fieldset>
	</form>
</div>
 
</body>
</html>