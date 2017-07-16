<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
	<head>
	
	</head>
	<body>
		<br/>
		<br/>
		<table style="width:60%; margin:auto; text-align:center; bgcolor:red">
			<tr>
				<c:forEach var="menu" items="${menuList}">
					<th>${menu.name}</th>
				</c:forEach>
			</tr>
		</table>
		<br/>
		<br/>
	</body>
</html>

