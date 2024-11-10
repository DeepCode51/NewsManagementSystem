<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>


<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<TITLE>修改新闻内容</TITLE>
	    <link rel="stylesheet" href="kindeditor_a5/themes/default/default.css" />
	<link rel="stylesheet" href="kindeditor_a5/plugins/code/prettify.css" />
	<script charset="utf-8" src="kindeditor_a5/kindeditor.js"></script>
	<script charset="utf-8" src="kindeditor_a5/lang/zh_CN.js"></script>
	<script charset="utf-8" src="kindeditor_a5/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="neirong"]', {
				cssPath : 'kindeditor_a5/plugins/code/prettify.css',
				uploadJson : 'kindeditor_a5/jsp/upload_json.jsp',
				fileManagerJson : 'kindeditor_a5/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>
       
	</head>
<%
  String id="";
 
   %>
<script language="javascript">

function gows()
{
	document.location.href="xinwenneirong_add.jsp?id=<%=id%>";
}
function hsgxia2shxurxu(nstr,nwbk)
{
	if (eval("form1."+nwbk).value.indexOf(nstr)>=0)
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"；", "");
	}
	else
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"；";
	}
}
</script>
	<body>
			<form action="updateXinwenneirong.do" name="form1" method="post">
				      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1"  style="border-collapse:collapse" bgcolor="#F2FDFF">
						<tr bgcolor="#E7E7E7">
							<td height="20" colspan="2" background="images/table_header.gif">修改新闻内容<input type="hidden" name="id" value="${xinwenneirong.id}" /></td>
						</tr>
						<tr ><td width="200">新闻分类：</td><td><select name='xinwenfenlei' id='xinwenfenlei' style=' height:19px; border:solid 1px #000000; color:#666666'><%=connDbBean.hsggetoption("xinwenfenlei","fenlei")%></select>&nbsp;*<label id='clabelxinwenfenlei' /></td></tr>		<tr ><td width="200">标题：</td><td><input name='biaoti' type='text' id='biaoti' value='' onblur='checkform()' size='50' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelbiaoti' /></td></tr>		<tr ><td width="200">内容：</td><td><textarea name="neirong" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;">${xinwenneirong.neirong}</textarea></td></tr>		<tr ><td width="200">描述：</td><td><textarea name='miaoshu' cols='50' rows='5' id='miaoshu' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>		<tr ><td width="200">图片：</td><td><input name='tupian' type='text' id='tupian' size='50' value='' onblur='' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='上传' onClick="up('tupian')" style='border:solid 1px #000000; color:#666666'/></td></tr>		<tr ><td width="200">点击率：</td><td><input name='dianjilv' type='text' id='dianjilv' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;<label id='clabeldianjilv' />必需数字型</td></tr>		<tr ><td width="200">添加人：</td><td><input name='tianjiaren' type='text' id='tianjiaren' onblur='' style='border:solid 1px #000000; color:#666666' value='<%=(String)request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>		
		
						<tr align='center'   height="22">
						    <td width="25%"  align="right">&nbsp;
						        
						    </td>
						    <td width="75%"  align="left">
						       <input type="submit" name="querenzhuce" id="querenzhuce" value="提交" onClick="return checkform();"/>
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
						
						
						
						
						<script language="javascript">document.form1.xinwenfenlei.value='${xinwenneirong.xinwenfenlei}';</script>	<script language="javascript">document.form1.biaoti.value='${xinwenneirong.biaoti}';</script>		<script language="javascript">document.form1.miaoshu.value='${xinwenneirong.miaoshu}';</script>	<script language="javascript">document.form1.tupian.value='${xinwenneirong.tupian}';</script>	<script language="javascript">document.form1.dianjilv.value='${xinwenneirong.dianjilv}';</script>	<script language="javascript">document.form1.tianjiaren.value='${xinwenneirong.tianjiaren}';</script>	
					 </table>
			</form>
   </body>
</html>






<script language=javascript >  
 
 function checkform(){  
 
	var xinwenfenleiobj = document.getElementById("xinwenfenlei"); if(xinwenfenleiobj.value==""){document.getElementById("clabelxinwenfenlei").innerHTML="&nbsp;&nbsp;<font color=red>请输入新闻分类</font>";return false;}else{document.getElementById("clabelxinwenfenlei").innerHTML="  "; } 	var biaotiobj = document.getElementById("biaoti"); if(biaotiobj.value==""){document.getElementById("clabelbiaoti").innerHTML="&nbsp;&nbsp;<font color=red>请输入标题</font>";return false;}else{document.getElementById("clabelbiaoti").innerHTML="  "; } 	    


return true;   
}   
popheight=450;
</script>  
