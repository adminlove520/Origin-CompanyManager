<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>头部页面</title>
<link type="text/css" href="css/style.css" rel="stylesheet" />
<script language="javascript" type="text/javascript" src=""></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript"> 
$(document).ready(function(){
	 
	 $("#logOut").bind('click',function(){
		if(confirm("确认退出？")){
			window.parent.location.href="LoginOutSystem.action";
		}
		 
	 });
	
});	 
	
</script>
</head>

<body>
<div class="top">
	<div class="top1">
    	<div class="logo">
			<IMG src="images/logo3.png" width="480"/>
		</div>
        <div class="top_info"><img src="images/zxtb.gif" style="border:0px;vertical-align:middle"/>&nbsp;&nbsp;<a id="logOut" href="#">退出系统</a></div>
    </div>
    <div class="top2">
    <!--设置时间js获取 -->
    	<div class="shijian" id="timeDiv"></div>
    	  <c:if test="${admin_type=='2'}">
        <div class="user">${power8?'超级管理员-':'管理员-'} ${admin.real_name}&nbsp;&nbsp;当前在线人数：<b>${applicationScope.count }</b></div>
        </c:if>
        <c:if test="${admin_type=='1'}">
         <div class="user">员工- ${admin.real_name}&nbsp;&nbsp;当前在线人数：<b>${applicationScope.count }</b></div>
         </c:if>
    </div>
</div>
</body>
</html>
<script language="javascript">
function calender()
{
 var time=new Date();
 var year=time.getFullYear();
 var month=toPair(time.getMonth()+1);
 var day=toPair(time.getDate());
 var hour=toPair(time.getHours());
 var minute=toPair(time.getMinutes());
 var second=toPair(time.getSeconds());
 var dateweek;

switch(time.getDay())
{
	case 0:dateweek = "星期日";break;
	case 1:dateweek = "星期一";break;
	case 2:dateweek = "星期二";break;
	case 3:dateweek = "星期三";break;
	case 4:dateweek = "星期四";break;
	case 5:dateweek = "星期五";break;
	case 6:dateweek = "星期六";break;
}

 var timeDiv = document.getElementById('timeDiv');
 timeDiv.innerHTML = "今天是："+year+"年"+month+"月"+day+"日　"+hour+":"+minute+":"+second+"　"+dateweek;
 var mytime=setTimeout("calender()",1000);//每一秒更新时间
}

calender();

function toPair(str){
	if(Number(str)<10){
		return "0"+str;
	}else{
		return str;
	}
}
</script>
