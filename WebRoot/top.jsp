<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")=="")
{
	out.print("<script>javascript:alert('对不起，您已超时或未登陆,请在IE中重新打开登陆！');window.parent.location.href='login.jsp';</script>");
	out.close();
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>无标题文档</TITLE><script language="javascript" src="images/qkjs.js"></script>


<style type="text/css">
<!--
.STYLE1 {color: #F8FCFF}
body {margin: 0px 0px 0px 0px; }
A:link {
	font-size:12px;
    color: #2f2f2f;
	text-decoration: none;
}
A:visited {
	font-size:12px;
    color: #2f2f2f;
	text-decoration: none;
}
A:hover { 
	font-size:12px;
	color: #FF6600;
	text-decoration: none;
}
-->
</style>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></HEAD>
<body topmargin="0">
 <table width="100%" height="84" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="94" background="images/hsg1.gif"  class="top"><a href="logout.jsp" target="_parent"></a></td>
    <td background="images/hsg3.gif"  class="top"><div style="font-family:宋体; color:#FF6600; WIDTH: 100%; FONT-WEIGHT: bold; FONT-SIZE: 28pt; margin-top:5pt">
      <div align="left" >新闻管理系统</div>
    </div></td>
    <td width="703" background="images/hsg2.gif"  class="top"><table width="100%" height="46" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td><TABLE cellSpacing=0 cellPadding=0 width="92%" border=0>
          <TBODY>
            <TR>
              <TD height=29 align="right" style="FONT-SIZE: 12px; COLOR: #333333">当前用户:<%=request.getSession().getAttribute("username")%> [权限：<%=request.getSession().getAttribute("cx")%>]
                今天：
                <SCRIPT language=javascript>setCalendar();</SCRIPT></TD>
            </TR>
          </TBODY>
        </TABLE></td>
      </tr>
      <tr>
        <td align="right" style="padding-right:60px;"><a href="logout.jsp" target="_parent" onClick="return confirm('确定要退出?')">退出</a></td>
      </tr>
    </table></td>
  </tr>
</table>
</BODY></HTML>
