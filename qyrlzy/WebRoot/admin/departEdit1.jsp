<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>所见即所得jQuery文本编辑器</title>

<link rel="stylesheet" type="text/css" href="bootstrap-3.3.5/css/bootstrap.min.css"></link>
<link rel="stylesheet" type="text/css" href="bootstrap-3.3.5/css/bootstrap-theme.min.css"></link>
<link rel="stylesheet" type="text/css" href="dist/bootstrap3-wysihtml5.min.css"></link>
<link rel="stylesheet" type="text/css" href="css/default.css">
<style type="text/css" media="screen">
  .btn.jumbo {
	font-size: 20px;
	font-weight: normal;
	padding: 14px 24px;
	margin-right: 10px;
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
	border-radius: 6px;
  }
</style>

</head>
<body>

<div class="container">
		
		<hr style="border-color: white"/>
		<textarea class="textarea" placeholder="Enter text ..." style="width: 70%; height: 80px; font-size: 14px; line-height: 18px;"></textarea>
</div>

<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script src="dist/bootstrap3-wysihtml5.all.min.js"></script>
<script type="text/javascript" src="dist/locales/bootstrap-wysihtml5.zh-CN.js"></script>
<script>
$('.textarea').wysihtml5({locale: "zh-CN"});
</script>

</body>
</html>