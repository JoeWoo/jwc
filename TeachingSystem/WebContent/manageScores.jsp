<%@page import="com.hit.DataControllor.DataManager"%>
<%@page import="com.hit.DataControllor.DBControllor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hit.Entity.Administrator"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<link rel="stylesheet" type="text/css" href="./css/student.css"/>
	<script type="text/javascript" src="js/admin.js"></script>
	<script type="text/javascript" src="js/manageScores.js"></script>
</head>
<%
	if(!DBControllor.isConnected()) DBControllor.connctTo("TeachingDB");
	Administrator administrator = (Administrator)session.getAttribute("USER");		
	ArrayList<String> sList = DataManager.getYears();
%>
<body onload="init_page('<%=administrator.getDid() %>')">
	<span id="welcome"><%=administrator.getID() %> <%=administrator.getName() %> | <a id="title" href="">退出</a></span>
	<div id="header">	
			<a id="logo" href="http://www.hit.edu.cn">
				<img src="./pics/hit.png" alt="" />
			</a>
		<ul id="nav">
			<li><a href="./admin.jsp" >课程管理</a></li>
			<li><a href="./setTimetable.jsp">排课</a></li>
			<li><a href="./manageStudent.jsp">学籍管理</a></li>
			<li><a href="./manageScores.jsp"class="navActive">成绩管理</a></li>
			<li><a href="./manageTeacher.jsp">教师管理</a></li>
			<li><a href="./manageComm.jsp">评教管理</a></li>
			<li><a href="./manageAdmin.jsp">管理员管理</a></li>
			<li><a href="./changeManagePwd.html">修改密码</a></li>
			<li><a href="./manageInfo.jsp">个人信息</a></li>
		</ul>
	</div>		
	<div id="content">
		<div id="main">
			<div id="main-top">	
			</div>
			<div id="main-main">
				<h2 id="queryRoom">
					<span>成绩管理</span>
				</h2>
				<form action="" id="query-input">	
					<div class="getIn"style="width:890px;">
						<div>
						&nbsp;
						<span class="week">院系：</span>
						<select id="dept-input" name="dept-input" onchange="getMajor(0)">
                        <option value="1">软件学院</option>
                       
						</select>
						&nbsp;
			
						<span class="week">专业：</span>
						<select id="major-input" name="major-input" >
                        <option value="nochoose">-未选择-</option>
						</select>
						&nbsp;
					
						<span class="week">年级：</span>
						<select id="year-input" name="major-input" >
                        <%
                        	int cnt = 0;
                        	for(String s:sList){
                        %>
                        <option value="<%=s %>"><%=s+"级" %></option>
                        <%
                        	}
                        %>
						</select>
						&nbsp;
						<span class="week">学期：</span>
						<select id="term-input" name="major-input" >
                        <%
                        	if(!DBControllor.isConnected()) DBControllor.connctTo("TeachingDB");
                        	ArrayList<String> tList = DataManager.getTermList();
                        	for(String s:tList){
                        %>
                        <option value="<%=s %>"><%=DataManager.getTermString(s) %></option>
                        <%
                        	}
                        %>
						</select>
						&nbsp;
						&nbsp;
						<span class="week">班号：</span>
						<select id="class-input" name="major-input" >
                        <option value="0"><option>
                        <option value="1">1103710321</option>
						</select>
						&nbsp;
						<span class="week">学号：</span>
						<select id="sid-input" name="major-input">
                        <option value="0"><option>
                        <option value="1">1103710321</option>
						</select>
						&nbsp;
					
						<input  name="submit" value="查询"type="button" onclick="queryScores()">
						</div>
						
					</div>

				</form>
				<div id="biao1" >
					<table  id="scorestable"border="1" cellpadding="0" cellspacing="0">
				        <tbody>
				        	<tr bgcolor="#CCCCCC">
					            <td height="28"><div><strong>学期</strong></div></td>
					            <td><div><strong>课程号</strong></div></td>
					            <td width="25%"><div><strong>课程名</strong></div></td>
					            <td width="10%"><div><strong>授课教师</strong></div></td>
					            <td><div><strong>类别</strong></div></td>
					            <td><div><strong>学分</strong></div></td>
					            <td><div><strong>学时</strong></div></td>
					            <td><div><strong>成绩</strong></div></td>
					            <td><div><strong>成绩类别</strong></div></td>
					            <td><div><strong>备注</strong></div></td>
					        </tr>
				       		<tr bgcolor="#C8D6FF">
					            <td height="25">2010秋季</td>
					            <td>08T1370030</td>
					            <td>程序设计语言</td>
					            <td>赵岩</td>
					            <td>必修</td>
					            <td>4.5</td>
					            <td>70</td>
					            <td>88</td>
					            <td></td>
					            <td></td>
				           </tr>
				           <tr bgcolor="#C8D6FF">
					            <td height="25">2010秋季</td>
					            <td>08T1370030</td>
					            <td>程序设计语言</td>
					            <td>赵岩</td>
					            <td>必修</td>
					            <td>4.5</td>
					            <td>70</td>
					            <td>88</td>
					            <td></td>
					            <td></td>
				           </tr>
				           <tr><td colspan="10" height="10">&nbsp;</td></tr>
				           <tr bgcolor="#C8D6FF">
					            <td height="25">2010春季</td>
					            <td>08T1370030</td>
					            <td>程序设计语言</td>
					            <td>赵岩</td>
					            <td>必修</td>
					            <td>4.5</td>
					            <td>70</td>
					            <td>88</td>
					            <td></td>
					            <td></td>
				           </tr>
				           <tr bgcolor="#C8D6FF">
					            <td height="25">2010春季</td>
					            <td>08T1370030</td>
					            <td>程序设计语言</td>
					            <td>赵岩</td>
					            <td>必修</td>
					            <td>4.5</td>
					            <td>70</td>
					            <td>88</td>
					            <td></td>
					            <td></td>
				           </tr>
				      </tbody>
				  </table>	
				</div>
				<div id="biao2">
					<table  id="scorestable"border="1" cellpadding="0" cellspacing="0">
				        <tbody>
				        	<tr bgcolor="#CCCCCC">
				        		<td height="28"><div><strong>排名</strong></div></td>
					            <td ><div><strong>学号</strong></div></td>
					            <td width="20%"><div><strong>姓名</strong></div></td>
					            <td width="25%"><div><strong>平均学分绩</strong></div></td>
					            <td width="10%"><div><strong>不及格科目数</strong></div></td>
					            <td><div><strong>百分比</strong></div></td>
					            <td><div><strong>备注</strong></div></td>
					        </tr>
				       		<tr bgcolor="#C8D6FF">
				       			<td height="25">1</td>
				       			<td>1103710321</td>
					            <td>吴健</td>
					            <td >80.76</td>
					            <td>0</td>
					            <td>48.67%</td>
					            <td></td>  
				           </tr>
				      </tbody>
				  </table>
				</div>
			</div>
		</div>
	</div>

	<div id="footer">
			<a href="#">关亍W3CStudy</a> | <a href="#">广告服务</a> | <a href="#">提交问题</a> | <a href="#">联系我们</a> | <a href="#">版权声明</a> | <a href="#">关于隐私</a> | <a href="#">合作伙伴</a>
		<br/>
			<a href="#">京ICP备10055601号</a>
			All rights(C)2008-2010 Reserved
	</div>

</body>
</html>