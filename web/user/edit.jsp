<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<LINK href="<%=request.getContextPath() %>/css/Style.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body>
     <form method="post" action="${pageContext.request.contextPath}/user">
		 	<input type="hidden" name="method" value="modifyUser"/>
     		<input type="hidden" name="id" value="${user.id}" />
			&nbsp;
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
						height="26">
						<strong><STRONG>编辑用户</STRONG>
						</strong>
					</td>
				</tr>
				
				<tr>
					<td align="center" bgColor="#f5fafe" class="ta_01">
						 登录名：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="loginName" id="loginName" class="bg" value="${user.loginName}"/>
					</td>
					<td align="center" bgColor="#f5fafe" class="ta_01">
						用户类型：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="radio" name="utype" value="管理员"
								<c:if test="${user.utype=='管理员'}">
									checked="checked"
								</c:if>
						/>管理员
						<input type="radio" name="utype" value="普通用户"
								<c:if test="${user.utype=='普通用户'}">
									checked="checked"
								</c:if>
						/>普通用户
					</td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe" class="ta_01">
						 密码：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="password" name="loginPwd" id="loginPwd" value="${user.loginPwd}"/>
					</td>
					<td align="center" bgColor="#f5fafe" class="ta_01">
						用户姓名：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="userName" class="bg" value="${user.userName}" />
					</td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe" class="ta_01">
						性别：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="radio" value="男" name="sex" id="sex0"
								<c:if test="${user.sex=='男'}">
									checked="checked"
								</c:if>
						/>男
						<input type="radio" value="女" name="sex" id="sex1"
								<c:if test="${user.sex=='女'}">
									checked="checked"
								</c:if>
						/>女
					</td>
					<td align="center" bgColor="#f5fafe" class="ta_01">
						学历：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<select name="education" id="education">
							<option value="">--选择学历--</option>
							<option value="博士" <c:if test="${user.education=='博士'}">selected="selected"</c:if> >博士</option>
							<option value="硕士" <c:if test="${user.education=='硕士'}">selected="selected"</c:if>>硕士</option>
							<option value="本科" <c:if test="${user.education=='本科'}">selected="selected"</c:if>>本科</option>
							<option value="专科" <c:if test="${user.education=='专科'}">selected="selected"</c:if>>专科</option>
							<option value="高中" <c:if test="${user.education=='高中'}">selected="selected"</c:if>>高中</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe" class="ta_01">
						出生日期：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="birthday" id="birthday" size="20" readonly="true"  value="${user.birthday}" onclick="c.show(this)"  />
					</td>
					<td align="center" bgColor="#f5fafe" class="ta_01">
						电话：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="telephone" id="telephone"  value="${user.telephone}"/>
					</td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe" class="ta_01">
						兴趣爱好：
					</td>
					<td class="ta_01" bgColor="#ffffff" colSpan="3">
						<input type="checkbox" name="interest"  value="看电影"
								<c:forEach items="${user.interest}" var="in">
									<c:if test="${in=='看电影'}">
										checked="checked"
									</c:if>
								</c:forEach>
						/> 看电影
						<input type="checkbox" name="interest"  value="旅游"
								<c:forEach items="${user.interest}" var="in">
									<c:if test="${in=='旅游'}">
										checked="checked"
									</c:if>
								</c:forEach>
						/>旅游
						<input type="checkbox" name="interest"  value="健身"
								<c:forEach items="${user.interest}" var="in">
									<c:if test="${in=='健身'}">
										checked="checked"
									</c:if>
								</c:forEach>
						/>健身
						<input type="checkbox" name="interest"  value="购物"
								<c:forEach items="${user.interest}" var="in">
									<c:if test="${in=='购物'}">
										checked="checked"
									</c:if>
								</c:forEach>
						/>购物
						<input type="checkbox" name="interest"  value="睡觉"
								<c:forEach items="${user.interest}" var="in">
									<c:if test="${in=='睡觉'}">
										checked="checked"
									</c:if>
								</c:forEach>
						/>睡觉
					</td>
				</tr>
				<TR>
					<TD class="ta_01" align="center" bgColor="#f5fafe">
						备注：
					</TD>
					<TD class="ta_01" bgColor="#ffffff" colSpan="3">
						<textarea cols="30" rows="3" name="remark" style="WIDTH: 96%">${user.remark}</textarea>
					</TD>
				</TR>
				<TR>
					<td align="center" colSpan="4" class="sep1">
						<img src="<%=request.getContextPath() %>/images/shim.gif">
					</td>
				</TR>
				<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center"
						bgColor="#f5fafe" colSpan="4">
						<input type="submit"  value="确定" class="button_ok"/>
						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<input type="reset"  value="重置" class="button_cancel"/>
						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
						<span id="Label1"></span>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>