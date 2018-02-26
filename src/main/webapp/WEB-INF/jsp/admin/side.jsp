<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>

</head>
<body>
	<br><br>
	<table align="center">
		<tr>
			<td>
				<c:set var="img" value="${member.img }" />
				<c:choose>
					<c:when test="${empty img }"><img src="../images/default_img2.jpg" width="150px"></c:when>
					<c:otherwise><img src="../images/${img}" width="150px"></c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td>ID : <c:out value="${member.id}" /></td>
		</tr>
		<tr>
			<td>이름 : <c:out value="${member.name}" /></td>
		</tr>
	</table>




</body>
</html>

