<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>员工转正分步步骤</title>

<link rel="stylesheet" type="text/css" href="css/jquery.step.css" />

<script src="js/jquery.min.js"></script>
<script src="js/jquery.step.min.js"></script>

<style>
button {
	display: inline-block;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	text-align: center;
	cursor: pointer;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #fff;
	background-color: #5bc0de;
}

.main {
	width: 1000px;
	margin: 100px auto;
}

#step {
	margin-bottom: 60px;
}

.btns {
	float: left;
}

.info {
	float: left;
	height: 34px;
	line-height: 34px;
	margin-left: 40px;
	font-size: 28px;
	font-weight: bold;
	color: #928787;
}

.info span {
	color: red;
}
</style>
</head>

<body>

<div class="main">
	<div id="step"></div>
	<div class="btns">
	</div>
	<div class="info">目前状态：<span id="index"></span></div>
</div>

<script type="text/javascript">
	var $step = $("#step");
	var $index = $("#index");

	$step.step({
		index: 0,
		time: 500,
		title: ["发起转正申请", "部门同意", "经理同意", "总部同意", "转正完成"]
	});
	$(document).ready(function(){
	for(var i=0;i<1;i++){$step.nextStep();
	}	$index.text("转正申请正在审核中。");
	});
</script>

</body>
</html>