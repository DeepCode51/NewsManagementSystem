<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>

<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<jsp:useBean id="code" scope="page" class="com.util.CheckCode" />

<style>
table td ,table th{
	color:#000000;
}
</style>
<script>
	function goXinwenList(name)
	{
		location.href="xwnrList.do?xinwenfenlei="+encodeURIComponent(name);
	}
</script>
<div class="header">
  <div class="ntbg">
    <div class="ntbd">
      <div class="notice">
        <div class="title">网站公告：</div>
        <div class="noticenr">
          <marquee  onmouseover="this.stop()" onMouseOut="this.start()" scrollamount="2"  >
          诚信为本：市场在变，诚信永远不变...
          </marquee>
        </div>
      </div>
      <!-- end notice-->
      <div class="toptel">
	  
	   <%
    if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")==""){
     %>
                  <table height="30" border="0" cellpadding="0" cellspacing="0">
                    <form action="hsgloginyanzheng.jsp" method="post" name="userlog" id="userlog" >
                      <tr>
                        <td  height="30" align="left" >用户名
                          <input name="username" type="text" id="username" size="10" style=" height:19px; border:solid 1px #000000; color:#666666" />
                          
                          <input name="pwd" type="password" id="pwd" size="10" style=" height:19px; border:solid 1px #000000; color:#666666" />
                          权限 
                            <select name="cx" id="cx" style="width:80px; height:20px; border:solid 1px #000000; color:#666666" >
                              <option value="注册用户">注册用户</option>
                              <option value="新闻发布">新闻发布</option>
                            </select>
                          
                          <input name="pagerandom" type="text" id="pagerandom" style=" height:20px; border:solid 1px #000000; color:#666666; width:50px" /></td>
                        <td align="left" style=" padding-left:3px; padding-right:3px;" ><%
								String yzm=code.getCheckCode();
								%>  <input type="hidden" name="yzm" id="yzm" value="<%=yzm %>" >
								   <%=yzm %></td>
                        <td align="left"><input type="submit" name="Submit3" value="登陆" style=" border:solid 1px #000000; color:#666666; width:60px; height:20px;" onclick="return checklog();" />
                            <input type="button" name="Submit3" value="找回密码" onclick="javascript:location.href='zmm.jsp';" style=" border:solid 1px #000000; color:#666666;width:60px; height:20px; display:none" /></td>
                      </tr>
                    </form>
					<script type="text/javascript">
       
function checklog()
{
	if(document.userlog.username.value=="" || document.userlog.pwd.value=="" || document.userlog.pagerandom.value=="")
	{
		alert("请输入完整");
		return false;
	}
	if (document.userlog.pagerandom.value != document.userlog.yzm.value) {
			alert("验证码错误！");
			document.userlog.pagerandom.focus();
			return false;
	}
	
}
           
                                  </script>
                  </table>
                  <%
							}
				  else
				  {
				 %>
                  <table height="30" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="30" align="left" valign="middle">用户名:<%=request.getSession().getAttribute("username")%>；您的权限: <%=request.getSession().getAttribute("cx")%>
                          <input type="button" name="Submit2" value="退出" onclick="location.href='logout.jsp';"  style=" border:solid 1px #000000; color:#666666; width:60px; height:20px;" />
                          <input type="button" name="Submit2" value="个人后台" onclick="location.href='main.jsp';"  style=" border:solid 1px #000000; color:#666666; width:60px; height:20px;" /></td>
                    </tr>
                  </table>
                  <%
				 }
				 %>
				 
	  </div>
      <!-- end toptel-->
    </div>
    <!-- end ntbd-->
  </div>
  <!-- end ntbg-->
  <div class="top">
    <div class="logo"><img src="qtimages/hsglogo.gif" alt="" > &nbsp;新闻管理系统</div>
    <!-- end logo-->
    <div class="search">
      <form id="search" name="search" method="get" action="xwtzList.do">
        <input type="text" class="text" placeholder="请输入搜索关键词" name="biaoti" id="biaoti"   />
        <input class="btnsubmit" type="submit" value="" >
      </form>
    </div>
    <!-- end search-->
  </div>
  <!-- end top-->
  <div  class="navgrp">
    <ul class="nav" id="nav">
      <li class="cur"><a href="index.do">网站首页</a></li>
      
      <li><a href="javascript:goXinwenList('财经');">财经</a> </li>
      <li><a href="javascript:goXinwenList('汽车');">汽车</a> </li>
      <li><a href="javascript:goXinwenList('体育');">体育</a> </li>
      <li><a href="javascript:goXinwenList('游戏');">游戏</a> </li>
      <li>
	      <a>用户注册</a>
	      <div id="navChild"> 
	      	<a href="userreg.jsp">用户注册</a> 
	      	<a href="xinwenfabuadd.jsp">新闻发布注册</a>
	      </div>
      </li>
      
      
      <li><a href="dx_detail.jsp?lb=系统简介">系统简介</a> </li>
        <!--
	  <li><a >在线留言</a>
      <div id="navChild"> <a href="lyb.jsp">我要留言</a> <a href="lybList.do">查看留言</a> </div>
      </li>
        -->
	   <li><a href="login.jsp">后台管理</a> </li>
    </ul>
  </div>
  <!-- end navgrp-->
  <div class="banner"  style=" height:450px">
	<ul class="slides">
	<%
		
			String sqlbht="select  shouyetupian from xinwentongzhi where leibie='bht'  order by id desc limit 0,5";
			ResultSet RS_resultbht=connDbBean.executeQuery(sqlbht);
while(RS_resultbht.next())
{

		%>
		<li style="background:url(<%=RS_resultbht.getString("shouyetupian")%>) 50% 0 no-repeat; height:450px"></li>
		<%
		}
		%>
	</ul>
  </div>
    <script src="qtimages/jquery.flexslider-min.js"></script>
    <script>
    $(function(){
        $('.banner').flexslider({
            directionNav: true,
            pauseOnAction: false
        });
    });
    </script>
  <!--<div class="claListBox">
    <div class="claListList">
      <div class="claListTitle">推荐项目</div>
      <ul class="claListUlList">
        <li><a href="" class="claListUlListHover">职业保姆</a></li>
        <li><a href="" class="claListUlListHover">涉外保姆</a></li>
        <li><a href="" class="claListUlListHover">育婴早教 </a></li>
        <li><a href="" class="claListUlListHover">幼教保育</a></li>
        <li><a href="" class="claListUlListHover">家教外教</a></li>
        <li><a href="" class="claListUlListHover">高级管家</a></li>
	   
      </ul>
    </div>
  </div>-->
  <!-- end claListBox-->
</div>
<!-- end header-->