<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="code" scope="page" class="com.util.CheckCode" />
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />
		<title>新闻管理系统</title>
		<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">
	function hsgchecklogin() {
			if(document.f11.username.value=="" || document.f11.pwd.value=="" || document.f11.pagerandom.value=="")
	{
		alert("请输入完整");
		return false;
	}
	if (document.f11.pagerandom.value != document.f11.yzm.value) {
			alert("验证码错误！");
			document.f11.pagerandom.focus();
			return false;
	}
	
	}
	</script>


	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #080808;	
	
}
.STYLE2 {color: #FFFFFF; }
.STYLE3 {color: #FFFFFF; font-size: 12px; }

-->
</style><body>
		<p>&nbsp;</p>
<table width="1024" height="709" border="0" align="center" cellpadding="0" cellspacing="0" background="images/hsgbg.jpg">
  <tr>
    <td height="83" valign="bottom"><p>&nbsp;</p></td>
  </tr>
  <tr>
    <td valign="top"  background="images/hsglogin.jpg"><table width="452" height="424" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="114" ><table width="72%" height="51" border="0" align="center">
          <tr>
            <td align="center"><div style="font-family:宋体; color:#FFFFFF;  WIDTH: 100%; FONT-WEIGHT: bold; FONT-SIZE: 28px; margin-top:5pt"> 新闻管理系统 </div></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="123" ><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="91">&nbsp;</td>
          </tr>
          <tr>
            <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="52%"><table width="56%" border="0" align="right" cellpadding="0" cellspacing="0">
                      <form name="f11" id="f11" method="post" action="hsgloginyanzheng.jsp">
                        <tr>
                          <td width="18%" height="30"><div align="center" class="STYLE3">用&nbsp;&nbsp;户</div></td>
                          <td height="30" colspan="2"><input name="username" type="text" id="username"  style="height:20px; width:130px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;">
                              <input name="login" type="hidden" id="login" value="1"></td>
                          </tr>
                        <tr>
                          <td height="30"><div align="center" class="STYLE3">密&nbsp;&nbsp;码</div></td>
                          <td height="30" colspan="2"><input name="pwd" type="password" id="pwd"  style="height:20px; width:130px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;"></td>
                          </tr>
                        <tr>
                          <td height="30"><div align="center" class="STYLE3">权&nbsp;&nbsp;限</div></td>
                          <td height="30" colspan="2"><select name="cx" id="cx" style="height:18px; width:130px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;">
                              <option value="管理员">管理员</option>
                              <option value="新闻发布">新闻发布</option>                              <!--quxanxiaxndexnglxu-->
                            </select>							</td>
                          </tr>
                        <tr>
                          <td height="30"><div align="center" class="STYLE3">验证码</div></td>
                          <td width="15%" height="30"><INPUT class=input_new id=pagerandom size=5 maxlength="4" name=pagerandom onKeyUp="this.value=this.value.replace(/\D/gi,'')" style="width:50px; height:20px; border:solid 1px #000000; color:#666666"/></td>
                          <td width="46%"><%
								String yzm=code.getCheckCode();
								%>  <input type="hidden" name="yzm" id="yzm" value="<%=yzm %>" >
								  <font class="STYLE3"><%=yzm %></font></td>
                        </tr>
                        <tr>
                          <td height="30">&nbsp;</td>
                          <td height="30"><input type="submit" name="Submit" value="登陆" onClick="return hsgchecklogin();"></td>
                          <td><input type="reset" name="Submit2" value="重置"></td>
                        </tr>
                      </form>
                  </table></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>

	</body>
</html>
