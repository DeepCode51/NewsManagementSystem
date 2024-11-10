<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<jsp:useBean id="code" scope="page" class="com.util.CheckCode" />
<%@page import="com.util.db"%>
<table id="__01" width="206" height="693" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td><img src="qtimages/1_02_01_01.gif" width="206" height="9" alt=""></td>
              </tr>
              <tr>
                <td><table id="__01" width="206" height="169" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="206" height="36" background="qtimages/1_02_01_02_01.gif"><table width="100%" height="17" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="71%" align="center" valign="bottom"><strong>系统公告</strong></td>
                        <td width="29%">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="206" height="133" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="11" background="qtimages/1_02_01_02_02_01.gif">&nbsp;</td>
                        <td width="184" height="133"><marquee border="0" direction="up" height="130" onMouseOut="start()" onMouseOver="stop()"
                scrollamount="1" scrolldelay="50"><TABLE width="92%" height="100%" 
            border=0 align=center 
      cellPadding=0 cellSpacing=5>
                      <TBODY><TR><TD><%=connDbBean.readzd("dx","content","leibie","系统公告")%>
</TD></TR></TBODY></TABLE></marquee></td>
                        <td width="11" background="qtimages/1_02_01_02_02_03.gif">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table id="__01" width="206" height="169" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="206" height="36" background="qtimages/1_02_01_02_01.gif"><table width="100%" height="17" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="71%" align="center" valign="bottom"><strong>用户登陆</strong></td>
                        <td width="29%">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="206" height="133" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="11" background="qtimages/1_02_01_02_02_01.gif">&nbsp;</td>
                          <td width="184" height="133"><%
    if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")==""){
     %>
                          <form action="hsgloginyanzheng.jsp" method="post" name="userlog" id="userlog" >
                            <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
                              <tr>
                                <td width="9" height="28">&nbsp;</td>
                                <td width="66" height="28">用户名:</td>
                                <td height="28" colspan="2"><input name="username" type="text" id="username" style="width:100px; height:20px; border:solid 1px #000000; color:#666666" /></td>
                              </tr>
                              <tr>
                                <td height="28">&nbsp;</td>
                                <td height="28">密码:</td>
                                <td height="28" colspan="2"><input name="pwd" type="password" id="pwd"  style="width:100px; height:20px; border:solid 1px #000000; color:#666666" /></td>
                              </tr>
                              <tr>
                                <td height="28">&nbsp;</td>
                                <td height="28">权限:</td>
                                <td height="28" colspan="2"><select name="cx" id="cx" style="width:100px; height:20px; border:solid 1px #000000; color:#666666" >
                                    <option value="注册用户">注册用户</option>
									<option value="新闻发布">新闻发布</option>									<!--quxanxiaxndexnglxu-->
                                </select></td>
                              </tr>
                              <tr >
                                <td height="28">&nbsp;</td>
                                <td height="28">验证码</td>
                                <td width="52" height="28"><INPUT id=pagerandom size=5 maxlength="4" name=pagerandom onKeyUp="this.value=this.value.replace(/\D/gi,'')" style="width:50px; height:20px; border:solid 1px #000000; color:#666666"/></td>
                                <td width="103"><%
								String yzm=code.getCheckCode();
								%>  <input type="hidden" name="yzm" id="yzm" value="<%=yzm %>" >
								   <%=yzm %></td>
                              </tr>
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
                              <tr>
                                <td height="38" align="center">&nbsp;</td>
                                <td height="38" colspan="3" align="center"><input type="submit" name="Submit" value="登陆" class="hsgbutton" onclick="return checklog();" />
                                    <input type="reset" name="Submit2" value="重置" class="hsgbutton" /></td>
                              </tr>
                            </table>
                          </form>
                          <%}else{ %>
                          <table width="90%" height="82%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                              <td width="31%" height="30">用户名</td>
                              <td width="69%" height="30"><%=request.getSession().getAttribute("username")%> </td>
                            </tr>
                            <tr>
                              <td height="30">权限</td>
                              <td height="30"><%=request.getSession().getAttribute("cx")%> </td>
                            </tr>
                            <tr>
                              <td height="30" colspan="2" align="center"><input type="button" name="Submit3" value="退出" onclick="javascript:location.href='logout.jsp';" />
                                  <input type="button" name="Submit32" value="个人后台" onclick="javascript:location.href='main.jsp';" />
                              </td>
                            </tr>
                          </table>
                        <%} %></td>
                          <td width="11" background="qtimages/1_02_01_02_02_03.gif">&nbsp;</td>
                        </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table id="__01" width="206" height="169" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="206" height="36" background="qtimages/1_02_01_02_01.gif"><table width="100%" height="17" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="71%" align="center" valign="middle"><strong><a href="news.asp?lb=站内新闻">站内搜索</a></strong></td>
                        <td width="29%">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="206" height="133" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="11" background="qtimages/1_02_01_02_02_01.gif">&nbsp;</td>
                          <td width="184" height="133"> <form action="xwtzList.do" method="post" name="formsearch" id="formsearch" >
                                  <table width="100%" height="17%" border="0" cellpadding="0" cellspacing="0">
                             
                                <tr>
                                  <td width="25%" height="30" align="center">标题</td>
                                  <td width="75%" height="30"><input name="biaoti" type="text" id="biaoti" size="12" style=" height:19px; border:solid 1px #000000; color:#666666" /></td>
                                </tr>
                                <tr>
                                  <td height="30" align="center">类别</td>
                                  <td height="30"><select name="lb" style=" height:19px; border:solid 1px #000000; color:#666666">
                                      <%=connDbBean.getxwlb()%>
                                    </select>
                                  </td>
                                </tr>
                                <tr>
                                  <td height="30">&nbsp;</td>
                                  <td height="30"><input type="submit" name="Submit4" value="提交"  /></td>
                                </tr>
                             
                  </table>
                  </form></td>
                          <td width="11" background="qtimages/1_02_01_02_02_03.gif">&nbsp;</td>
                        </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table id="__01" width="206" height="169" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="206" height="36" background="qtimages/1_02_01_02_01.gif"><table width="100%" height="17" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="71%" align="center" valign="middle"><strong><a href="news.asp?lb=站内新闻">友情连接</a></strong></td>
                        <td width="29%">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="206" height="133" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="11" background="qtimages/1_02_01_02_02_01.gif">&nbsp;</td>
                          <td width="184" height="133" valign="top"><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0" class="newsline">
                           <%
    for(HashMap map:new db().select("select * from youqinglianjie order by id desc",1,8)){
     %>
	 <tr>
                              <td width="12%" height="25" align="center"><span class="STYLE2"><img src="qtimages/1.jpg" /></span></td>
                              <td width="20%" height="25"><a href="<%=map.get("wangzhi") %>" target="_blank" ><%=map.get("wangzhanmingcheng") %></a></td>
                              <td width="68%" height="25"><a href="<%=map.get("wangzhi") %>" target="_blank" ><%=map.get("wangzhi") %></a></td>
                            </tr>
                            <%
								  }
								  %>
                          </table></td>
                          <td width="11" background="qtimages/1_02_01_02_02_03.gif">&nbsp;</td>
                        </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><img src="qtimages/1_02_01_06.gif" width="206" height="8" alt=""></td>
              </tr>
			  
            </table>