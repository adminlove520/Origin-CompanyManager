<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>手风琴菜单</title>
	
	
    <script src="js/adapter.js"></script> <!--rem适配js-->
	
    <link rel="stylesheet" href="css/base1.css"> <!--初始化文件-->
    <link rel="stylesheet" href="css/menu.css"> <!--主样式-->

</head>
<body>

<div id="menu">
    <!--隐藏菜单-->
    <div id="ensconce">
        <h2>
            <img src="images/show.png" alt="">
            企业人事信息管理系统
        </h2>
    </div>
  <c:if test="${power8}">
   <div id="open">
        <div class="navH">
            企业人事
            <span><img class="obscure" src="images/obscure.png" alt=""></span>
        </div>
        <div class="navBox">
            <ul>
             <li>
                    <h2 class="obtain">个人信息中心<i></i></h2>
                    <div class="secondary">
                        <h3><a href="modifyInfo.jsp" target="MainFrame">个人信息</a></h3>
                        <h3><a href="modifyPwd2.jsp" target="MainFrame">修改密码</a></h3>              
                    </div>
                </li>          
                  <li>
                    <h2 class="obtain">用户信息管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="manager_listManagers.action" target="MainFrame">管理员查询</a></h3>
                       <h3><a href="manager_addManagerShow.action" target="MainFrame">添加管理员</a></h3>               
                    </div>
                </li>

                <li>
                    <h2 class="obtain">部门信息管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="Admin_listDeparts.action" target="MainFrame">部门查询</a></h3>
                        <h3><a href="Admin_addDepartShow.action" target="MainFrame">添加部门</a></h3>                
                    </div>
                </li>
                <li>
                    <h2 class="obtain">在职员工管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="Admin_listUsers.action" target="MainFrame">在职员工查询</a></h3>
                        <h3><a href="Admin_addUserShow.action" target="MainFrame">新增在职员工</a></h3>
                    </div>
                </li>                             
                <li>
                    <h2 class="obtain">离职员工管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="Admin_listUsers2.action" target="MainFrame">离职员工查询</a></h3>
                        <h3><a href="Admin_addUserShow2.action" target="MainFrame">新增离职员工</a></h3>                                        
                    </div>
                </li>
  
                <li>
                    <h2 class="obtain">员工工资管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="Admin_listSalarys.action" target="MainFrame">员工工资查询</a></h3>
                        <h3><a href="Admin_addSalaryShow.action" target="MainFrame">新增员工工资</a></h3>                      
                    </div>
                </li>
                <li>
                    <h2 class="obtain">员工培训管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="Admin_listToachs.action" target="MainFrame">员工培训查询</a></h3>
                        <h3><a href="Admin_addToachShow.action" target="MainFrame">新增员工培训</a></h3>
                       
                    </div>
                </li>
 
                <li>
                    <h2 class="obtain">员工奖惩管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="Admin_listAwards.action" target="MainFrame">员工奖惩查询</a></h3>
                        <h3><a href="Admin_addAwardShow.action" target="MainFrame">新增员工奖惩</a></h3>
                       
                    </div>
                </li>
           
                <li>
                    <h2 class="obtain">员工通讯管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="Admin_listDirects.action" target="MainFrame">员工通讯录查询</a></h3>
                        <h3><a href="Admin_addDirectShow.action" target="MainFrame">新增员工通讯录</a></h3>                      
                    </div>
                </li> 
                 <li>
                    <h2 class="obtain">企业工作日常统计<i></i></h2>
                    <div class="secondary">
                        <h3><a href="Admin_tongji.action" target="MainFrame">企业数据统计</a></h3>                      
                    </div>
                </li>             
            </ul>
        </div>
    </div>
     </c:if>
     <c:if test="${!power8}">
    <!--管理员显示菜单   douyin:360093013 weixin:466941464-->
     <c:if test="${admin_type=='2'}">
    <div id="open">
        <div class="navH">
            企业人事
            <span><img class="obscure" src="images/obscure.png" alt=""></span>
        </div>
        <div class="navBox">
            <ul>
             <li>
                    <h2 class="obtain">个人信息中心<i></i></h2>
                    <div class="secondary">
                        <h3><a href="modifyInfo.jsp" target="MainFrame">个人信息</a></h3>
                        <h3><a href="modifyPwd2.jsp" target="MainFrame">修改密码</a></h3>              
                    </div>
                </li>
                <c:if test="${power1}">
                  <li>
                    <h2 class="obtain">用户信息管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="manager_listManagers.action" target="MainFrame">管理员查询</a></h3>
                       <h3><a href="manager_addManagerShow.action" target="MainFrame">添加管理员</a></h3>               
                    </div>
                </li>
                </c:if>
                 <c:if test="${power2}">
                <li>
                    <h2 class="obtain">部门信息管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="Admin_listDeparts.action" target="MainFrame">部门查询</a></h3>
                        <h3><a href="Admin_addDepartShow.action" target="MainFrame">添加部门</a></h3>                
                    </div>
                </li>
                </c:if>
                 <c:if test="${power3}">
                <li>
                    <h2 class="obtain">在职员工管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="Admin_listUsers.action" target="MainFrame">在职员工查询</a></h3>
                        <h3><a href="Admin_addUserShow.action" target="MainFrame">新增在职员工</a></h3>
                    </div>
                </li>                             
                <li>
                    <h2 class="obtain">离职员工管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="Admin_listUsers2.action" target="MainFrame">离职员工查询</a></h3>
                        <h3><a href="Admin_addUserShow2.action" target="MainFrame">新增离职员工</a></h3>                                        
                    </div>
                </li>
                </c:if>
                <c:if test="${power4}">
                <li>
                    <h2 class="obtain">员工工资管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="Admin_listSalarys.action" target="MainFrame">员工工资查询</a></h3>
                        <h3><a href="Admin_addSalaryShow.action" target="MainFrame">新增员工工资</a></h3>                      
                    </div>
                </li>
                </c:if>
                <c:if test="${power5}">
                <li>
                    <h2 class="obtain">员工培训管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="Admin_listToachs.action" target="MainFrame">员工培训查询</a></h3>
                        <h3><a href="Admin_addToachShow.action" target="MainFrame">新增员工培训</a></h3>
                       
                    </div>
                </li>
                </c:if>
                <c:if test="${power6}">
                <li>
                    <h2 class="obtain">员工奖惩管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="Admin_listAwards.action" target="MainFrame">员工奖惩查询</a></h3>
                        <h3><a href="Admin_addAwardShow.action" target="MainFrame">新增员工奖惩</a></h3>
                       
                    </div>
                </li>
                </c:if>
                <c:if test="${power7}">
                <li>
                    <h2 class="obtain">员工通讯管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="Admin_listDirects.action" target="MainFrame">员工通讯录查询</a></h3>
                        <h3><a href="Admin_addDirectShow.action" target="MainFrame">新增员工通讯录</a></h3>                      
                    </div>
                </li>
                </c:if>
            </ul>
        </div>
    </div>
     </c:if>
    </c:if>
   
   
    
     <!--员工显示菜单-->
     <c:if test="${admin_type=='1'}">
         <div id="open">
        <div class="navH">
            人力资源
            <span><img class="obscure" src="images/obscure.png" alt=""></span>
        </div>
        <div class="navBox">
            <ul>
             <li>
                    <h2 class="obtain">个人信息中心<i></i></h2>
                    <div class="secondary">
                        <h3><a href="modifyInfo.jsp" target="MainFrame">个人信息</a></h3>
                        <h3><a href="modifyPwd1.jsp" target="MainFrame">修改密码</a></h3>
                        <c:if test="${admin.statue==1}">
                        <h3><a href="zhuanzheng1.jsp" target="MainFrame">转正审核状态</a></h3>   
                        </c:if>
                         <c:if test="${admin.statue==2}">
                        <h3><a href="zhuanzheng2.jsp" target="MainFrame">转正审核状态</a></h3>   
                        </c:if> 
                         <c:if test="${admin.statue==3}">
                        <h3><a href="zhuanzheng3.jsp" target="MainFrame">转正审核状态</a></h3>   
                        </c:if> 
                         <c:if test="${admin.statue==4}">
                        <h3><a href="zhuanzheng4.jsp" target="MainFrame">转正审核状态</a></h3>   
                        </c:if>    
                                
                    </div>
                </li>
                <li>
                    <h2 class="obtain">员工工资管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="Admin_listSalarys.action" target="MainFrame">员工工资查询</a></h3>                     
                    </div>
                </li>
                <li>
                    <h2 class="obtain">员工培训管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="Admin_listToachs.action" target="MainFrame">员工培训查询</a></h3>             
                    </div>
                </li>
                <li>
                    <h2 class="obtain">员工奖惩管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="Admin_listAwards.action" target="MainFrame">员工奖惩查询</a></h3>
                       
                    </div>
                </li>
                <li>
                    <h2 class="obtain">员工通讯管理<i></i></h2>
                    <div class="secondary">
                        <h3><a href="Admin_listDirects.action" target="MainFrame">员工通讯录查询</a></h3>                     
                    </div>
                </li>
                <li>
                    <h2 class="obtain">员工资料上传<i></i></h2>
                    <div class="secondary">
                        <h3><a href="Admin_fileupload.action" target="MainFrame">员工资料上传</a></h3>                     
                    </div>
                </li>
                 <li>
                    <h2 class="obtain">员工转正通道<i></i></h2>
                    <div class="secondary">                    
                        <h3><a href="Admin_zhuanzheng.action" target="MainFrame">转正审核状态</a></h3>                                                         
                    </div>
                </li>
            </ul>
        </div>
    </div>
     
    </c:if>
</div>

<script src="js/menu.js"></script> <!--控制js-->
</body>
</html>