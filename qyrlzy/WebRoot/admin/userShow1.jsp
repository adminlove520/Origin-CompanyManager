<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在职员工信息</title>
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
   document.info.action="Admin_listUsers.action";
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
       document.info.action="Admin_delUsers.action?paramsUser.ids="+ids;
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
  document.info.action="Admin_listUsers.action";
  document.info.submit();
}
function ChangePage(pagenum)
{
  document.getElementById("pageNo").value=pagenum;
  document.info.action="Admin_listUsers.action";
  document.info.submit();
}
</script>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white;font-size:12px">在职员工管理&gt;&gt;在职员工查询</span>
</div>
<form name="info" id="info" action="Admin_listUsers.action" method="post">
<input type="hidden" name="pageNo" id="pageNo" value="${pageNo}"/>
<table width="98%" align="center" cellpadding="0" cellspacing="0">
  <tr><td colspan="2" height="4px"></td></tr>  
  <tr>
    <td width="">在职员工列表</td>
    <td width="" align="right">
            用户名：
      <input type="text" id="paramsUser.user_name" name="paramsUser.user_name" value="${paramsUser.user_name}" class="inputstyle" style="width:100px;height:23px;position:relative;top:5px;"/>&nbsp;
            姓名：
      <input type="text" id="paramsUser.real_name" name="paramsUser.real_name" value="${paramsUser.real_name}" class="inputstyle" style="width:100px;height:23px;position:relative;top:5px;"/>&nbsp;
            部门：
      <s:select list="#attr.departs" name="paramsUser.depart_id" value="%{#attr.paramsUser.departr_id}"
      		listKey="depart_id" listValue="depart_name" headerKey="0" headerValue="请选择" cssClass="selectstyle" cssStyle="height:23px; width:100px;position:relative;top:4px;">
      </s:select>&nbsp;
      <input type="button" value="搜索" onclick="serch();" class="btn btn-primary btn-sm" style="margin-bottom:4px;"/>&nbsp;
      <input type="button" value="删除" onclick="del();" class="btn btn-primary btn-sm" style="margin-bottom:4px;"/>
    </td>
  </tr>
</table>
<table class="table table-striped table-bordered" width="90%" align="center">
    <thead >
      <tr >
      
        <th style="text-align:center;vertical-align:middle;width:80px;"><input type="checkbox" onclick="CheckAll(this);" style="vertical-align:text-bottom;" title="全选/取消全选"/></th>
        <th style="text-align:center;vertical-align:middle;">员工编号</th>
        <th style="text-align:center;vertical-align:middle;">姓名</th>
        <th style="text-align:center;vertical-align:middle;">性别</th>
        <th style="text-align:center;vertical-align:middle;">年龄</th>
        <th style="text-align:center;vertical-align:middle;">籍贯</th>
        <th style="text-align:center;vertical-align:middle;">学历</th>
        <th style="text-align:center;vertical-align:middle;">部门</th>
        <th style="text-align:center;vertical-align:middle;">职位</th>
        <th style="text-align:center;vertical-align:middle;">入职日期</th>
        <th style="text-align:center;vertical-align:middle;">入职状态</th>
        <th style="text-align:center;vertical-align:middle;">操作</th>        
      </tr>
    </thead>
     <tbody>
     <s:if test="#attr.users!=null && #attr.users.size()>0">
   <s:iterator value="#attr.users" id="user" status="status">  
      <tr onmouseover="tr_mouseover(this)" onmouseout="tr_mouseout(this)" style="text-align:center;vertical-align:middle;">
     
        <td><s:checkbox name="chkid" fieldValue="%{#user.user_id}" cssStyle="vertical-align:text-bottom;"/></td>
        <td><s:property value="#user.user_name"/></td>
        <td><s:property value="#user.real_name"/></td>
        <td><s:property value="#user.user_sexDesc"/></td>
        <td><s:property value="#user.user_age"/></td>
        <td><s:property value="#user.user_nation"/></td>
        <td><s:property value="#user.user_level"/></td>
        <td><s:property value="#user.depart_name"/></td>
        <td><s:property value="#user.user_pose"/></td>
        <td><s:property value="#user.reg_date.substring(0,10)"/></td>   
        <td style="color:#008800;font-weight:bold;"><s:property value="#user.statueDesc"/></td>   
        <td> <s:a href="Admin_editUser.action?paramsUser.user_id=%{#user.user_id}">编辑</s:a>&nbsp;&nbsp;
       <s:a href="Admin_addUserShow2.action?paramsUser.user_id=%{#user.user_id}">离职</s:a>&nbsp;&nbsp;
       <!-- 如果不是指定管理员就不显示转正的链接 -->      
      <!--部门同意admin1 经理admin2 总部admin3 -->
       <c:if test="${user.statue!=2&&admin.manager_name=='admin1' }">
       <s:a href="Admin_zhuanzUser.action?paramsUser.user_id=%{#user.user_id}" ><c:if test="${user.statue==5}"><input type="button" value="转正" id="admin1" style="height:25px;color:#000000;font-weight:bold;"/></c:if>
       <c:if test="${user.statue==3}"><input type="button" value="已审核" id="admin1" style="height:25px;color:#008800;font-weight:bold;"/></c:if></s:a>
       </c:if>
        <c:if test="${user.statue!=2&&admin.manager_name=='admin2' }">
       <s:a href="Admin_zhuanzUser.action?paramsUser.user_id=%{#user.user_id}"><c:if test="${user.statue==3}"><input type="button" value="转正" id="admin1" style="height:25px;color:#000000;font-weight:bold;"/></c:if>
       <c:if test="${user.statue==4}"><input type="button" value="已审核" id="admin1" style="height:25px;color:#008800;font-weight:bold;"/></c:if></s:a>
       </c:if>
        <c:if test="${user.statue!=2&&admin.manager_name=='admin3' }">
       <s:a href="Admin_zhuanzUser.action?paramsUser.user_id=%{#user.user_id}" ><c:if test="${user.statue==4}"><input type="button" value="转正" id="admin1" style="height:25px;color:#000000;font-weight:bold;"/></c:if>
</s:a>
       </c:if>
     </td>
      </tr> 
       </s:iterator>
   </s:if>
    <s:else>
   <tr>
    <td height="60" colspan="12" align="center"><b style="font-size:16px;">&lt;不存在在职员工信息&gt;</b></td>
   </tr>
   </s:else>
    </tbody>   
  </table> 
<jsp:include page="page.jsp"></jsp:include>
</form> 
</body>
</html>