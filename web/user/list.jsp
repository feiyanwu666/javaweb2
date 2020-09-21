<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="<%=request.getContextPath() %>/css/Style.css" rel="stylesheet" type="text/css" />
		<script>
			//根据ID删除用户
			function delUser(id){
			    if(confirm("是否忍心删除人家？")){
			        //删除    get请求
					location.href="${pageContext.request.contextPath}/user?method=delUser&id="+id;
				}
			}
		</script>
	</HEAD>
	<body>
		<br>
		<form name="Form1"
			  method="post"  action="${pageContext.request.contextPath}/user" id="Form1">
			<input type="hidden" name="method" value="searchByParam"/>
			<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
				<TBODY>
					<tr>
						<td class="ta_01" align="center" bgColor="#afd1f3">
							<strong>查 询 条 件</strong>
						</td>
					</tr>
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr>
									<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
										用户姓名
									</td>
									<td class="ta_01" bgColor="#ffffff">
										<input name="userName" class="bg" size="15" value="${userName}"/>
									</td>
									<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
										性别：
									</td>
									<td class="ta_01" bgColor="#ffffff">
										<select name="sex" id="sex">
											<option value="">--选择性别--</option>
											<option value="男">男</option>
											<option value="女">女</option>
										</select>
									</td>
								</tr>
								<tr>
									<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
										学历：
									</td>
									<td class="ta_01" bgColor="#ffffff">
										<select name="education" id="education" >
											<option value="">--选择学历--</option>
											<option value="博士">博士</option>
											<option value="硕士">硕士</option>
											<option value="本科">本科</option>
											<option value="专科">专科</option>
											<option value="高中">高中</option>
										</select>
									</td>
									<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
										
									</td>
									<td class="ta_01" bgColor="#ffffff">
										
									</td>
								</tr>
								<tr>
									<td width="100" height="22" align="center" bgColor="#f5fafe"
										class="ta_01">
									</td>
									<td class="ta_01" bgColor="#ffffff">
										<font face="宋体" color="red"> &nbsp;</font>
									</td>
									<td align="right" bgColor="#ffffff" class="ta_01"><br><br></td>
									<td align="right" bgColor="#ffffff" class="ta_01">
										<input type="submit" id="search" value="查询" class="button_view" />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="reset" id="reset" value="重置" class="button_view" />
									</td>
								</tr>
							</table>
						</td>

					</tr>
					<tr>
						<td class="ta_01" align="center" bgColor="#afd1f3">
							<strong>用 户 列 表</strong>
						</TD>
					</tr>
					<tr>
						<td class="ta_01" align="right">
							<a class="button_add" style="padding: 2px 4px 2px 10px; border: 1px solid #8AA2CC;" href="<%=request.getContextPath() %>/user/add.jsp" id="add">添加</a>
						</td>
					</tr>
					<tr>
						<td class="ta_01" align="center" bgColor="#f5fafe">
							<table cellspacing="0" cellpadding="1" rules="all"
								bordercolor="gray" border="1" id="DataGrid1"
								style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
								<tr
									style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

									<td align="center" width="18%">
										登录名
									</td>
									<td align="center" width="17%">
										用户姓名
									</td>
									<td align="center" width="8%">
										性别
									</td>
									<td align="center" width="23%">
										联系电话
									</td>
									<td width="11%" align="center">
										学历
									</td>
									<td width="7%" align="center">
										编辑
									</td>
									<td width="7%" align="center">
										查看
									</td>
									<td width="7%" align="center">
										删除
									</td>
								</tr>
									<c:forEach items="${ulist}" var="user">
										<tr onmouseover="this.style.backgroundColor = 'white'"
											onmouseout="this.style.backgroundColor = '#F5FAFE';">
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="18%">
												${user.loginName}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
												${user.userName}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="8%">
													${user.sex}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="23%">
													${user.telephone}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center">
													${user.education}
											</td>
											<td align="center" style="HEIGHT: 22px">
												<a href="${pageContext.request.contextPath}/user?method=toEditView&id=${user.id}">
													<img src="<%=request.getContextPath() %>/images/i_edit.gif" border="0" style="CURSOR: hand">
												</a>
											</td>
											<td align="center" style="HEIGHT: 22px">
												<a href="${pageContext.request.contextPath}/user?method=searchUserById&id=${user.id}">
													<img src="<%=request.getContextPath() %>/images/button_view.gif" border="0" style="CURSOR: hand">
												</a>
											</td>
											<td align="center" style="HEIGHT: 22px">
												<a onclick="delUser('${user.id}')">
													<img src="<%=request.getContextPath() %>/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
												</a>
											</td>
										</tr>
									</c:forEach>

							</table>
						</td>
					</tr>
				</TBODY>
			</table>
		</form>
	</body>
</HTML>
