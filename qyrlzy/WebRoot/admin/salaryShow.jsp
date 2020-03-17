<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工工资信息</title>
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
   document.info.action="Admin_listSalarys.action";
   document.info.submit();
}
function excel()
{
   document.info.action="Admin_salaryExcel.action";
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
       alert("请至少选择一个要删除的员工工资！");
       return false;
    }
    if(confirm('确认删除吗!?'))
    {
       document.info.action="Admin_delSalarys.action?paramsSalary.ids="+ids;
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
  document.info.action="Admin_listSalarys.action";
  document.info.submit();
}
function ChangePage(pagenum)
{
  document.getElementById("pageNo").value=pagenum;
  document.info.action="Admin_listSalarys.action";
  document.info.submit();
}


function myfunction(){
var obj = document.getElementById("testSelect"); //定位id。
var index = obj.selectedIndex; // 选中索引。
var value = obj.options[index].value; // 选中值。
//alert(value);
   if(value==2){
   document.location.href="Admin_listSalarysAsc.action";
   }else if(value==3)
   document.location.href="Admin_listSalarysDesc.action";                     
     }
</script>
<style type="text/css">
#testSelect{
position:relative;
top:-2px;
}
.option{
color:red;
}
</style>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white;font-size:12px">员工工资管理&gt;&gt;员工工资查询</span>
</div>
<form name="info" id="info" action="Admin_listSalarys.action" method="post">
<input type="hidden" name="pageNo" id="pageNo" value="${pageNo}"/>
<table width="100%" align="center" cellpadding="0" cellspacing="0">
  <tr><td colspan="2" height="4px"></td></tr>
  <tr>
    <td width="">员工工资列表</td>
    <td width="" align="right">
            姓名：
      <input type="text" id="paramsSalary.real_name" name="paramsSalary.real_name" value="${paramsSalary.real_name}" class="inputstyle" style="width:100px;height:23px;position:relative;top:5px;"/>&nbsp;
            工资月份：
      <input type="text" id="paramsSalary.salary_month" name="paramsSalary.salary_month" value="${paramsSalary.salary_month}" class="inputstyle" style="width:100px;height:23px;position:relative;top:5px;"
				onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM'})"/>&nbsp;&nbsp;
				
      <input type="button" value="搜索" onclick="serch();" class="btn btn-primary btn-sm" style="margin-bottom:4px;"/>&nbsp;
     <s:if test="#attr.admin_type==2">
       <input type="button" value="删除" onclick="del();" class="btn btn-primary btn-sm" style="margin-bottom:4px;"/>&nbsp;
      <input type="button" value="打印" onclick="excel();" class="btn btn-primary btn-sm" style="margin-bottom:4px;"/> &nbsp;    
      <select id="testSelect" onchange="myfunction();"  style="width:100px;height:23px;position:relative;top:0px;">
       <option value="1" class="option">选择排序方式</option>
       <option value="2" class="option">按绩效升序</option>
       <option value="3" class="option">按绩效降序</option>
       </select>  &nbsp;         
      </s:if>
    </td>
  </tr> 
</table>
<table width="100%" align="center" class="table table-striped table-bordered" cellpadding="0" cellspacing="0">
<thead >
   <tr >
     <s:if test="#attr.admin_type==2">
     <th style="text-align:center;vertical-align:middle;width:40px;"><input type="checkbox" onclick="CheckAll(this);" style="vertical-align:text-bottom;" title="全选/取消全选" /></td>
     </s:if>
     <th style="text-align:center;vertical-align:middle;">姓名</th>
     <th style="text-align:center;vertical-align:middle;">工资月份</th>
     <th style="text-align:center;vertical-align:middle;">底薪</th>
     <th style="text-align:center;vertical-align:middle;">补助</th>
     <th style="text-align:center;vertical-align:middle;">保险</th>
     <th style="text-align:center;vertical-align:middle;">养老金</th>
     <th style="text-align:center;vertical-align:middle;">住房公积金</th>
     <th style="text-align:center;vertical-align:middle;">考勤奖</td>
     <th style="text-align:center;vertical-align:middle;">绩效</th>
     <th style="text-align:center;vertical-align:middle;">克扣</th>
     <th style="text-align:center;vertical-align:middle;">工资总计</th>
     <th style="text-align:center;vertical-align:middle;">备注</th>
     <s:if test="#attr.admin_type==2">
     <th style="text-align:center;vertical-align:middle;">操作</th>
     </s:if>
   </tr>
   </thead>
   <tbody>
   <s:if test="#attr.salarys!=null && #attr.salarys.size()>0">
   <s:iterator value="#attr.salarys" id="salary" status="status">
   <tr onmouseover="tr_mouseover(this)" onmouseout="tr_mouseout(this)" align="center"> 
     <s:if test="#attr.admin_type==2">
     <td ><s:checkbox name="chkid" fieldValue="%{#salary.salary_id}" cssStyle="vertical-align:text-bottom;"/></td>
     </s:if>
     <td ><s:property value="#salary.real_name"/></td>
     <td ><s:property value="#salary.salary_month"/></td> 
     <td ><s:property value="#salary.salary_basic"/></td> 
     <td ><s:property value="#salary.salary_subsidy"/></td>
     <td ><s:property value="#salary.salary_baoxian"/></td> 
     <td ><s:property value="#salary.salary_yanglao"/></td> 
     <td ><s:property value="#salary.salary_zhufang"/></td>  
     <td ><s:property value="#salary.salary_attendDesc"/></td> 
     <td  style="color:red"><s:property value="#salary.salary_award"/></td> 
     <td ><s:property value="#salary.salary_punish"/></td> 
     <td ><s:property value="#salary.salary_money"/></td> 
     <td ><s:property value="#salary.salary_note"/></td> 
     <s:if test="#attr.admin_type==2">
     <td width="" align="center">
       <s:a href="Admin_editSalary.action?paramsSalary.salary_id=%{#salary.salary_id}">编辑</s:a>&nbsp;&nbsp;
     </td>
     </s:if>
   </tr> 
   </s:iterator>
   </s:if>
   <s:else>
   <tr>
     <td height="60" colspan="13" align="center"><b>&lt;不存在员工工资信息&gt;</b></td>
   </tr>
   </s:else>
   </tbody>
</table>
<jsp:include page="page.jsp"></jsp:include>
</form> 

</body>
</html>