<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>MemberList</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>
<h2>게시판 목록</h2>
<table style="border:1px solid #ccc">
	<colgroup>
		<col width="10%"/>
		<col width="*"/>
		<col width="15%"/>
		<col width="20%"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col">ID</th>
			<th scope="col">이름</th>
			<th scope="col">PW</th>
			<th scope="col">관리자여부</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>${member.id }</td>
			<td>${member.name }</td>
			<td>${member.pw }</td>
			<td>${member.isAdmin }</td>
		</tr>
		
	</tbody>
</table>
</body>
</html>