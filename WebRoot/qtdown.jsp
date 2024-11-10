<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>


<div class="footer">
  <div class="linkBox">
    <div class="link">
      <div class="linkTitle">友情链接</div>
      <div class="link_list"> 
	  <%
			String sqlyqlj="select  * from youqinglianjie   order by id desc limit 0,5";
			ResultSet RS_resultyqlj=connDbBean.executeQuery(sqlyqlj);
while(RS_resultyqlj.next())
{
		%>
	  <a href="<%=RS_resultyqlj.getString("wangzhi")%>" target="_blank"><%=RS_resultyqlj.getString("wangzhanmingcheng")%></a>
	  
	   <%
								  }
								  %>
					   </div>
      <!-- end link_list-->
      <div class="clear"></div>
    </div>
    <!-- end link-->
  </div>
  <!-- end linkBox-->
  <div class="btnav">
    <div class="btnavlist"> <a href="">网站首页</a>　 |　 <a href="">关于我们</a> 　 |　 <a href="">新闻资讯</a> 　 |　 <a href="">服务项目</a> 　 |　 <a href="">荣誉资质</a> 　 |　 <a href="">案例展示</a> 　 |　 <a href="">人才招聘</a> 　 |　 <a href="">客户留言</a> 　 |　 <a href="">联系我们</a> </div>
    <!-- end btnavlist-->
  </div>
  <!-- end btnav-->
  <div class="copyrightnr"> 地址：xxxxxxxxxxxxx　　电话：0000-00000000　　手机：12312312312<br />
    版权所有：新闻管理系统 　　ICP备********号</a> </div>
  <!-- end copyrightnr-->
  <div class="fixed"><a href="javascript:;" title="二维码" class="codepic"></a> <a href="javascript:;" title="返回顶部" class="backup"></a>
    <div> <img src="qtimages/ewm.png" class="code" alt="" width="196" height="196" /> </div>
  </div>
</div>