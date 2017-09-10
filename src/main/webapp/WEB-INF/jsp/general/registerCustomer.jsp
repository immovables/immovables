<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<title>고객등록화면</title>
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
	
	// 연락일시
	$( "#callDatepicker" ).datepicker({ 
		changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
		changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
		minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
		nextText: '다음 달', // next 아이콘의 툴팁.
		prevText: '이전 달', // prev 아이콘의 툴팁.
		numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
		yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
		showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
		currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
		closeText: '닫기',  // 닫기 버튼 패널
		dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
		showAnim: "slide", //애니메이션을 적용한다.
		showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
		dayNamesMin: ['일','월', '화', '수', '목', '금', '토'], // 요일의 한글 형식.
		maxDate: 0,
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.
	});

	// 상황예정일시
    $( "#meetingDatepicker" ).datepicker({ 
		changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
		changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
		minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
		nextText: '다음 달', // next 아이콘의 툴팁.
		prevText: '이전 달', // prev 아이콘의 툴팁.
		numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
		yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
		showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
		currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
		closeText: '닫기',  // 닫기 버튼 패널
		dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
		showAnim: "slide", //애니메이션을 적용한다.
		showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
		dayNamesMin: ['일','월', '화', '수', '목', '금', '토'], // 요일의 한글 형식.
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.
    });

	// 입주시기
    $('#moveDatepicker').datepicker({
    	changeMonth: true,
        changeYear: true,
		currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
		closeText: '선택',  // 닫기 버튼 패널
        showButtonPanel: true,
        dateFormat: 'yy-mm',
        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
                     '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
                     monthNamesShort: ['1월','2월','3월','4월','5월','6월',
                     '7월','8월','9월','10월','11월','12월'],
        onClose: function(dateText, inst) {
            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            $(this).val($.datepicker.formatDate('yy-mm', new Date(year, month, 1)));
        }
    });

    $("#moveDatepicker").focus(function () {
        $(".ui-datepicker-calendar").hide();
        $("#ui-datepicker-div").position({
            my: "center top",
            at: "center bottom",
            of: $(this)
        });
    });
	

    
    // 연락처 숫자만 입력
	$('#contactNumber').keyup(function () { 
	    this.value = this.value.replace(/[^0-9\-]/gi,'');
    	var val = this.value;
    	if(val.length==0){
    		$("#necessaryContactNumber").show();
        	$('#necessaryContactNumber').css("color","red");
        	$('#necessaryContactNumber').text('* 필수 항목!');
    	}else {
    		$("#necessaryContactNumber").hide();
    	}
	});
    
	$('#callDatepicker').change(function () { 
    	var val = this.value;
    	if(val.length==0){
    		$("#necessaryCallDate").show();

    	}else {
    		$("#necessaryCallDate").hide();
    	}
	});
	
    // 보증금 숫자만 입력
	$('input[name*=Deposit]').keyup(function () { 
	    this.value = this.value.replace(/[^0-9\.]/gi,'');
	});

    // 임대료 숫자만 입력
	$('input[name*=Rental]').keyup(function () { 
	    this.value = this.value.replace(/[^0-9\.]/gi,'');
	});

	// 상황예정일시 미정 Click
	$("#undecidedMeetingDate").click(function(){
		//만약 전체 선택 체크박스가 체크된상태일경우 
		if($("#undecidedMeetingDate").prop("checked")) {
			
			$("#meetingDatepicker").attr("disabled",true);
			$("#meetingHour").attr("disabled",true);
			$("#meetingMinute").attr("disabled",true);
			
		// 전체선택 체크박스가 해제된 경우 
		}else { 
			//해당화면에 모든 checkbox들의 체크를해제시킨다. 
			$("#meetingDatepicker").attr("disabled",false);
			$("#meetingHour").attr("disabled",false);
			$("#meetingMinute").attr("disabled",false);
		}

	});

	// 지역  Check 이벤트
	$("#allZone").click(function(){
		//만약 전체 선택 체크박스가 체크된상태일경우 
		if($("#allZone").prop("checked")) {
			$("input[name*=Zone]").prop("checked",true);
			$("input[name*=Line]").prop("checked",true);
		// 전체선택 체크박스가 해제된 경우 
		}else { 
			//해당화면에 모든 checkbox들의 체크를해제시킨다. 
			$("input[name*=Zone]").prop("checked",false); 
			$("input[name*=Line]").prop("checked",false);
		}
	});

	
	$("#gangnamguZone").click(function(){
		//만약 전체 선택 체크박스가 체크된상태일경우 
		if($("#gangnamguZone").prop("checked")) {
			$("input[name^=gangnam]").prop("checked",true);
		// 전체선택 체크박스가 해제된 경우 
		}else { 
			//해당화면에 모든 checkbox들의 체크를해제시킨다. 
			$("input[name^=gangnam]").prop("checked",false); 
			$("#allZone").prop("checked",false); // 전지역 선택 해제
		}
	});

	$("#seochoguZone").click(function(){
		//만약 전체 선택 체크박스가 체크된상태일경우 
		if($("#seochoguZone").prop("checked")) {
			$("input[name^=seocho]").prop("checked",true);
		// 전체선택 체크박스가 해제된 경우 
		}else { 
			//해당화면에 모든 checkbox들의 체크를해제시킨다. 
			$("input[name^=seocho]").prop("checked",false); 
			$("#allZone").prop("checked",false); // 전지역 선택 해제
		}
	});

	
	$("#contactCheck").click(function(){
		var number = $('#contactNumber').val();
		var callDate = $('#callDatepicker').val();
		
		if(number == "" || number == null || number == undefined || ( number != null && typeof number == "object" && !Object.keys(number).length)){
    		$("#necessaryContactNumber").show();
        	$('#necessaryContactNumber').css("color","red");
        	$('#necessaryContactNumber').text('전화번호를 입력하세요.');
		}else if(number.length<=9 || number.length>14){
    		$("#necessaryContactNumber").show();
        	$('#necessaryContactNumber').css("color","red");
        	$('#necessaryContactNumber').text('잘못된 형식의 번호');
		}else {
			console.log(number);
		    $.ajax({
		    	headers: { Accept : "application/json"},
		        type:"POST",
		        url:"./checkContactNumber.do",
		        data : {contactNumber : number},
		        dataType : "JSON",
		        success: function(data){
		        	console.log(data);
		        	console.log(number);
		        	if(data.result == null){
		            	$('#necessaryContactNumber').show();
		            	$('#necessaryContactNumber').css("color","green");
		            	$('#necessaryContactNumber').text('신규  번호');


		        	}else if(data.result.contactNumber == number){
		            	alert("해당 번호로 등록된 데이터가 있습니다. 등록자 : " + data.result.createrId);
		            }else if(data.result =='-1'){
		            	alert("권한이 없습니다.로그인 페이지로 이동합니다.");
		            	location.href="/login.do";


		            	
		            }
		        },
		        error: function(xhr, status, error) {
		        	alert("오류가 발생하였습니다.");
		        }  
		    });
		}

	});
	
	$("#registerButton").click(function(){
		  document.customerForm.submit();
	});

	$("#cancelButton").click(function(){
		location.replace('/customer.do');
	});
	
	
	
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
					<tr>
						<th style="text-align:center; background-color:#CEECF5; width:7%;" class="line">연락처  *</th>
	                    <td colspan="2" style="width:15%;" class="line">
	                       <input type="text" id="contactNumber" name="contactNumber" size="12" maxlength="13" placeholder="숫자, [ - ] 만 입력">
	                       <input type="button" id="contactCheck" class="check-button" value="중복확인" >
	                       <span id="necessaryContactNumber" style="color: red;">* 필수 항목!</span>                            
	                   </td>
	                   <th style="text-align:center; background-color:#CEECF5; width:7%;" class="line" >연락일시  *</th>
	                   <td class="line" style="width:30%;">
	                       <input type="text" id="callDatepicker" name="callDatepicker" size="8" maxlength="13">
	                       <select name="callHour">
	                           <option value="" disabled selected>시</option>
	                           <c:forEach var = "i" begin = "0" end = "24">
	                           <c:if test="${i le 9}">
		                           <option value="0 + ${i}" >0${i} 시</option>
	                           </c:if>
	                           <c:if test="${i gt 9}">
		                           <option value="${i}" >${i} 시</option>
	                           </c:if>
	                           </c:forEach>
	                       </select>     
	                       <select name="callMinute">
	                           <option value="" disabled selected>분</option>
	                           <c:forEach var = "i" begin = "0" end = "59">
	                           <c:if test="${i le 9}">
		                           <option value="0 + ${i}" >0${i} 분</option>
	                           </c:if>
	                           <c:if test="${i gt 9}">
		                           <option value="${i}" >${i} 분</option>
	                           </c:if>
	                           </c:forEach>
	                       </select>     
	                       <span id="necessaryCallDate" style="color: red;">* 필수 항목!</span>                            
	                       
	                   </td>
	                   <th style="text-align:center; background-color:#CEECF5; width:7%;" class="line" >상황예정일시</th>
	                   <td  colspan="2" class="line"  style="width:30%;">
	                       <input type="text" id="meetingDatepicker" name="meetingDatepicker" size="8" maxlength="13">
	                       <select id="meetingHour" name="meetingHour">
	                           <option value="" disabled selected>시</option>
	                           <c:forEach var = "i" begin = "0" end = "24">
	                           <c:if test="${i le 9}">
		                           <option value="0 + ${i}" >0${i} 시</option>
	                           </c:if>
	                           <c:if test="${i gt 9}">
		                           <option value="${i}" >${i} 시</option>
	                           </c:if>
	                           </c:forEach>
	                       </select>     
	                       <select id="meetingMinute" name="meetingMinute">
	                           <option value="" disabled selected>분</option>
	                           <c:forEach var = "i" begin = "0" end = "59">
	                           <c:if test="${i le 9}">
		                           <option value="0 + ${i}" >0${i} 분</option>
	                           </c:if>
	                           <c:if test="${i gt 9}">
		                           <option value="${i}" >${i} 분</option>
	                           </c:if>
	                           </c:forEach>
	                       </select> &nbsp;
							<input type="checkbox" id="undecidedMeetingDate" name="undecidedMeetingDate" value="undecidedMeetingDate"><label for="undecidedMeetingDate"><span></span>미정</label>
	                   </td>

	               </tr>
					<tr>
						<th style="text-align:center; background-color:#CEECF5;" class="line">업종</th>
						<td colspan="2" class="line">
							<input type="text" name="businessType" size="40" maxlength="50">
						</td>
						<th style="text-align:center; background-color:#CEECF5;" class="line">종류</th>
						<td colspan="5" class="line">
							<input type="checkbox" id="generalType" name="generalType" value="generalType" checked="checked"><label for="generalType"><span></span>일반</label>&nbsp; &nbsp; &nbsp;
							<input type="checkbox" id="houseType" name="houseType" value="houseType"><label for="houseType"><span></span>주택형</label>&nbsp; &nbsp; &nbsp;
							<input type="checkbox" id="detachedType" name="detachedType" value="detachedType"><label for="detachedType"><span></span>단독</label>&nbsp; &nbsp; &nbsp;
							<input type="checkbox" id="studioType" name="studioType" value="studioType"><label for="studioType"><span></span>스튜디오</label>&nbsp; &nbsp; &nbsp;
	                   </td>
	               </tr>
	               
	               <tr>
	                   <th style="text-align:center; background-color:#CEECF5; width:7%;" class="line">금액</th>
	                   <th style="text-align:center; background-color:#CEECF5; width:7%;" class="line">보증금</th>
	                   <td class="line">
							<input type="text" name="minDeposit" size="2" maxlength="10" placeholder="숫자만" > ~ <input type="text" name="maxDeposit" size="2" maxlength="10" placeholder="숫자만" > 만원 &nbsp; &nbsp;
                            <input type="checkbox" id="undecidedDeposit" name="undecidedDeposit" value="undecidedDeposit"><label for="undecidedDeposit"><span></span>미정</label>
	                   </td>
	
	                   <th style="text-align:center; background-color:#CEECF5;" class="line">임대료</th>
	                   <td colspan="4" class="line">
	                     	<input type="text" name="minRental" size="2" maxlength="10" placeholder="숫자만"> ~ <input type="text" name="maxRental" size="2" maxlength="10" placeholder="숫자만"> 만원 &nbsp; &nbsp;
                            <input type="checkbox" id="checkMaintenanceCost" name="checkMaintenanceCost" value="checkMaintenanceCost"><label for="checkMaintenanceCost"><span></span>관리비 포함</label>
	                   </td>
	               </tr>
	                   
	               <tr>
	                   <th style="text-align:center; background-color:#CEECF5;" class="line">평수</th>
	                   <td colspan="2" class="line">
	                     	<input type="text" name="minArea" size="2" maxlength="10" placeholder="숫자만"> ~ <input type="text" name="maxArea" size="2" maxlength="10" placeholder="숫자만"> 평(坪)
                            <input type="checkbox" id="isUndecidedArea" name="isUndecidedArea"><label for="undecidedArea"><span></span>미정</label>
	                   </td>
	                   
	                   <th style="text-align:center; background-color:#CEECF5;" class="line">층</th>
	                   <td colspan="6" class="line">
							<select name="floor">
	                           <option value="" disabled selected>층</option>
	                           <option value="-1">지하 층</option>
	                           <c:forEach var = "i" begin = "1" end = "15">
		                           <option value="${i}">${i} 층</option>
	                           </c:forEach>
	                       </select> 
							<input type="radio" id="moreFloor" name="floor" value="more"><label for="moreFloor"><span></span>이상</label>&nbsp; &nbsp; &nbsp;
							<input type="radio" id="onlyFloor" name="floor" value="only"><label for="onlyFloor"><span></span>만</label>&nbsp; &nbsp; &nbsp;
							<input type="radio" id="belowFloor" name="floor" value="below"><label for="belowFloor"><span></span>이하</label>&nbsp; &nbsp; &nbsp;
							<span>◈ 직접기입 : </span><input type="text" name="etcFloor">
	                   </td>
	               </tr>
	               <tr>
	                   	<th style="text-align:center; background-color:#CEECF5;" class="line">옵션 </th>
	                   	<th style="text-align:center; background-color:#CEECF5; width:7%;" class="line">Room</th>
	                   	<td class="line">
	                    <select name="roomNumber">                            
	                    	<c:forEach var = "i" begin = "0" end = "10">
	                            <option value="${i}" >${i} 개</option>
						 	</c:forEach>
					 	</select>&nbsp; 
						 <input type="checkbox" id="isCompulsoryRoom" name="isCompulsoryRoom"/>
						 <label for="isCompulsoryRoom"><span></span>필수</label>
						</td> 
						<th style="text-align:center; background-color:#CEECF5;" class="line">주차</th>
						<td class="line"> 
	                    <select name="parkingNumber">                            
	                    	<c:forEach var = "i" begin = "0" end = "10">
	                            <option value="${i}" >${i} 대</option>
						 	</c:forEach>
					 	</select>&nbsp; 
						 <input type="checkbox" id="isCompulsoryParking" name="isCompulsoryParking"/>
						 <label for="isCompulsoryParking"><span></span>필수</label>
					 	</td>
						<th style="text-align:center; background-color:#CEECF5; width:7%;" class="line">EV</th>
						<td class="line"> 
	                    <select name="elevator">                            
	                    	<c:forEach var = "i" begin = "1" end = "5">
	                            <option value="${i}" >${i} 층</option>
						 	</c:forEach>
					 	</select>
					 	<span>이상  &nbsp; </span> 
						 <input type="checkbox" id="isCompulsoryElevator" name="isCompulsoryElevator"/>
						 <label for="isCompulsoryElevator"><span></span>필수</label>
					 </td>
	               </tr> 
	
	            <tr>
					<th style="text-align:center; background-color:#CEECF5;" class="line">지역</th>
					<td colspan="8" class="line">
						<br>
	                	<input type="checkbox" id="allZone" name="allZone" value="allZone"><label for="allZone"><span></span>전지역</label>
	                    <br><br><br>▒ 행정구역 ▒<br><br>
						<input type="checkbox" id="gangnamguZone" name="gangnamguZone" value="gangnamguZone"><label for="gangnamguZone"><span></span>강남구(전체)</label>&nbsp; &nbsp; &nbsp; &nbsp;
	                    <input type="checkbox" id="gangnamYeoksamZone" name="gangnamYeoksamZone" value="gangnamYeoksamZone"><label for="gangnamYeoksamZone"><span></span>역삼동</label>&nbsp; &nbsp; &nbsp;
	                    <input type="checkbox" id="gangnamNonhyeonZone" name="gangnamNonhyeonZone" value="gangnamNonhyeonZone"><label for="gangnamNonhyeonZone"><span></span>논현동</label>&nbsp; &nbsp; &nbsp;
	                    <input type="checkbox" id="gangnamDaechiZone" name="gangnamDaechiZone" value="gangnamDaechiZone"><label for="gangnamDaechiZone"><span></span>대치동</label>&nbsp; &nbsp; &nbsp;
	                    <input type="checkbox" id="gangnamSamsungZone" name="gangnamSamsungZone" value="gangnamSamsungZone"><label for="gangnamSamsungZone"><span></span>삼성동</label>&nbsp; &nbsp; &nbsp;
	                    <input type="checkbox" id="gangnamSinsaZone" name="gangnamSinsaZone" value="gangnamSinsaZone"><label for="gangnamSinsaZone"><span></span>신사동</label>&nbsp; &nbsp; &nbsp;
	                    <input type="checkbox" id="gangnamChungdamZone" name="gangnamChungdamZone" value="gangnamChungdamZone"><label for="gangnamChungdamZone"><span></span>청담동</label>&nbsp; &nbsp; &nbsp;
	                    <input type="checkbox" id="gangnamDogokZone" name="gangnamDogokZone" value="gangnamDogokZone"><label for="gangnamDogokZone"><span></span>도곡동</label>
						<br><br>
						<input type="checkbox" id="seochoguZone" name="seochoguZone" value="seochoguZone"><label for="seochoguZone"><span></span>서초구(전체)</label>&nbsp; &nbsp; &nbsp; &nbsp;  
	                    <input type="checkbox" id="seochoSeochoZone" name="seochoSeochoZone" value="seochoSeochoZone"><label for="seochoSeochoZone"><span></span>서초동</label>&nbsp; &nbsp; &nbsp;  
	                    <input type="checkbox" id="seochoYangjaeZone" name="seochoYangjaeZone" value="seochoYangjaeZone"><label for="seochoYangjaeZone"><span></span>양재동</label>&nbsp; &nbsp; &nbsp;  
	                    <input type="checkbox" id="seochoBanpoZone" name="seochoBanpoZone" value="seochoBanpoZone"><label for="seochoBanpoZone"><span></span>반포동</label>&nbsp; &nbsp; &nbsp;  
	                    <input type="checkbox" id="seochoJamwonZone" name="seochoJamwonZone" value="seochoJamwonZone"><label for="seochoJamwonZone"><span></span>잠원동</label>&nbsp; &nbsp; &nbsp;  
	                    <input type="checkbox" id="seochoJamsilZone" name="seochoJamsilZone" value="seochoJamsilZone"><label for="seochoJamsilZone"><span></span>잠실동</label>&nbsp; &nbsp; &nbsp;  
	                    <input type="checkbox" id="seochoSamjunZone" name="seochoSamjunZone" value="seochoSamjunZone"><label for="seochoSamjunZone"><span></span>삼전동</label>
						<br><br><br>▒ 전철역 ▒<br><br>
	                    <input type="checkbox" id="2hoLine" name="2hoLine" value="2hoLine"><label for="2hoLine"><span></span>2호선</label>&nbsp; &nbsp; &nbsp; 
	                    <input type="checkbox" id="3hoLine" name="3hoLine" value="3hoLine"><label for="3hoLine"><span></span>3호선</label>&nbsp; &nbsp; &nbsp; 
	                    <input type="checkbox" id="7hoLine" name="7hoLine" value="7hoLine"><label for="7hoLine"><span></span>7호선</label>&nbsp; &nbsp; &nbsp; 
	                    <input type="checkbox" id="9hoLine" name="9hoLine" value="9hoLine"><label for="9hoLine"><span></span>9호선</label>&nbsp; &nbsp; &nbsp; 
	                    <input type="checkbox" id="bundangLine" name="bundangLine" value="bundangLine"><label for="bundangLine"><span></span>분당선</label>
	                       <br><br>
	                   </td>
	               </tr>
	
				 <tr>   
	                   <th style="text-align:center; background-color:#CEECF5;" class="line">입주시기</th>
	                   <td colspan="2" class="line">
	                    <input type="text" id="moveDatepicker" name="moveMonth" size="8" maxlength="50">
	                       <select name="moveDay">
	                           <option value="" disabled selected>날짜</option>
	                           <option value="100" >초</option>
	                           <option value="200" >중</option>
	                           <option value="300" >말</option>
	                           <c:forEach var = "i" begin = "1" end = "31">
	                           <option value="${i}" >${i} 일</option>
	                           </c:forEach>
	                       </select>            
	                       <input type="checkbox" id="undecidedMoveDate" name="undecidedMoveDate" value="undecidedMoveDate"><label for="undecidedMoveDate"><span></span>미정</label>
	                   </td>
	                   <th style="text-align:center; background-color:#CEECF5;" class="line">상태</th>
	                   <td colspan="5" class="line">
							<input type="radio" id="stateNew" name="state" checked="checked" value="1"><label for="stateNew"><span></span>신규(상황 전)</label>&nbsp; &nbsp; &nbsp;
							<input type="radio" id="stateMeeting" name="state" value="2"><label for="stateMeeting"><span></span>상황 진행중</label>&nbsp; &nbsp; &nbsp;
							<input type="radio" id="stateContract" name="state" value="3"><label for="stateContract"><span></span>계약완료</label>&nbsp; &nbsp; &nbsp;
							<input type="radio" id="stateFinish" name="state" value="4"><label for="stateFinish"><span></span>종료</label>&nbsp; &nbsp; &nbsp;
							<span>◈ 직접기입 : </span><input type="text" name="etcFloor"/>
	                   </td>
	                 </tr> 
	               <tr>
	               	<th style="text-align:center; background-color:#CEECF5;" class="line">내용</th>
	               	<td colspan="7" class="line"><textarea name="content" style="width:100%; height:150px; resize:none;"></textarea></td>
	               	
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