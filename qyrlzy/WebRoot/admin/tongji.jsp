<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jquery 图表插件可编辑表格生成走势图jquery 图表统计数据</title>
<meta name="description" content="jquery 图表插件制作生成产品趋势图走势图等。jquery表格可编辑自动生成走势图，统计产品数据等。jquery下载。" />
<link href="css/basic.css" type="text/css" rel="stylesheet" />
<link href="css/visualize.css" type="text/css" rel="stylesheet" />
<link href="css/visualize-dark.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/excanvas.js"></script>
<script type="text/javascript" src="js/visualize.jQuery.js"></script>
<script type="text/javascript">
$(function(){	
	$('table').visualize({type: 'pie',  width: '370px'});
	$('table').visualize({type: 'bar', width: '370px'});
	$('table').visualize({type: 'area', width: '370px'});
	$('table').visualize({type: 'line', width: '370px'});
	
	$('table td')
		.click(function(){
			if( !$(this).is('.input') ){
				$(this).addClass('input')
					.html('<input type="text" value="'+ $(this).text() +'" />')
					.find('input').focus()
					.blur(function(){
						//remove td class, remove input
						$(this).parent().removeClass('input').html($(this).val() || 0);
						//update charts	
						$('.visualize').trigger('visualizeRefresh');
					});					
			}
		})
		.hover(function(){ $(this).addClass('hover'); },function(){ $(this).removeClass('hover'); });
});
</script>
<style type="text/css">
table{float:left;margin:140px 40px 0 0;}
td input{border:1px solid orange;background:yellow;-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px;position:absolute;padding:8px 0;text-align:center;width:60px;margin:-17px 0 0 4px;font-size:1.4em;}
td.input{padding:0;position:relative;}
.visualize{float:left;}
.demo{width:980px;margin:0 auto;}
.demo .btndemo{display:inline-block;height:30px;line-height:30px;padding:0 12px;margin:0 20px;font-size:14px;background:#ddd;color:#fff;text-decoration:none;}
</style>
</head>
<body>

<div class="demo">
	<table style="width:100%;margin:40px 0 0 0;">
		<caption>2019年企业人事信息统计</caption>
		<thead>
			<tr>
				<td></td>
				<th scope="col">全勤</th>
				<th scope="col">离职</th>
				<th scope="col">转正</th>
				<th scope="col">奖励</th>
				<th scope="col">惩罚</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">软件部</th>
				<td>90%</td>
				<td>${a2}%</td>
				<td>${e1 }%</td>
				<td>30%</td>
				<td>10%</td>
			</tr>
			<tr>
				<th scope="row">市场部</th>
				<td>80%</td>
				<td>${b2}%</td>
				<td>${e2 }%</td>
				<td>34%</td>
				<td>17%</td>
			
			</tr>
			<tr>
				<th scope="row">人事部</th>
				<td>86%</td>
				<td>${d2}%</td>
				<td>${e3 }%</td>
				<td>45%</td>
				<td>9%</td>
			
			</tr>
			<tr>
				<th scope="row">财务部</th>			    
				<td>93%</td>
				<td>${c2 }%</td>
				<td>${e4 }%</td>
				<td>10%</td>
				<td>10%</td>
			</tr>		
		</tbody>
	</table>
</div>

</body>
</html>