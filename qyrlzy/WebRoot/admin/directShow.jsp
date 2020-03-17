<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通讯录信息</title>
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
   document.info.action="Admin_listDirects.action";
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
       alert("请至少选择一个要删除的通讯录！");
       return false;
    }
    if(confirm('确认删除吗!?'))
    {
       document.info.action="Admin_delDirects.action?paramsDirect.ids="+ids;
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
  document.info.action="Admin_listDirects.action";
  document.info.submit();
}
function ChangePage(pagenum)
{
  document.getElementById("pageNo").value=pagenum;
  document.info.action="Admin_listDirects.action";
  document.info.submit();
}
</script>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white;font-size:12px;">通讯录管理&gt;&gt;通讯录查询</span>
</div>
<form name="info" id="info" action="Admin_listDirects.action" method="post">
<input type="hidden" name="pageNo" id="pageNo" value="${pageNo}"/>
<table width="96%" align="center" cellpadding="0" cellspacing="0">
  <tr><td colspan="2" height="2px"></td></tr>
  <tr>
    <td width="">通讯录列表</td>
    <td width="" align="right">
            员工编号：
      <input type="text" id="paramsDirect.user_name" name="paramsDirect.user_name" value="${paramsDirect.user_name}" class="inputstyle" style="width:100px;height:23px;position:relative;top:5px;"/>&nbsp;
            姓名：
      <input type="text" id="paramsDirect.real_name" name="paramsDirect.real_name" value="${paramsDirect.real_name}" class="inputstyle" style="width:100px;height:23px;position:relative;top:5px;"/>&nbsp;
            部门：
      <s:select list="#attr.departs" name="paramsDirect.depart_id" value="%{#attr.paramsDirect.depart_id}"
      		listKey="depart_id" listValue="depart_name" headerKey="0" headerValue="请选择" cssClass="selectstyle" cssStyle="width:100px;height:23px;position:relative;top:4px;">
      </s:select>&nbsp;&nbsp;
      <input type="button" value="搜索" onclick="serch();" class="btn btn-primary btn-sm" style="margin-bottom:3px;"/>&nbsp;
      <s:if test="#attr.admin_type==2">
      <input type="button" value="删除" onclick="del();" class="btn btn-primary btn-sm" style="margin-bottom:3px;"/>
      </s:if>
    </td>
  </tr>
</table>
<table width="95%" align="center" class="table table-striped table-bordered" cellpadding="0" cellspacing="0">
   <tr>
     <s:if test="#attr.admin_type==2">
     <th style="text-align:center;vertical-align:middle;width:60px;"><input type="checkbox" onclick="CheckAll(this);" style="vertical-align:text-bottom;" title="全选/取消全选"/></th>
     </s:if>
     <th style="text-align:center;vertical-align:middle;">员工编号</th>
     <th style="text-align:center;vertical-align:middle;">姓名</th>
     <th style="text-align:center;vertical-align:middle;">性别</th>
     <th style="text-align:center;vertical-align:middle;">部门</th>
     <th style="text-align:center;vertical-align:middle;">电话</th>
     <th style="text-align:center;vertical-align:middle;">QQ</th>
     <th style="text-align:center;vertical-align:middle;">邮箱</th>
     <th style="text-align:center;vertical-align:middle;">住址</th>
     <s:if test="#attr.admin_type==2">
     <th style="text-align:center;vertical-align:middle;">操作</th>
     </s:if>
   </tr>
   <s:if test="#attr.directs!=null && #attr.directs.size()>0">
   <s:iterator value="#attr.directs" id="direct" status="status">
   <tr onmouseover="tr_mouseover(this)" onmouseout="tr_mouseout(this)" style="text-align:center;vertical-align:middle;"> 
     <s:if test="#attr.admin_type==2">
     <td width="" align="center"><s:checkbox name="chkid" fieldValue="%{#direct.direct_id}" cssStyle="vertical-align:text-bottom;"/></td>
     </s:if>
     <td ><s:property value="#direct.user_name"/></td>
     <td ><s:property value="#direct.real_name"/></td>
     <td ><s:property value="#direct.user_sexDesc"/></td>
     <td ><s:property value="#direct.depart_name"/></td>  
     <td ><s:property value="#direct.user_phone"/> </td>
     <td ><s:property value="#direct.user_qq"/></td>
     <td ><s:property value="#direct.user_mail"/></td>
     <td ><s:property value="#direct.user_address"/></td> 
     <s:if test="#attr.admin_type==2">
     <td width="" align="center">
       <s:a href="Admin_editDirect.action?paramsDirect.direct_id=%{#direct.direct_id}">编辑</s:a>&nbsp;&nbsp;
     </td>
     </s:if>
   </tr> 
   </s:iterator>
   </s:if>
   <s:else>
   <tr>
     <td height="60" colspan="12" align="center"><b>&lt;不存在通讯录信息&gt;</b></td>
   </tr>
   </s:else>
   
</table>
<jsp:include page="page.jsp"></jsp:include>
</form> 
</body>
</html>