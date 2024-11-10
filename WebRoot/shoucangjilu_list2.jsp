<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<TITLE>收藏记录查询</TITLE>
	
	<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>
	</head>
	<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr valign="top">
				<td>
					<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
						<tr align="left" bgcolor="#F2FDFF">
							<td colspan="17" background="images/table_header.gif">收藏记录列表</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr valign="top">
			  <td bgcolor="#FFFFFF">
			  <table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
						

						<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="50">序号</td>
					<td width="166" >来自表</td>
					<td width="916" align="left" >标题</td>
 
    
					
					<td width="140">添加时间</td>
					<td width="140">操作</td>
		        </tr>
                          <% 

    String sql =  "select * from shoucangjilu where username='"+request.getSession().getAttribute("username")+"' order by id desc";

	ResultSet RS_result=connDbBean.executeQuery(sql);
	int i=0;
	while(RS_result.next()){
	i++;
     %>  
	 <tr align='center' bgcolor="#FFFFFF" onMouseOver="this.style.backgroundColor='#EDDCC2'" onMouseOut="this.style.backgroundColor='#ffffff'" height="22">
		<td width="50"><%=i %></td>
		<td>[<%=RS_result.getString("biao")%>]</td>
		<td align="left"><%
		 out.print(connDbBean.readzd(RS_result.getString("biao"),RS_result.getString("ziduan"),"ID",RS_result.getString("xwid")));
		%></td>
		<td width="140" align="center"><%=RS_result.getString("addtime")%></td>
		<td width="140" align="center"><a href="deleteShoucangjilu.do?id=<%=RS_result.getString("id")%>" onclick="return confirm('真的要删除？')" >删除</a>
		
		 <a href="<%=RS_result.getString("biaoj")%>Detail.do?id=<%=RS_result.getString("xwid")%>" target="_blank">详细</a>
			 </td>
 	 </tr>
  <%
  }
   %>
                        </table></td>
						</tr>
					</table>
					
					
			  </td>
	  </tr>
		</table>
		
			
			
			
			
			
	</body>
</html>
