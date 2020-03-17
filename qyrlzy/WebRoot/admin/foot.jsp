<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>返回顶部</title>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";
	margin:0px; 
	padding:0px;
	background:url(images/main_bg.jpg) no-repeat bottom right #fff;
}
table tr td{ 
	font-size:12px; 
	font-family:Arial, Helvetica, sans-serif;
}
/* leftsead */
#leftsead{width:131px;height:143px;position:fixed;top:258px;right:0px;}
*html #leftsead{margin-top:258px;position:absolute;top:expression(eval(document.documentElement.scrollTop));}
#leftsead li{width:131px;height:53px;}
#leftsead li img{float:right;border-bottom-left-radius:5px;border-top-left-radius:5px;}
#leftsead li a{height:49px;float:right;display:block;min-width:47px;max-width:131px;}
#leftsead li a .shows{display:block;}
#leftsead li a .hides{margin-right:-166px;cursor:pointer;cursor:hand;}
#leftsead li a.youhui .hides{display:none;position:absolute;right:216px;top:2px;}
</style>

</head>

<body >


<table width="100%" border="0" cellspacing="0" cellpadding="0" height="500px">
  <tr>
    <td height="23">&nbsp;</td>
  </tr>
  <tr>
    <td height="35" valign="bottom" style="background:url(images/right_top.gif) no-repeat 30px center;"><p style="font-size:16px; font-weight:bold; text-align:left; padding-left:90px; font-family:Arial, Helvetica, sans-serif; color:#016597;">企业人事信息管理系统</p></td>
  </tr>
  <tr>
    <td align="left" valign="top"><p style="padding-left:60px; padding-top:15px; text-indent:2em; line-height:24px; padding-right:30px; color:#016597;">本系统是对企业人力资源信息进行管理的一款综合平台。主要实现了以下功能：管理员信息维护、员工信息管理、部门信息管理、离职人员管理、员工工资管理、员工培训管理、员工奖惩管理、员工通讯录管理等。</p></td>
  </tr>
</table>

<div id="leftsead">
	<ul>
	     <li>
			<a id="top_btn">
				<img src="images/foot03/ll06.png" width="47" height="49" class="hides"/>
				<img src="images/foot03/l06.png" width="47" height="49" class="shows" />
			</a>
		</li>

		<li>
			<a href="http://web2.qq.com/">
				<img src="images/foot03/ll03.png"  width="47" height="49" class="hides"/>
				<img src="images/foot03/l03.png" width="47" height="49" class="shows" />
			</a>
		</li>

		<li>
			<a href="">
					<img src="images/foot03/ll02.png" width="166" height="49" class="hides"/>
				<img src="images/foot03/l04.png" width="47" height="49" class="shows" />
			</a>
		</li>

		<li>
			<a class="youhui">
				<img src="images/foot03/l02.png" width="47" height="49" class="shows" />
				<img src="images/foot03/zfe.jpg" width="196" height="205" class="hides" usemap="#taklhtml"/>
			</a>
		</li>
	
	
	
	</ul>
</div><!--leftsead end-->


<script type="text/javascript">
$(document).ready(function(){

	$("#leftsead a").hover(function(){
		if($(this).prop("className")=="youhui"){
			$(this).children("img.hides").show();
		}else{
			$(this).children("img.hides").show();
			$(this).children("img.shows").hide();
			$(this).children("img.hides").animate({marginRight:'0px'},'slow'); 
		}
	},function(){ 
		if($(this).prop("className")=="youhui"){
			$(this).children("img.hides").hide('slow');
		}else{
			$(this).children("img.hides").animate({marginRight:'-143px'},'slow',function(){$(this).hide();$(this).next("img.shows").show();});
		}
	});

	$("#top_btn").click(function(){if(scroll=="off") return;$("html,body").animate({scrollTop: 0}, 600);});

});
</script>
</body>
</html>
