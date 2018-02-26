<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
	<head>
	    <style type="text/css">
    	#content {
    		width:100%; margin:0 auto;
    		overflow:hidden;
    	}

    	#content > #news {
    		width : 20%;
    		float : left;
    	}
    	
    	#content > #menu {
    		width : 80%;  margin:0 auto;
    		float : left;
    	}
    </style>
	
	</head>
	<body>
	<form>
			<div id="content"><br />
				<div id="news">immovables 개인 홈페이지</div>
				<div id="menu">
							<c:forEach var="menu" items="${menuList}">
								<a href='${menu.url}'>${menu.name}</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
							</c:forEach>
				</div>
			<br /></div>
</form>
	</body>
</html>

