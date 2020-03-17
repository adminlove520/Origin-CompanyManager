<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看员工培训信息</title>
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
	 
});
</script>
<style type="text/css">
</style>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white;font-size:12px;">员工培训管理&gt;&gt;查看员工培训</span>
</div>
<form id="info" name="info" action="Admin_addToach.action" method="post">   
<s:hidden id="paramsToach.toach_id" name="paramsToach.toach_id" value="%{#attr.toach.toach_id}" /> 
<table width="500" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;" >
   <tr> 
     <td>
            <TR>
              <TD height="10px" bgcolor="#DFEDFF"></TD>           
            </TR>
     </td>
   </tr>
   <tr>
     <td>
     <table width="100%" align="center" cellpadding="1" cellspacing="1" class="editbody"border="1" >
       <tr>
          <td width="35%" align="right" style="padding-right:5px"><font color="red">*</font> 员工姓名：</td>
          <td width="65%" style="font-size:16px;">
          	<s:property value="#attr.toach.user_name" />|<s:property value="#attr.toach.real_name" />
          </td>
        </tr> 
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 培训主题：</td>
          <td  style="font-size:16px;">
           <s:property value="#attr.toach.toach_title"/>
          </td>
        </tr>
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 培训内容：</td>
          <td style="font-size:16px;">
           <s:property value="#attr.toach.toach_content"/>
          </td>
        </tr>   
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 培训起始：</td>
          <td style="font-size:16px;">
            <s:property value="#attr.toach.toach_date1"/>
          </td> 
        </tr>
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 培训截止：</td>
          <td style="font-size:16px;">
            <s:property value="#attr.toach.toach_date2"/>
          </td> 
        </tr>
        <tr>
          <td align="right" style="padding-right:5px">备注：</td>
          <td style="font-size:16px;">
           <s:property value="#attr.toach.toach_note"/>
          </td>
        </tr>   
     </table>
     </td>
   </tr>  
   <TR>
              <TD height="10px" bgcolor="#DFEDFF"></TD>           
            </TR>
   <tr>
     <td>
       <table width="100%" align="center" cellpadding="0" cellspacing="0" class="editbody">
        <tr class="editbody">
          <td align="center" height="30">
          	<input type="button" id="editBtn" Class="btn btn-primary btn-sm" onclick="window.history.back()" value="返 回" style="margin-bottom:10px;"/>
          </td>
        </tr>
      </table>
     </td>
   </tr>
</table>
</form>
</body>
</html>