<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>菜单</title>
<link href="<%=request.getContextPath() %>/css/left.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<table width="100" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="12"></td>
		</tr>
	</table>
	<table width="100%" border="0">
		<tr>
			<td>
				<a href="<%=request.getContextPath() %>/login/welcome.jsp" target="mainFrame">员工管理</a> <br/>
				<a href="${pageContext.request.contextPath}/user?method=list"  target="mainFrame">用户管理</a>
			</td>
		</tr>
	</table>
</body>
</html>
