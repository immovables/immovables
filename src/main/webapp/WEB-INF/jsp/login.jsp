<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style type="text/css">
 #pop{
  width:300px; height:400px; background:#3d3d3d; color:#fff; 
  position:absolute; top:10px; left:100px; text-align:center; 
  border:2px solid #000;
   }
</style>
<script type="text/javascript">
jQuery.fn.center = function () {
    this.css("position","absolute");
    this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
    return this;
}

showPopup = function() {
	$("#popLayer").show();
	$("#popLayer").center();
}

hidePopup = function() {
	$("#popLayer").hide();
}


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
<a href="javascript:;" onclick="javascript:showPopup()">팝업띄우기</a>
<a href="javascript:;" onclick="javascript:hidePopup()">팝업띄우기</a>

<!-- 레이어팝업 -->
<div id="popLayer" style="display:none;">
	<div>팝업 레이어입니다.</div>
</div>


</form>

</body>
</html>