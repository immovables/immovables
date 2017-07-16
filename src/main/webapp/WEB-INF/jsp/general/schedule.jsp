<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css" />

<title>스케줄 목록</title>
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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<form action="/searchSchedule.do">
		<header>
		<c:import url="../admin/head.jsp" charEncoding="UTF-8" /></header>
		<div id="content">
			<aside id="main_aside"> <c:import url="../admin/side.jsp"
				charEncoding="UTF-8" /></aside>
			<br />
			<section id="main_section"> <%-- <c:out value="${sessionScope.id }" />  --%>
			<div id="wrap">
				<div>
					<select class="select_box" name="year">
						<c:forEach var="year" begin="2016" end="${(today.year)+1}"
							step="1" varStatus="status">
							<option value="${year}"	<c:if test="${year == today.year}">selected</c:if>>${year} 년</option>
						</c:forEach>
					</select> <select class="select_box" name="month">
						<c:forEach var="month" begin="1" end="12" step="1" varStatus="status">
							<option value="${month}" <c:if test="${month== today.month}">selected</c:if>>${month} 월</option>
						</c:forEach>
					</select> <input type="submit" class="button" value="조회" />​
				</div>
				<br />
			</div>
			<div>
				<TABLE width="100%" border="1" cellspacing="0" cellpadding="0">
					<thead>
						<TR height="50px">
							<TD align=center><FONT color=red>일요일</FONT></TD>
							<TD align=center>월요일</TD>
							<TD align=center>화요일</TD>
							<TD align=center>수요일</TD>
							<TD align=center>목요일</TD>
							<TD align=center>금요일</TD>
							<TD align=center><FONT color=blue>토요일</FONT></TD>
						</TR>
					</thead>
					<TR height="115px">
						<c:if test="${today.firstDayOfWeek != '1'}">
							<%-- 해당 월의 가장 첫째줄에 있는 공백부분을 셈해서 처리한다.--%>
							<c:forEach var="i" begin="1" end="${today.firstDayOfWeek-1}">
								<TD class="uline" valign="top" align="right" style="padding: 5"></TD>
							</c:forEach>
						</c:if>
						<c:forEach var="currentDay" begin="1" end="${today.lastDateOfMonth}">
							<TD bgcolor="#ffffff" style="padding: 5" valign="top">
								<TABLE cellpadding="0" cellsping="0" border="0">
									<TR height="115px">
										<TD class="uline" valign="top" align="right"><c:if test="${today.date == currentDay}"><b><span style="font-size:26px;"></c:if>
										<A
											href='javascript:dWrite("${today.year}","${today.month}","${currentDay}")'>
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
										</A></TD>
									</TR>
									<TR>
										<TD valign="top">
											<TABLE>

											</TABLE>
										</TD>
									</TR>
								</TABLE>
							</TD>
							<%-- 만약 한주의 마지막날(토요일)이고 이 달의 마지막 날이 아니라면 다음 줄로 넘어간다. --%>
							<c:if test="${((currentDay-(8-today.firstDayOfWeek)) % 7) == 0}">
					</TR>
					<TR>
						</c:if>
						</c:forEach>

						<%-- 해당 월의 가장 마지막 줄에 있는 공백부분을 셈해서 처리한다.--%>
						<c:if test="${today.lastDayOfWeek != '7'}">
							<c:forEach var="i" begin="1" end="${7-today.lastDayOfWeek}">
								<TD class=uline valign=top align=right style='padding: 5'>
								</TD>
							</c:forEach>
						</c:if>
					</TR>
				</TABLE>
				<%-- end month outline table --%>
			</div>
		</div>
		</section>
	</form>
</body>
</html>