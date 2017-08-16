<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../css/style.css" />

<title>스케줄 목록</title>
<style type="text/css">


</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
$(function() {
	$('#seachButton').click(function(){
		var url = '/searchSchedule.do';
		$(location).attr('href',url);
	});
});

function detail(year,month,day) {
	if(month.length==1) {
		month = '0'+ month;
	}
	if(day.length==1) {
		day = '0'+ day;
	}
	
	var detailData = {'date' : year + month + day, 'userId' : $('#userId').val() }
	var date = year + month + day;
	var userId = $('#userId').val();

	var url = '/detailSchedule.do?date=' + date + '&userId='+userId;
	$(location).attr('href',url);
};
</script>
</head>
<body>

		<div><c:import url="../admin/head.jsp" charEncoding="UTF-8" /></div>
		<div id="content">
			<div id="main_aside"> <c:import url="../admin/side.jsp"
				charEncoding="UTF-8" /></div>
			<br/>
			<div id="main_section"> <input type="hidden" id="userId" value='<c:out value="${sessionScope.id }" />' />
			<div id="wrap">
				<form action="/searchSchedule.do">
				<div>
					<select class="select_box" name="year">
						<c:forEach var="year" begin="2016" end="${(today.year)+1}"
							step="1" varStatus="status">
							<option value="${year}"	<c:if test="${year == today.year}">selected</c:if>>${year} 년</option>
						</c:forEach>
					</select> 
					<select class="select_box" name="month">
						<c:forEach var="month" begin="1" end="12" step="1" varStatus="status">
							<option value="${month}" <c:if test="${month== today.month}">selected</c:if>>${month} 월</option>
						</c:forEach>
					</select> 
					<input type="submit" class="button" id="seachButton" value="조회" />​
				</div>
				</form>
				<br />
			</div>
			<div>
				<table width="100%" class='Schedule-table'>
					<thead>
						<tr height="30px">
							<th width="12.5%" align=center class='Schedule-table-td'><font color=red>일요일</font></th>
							<th width="15%" align=center class='Schedule-table-td'>월요일</th>
							<th width="15%" align=center class='Schedule-table-td'>화요일</th>
							<th width="15%" align=center class='Schedule-table-td'>수요일</th>
							<th width="15%" align=center class='Schedule-table-td'>목요일</th>
							<th width="15%" align=center class='Schedule-table-td'>금요일</th>
							<th width="12.5%" align=center class='Schedule-table-td'><font color=blue>토요일</font></th>
						</TR>
					</thead>
					<tr height="90px" >
						<c:if test="${today.firstDayOfWeek != '1'}">
							<%-- 해당 월의 가장 첫째줄에 있는 공백부분을 셈해서 처리한다.--%>
							<c:forEach var="i" begin="1" end="${today.firstDayOfWeek-1}">
								<td class='Schedule-table-td'  valign="top" align="left" style="padding: 5"></td>
							</c:forEach>
						</c:if>
						<c:forEach var="currentDay" begin="1" end="${today.lastDateOfMonth}">
							<td bgcolor="#ffffff" class='Schedule-table-td' style="padding: 5" valign="top">
								<table cellpadding="0" cellsping="0" border="0">
									<tr height="12px">
										<td class="uline" valign="top" align="left"><c:if test="${today.date == currentDay}"><b><span style="font-size:26px;"></c:if>
										<a href='javascript:detail("${today.year}","${today.month}","${currentDay}")'>
												<c:choose>
													<c:when test="${((currentDay-(8-today.firstDayOfWeek)) % 7) == 1}">
														<!-- 일요일 -->
														<FONT color="red"><c:out value="${currentDay}" /></FONT>
													</c:when>
													<c:when test="${((currentDay-(8-today.firstDayOfWeek)) % 7) == 0}">
														<!-- 토요일 -->
														<FONT color="blue" bold><c:out value="${currentDay}" /></FONT>
													</c:when>
													<c:otherwise>
														<FONT color="#000000"><c:out value="${currentDay}" />
													</c:otherwise>
												</c:choose>
												<c:if test="${today.date == currentDay}"></span></b> </c:if>
										</a>
										</td>
									</tr>
									<tr>
										<td valign="top">
											<table>
												<tr height="30px" >
													<td>
														<c:forEach items="${telephoneSurveyList}" var="telephoneSurveyList">
															<c:set var ="day" value = "${fn:substring(telephoneSurveyList.surveyDate,8,10)}" />
															<c:if test="${currentDay == day}">
																<font size="2px">☎ : <c:out value="${telephoneSurveyList.range}" /></font>
															</c:if>															
														</c:forEach>
													</td>
												</tr>
												<tr height="30px">
													<td></td>
												</tr>
												<tr height="30px">
													<td></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
							<%-- 만약 한주의 마지막날(토요일)이고 이 달의 마지막 날이 아니라면 다음 줄로 넘어간다. --%>
							<c:if test="${((currentDay-(8-today.firstDayOfWeek)) % 7) == 0}">
					</tr>
					<tr>
						</c:if>
						</c:forEach>

						<%-- 해당 월의 가장 마지막 줄에 있는 공백부분을 셈해서 처리한다.--%>
						<c:if test="${today.lastDayOfWeek != '7'}">
							<c:forEach var="i" begin="1" end="${7-today.lastDayOfWeek}">
								<td class='Schedule-table-td' valign=top align=right style='padding: 5'>
								</td>
							</c:forEach>
						</c:if>
					</tr>
				</table>
				<%-- end month outline table --%>
			</div>
		</div>
		</div>
</body>
</html>