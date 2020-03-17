<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'index.jsp' starting page</title>
  </head>
  <body>
    <s:form action="sendTextMail" namespace="/admin">
        收件人邮箱:<s:textfield name="to" label="收件人邮箱:"></s:textfield><br>
     QQ号码 :  <s:textfield name="qq" label="QQ号码"></s:textfield>
       QQ密码 <s:password name="password" label="QQ密码"></s:password>
       主题 <s:textfield name="subject" label="主题"></s:textfield>
       内容 <s:textarea name="content" label="内容" rows="5"></s:textarea>
       发送 <s:submit value="发送"></s:submit>
    </s:form>
  </body>
</html>