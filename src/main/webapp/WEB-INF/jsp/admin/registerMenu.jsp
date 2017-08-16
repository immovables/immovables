<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>메뉴등록화면</title>
<style type="text/css">
#content {
	width: 100%;
	margin: 0 auto;
	overflow: hidden;
}

#content>#main_aside {
	width: 20%;
	float: left;
}

#content>#main_section {
	width: 77%;
	margin: 0 auto;
	float: left;
}

.button {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 8px 15px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 6px 20px;
	cursor: pointer;
}

/* body select.select_box */
body select {
	/* display: block;  */
	padding: 10px 70px 10px 13px !important;
	max-width: 100%;
	height: auto !important;
	border: 1px solid #e3e3e3;
	border-radius: 3px;
	background: url("images/selectbox_arrow.png") right center no-repeat;
	background-color: #fff;
	color: #444444;
	font-size: 12px;
	line-height: 16px !important;
	appearance: none; /* this is must */
	-webkit-appearance: none;
	-moz-appearance: none;
} /* body select.select_box option */
body select option {
	padding: 0 4px;
}
</style>
    <script type="text/javascript">
    </script>
    
</head>
<body>
<form action="">
<header><c:import url="./head.jsp" charEncoding="UTF-8" /></header>
<div id="content">
	<aside id="main_aside">	<c:import url="./side.jsp" charEncoding="UTF-8" /></aside>
	<section id="main_section">
    <!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
    <div id="wrap">
        <b><font size="6" color="gray">메뉴등록</font></b>
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
        <form method="post" action="/registerMenu.do" name="memberInfo" onsubmit="return checkValue()">
            <table>
                <tr>
                    <td id="title">* 메뉴명</td>
                    <td>
                        <input type="text" name="id" maxlength="50">
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">* URL</td>
                    <td>
                        <input type="text" name="id" maxlength="50">
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="등록"/>  <input type="button" value="취소">
        </form>
    </div>
	</section>
</div>
</form>
</body>
</html>