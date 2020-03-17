<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员信息</title>
<link href="css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
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
   document.info.action="manager_listManagers.action";
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
       alert("请至少选择一个要删除的在职员工！");
       return false;
    }
    if(confirm('确认删除吗!?'))
    {
       document.info.action="manager_delManagers.action?ids="+ids;
       document.info.submit();
    }
    
}
</script>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white;font-size:12px">用户信息管理&gt;&gt;管理员查询</span>
</div>
<form name="info" id="info" action="manager_listManagers.action" method="post">
<div class="container">
<table width="100%" align="center" cellpadding="0" cellspacing="0">
  <tr><td colspan="2" height="4px"></td></tr>  
  <tr>
    <td width="">管理员列表</td>
    <td width="" align="right">
            用户名：
      <input type="text" id="manager_name" name="manager_name" value="${manager_name}" class="inputstyle" style="width:100px;height:23px;position:relative;top:5px;"/>&nbsp;          
      <input type="button" value="搜索" onclick="serch();" class="btn btn-primary btn-sm" style="margin-bottom:4px;"/>&nbsp;
      <input type="button" value="删除" onclick="del();" class="btn btn-primary btn-sm" style="margin-bottom:4px;"/>
    </td>
  </tr>
</table>
</div>
<div class="container">
<table class="table table-striped table-bordered" width="100%" align="center">
    <thead >
      <tr >   
        <th style="text-align:center;vertical-align:middle;width:80px;"><input type="checkbox" onclick="CheckAll(this);" style="vertical-align:text-bottom;" title="全选/取消全选"/></th>       
        <th style="text-align:center;vertical-align:middle;">用户名</th>
        <th style="text-align:center;vertical-align:middle;">姓名</th>
        <th style="text-align:center;vertical-align:middle;">性别</th>
        <th style="text-align:center;vertical-align:middle;">用户权限</th>    
        <th style="text-align:center;vertical-align:middle;">操作</th>    
      </tr>
    </thead>
     <tbody>
     <s:if test="#attr.managers!=null && #attr.managers.size()>0">
   <s:iterator value="#attr.managers" id="manager" status="status">  
      <tr onmouseover="tr_mouseover(this)" onmouseout="tr_mouseout(this)" style="text-align:center;vertical-align:middle;">
             <c:if test="${manager.manager_power!='8' }">
        <td><s:checkbox name="chkid" fieldValue="%{#manager.manager_id}" cssStyle="vertical-align:text-bottom;"/></td>
        <td><s:property value="#manager.manager_name"/> </td>
        <td><s:property value="#manager.real_name"/></td>
        <td><s:property value="#manager.manager_sexDesc"/></td>
        <td><s:property value="#manager.manager_power"/></td>    
        <td> <s:a href="manager_updateManager.action?manager_id=%{#manager.manager_id}">修改</s:a>&nbsp;&nbsp;      
     </td>
     </c:if>
      </tr> 
       </s:iterator>
   </s:if>
    <s:else>
   <tr>
    <td height="60" colspan="12" align="center"><b style="font-size:16px;">&lt;不存在管理员信息&gt;</b></td>
   </tr>
   </s:else>
    </tbody>   
  </table> 
 
<jsp:include page="page.jsp"></jsp:include>
 </div>
</form> 
</body>
</html>