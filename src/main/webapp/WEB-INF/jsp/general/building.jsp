<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../../../css/style.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<title>매물 목록</title>
<style type="text/css">

</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){

	$('#registerButton').click(function() {
		var url = 'http://www.오피스코리아매물장.com/data_view.php?data_id=5174&type_name=phone';
		$.ajax({
			type:'GET',
			url : url,
			success:function(args){
				$('#listDiv').html(args);
				console.log(args);
			}
		})
	});
	
});

</script>
</head>
<body>
<div id="listDiv"></div>

	<div><c:import url="../admin/head.jsp" charEncoding="UTF-8" /></div>
	<div id="content"><!-- 회원 -->
		<div id="main_aside"> <c:import url="../admin/side.jsp" charEncoding="UTF-8" />
	</div>
		<br/>
		<div id="main_section">
		<div id="wrap">
			<form action="">
			<div>
				<span>지역 : </span>
				<input type="text" id="dong" name="dong" size="12" maxlength="13" placeholder="행정구역 '동' 입력" />
				<br/>
				<span>보증금 : </span><input type="text" id="minDeposit" name="minDeposit" size="4" maxlength="7" placeholder="숫자" /> ~ <input type="text" id="maxDeposit" name="maxDeposit" size="5" maxlength="7" placeholder="숫자" />
				&nbsp; &nbsp; &nbsp;
				<span>월 임대료 : </span><input type="text" id="minDeposit" name="minDeposit" size="4" maxlength="7" placeholder="숫자" /> ~ <input type="text" id="maxDeposit" name="maxDeposit" size="5" maxlength="7" placeholder="숫자" />
				&nbsp; &nbsp;<input type="checkbox" id="inclusionCost" name="inclusionCost"/><label for="inclusionCost"><span></span>관리비 포함</label>								
				<br/>
				<span>Room : </span>
				<select class="select_box" name="room">
	            	<option value="" >전체</option>
					<c:forEach var = "i" begin = "0" end = "15">
	                	<option value="${i}" >${i} 개</option>
                    </c:forEach>
				</select> 
				<span>주차 : </span>
				<select class="select_box" name="room">
	            	<option value="" >상관없음</option>
					<c:forEach var = "i" begin = "0" end = "9">
	                	<option value="${i}" >${i} 개</option>
                    </c:forEach>
				</select> 
				<input type="text" id="parking" name="parking" size="3" maxlength="3" placeholder="주차 가능 수" />
				<input type="submit" class="button" id="seachButton" value="조회" />​
				<input type="button" class="register-button" id="registerButton" value="등록" />​
			</div>
			<br/>
			<table width="100%" class='Schedule-table'>
				<thead>
					<TR height="50px">
						<th align="center" width="1%" class='Schedule-table Schedule-table-td'>No</th>
						<th align="center" width="8%" class='Schedule-table Schedule-table-td'>연락처</th>
						<th align="center" width="16%" class='Schedule-table Schedule-table-td'>업종</th>
						<th align="center" width="18%" class='Schedule-table Schedule-table-td'>금액</th>
						<th align="center" width="7%" class='Schedule-table Schedule-table-td'>면적</th>
						<th align="center" width="7%" class='Schedule-table Schedule-table-td'>상태</th>
						<th align="center" width="16%" class='Schedule-table Schedule-table-td'>담당자</th>
					</TR>
				</thead>
				<c:forEach items="${customerList}" var="customerList" varStatus="status">
						<c:set var="seq" value="${customerList.seq}"/>
						<c:set var="minDeposit" value="${customerList.minDeposit}"/>
						<c:set var="maxDeposit" value="${customerList.maxDeposit}"/>
						<c:set var="minRental" value="${customerList.minRental}"/>
						<c:set var="maxRental" value="${customerList.maxRental}"/>
						<c:set var="minArea" value="${customerList.minArea}"/>
						<c:set var="maxArea" value="${customerList.maxArea}"/>
						<c:set var="state" value="${customerList.state}"/>
						<tr height="40px">
							<td align="center" class='Schedule-table Schedule-table-td'>${status.count}</td>
							<td align="left" class='Schedule-table Schedule-table-td'>
								<a href = "<c:url value = "/customerDetail/${seq}.do"/>">${customerList.contactNumber}</a>
							</td>
							<td align="left" class='Schedule-table Schedule-table-td'>${customerList.businessType}</td>
							<td align="left" class='Schedule-table Schedule-table-td'>
								보 - <c:if test="${minDeposit > 0}"> ${minDeposit} ~ </c:if>${maxDeposit}  / 
								월 - <c:if test="${minRental > 0}"> ${minRental} ~ </c:if>${maxRental} 만원
							</td>
							<td align="center" class='Schedule-table Schedule-table-td'>
								<c:if test="${minArea > 0}"> ${minArea} ~ </c:if>${maxArea} 평</td>
							<td align="center" class='Schedule-table Schedule-table-td'>
								<c:choose>
									<c:when test="${state == 1}">신규</c:when>
									<c:when test="${state == 2}">상황 진행중</c:when>
									<c:when test="${state == 3}">계약 완료</c:when>
									<c:when test="${state == 4}">종료</c:when>
									<c:otherwise>${customerList.stateEtc}</c:otherwise>
								</c:choose>
							</td>
							<td align="center" class='Schedule-table Schedule-table-td'>${customerList.member.name}</td>
				</c:forEach>
				<c:if test="${fn:length(customerList)==0 }">
					<tr align="center" height="50px">
						<td colspan="8" class='Schedule-table Schedule-table-td'>데이터가 없습니다. </td>
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