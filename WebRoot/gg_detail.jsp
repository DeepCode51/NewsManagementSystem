<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

 <%
  String id=request.getParameter("id");

  connDbBean.hsgexecute("update xinwentongzhi set dianjilv=dianjilv+1 where id="+id);
%>

<!DOCTYPE html>
<html>
<head>

<title>助学新版</title>

<LINK type="text/css" rel=stylesheet href="qtimages/style.css">
<script type="text/javascript" src="qtimages/jquery.js"></script>
<script type="text/javascript" src="qtimages/arrow.js"></script>
<script type="text/javascript" src="qtimages/inc.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
<body>
<jsp:include page="qttop.jsp"></jsp:include>
<div class="section">
  <div class="kcBox clear-fix">
    <div class="knowList3 clear-fix">
      <div class="Ttitle">内容详细 <span>Details</span>
        <div class="Tmore">  </div>
      </div>
      <!-- end Ttitle-->
      <ul class="knowListUl2">
	  <font color="#000000">
	                           <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#FA8A89" class="newsline" style="border-collapse:collapse">
                          <tr>
                            <td height="46" align="center" ><font style="color:#e0b508; font-size:18px;font-weight:bold" >${xinwentongzhi.biaoti} (被访问${xinwentongzhi.dianjilv }次)</font> </td>
                          </tr>
                          <tr>
                            <td height="110" align="left">${xinwentongzhi.neirong }</td>
                          </tr>
                          <tr>
                            <td height="33" align="right"><input type="button" name="Submit5" value="返回" onClick="javascript:history.back();" ></td>
                          </tr>
                        </table>
                          					</font>
    
      </ul>
      <!-- end knowListUl-->
    </div>
    <!-- end knowList-->
    <div class="contact">
      <div class="numTel">400-0000-000</div>
      <dl>
        <dt>手&nbsp;&nbsp;&nbsp;机：</dt>
        <dd>12312312312</dd>
      </dl>
      <dl>
        <dt>电&nbsp;&nbsp;&nbsp;话：</dt>
        <dd>0000-00000000</dd>
      </dl>
      <dl>
        <dt>邮&nbsp;&nbsp;&nbsp;箱：</dt>
        <dd>aaaaaaaa@aa.com</dd>
      </dl>
      <dl>
        <dt>地&nbsp;&nbsp;&nbsp;址：</dt>
        <dd>xxxxxxxxxxxxxxxxxxxx</dd>
      </dl>
	  <dl>
        <dt>联系人：</dt>
        <dd>何总</dd>
      </dl>
      <div class="conMore"><a href="">更多 +</a></div>
    </div>
    <!-- end contact-->
  </div>
  <!-- end kcBox-->
</div>

<jsp:include page="qtdown.jsp"></jsp:include>
</body>
</html>
