<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.util.db"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>



<!DOCTYPE html>
<html>
<head>

<title>新闻管理系统</title>

<LINK type="text/css" rel=stylesheet href="qtimages/style.css">
<script type="text/javascript" src="qtimages/jquery.js"></script>
<script type="text/javascript" src="qtimages/arrow.js"></script>
<script type="text/javascript" src="qtimages/inc.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
<body>
<jsp:include page="qttop.jsp"></jsp:include>

<div class="section">
  <div class="company clear-fix">
    <div class="Ttitle">关于我们 <span>about us</span>
      
    </div>
    <!-- end Ttitle-->
    <div class="companyCon">
      <div class="companyPic"><img src="qtimages/about.jpg" alt="" width="190" height="190" class="PicAuto"></div>
      <div class="companyConFont"> <span>关于我们</span>
	  <%=connDbBean.readzd("dx","content","leibie","关于我们")%>
	  </div>
      <!-- end companyConFont -->
    </div>
    <!-- end companyCon -->
  </div>
  
  <!-- end company -->
</div>


<c:forEach items="${fenlei }" var="f">
<div class="section ">
  <div class="TtitleBox">
    <div class="Ttitle">${f.fenlei } 
      <div class="Tmore"> <a href="javascript:;" onclick="goXinwenList('${f.fenlei }')">查看更多 +</a> </div>
    </div>
    <!-- end Ttitle-->
  
  </div>
  <!-- end TtitleBox-->
  
  
  
  <div class="casebg">
    <div id="casePicUlId">
      <div class="casePicUlIdBox htmlpic1">
        <ul class="casePicUl">
          <c:forEach items="${xinwenList }" var="x">
          <c:if test="${x.fenlei == f.fenlei }">
          	<c:forEach items="${x.list }" var="t">
	          <li>
	            <div class="title">${t.biaoti }</div>
	            <div class="pic">
	            <img src="${t.tupian }" alt="" width="219" height="170" class="PicAuto"></div>
	            <div class="intro">${t.miaoshu }</div>
	            <div class="more"><a href="xwnrDetail.do?id=${t.id }">详情+</a></div>
	          </li>
	         </c:forEach>
          </c:if>
          </c:forEach>
		</ul>
      </div>
      <!-- end casePicUlId-->
      <!-- end casePicUlId-->
    </div>
    <!-- end casePicUlIdBox-->
  </div>
  <!-- end casePic-->
</div>
</c:forEach>



<jsp:include page="qtdown.jsp"></jsp:include>
<!-- end footer-->
</body>
</html>
