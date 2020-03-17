<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>登录</title>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/style1.css">
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script language="javascript" type="text/javascript">
	//实现验证码点击刷新
	function reloadcode(){
		var verify=document.getElementById('safecode');
		verify.setAttribute('src','Random.jsp?'+Math.random());
}
	$(document).ready(function(){
		var loginInBtn = $("#loginInBtn");
		var manager_name = $("#params\\.manager_name");
		var manager_pass = $("#params\\.manager_pass");
		var admin_type = $("#admin_type");
		var random = $("#params\\.random");
		var loginTip = $("#loginTip");
		
		loginInBtn.bind('click',function(){
			if(manager_name.val()==''||manager_pass.val()==''||random.val()==''){
				loginTip.html("用户名、密码和验证码不能为空！")
				return;
			}
			$("#info").submit();			 
		});
		
	});
</script>
</head>
<body>

    <div class="bg"></div>
    <div class="container">
        <div class="line bouncein">
            <div class="xs6 xm4 xs3-move xm4-move">
                <div style="height:90px;"></div>
                <div class="media media-y margin-big-bottom">
                </div>
                <form action="LoginInSystem.action" method="post" id="info" name="info">
                    <div class="panel loginbox">
                        <div class="text-center margin-big padding-big-top">
                            <h1>企业人事信息管理系统</h1>
                        </div>
                        <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                            <div class="form-group">
                                <div class="field field-icon-right">
                                    <input type="text" class="input input-big" name="params.manager_name" id="params.manager_name" value="${params.manager_name}" placeholder="登录账号" />
                                    <span class="icon icon-user margin-small"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="field field-icon-right">
                                    <input type="password" class="input input-big" name="params.manager_pass" id="params.manager_pass"  placeholder="登录密码" />
                                    <span class="icon icon-key margin-small"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="field field-icon-right">
                                    <select id="admin_type" name="admin_type" class="input input-big" >
                                    <option value="">用户类型</option>
									<option value="1">员工</option>
									<option value="2">管理员</option><!-- 管理员还细分为不同权限的用户 -->
								</select>
                                <span class="icon icon-user margin-small"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="field">
                                    <input type="text" class="input input-big" name="params.random" id="params.random" placeholder="填写右侧的验证码" />
                                    <img src="Random.jsp" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" title="换一张" id="safecode" onClick="reloadcode()"/>
                                </div>
                            </div>
                        </div>
                        <div id="loginTip" style="HEIGHT:22px;color:red;position:relative;left:40px;"></div>
                        <div style="padding:15px;">
                            <input type="button" id="loginInBtn" class="button button-block bg-main text-big input-big" value="登录" >
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>