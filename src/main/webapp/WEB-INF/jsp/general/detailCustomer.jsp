<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<title>고객상세화면</title>
<style type="text/css">
#popLayer{
  display: none;
  width: 100px;
  height: 50px;
  border: 1px solid red;
}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.dim-layer').hide();
	
});


</script>
</head>
<body>
	<div><c:import url="../admin/head.jsp" charEncoding="UTF-8" /></div>
	<div id="content"><div id="main_aside"> <c:import url="../admin/side.jsp" charEncoding="UTF-8" /></div>
		<br/>
		<div id="main_section">
			<div id="wrap">
			<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
			<form id="customerForm" name="customerForm" method="POST" action="/registerCustomer.do" name="customer" onsubmit="return false;">
				<br>
				<table style="width:100%;" class='Schedule-table'>
					<tr style="height:50px">
						<th style="text-align:center; background-color:#CEECF5; width:7%;" class="line">연락처</th>
	                    <td colspan="3" style="width:15%;" class="line">
	                       <c:out value="${customer.contactNumber}" ></c:out>             
	                   </td>
	                   <th style="text-align:center; background-color:#CEECF5; width:7%;" class="line" >최초 연락일시</th>
	                   <td class="line" style="width:20%;">
	                       <c:out value="${customer.callDatetime}" ></c:out>             
	                   </td>
	                   <th style="text-align:center; background-color:#CEECF5; width:7%;" class="line" >상황예정일시</th>
	                   <td  colspan="2" class="line"  style="width:30%;">
	                       <c:out value="${customer.meetingDatetime}" ></c:out>             
	                   </td>
	               </tr>
					<tr style="height:50px">
						<th style="text-align:center; background-color:#CEECF5;" class="line">업종</th>
						<td colspan="3" class="line">
	                       <c:out value="${customer.businessType}" ></c:out>             
						</td>
						<th style="text-align:center; background-color:#CEECF5;" class="line">종류</th>
						<td colspan="5" class="line">
	                       <c:out value="${customer.officeType}" ></c:out>             
	                   </td>
	               </tr>
	               
					<tr style="height:50px">
	                   <th style="text-align:center; background-color:#CEECF5; width:7%;" class="line">보증금</th>
	                   <td class="line" colspan="3">
	                       <c:out value="${customer.minDeposit} ~ ${customer.maxDeposit}" > </c:out>             
	                   </td>
	
	                   <th style="text-align:center; background-color:#CEECF5;" class="line">임대료</th>
	                   <td colspan="5" class="line">
	                       <c:out value="${customer.minRental} ~ ${customer.maxRental}" > </c:out>             
	                   </td>
	               </tr>
	                   
					<tr style="height:50px">
	                   <th style="text-align:center; background-color:#CEECF5;" class="line">평수</th>
	                   <td colspan="3" class="line">
	                       <c:out value="${customer.minArea} ~ ${customer.maxArea}" > </c:out>             
	                   </td>
	                   
	                   <th style="text-align:center; background-color:#CEECF5;" class="line">층</th>
	                   <td colspan="5" class="line">
	                       <c:out value="${customer.contactNumber}" ></c:out>             
	                   </td>
	               </tr>
				<tr style="height:50px">
	                   	<th style="text-align:center; background-color:#CEECF5; width:7%;" class="line">Room</th>
	                   	<td class="line" colspan="3">
	                       <c:out value="${customer.contactNumber}" ></c:out>             
						</td> 
						<th style="text-align:center; background-color:#CEECF5;" class="line">주차</th>
						<td class="line"> 
	                       <c:out value="${customer.contactNumber}" ></c:out>             
					 	</td>
						<th style="text-align:center; background-color:#CEECF5; width:7%;" class="line">EV</th>
						<td class="line"> 
	                       <c:out value="${customer.contactNumber}" ></c:out>             
					 </td>
	               </tr> 
	
				<tr style="height:50px">
					<th style="text-align:center; background-color:#CEECF5;" class="line">지역</th>
					<td colspan="8" class="line">
	                       <c:out value="${customer.contactNumber}" ></c:out>             
	                </td>
	            </tr>
	
				<tr style="height:50px">
	                   <th style="text-align:center; background-color:#CEECF5;" class="line">입주시기</th>
	                   <td colspan="3" class="line">
	                       <c:out value="${customer.moveMonth}" />             
	                       <c:out value="${customer.moveDay}" />             
	                   </td>
	                   <th style="text-align:center; background-color:#CEECF5;" class="line">상태</th>
	                   <td colspan="5" class="line">
	                       <c:out value="${customer.state}" ></c:out>             
	                   </td>
	            </tr> 
					<tr style="height:50px">
					<th style="text-align:center; background-color:#CEECF5;" class="line">내용</th>
	               	<td colspan="7" class="line">
	                       <c:out value="${customer.content}" ></c:out>             
	               	</td>
	            </tr>
				
		    </table>
	    <br>
		<input type="button" class="register-button" style="background-color: #f44336;" id="cancelButton" value="취소"/>
		<input type="button" class="register-button" id="registerButton" value="등록" />
	
	    </form>
    	</div>
		</div>
	</div>
	
	

</body>

	
</body>
</html>