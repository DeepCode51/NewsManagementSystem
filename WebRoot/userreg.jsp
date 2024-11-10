<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>

<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>

<script language=javascript >  
function hsgcheck() {
		var yonghuming = $("#yonghuming").val();
		if(yonghuming==""||(yonghuming.length<6||yonghuming.length>12)){
			 $("#clabelyonghuming").html("<font color=red>用户名不能为空且长度在6～12位之间！</font>");
			 $("input[id=yonghuming]").focus();
			 $("#querenzhuce").attr("disabled","disabled");
			 return false;
		} 
		else
		{
			$("#clabelyonghuming").html("");
			$.ajax({
				url : "quchongYonghuzhuce.do",
				type : "post",
				data : "yonghuming=" + yonghuming,
				dataType : "json",
				success:function(result){
				if(result.info=="ng"){
					$("#clabelyonghuming").html("<font color=red>用户名已存在，请更换！</font>");
					$("input[id=yonghuming]").focus();
					$("#querenzhuce").attr("disabled","disabled");
					return false;
				}
				else
				{
					$("#querenzhuce").removeAttr("disabled");
				}
				},
				error:function(){
					$("#clabelyonghuming").html("系统异常，请检查错误！");
					$("input[id=yonghuming]").focus();
					$("#querenzhuce").attr("disabled","disabled");
					return false;
				}
			});
		}
	}
</script>
	<script language="javascript">
function checkform()
{
	var yonghumingobj = document.getElementById("yonghuming"); if(yonghumingobj.value==""){document.getElementById("clabelyonghuming").innerHTML="&nbsp;&nbsp;<font color=red>请输入用户名</font>";return false;}else{document.getElementById("clabelyonghuming").innerHTML="  "; } 
	var mimaobj = document.getElementById("mima"); if(mimaobj.value==""){document.getElementById("clabelmima").innerHTML="&nbsp;&nbsp;<font color=red>请输入密码</font>";return false;}else{document.getElementById("clabelmima").innerHTML="  "; } 
	var xingmingobj = document.getElementById("xingming"); if(xingmingobj.value==""){document.getElementById("clabelxingming").innerHTML="&nbsp;&nbsp;<font color=red>请输入姓名</font>";return false;}else{document.getElementById("clabelxingming").innerHTML="  "; } 
	var youxiangobj = document.getElementById("youxiang"); if(youxiangobj.value!=""){ if(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test(youxiangobj.value)){document.getElementById("clabelyouxiang").innerHTML=""; }else{document.getElementById("clabelyouxiang").innerHTML="&nbsp;&nbsp;<font color=red>必需邮箱格式</font>"; return false;}}  
    var shoujiobj = document.getElementById("shouji"); if(shoujiobj.value!=""){ if(/^1[3|4|5|6|7|8|9][0-9]\d{8,8}$/.test(shoujiobj.value)){document.getElementById("clabelshouji").innerHTML=""; }else{document.getElementById("clabelshouji").innerHTML="&nbsp;&nbsp;<font color=red>必需手机格式</font>"; return false;}}  
    var shenfenzhengobj = document.getElementById("shenfenzheng"); if(shenfenzhengobj.value!=""){ if(/^\d{15}$|^\d{18}$|^\d{17}[xX]$/.test(shenfenzhengobj.value)){document.getElementById("clabelshenfenzheng").innerHTML=""; }else{document.getElementById("clabelshenfenzheng").innerHTML="&nbsp;&nbsp;<font color=red>必需身份证格式</font>"; return false;}}  
    
}

</script>


<!DOCTYPE html>
<html>
<head>

<title>用户注册</title>

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
      <div class="Ttitle">用户注册 <span>UserReg</span>
        <div class="Tmore">  </div>
      </div>
      <!-- end Ttitle-->
      <ul class="knowListUl2">
	  <font color="#000000">
	                           
							   
							   
				     <style type="text/css">
