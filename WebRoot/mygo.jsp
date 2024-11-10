<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'adminyanzheng.jsp' starting page</title>
    

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
  
  <body>
  <%
if (request.getSession().getAttribute("cx").equals("员工"))
{
	response.sendRedirect("left3.jsp");
} 

if (request.getSession().getAttribute("cx").equals("注册用户"))
{
	response.sendRedirect("left2.jsp");
}
if (request.getSession().getAttribute("cx").equals("超级管理员") || request.getSession().getAttribute("cx").equals("普通管理员"))
{
	response.sendRedirect("left.jsp");
}
 %>
  </body>
</html>

