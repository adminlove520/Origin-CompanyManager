<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工奖惩信息</title>
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
   document.info.action="Admin_listAwards.action";
   document.info.submit();
}
function excel()
{
   document.info.action="Admin_awardExcel.action";
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
       alert("请至少选择一个要删除的员工奖惩！");
       return false;
    }
    if(confirm('确认删除吗!?'))
    {
       document.info.action="Admin_delAwards.action?paramsAward.ids="+ids;
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
  document.info.action="Admin_listAwards.action";
  document.info.submit();
}
function ChangePage(pagenum)
{
  document.getElementById("pageNo").value=pagenum;
  document.info.action="Admin_listAwards.action";
  document.info.submit();
}
</script>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white;font-size:12px;">员工奖惩管理&gt;&gt;员工奖惩查询</span>
</div>
<form name="info" id="info" action="Admin_listAwards.action" method="post">
<input type="hidden" name="pageNo" id="pageNo" value="${pageNo}"/>
<div class="container">
<table width="100%" align="center" cellpadding="0" cellspacing="0">
  <tr><td colspan="2" height="4px"></td></tr>
  <tr>
    <td width="">员工奖惩列表</td>
    <td width="" align="right">
            姓名：
      <input type="text" id="paramsAward.real_name" name="paramsAward.real_name" value="${paramsAward.real_name}" class="inputstyle" style="width:100px;height:23px;position:relative;top:5px;"/>&nbsp;
            
            奖惩标题：
      <input type="text" id="paramsAward.award_title" name="paramsAward.award_title" value="${paramsAward.award_title}" class="inputstyle" style="width:100px;height:23px;position:relative;top:5px;"/>&nbsp;&nbsp;
        奖惩类型：
      <s:select list="#{'1':'奖励','2':'惩处'}"  id="paramsAward.award_type" name="paramsAward.award_type" value="%{#attr.paramsAward.award_type}"
      		listKey="key" listValue="value" headerKey="0" headerValue="请选择" cssClass="selectstyle"  cssStyle="width:100px;height:23px;position:relative;top:5px;">
      </s:select>&nbsp; 
      <input type="button" value="搜索" onclick="serch();" class="btn btn-primary btn-sm" style="margin-bottom:4px;"/>&nbsp;
      <s:if test="#attr.admin_type==2">
      <input type="button" value="删除" onclick="del();" class="btn btn-primary btn-sm" style="margin-bottom:4px;"/>&nbsp;
       <input type="button" value="打印" onclick="excel();" class="btn btn-primary btn-sm" style="margin-bottom:4px;"/>
      </s:if>   
    </td>
  </tr>
</table>
</div>
<div class="container">
<table width="100%" align="center" class="table table-striped table-bordered" >
<thead>
   <tr>
   
     <s:if test="#attr.admin_type==2">
     <th style="text-align:center;vertical-align:middle;width:60px;"><input type="checkbox" onclick="CheckAll(this);" style="vertical-align:text-bottom;position:relative;bottom:5px;" title="全选/取消全选"/></th>
     </s:if>     
     <th style="text-align:center;vertical-align:middle;">编号</th>
     <th style="text-align:center;vertical-align:middle;">姓名</th>
     <th style="text-align:center;vertical-align:middle;">奖惩类型</th>
     <th style="text-align:center;vertical-align:middle;">奖惩标题</th>
     <th style="text-align:center;vertical-align:middle;">奖惩时间</th>
     <th style="text-align:center;vertical-align:middle;">操作</th>
   </tr>
   </thead>
   <tbody>	
   <s:if test="#attr.awards!=null && #attr.awards.size()>0">
   <s:iterator value="#attr.awards" id="award" status="status">
   <tr onmouseover="tr_mouseover(this)" onmouseout="tr_mouseout(this)" style="text-align:center;vertical-align:middle;"> 
  
     <s:if test="#attr.admin_type==2">    
     <td><s:checkbox name="chkid" fieldValue="%{#user.user_id}" cssStyle="vertical-align:text-bottom;"/></td>
     </s:if>
     <td ><s:property value="#award.user_name"/></td>
     <td ><s:property value="#award.real_name"/></td>
     <td ><s:property value="#award.award_typeDesc"/></td> 
     <td ><s:property value="#award.award_title"/></td> 
     <td ><s:property value="#award.award_date"/></td>
     <td> 
       <s:a href="Admin_queryAward.action?paramsAward.award_id=%{#award.award_id}">查看</s:a>&nbsp;
       <s:if test="#attr.admin_type==2">
       <s:a href="Admin_editAward.action?paramsAward.award_id=%{#award.award_id}">编辑</s:a>
       </s:if>
     </td>    
   </tr> 
   </s:iterator>
   </s:if>
   <s:else>
   <tr>
     <td height="60" colspan="14" align="center"><b style="font-size:26px;">&lt;不存在员工奖惩信息&gt;</b></td>
   </tr>
   </s:else>
   </tbody>
</table>
</div>
<jsp:include page="page.jsp"></jsp:include>
</form> 
</body>
</html>