<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

 <ul id="Nav" class="layui-nav layui-nav-tree">
					
 		            <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe857;</i>
                            <em>系统用户管理</em>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="allusers_add.jsp">管理员添加</a></dd>
                            <dd><a href="allusersList.do">管理员管理</a></dd>
							<dd><a href="yonghuzhuce_add.jsp">注册会员添加</a></dd>
                            <dd><a href="yonghuzhuceList.do">注册会员管理</a></dd>
                            <dd><a href="mod.jsp">修改密码</a></dd>
                        </dl>
                    </li>

                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe857;</i>
                            <em>分类管理</em>
                        </a>
                        <dl class="layui-nav-child">
                                <dd><a href="xinwenfenlei_add.jsp?lb=站内新闻">分类添加</a></dd>
                                <dd><a href="xinwenfenleiList.do?lb=站内新闻">分类查询</a></dd>
                            </dl>
                    </li>
					
					<li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe612;</i>
                            <em>新闻管理</em>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="xinwenneirong_add.jsp">新闻添加</a></dd>
                                <dd><a href="xinwenneirongList.do">新闻查询</a></dd>
                        </dl>
                    </li>
					 
					 <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe612;</i>
                            <em>发布者管理</em>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="xinwenfabu_add.jsp">发布者添加</a></dd>
                                <dd><a href="xinwenfabuList.do">发布者查询</a></dd>
                        </dl>
                    </li>
					 
					 <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe857;</i>
                            <em>变换图管理</em>
                        </a>
                        <dl class="layui-nav-child">
                                <dd><a href="xinwentongzhi_add.jsp?lb=bht">变换图添加</a></dd>
                                <dd><a href="xinwentongzhiList.do?lb=bht">变换图查询</a></dd>
                            </dl>
                    </li>
					<li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe857;</i>
                            <em>系统基本管理</em>
                        </a>
                        <dl class="layui-nav-child">
                               
                                <dd><a href="youqinglianjie_add.jsp">友情连接添加</a></dd>
								<dd><a href="youqinglianjieList.do">友情连接查询</a></dd>
								<dd><a href="dx.jsp?lb=系统公告">系统公告设置</a></dd>
								<dd><a href="dx.jsp?lb=系统简介">系统简介设置</a></dd>
								<dd><a href="liuyanbanList.do">留言板管理</a></dd>
								
                            </dl>
                    </li>

                </ul>