<!--
.STYLExx {color: #000000}
-->
</style>
<form action="addYonghuzhuce.do" method="post" name="form1" id="form1">
 <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CCCCCC" style="border-collapse:collapse" class="newsline" height="500">
						
						<tr ><td width="200"><span class="STYLExx">用户名：</span></td>
						  <td><span style="color: #000000">
					      <input name='yonghuming' type='text' id='yonghuming' value='' onblur='hsgcheck()' style='border:solid 1px #000000; color:#666666' />
					      &nbsp;*
						    <label id='clabelyonghuming' />                              
						    </span></td>
						</tr>
		<tr ><td width="200"><span class="STYLExx">密码：</span></td>
		  <td><span style="color: #000000">
	      <input name='mima' type='text' id='mima' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />
	      &nbsp;*
		    <label id='clabelmima' />              
		    </span></td>
		</tr>
		<tr ><td width="200"><span class="STYLExx">姓名：</span></td>
		  <td><span style="color: #000000">
	      <input name='xingming' type='text' id='xingming' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />
	      &nbsp;*
		    <label id='clabelxingming' />              
		    </span></td>
		</tr>
		<tr ><td width="200"><span class="STYLExx">性别：</span></td>
		  <td><span class="STYLExx">
		    <select name='xingbie' id='xingbie'>
		      <option value="男">男</option>
		      <option value="女">女</option>
	      </select>
		    </span></td>
		</tr>
		<tr ><td width="200"><span class="STYLExx">出生年月：</span></td>
		<td><input name='chushengnianyue' type='text' id='chushengnianyue' value='<%=connDbBean.getdate()%>' onblur='' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:100px; height:16px; border:solid 1px #000000'/></td>
		</tr>
		<tr ><td width="200"><span class="STYLExx">QQ：</span></td>
		<td><input name='QQ' type='text' id='QQ' value='' onblur='' style='border:solid 1px #000000' /></td>
		</tr>
		<tr ><td width="200"><span class="STYLExx">邮箱：</span></td>
		<td><span style="color: #000000">
	    <input name='youxiang' type='text' id='youxiang' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />
	    &nbsp;
		  <label id='clabelyouxiang' />          
	    必需邮箱格式</span></td>
		</tr>
		<tr ><td width="200"><span class="STYLExx">手机：</span></td>
		<td><span style="color: #000000">
	    <input name='shouji' type='text' id='shouji' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />
	    &nbsp;
		  <label id='clabelshouji' />          
	    必需手机格式</span></td>
		</tr>
		<tr ><td width="200"><span class="STYLExx">身份证：</span></td>
		<td><span style="color: #000000">
	    <input name='shenfenzheng' type='text' id='shenfenzheng' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />
	    &nbsp;
		  <label id='clabelshenfenzheng' />          
	    必需身份证格式</span></td>
		</tr>
		<tr 0><td width="200"><span class="STYLExx">头像：</span></td>
		  <td><span style="color: #000000">
	      <input name='touxiang' type='text' id='touxiang' size='50' value='' onblur='' style='border:solid 1px #000000; color:#666666' />
	      &nbsp;
	      <input type='button' value='上传' onClick="up('touxiang')" style='border:solid 1px #000000; color:#666666'/>
		    </span></td>
		</tr>
		<tr 1><td width="200"><span class="STYLExx">地址：</span></td>
		<td><input name='dizhi' type='text' id='dizhi' value='' onblur='' size='50' style='border:solid 1px #000000' /></td>
		</tr>
		<tr 2><td width="200"><span class="STYLExx">备注：</span></td>
		  <td><span style="color: #000000">
		    <textarea name='beizhu' cols='50' rows='5' id='beizhu' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea>
		    </span></td>
		</tr>
		
		
						<tr align='center'   height="22">
						    <td width="25%"  align="right">&nbsp;						    </td>
						    <td width="75%"  align="left">
						      <input type="submit" name="querenzhuce" id="querenzhuce" value="提交" onClick="return checkform();"/>
						       <input type="reset" value="重置"/>&nbsp;						    </td>
						</tr>
					 </table>
		
			<script language="javascript">popheight = 450;</script>
			
			
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
</form>


<jsp:include page="qtdown.jsp"></jsp:include>
</body>
</html>
