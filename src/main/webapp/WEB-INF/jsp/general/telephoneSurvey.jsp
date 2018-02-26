<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../../css/style.css" />

<title>스케줄 목록</title>
<style type="text/css">

</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){

	$("input[type='checkbox'][name^='onoffswitch_']").click(function(){
		console.log( $(this).val() );
		
		console.log( $(this) );
		if($(this).val()==1) {
			$(this).val(2);
		}else {
			$(this).val(1);
		}
		
		
	});

});


</script>
</head>
<body>

		<div><c:import url="../admin/head.jsp" charEncoding="UTF-8" /></div>
		
		<div id="content"><!-- 회원 -->
			<div id="main_aside"> <c:import url="../admin/side.jsp" charEncoding="UTF-8" />
		</div>
			<br/>
			<div id="main_section">
			<div id="wrap">
				<form action="">
				<div>
					<select class="select_box" name="year">
						<c:forEach var="year" begin="2016" end="${(selectedDay.year)+1}"
							step="1" varStatus="status">
							<option value="${year}"	<c:if test="${year == selectedDay.year}">selected</c:if>>${year} 년</option>
						</c:forEach>
					</select> <select class="select_box" name="month">
						<c:forEach var="month" begin="1" end="12" step="1" varStatus="status">
							<option value="${month}" <c:if test="${month== selectedDay.month}">selected</c:if>>${month} 월</option>
						</c:forEach>
					</select> 
					<input type="submit" class="button" id="seachButton" value="조회" />​
					<input type="button" class="register-button" id="seachButton" value="등록" />​
				</div>
				<br/>
				<table width="100%" class='Schedule-table'>
					<thead>
						<TR height="50px">
							<th align="center" width="10%" class='Schedule-table Schedule-table-td'>날짜</th>
							<th align="center" width="10%" class='Schedule-table Schedule-table-td'>이름</th>
							<th align="center" width="40%" class='Schedule-table Schedule-table-td'>전화개척</th>
							<th align="center" width="10%" class='Schedule-table Schedule-table-td'>상태</th>
							<th align="center" width="10%" class='Schedule-table Schedule-table-td'>변경</th>
						</TR>
					</thead>
					<c:forEach items="${telephoneSurveyList}" var="telephoneSurveyList">
						<c:set var="seq" value="${telephoneSurveyList.seq}"/>
						<c:set var="state" value="${telephoneSurveyList.state}"/>
						<tr height="30px">
							<fmt:formatDate pattern = "yyyy-MM-dd" var="surveyDate" value = "${telephoneSurveyList.surveyDate}"/>
							<td align="center" class='Schedule-table Schedule-table-td'>${surveyDate }</td>
							<td align="center" class='Schedule-table Schedule-table-td'>${telephoneSurveyList.memberName}</td>
							<td class='Schedule-table Schedule-table-td'>${telephoneSurveyList.range}</td>
							<td align="center" class='Schedule-table Schedule-table-td'>
	

							<fmt:formatDate pattern = "yyyy-MM-dd" var="sDate" value = "${telephoneSurveyList.surveyDate}"/>
							<c:set var="tDate" value="${today.year}-${today.month}-${today.date}"/>
							<c:choose>
								<c:when test="${state ne 0 && tDate > sDate }">
									<div class="onoffswitch">
										<c:if test="${state ne 1 }">
										    <input type="checkbox" name="onoffswitch_${seq }" value="${state}" class="onoffswitch-checkbox" id="myonoffswitch_${seq }" checked >
										    <label class="onoffswitch-label" for="myonoffswitch_${seq }">
										        <span class="onoffswitch-inner"></span><span class="onoffswitch-switch"></span>
										    </label>
										</c:if>
										<c:if test="${state eq 1 }">
										    <input type="checkbox" name="onoffswitch_${seq }" value="${state}" class="onoffswitch-checkbox" id="myonoffswitch_${seq }" >
										    <label class="onoffswitch-label" for="myonoffswitch_${seq }">
										        <span class="onoffswitch-inner"></span><span class="onoffswitch-switch"></span>
										    </label>
										</c:if>
									</div>
								</c:when>
								<c:otherwise>
									Before Start
								</c:otherwise>
							</c:choose>

							</td>
							<td class='Schedule-table Schedule-table-td'>
								<c:if test="${state eq 0 }">
									<input type="button" class="update-button" id="tel_up_${seq }" value="수정">
									<input type="button" class="delete-button" id="tel_del_${seq }" value="삭제">
								</c:if>
							</td>
						</tr>
					</c:forEach>
					<c:if test="${fn:length(telephoneSurveyList)==0 }">
						<tr align="center" height="50px">
							<td colspan="5" class='Schedule-table Schedule-table-td'>데이터가 없습니다. </td>
						</tr>
					</c:if>
				</table>
				</form>
				<br />
			</div> <!--  id="wrap" -->
		</div> <!-- id="main_section" -->
		</div>
</body>
</html>