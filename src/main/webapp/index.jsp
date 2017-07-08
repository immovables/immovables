<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<% 
String sessionId = (String)request.getSession().getAttribute("id");

if (sessionId != null) { %>
	<jsp:forward page="/index.do"/>
<% }%>


<html>
<head>
<script type="text/javascript">

</script>

</head>
<body>
<form id="loginForm" method="POST" action="/login.do">

<h2>로그인</h2>
<table style="border:1px solid #ccc">
	<colgroup>
	</colgroup>
	<thead>
		<tr>
			<th scope="col">ID</th>
			<td scope="col">
				<input type="text" name="id" placeholder = "ID를 입력해 주세요."/>
			</td>
			<td rowspan="2">
				<input type="submit" value="로그인"/>
			</td>
		</tr>
		<tr>
			<th scope="col">Password</th>
			<td scope="col">
				<input type="password" name="pw" placeholder = "비밀번호를 입력해 주세요."/>
			</td>
		</tr>
		
	</thead>
</table>
</form>
</body>
</html>