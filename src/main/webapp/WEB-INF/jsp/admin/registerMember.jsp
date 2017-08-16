<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>직원등록화면</title>
    <style type="text/css">
    	#content {
    		width:100%; margin:0 auto;
    		overflow:hidden;
    	}

    	#content > #main_aside {
    		width : 20%;
    		float : left;
    	}
    	
    	#content > #main_section {
    		width : 77%;  margin:0 auto;
    		float : left;
    	}
    </style>

    <script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
            if(!document.memberInfo.id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            if(!document.memberInfo.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(document.memberInfo.pw.value != document.memberInfo.pwCheck.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
            
            if(!document.memberInfo.name.value){
                alert("이름을 입력하세요.");
                return false;
            }

        }
    </script>
    
</head>
<body>
		<header>
		<c:import url="../admin/head.jsp" charEncoding="UTF-8" /></header>
		<div id="content">
			<aside id="main_aside"> <c:import url="../admin/side.jsp"
				charEncoding="UTF-8" /></aside>
			<br />
			<section id="main_section"> <%-- <c:out value="${sessionScope.id }" />  --%>
			<div id="wrap">
        <br><br>
        <b><font size="6" color="gray">직원등록</font></b>
        <br><br><br>
        
        
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
        <form method="post" action="/registerMember.do" name="memberInfo" onsubmit="return checkValue()">
            <table>
                <tr>
                    <td id="title">* 아이디</td>
                    <td>
                        <input type="text" name="id" maxlength="50">
                        <input type="button" value="중복확인" >    
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">* 비밀번호</td>
                    <td>
                        <input type="password" name="pw" maxlength="50">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">* 비밀번호 확인</td>
                    <td>
                        <input type="password" name="pwCheck" maxlength="50">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">* 이름</td>
                    <td>
                        <input type="text" name="name" maxlength="50">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">성별</td>
                    <td>
                        <input type="radio" name="gender" value="남" checked>남
                        <input type="radio" name="gender" value="여" checked>여
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">생년월일</td>
                    <td>
                        <input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6" >
                        <select name="birthmm">
                            <option value="">월</option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                        </select>
                        <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4" >
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이메일</td>
                    <td>
                        <input type="text" name="mail1" maxlength="50">@
                        <select name="mail2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">휴대전화</td>
                    <td>
                        <input type="text" name="phone" />
                    </td>
                </tr>
                <tr>
                    <td id="title">관리자여부</td>
                    <td>
                        <input type="radio" name="isAdmin" value="true"/> 관리자
                        <input type="radio" name="isAdmin" value="false" checked="checked"/> 일반
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="가입"/>  <input type="button" value="취소">
        </form>
    </div>
	</section>
</div>
<footer></footer>
</body>
</html>