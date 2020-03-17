<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部门信息</title>
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
   document.info.action="Admin_listDeparts.action";
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
       alert("请至少选择一个要删除的部门！");
       return false;
    }
    if(confirm('确认删除吗!?'))
    {
       document.info.action="Admin_delDeparts.action?paramsDepart.ids="+ids;
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
  document.info.action="Admin_listDeparts.action";
  document.info.submit();
}
function ChangePage(pagenum)
{
  document.getElementById("pageNo").value=pagenum;
  document.info.action="Admin_listDeparts.action";
  document.info.submit();
}
</script>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white;font-size:12px">部门管理&gt;&gt;部门查询</span>
</div>
<form name="info" id="info" action="Admin_listDeparts.action" method="post">
<input type="hidden" name="pageNo" id="pageNo" value="${pageNo}"/>
<div class="container">
<table width="100%" align="center" cellpadding="0" cellspacing="0">
  <tr><td colspan="2" height="4px"></td></tr>
  <tr>
    <td width="25px">部门列表</td>
    <td width="25px" align="right">
            部门名称：
      <input type="text" id="paramsDepart.depart_name" name="paramsDepart.depart_name" 
      		value="${paramsDepart.depart_name}" class="inputstyle" style="width:100px;height:23px;position:relative;top:4px;"/>&nbsp;
      <input type="button" value="搜索" onclick="serch();" class="btn btn-primary btn-sm" style="margin-bottom:2px;"/>&nbsp;
      <input type="button" value="删除" onclick="del();" class="btn btn-primary btn-sm" style="margin-bottom:2px;"/>
    </td>
  </tr>
  <tr><td colspan="2" height="2px"></td></tr>  
</table>
</div>
<div class="container">
<table width="100%" align="center" class="table table-striped table-bordered" cellpadding="0" cellspacing="0">  
   <thead>
   <tr>
   
   <th style="text-align:center;vertical-align:middle;width:70px;"><input type="checkbox" onclick="CheckAll(this);" style="vertical-align:text-bottom;" title="全选/取消全选"/></th>
   <th style="text-align:center;vertical-align:middle;">序号</th>
   <th style="text-align:center;vertical-align:middle;">部门名称</th>
   <th style="text-align:center;vertical-align:middle;">部门描述</th>
   <th style="text-align:center;vertical-align:middle;">操作</th>
   </tr>
   </thead>
   <tbody>
   <s:if test="#attr.departs!=null && #attr.departs.size()>0">
   <s:iterator value="#attr.departs" id="depart" status="status">
   <tr onmouseover="tr_mouseover(this)" onmouseout="tr_mouseout(this)" align="center"> 
   
     <td ><s:checkbox name="chkid" fieldValue="%{#depart.depart_id}" cssStyle="vertical-align:text-bottom;"/></td>
     <td ><s:property value="#status.index+1"/></td>
     <td >&nbsp;&nbsp;<s:property value="#depart.depart_name"/></td>
     <td ><s:property value="#depart.depart_note"/></td>
     <td >
       <img src="images/edit.png"/>&nbsp;&nbsp;<s:a href="Admin_editDepart.action?paramsDepart.depart_id=%{#depart.depart_id}">编辑</s:a>
     </td>
   </tr> 
   </s:iterator>
   </s:if>
   <s:else>
   <tr>
     <td height="60" colspan="5" align="center"><b style="font-size:16px;">&lt;不存在部门信息&gt;</b></td>
   </tr>
   </s:else>
   </tbody>
</table>

<jsp:include page="page.jsp"></jsp:include>
</div>
</form> 
</body>
</html>