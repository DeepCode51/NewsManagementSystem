<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<html>
  <head>
    <title>新闻内容详细</title>
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>

  </head>

  <body >

  新闻内容详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CBD8AC" style="border-collapse:collapse">  
   <tr>
     <td width='11%' height=44>新闻分类：</td><td width='39%'>${xinwenneirong.xinwenfenlei}</td><td  rowspan=4 align=center><a href=${xinwenneirong.tupian} target=_blank><img src=${xinwenneirong.tupian} width=228 height=215 border=0></a></td></tr><tr><td width='11%' height=44>标题：</td><td width='39%'>${xinwenneirong.biaoti}</td></tr><tr><td width='11%' height=44>点击率：</td><td width='39%'>${xinwenneirong.dianjilv}</td></tr><tr><td width='11%' height=44>添加人：</td><td width='39%'>${xinwenneirong.tianjiaren}</td></tr><tr><td width='11%' height=100  >内容：</td><td width='39%' colspan=2 height=100 >${xinwenneirong.neirong}</td></tr><tr><td width='11%' height=100  >描述：</td><td width='39%' colspan=2 height=100 >${xinwenneirong.miaoshu}</td></tr><tr><td colspan=3 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>

