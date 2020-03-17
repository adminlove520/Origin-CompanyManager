<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>离职员工信息</title>
<link href="css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
  <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
  <script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script type="text/javascript">
var tempClassName="";
function tr_mouseover(obj) 
{ 
	tempClassName=obj.className;
	obj.className="list_mouseover";
}
function tr_mouseout(obj)      
{ 
	obj.className=tempClassName;
}      
function CheckAll(obj) 
{
	var checks=document.getElementsByName("chkid");
    for (var i=0;i<checks.length;i++)
	{
	    var e = checks[i];
	    e.checked = obj.checked;
	}
    
}


function serch()
{
   document.info.action="Admin_listUsers2.action";
   document.info.submit();
}
function del()
{
	var checks=document.getElementsByName("chkid");
    var ids="";
	for (var i=0;i<checks.length;i++)
    {
        var e = checks[i];
		if(e.checked==true)
		{
		  if(ids=="")
		  {
		    ids=ids+e.value;
		  }
		  else
		  {
		    ids=ids+","+e.value;
		  }
		}
    }
    if(ids=="")
    {
       alert("请至少选择一个要删除的离职员工！");
       return false;
    }
    if(confirm('确认删除吗!?'))
    {
       document.info.action="Admin_delUsers2.action?paramsUser.ids="+ids;
       document.info.submit();
    }
    
}
function GoPage()
{
  var pagenum=document.getElementById("goPage").value;
  var patten=/^\d+$/;
  if(!patten.exec(pagenum))
  {
    alert("页码必须为大于0的数字");
    return false;
  }
  document.getElementById("pageNo").value=pagenum;
  document.info.action="Admin_listUsers2.action";
  document.info.submit();
}
function ChangePage(pagenum)
{
  document.getElementById("pageNo").value=pagenum;
  document.info.action="Admin_listUsers2.action";
  document.info.submit();
}
</script>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white;font-size:12px;">离职员工管理&gt;&gt;离职员工查询</span>
</div>
<form name="info" id="info" action="Admin_listUsers2.action" method="post">
<input type="hidden" name="pageNo" id="pageNo" value="${pageNo}"/>
<div class="container">
<table width="100%" align="center" cellpadding="0" cellspacing="0">
  <tr><td colspan="2" height="2px"></td></tr>
  <tr>
    <td width="">离职员工列表</td>
    <td width="" align="right">
            姓名：
      <input type="text" id="paramsUser.real_name" name="paramsUser.real_name" value="${paramsUser.real_name}" class="inputstyle" style="width:100px;height:23px;position:relative;top:5px;"/>&nbsp;
            离职日期：
      <input type="text" id="paramsUser.leave_date" name="paramsUser.leave_date" value="${paramsUser.leave_date}" class="inputstyle" style="width:100px; height:23px;position:relative;top:5px;"
				onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/>&nbsp;&nbsp;
      <input type="button" value="搜索" onclick="serch();" class="btn btn-primary btn-sm" style="margin-bottom:3px;"/>&nbsp;
      <input type="button" value="删除" onclick="del();" class="btn btn-primary btn-sm" style="margin-bottom:3px;"/>
    </td>
  </tr>  
</table>
</div>
<div class="container">

<table width="95%" align="center" class="table table-striped table-bordered" cellpadding="0" cellspacing="0">
   <thead >
   <tr >
     <th style="text-align:center;vertical-align:middle;width:40px"><input type="checkbox" onclick="CheckAll(this);" style="vertical-align:text-bottom;" title="全选/取消全选"/></th>
     <th style="text-align:center;vertical-align:middle;">员工编号</th>
     <th style="text-align:center;vertical-align:middle;">姓名</th>
     <th style="text-align:center;vertical-align:middle;">离职日期</th>
     <th style="text-align:center;vertical-align:middle;">离职原因</th>
   </tr>
   </thead>
   <tbody>
   <s:if test="#attr.users!=null && #attr.users.size()>0">
   <s:iterator value="#attr.users" id="user" status="status">
   <tr class="<s:if test='(#status.index + 1)%2==0'>list1</s:if><s:else>list0</s:else>" onmouseover="tr_mouseover(this)" onmouseout="tr_mouseout(this)"> 
     <td width="" align="center"><s:checkbox name="chkid" fieldValue="%{#user.user_id}" cssStyle="vertical-align:text-bottom;"/></td>
     <td width="" align="center"><s:property value="#user.user_name"/></td>
     <td width="" align="center"><s:property value="#user.real_name"/></td>
     <td width="" align="center"><s:property value="#user.leave_date.substring(0,10)"/></td> 
     <td width="" align="center"><s:property value="#user.leave_reason"/>&nbsp;</td>
   </tr> 
   </s:iterator>
   </s:if>
   <s:else>
   <tr>
     <td height="60" colspan="9" align="center"><b>&lt;不存在离职员工信息&gt;</b></td>
   </tr>
   </s:else>
   </tbody>
</table>
</div>
<jsp:include page="page.jsp"></jsp:include>
</form> 
</body>
</html>