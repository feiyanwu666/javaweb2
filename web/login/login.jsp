<%@ page import="java.net.URLDecoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link href="<%=request.getContextPath() %>/css/Style.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript">
			//切换验证码
			function changeImg(x){
				x.src="${pageContext.request.contextPath}/utils?method=vc&hehe="+new Date().getTime();
			}
		</script>
	</head>

	<body>
		<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">
					<table width="452" height="290" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td bgcolor="#FFFFFF">
								<table width="452" height="290" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td height="74">
											<img src="<%=request.getContextPath() %>/images/logintitle.gif">
										</td>
									</tr>
									<tr>
										<td align="center" valign="bottom" background="<%=request.getContextPath() %>/images/loginbg.gif">
											<form action="${pageContext.request.contextPath}/login" method="post" target="_parent">
												<input type="hidden" name="method" value="login"/>
												<table border="0" align="center" cellpadding="2" cellspacing="0">
													<tr align="center">
														<td height="30" colspan="2" style="border-bottom: 1px dotted #cccccc">
															<strong style="font-size: 14px;color:red;">${msg}</strong>
														</td>
													</tr>
													<tr>
														<td height="30" nowrap>
															<font color="000F60"><strong>用户名：</strong> </font>
														</td>
														<td>
															<%
																application.setAttribute("url",new URLDecoder());
															%>
															<input type="text" name="loginName" class="test" style="width: 160px;"
															value="${url.decode(cookie.remember.value,'utf-8')}"/>
														</td>
													</tr>
													<tr>
														<td height="30" nowrap>
															<strong><font color="000F60">密码： </font> </strong>
														</td>
														<td>
															<input type="password" name="loginPwd" class="text" style="width: 160px;"/>
														</td>
													</tr>
													<tr>
														<td height="30" nowrap>
															<strong><font color="000F60">验证码： </font> </strong>
														</td>
														<td>
															<input type="text" name="verifyCode" class="text" style="width: 50px;"/>
															<img id="m1" src="${pageContext.request.contextPath}/utils?method=vc" style="height:30px;width:100px;"
															onclick="changeImg(this)"/>
														</td>
													</tr>
													<tr>
														<td height="30" nowrap>
														</td>
														<td>
															<input type="checkbox" name="autoLogin" value="yes"/>自动登录
															<input type="checkbox" name="remember" value="yes"/>记住用户名
														</td>
													</tr>
													<tr>
														<td height="30">
														</td>
														<td>
															<input type="submit"  value="登录" class="buttoninput" />
															<input type="reset"  value="重置" class="buttoninput" />
														</td>
													</tr>
												</table>
											</form>
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td height="30" align="center">
													</td>
												</tr>
												<tr>
													<td height="23" align="center"></td>
												</tr>
											</table>
										</td>
									</tr>

								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
