 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>

<html>
<head>
<jsp:include page="../../admin/common/header.jsp"></jsp:include> 
   <meta charset="UTF-8">
   <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>

<script src="./node_modules/jspdf/dist/jspdf.min.js"></script>

<script type = "text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script> 
<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type = "text/javascript" src = "https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>


<style type="text/css">
<!--
.border_tit {font-family:굴림, verdana, arial; font-size: 11px;color: #5863C7;}
.border_tit_red {font-family:굴림, verdana, arial; font-size: 11px;color: red;}
.border_up {font-family:굴림, verdana, arial; font-size: 11px;color: #5863C7; border-top-width:1; border-right-width:1; border-bottom-width:1; border-left-width:1; border-color:#5863C7; border-top-style:solid; border-left-style:none; border-right-style:solid; border-bottom-style:none;}
.border_up_red {font-family:굴림, verdana, arial; font-size: 11px;color: red; border-top-width:1; border-right-width:1; border-bottom-width:1; border-left-width:1; border-color:red; border-top-style:solid; border-left-style:none; border-right-style:solid; border-bottom-style:none;}
.border_all {font-family:굴림, verdana, arial; font-size: 11px;color: #5863C7; border-top-width:2; border-right-width:2; border-bottom-width:2; border-left-width:2; border-color:#5863C7; border-top-style:solid; border-left-style:solid; border-right-style:solid; border-bottom-style:solid; }
.border_all_red {font-family:굴림, verdana, arial; font-size: 11px;color: red; border-top-width:2; border-right-width:2; border-bottom-width:2; border-left-width:2; border-color:red; border-top-style:solid; border-left-style:solid; border-right-style:solid; border-bottom-style:solid;}
.border_both {font-family:굴림, verdana, arial; font-size: 11px;color: #5863C7; border-top-width:1; border-right-width:1; border-bottom-width:1; border-left-width:1; border-color:#5863C7; border-top-style:none; border-left-style:solid; border-right-style:solid; border-bottom-style:none;}
.border_both_red {font-family:굴림, verdana, arial; font-size: 11px;color: red; border-top-width:1; border-right-width:1; border-bottom-width:1; border-left-width:1; border-color:red; border-top-style:none; border-left-style:solid; border-right-style:solid; border-bottom-style:none;}
.border_top {font-family:굴림, verdana, arial; font-size: 11px;color: #5863C7; border-top-width:1; border-right-width:1; border-bottom-width:1; border-left-width:1; border-color:#5863C7; border-top-style:solid; border-left-style:none; border-right-style:none; border-bottom-style:none;}
.border_top_red {font-family:굴림, verdana, arial; font-size: 11px;color: red; border-top-width:1; border-right-width:1; border-bottom-width:1; border-left-width:1; border-color:red; border-top-style:solid; border-left-style:none; border-right-style:none; border-bottom-style:none;}
.border_back {font-family:굴림, verdana, arial; font-size: 11px;color: #5863C7; border-top-width:1; border-right-width:1; border-bottom-width:1; border-left-width:1; border-color:#5863C7; border-top-style:solid; border-left-style:solid; border-right-style:solid; border-bottom-style:none;}
.border_back_red {font-family:굴림, verdana, arial; font-size: 11px;color: red; border-top-width:1; border-right-width:1; border-bottom-width:1; border-left-width:1; border-color:red; border-top-style:solid; border-left-style:solid; border-right-style:solid; border-bottom-style:none;}
-->
</style>
</head>
<script>
	  var str = "${requestScope.price2nd}"
      var last = str.charAt(str.length-1);
      var last1 = str.charAt(str.length-2);
      var last2 = str.charAt(str.length-3);
      var last3 = str.charAt(str.length-4);
      var last4 = str.charAt(str.length-5);
      var last5 = str.charAt(str.length-6);
      var last6 = str.charAt(str.length-7);
      var last7 = str.charAt(str.length-8);
      var last8 = str.charAt(str.length-9);
      
      var tax = "${requestScope.taxPrice}";
      var tax1 = tax.charAt(tax.length-1);
      var tax2 = tax.charAt(tax.length-2);
      var tax3 = tax.charAt(tax.length-3);
      var tax4 = tax.charAt(tax.length-4);
      var tax5 = tax.charAt(tax.length-5);
      var tax6 = tax.charAt(tax.length-6);
      var tax7 = tax.charAt(tax.length-7);
      var tax8 = tax.charAt(tax.length-8);
      var tax9 = tax.charAt(tax.length-9);
      
      var today = new Date();   

      var year = today.getFullYear(); // 년도
      var month = today.getMonth() + 1;  // 월
      var date = today.getDate();  // 날짜
      var day = today.getDay();  // 요일

      
</script>
<body>

<section id="product" class="product">

		<div class="container">		
				<div class="row">
				 <div class="head_title text-left fix">
		 	<p role="presentation" style="font-weight:800; font-size:25px; color:black; margin-top:10px;">세금계산서 상세보기</p>
                        </div>	
					 <div class="col-md-25">
							 <a href="${ pageContext.servletContext.contextPath }/admin/taxManageList"><img src="${ pageContext.servletContext.contextPath }/resources/images/goback.png" 
							                               			style="width:50px;height:52px; margin-top:-60px; float:right;"></a>

   <button id="create_pdf" style="width: 100px; height:50px; margin-left : border-radius: 5px; font-size: larger;">pdf 생성</button>
<table width='778' cellpadding='0' cellspacing='0' align='center'>
 <tr>
  <td width='100%'><br><br><br>
  
  
<div id="pdf_wrap">

<table width='700' cellpadding='0' cellspacing='0' align='center' class='border_all'>
 <tr>
  <td width='100%'>
    <table cellpadding='0' cellspacing='0' height='65' width='100%'><tr>
      <td rowspan='2' align='center' width='360' class='border_tit'><font size='6'><b>세 금 계 산 서</b></font></td>
      <td rowspan='2' width='5' align='center' class='border_tit'><font size='4'><b>[</b></font></td>
      <td rowspan='2' width='70' align='center' class='border_tit'>공급받는자&nbsp;<br>보 &nbsp;관 &nbsp;용&nbsp;</td>
      <td rowspan='2' width='5' align='center' class='border_tit'><font size='4'><b>]</b></font></td>
      <td align='right' width='85' class='border_tit'>책 번 호&nbsp;&nbsp;</td>
      <td colspan='3' align='right' class='border_both'>권 &nbsp;</td>
      <td colspan='4' align='right' class='border_tit'>호 &nbsp;</td>
     </tr>
     <tr>
      <td width='85' align='right' class='border_tit'>일련번호&nbsp;</td>
      <td colspan='1' class='border_back ' width='25'>&nbsp;</td>
      <td colspan='1' class='border_up' width='25'>&nbsp;</td>
      <td colspan='1' class='border_up' width='25'>&nbsp;</td>
      <td colspan='1' class='border_up' width='25'>&nbsp;</td>
      <td colspan='1' class='border_up' width='25'>&nbsp;</td>
      <td colspan='1' class='border_up' width='25'>&nbsp;</td>
      <td colspan='1' class='border_top' width='25'>&nbsp;</td>  <!-- 책,권 -->
     </tr>
    </table>
   </td>
  </tr>
  <tr> 
   <td>
    <c:forEach var="adApprove" items="${ requestScope.adApprove }">
    <table cellpadding='0' cellspacing='0' width='700'>
     <tr>
      <td class='border_up' align='center' width='17' rowspan='4'>공<br><br><br>급<br><br><br>자</td>
      <td class='border_up' align='center' width='55' height='33'>등록번호</td>
      <td class='border_up' align='center' width='278' colspan='5'>&nbsp;</td>
      <td class='border_up' align='center' width='17' rowspan='4'>공<br>급<br>받<br>는<br>자</td>
      <td class='border_up' align='center' width='55'>등록번호</td>
      <td class='border_top' align='center' width='278' colspan='5'>${adApprove.companyNumber }</td>
     </tr>
     <tr>
      <td class='border_up' align='center' width='55' height='33'>상 호<br>(법인명)</td>
      <td class='border_up' align='center' width='160' colspan='3'>펫 팔</td>
      <td class='border_up' align='center' width='12' colspan='1'>성<br>명</td>
      <td class='border_up' align='right' width='94' colspan='1'>김해인 인</td>
      <td class='border_up' align='center' width='55'>상 호<br>(법인명)</td>
      <td class='border_up' align='center' width='160' colspan='3'>${adApprove.companyName }</td>
      <td class='border_up' align='center' width='12' colspan='1'>성<br>명</td>
      <td class='border_top' align='right' width='94' colspan='1'><c:out value="${adApprove.leaderName }"></c:out> 인</td>
     </tr>
     <tr>
      <td class='border_up' align='center' width='55' height='33'>사업장<br>주  소</td>
      <td class='border_up' align='center' width='278' colspan='5'>서울</td>
      <td class='border_up' align='center' width='55'>사업장<br>주  소</td>
      <td class='border_top' align='center' width='278' colspan='5'><c:out value="${adApprove.companyLocation }"></c:out></td>
     </tr>
     <tr>
      <td class='border_up' align='center' width='55' height='33'>업  태</td>
      <td class='border_up' align='center' width='148' colspan='1'>광고대행업</td>
      <td class='border_up' align='center' width='12' colspan='1'>종<br>목</td>
      <td class='border_up' align='center' width='106' colspan='3'>반려동물 서비스업</td>
      <td class='border_up' align='center' width='55'>업 &nbsp; 태</td>
      <td class='border_up' align='center' width='148' colspan='1'><c:out value="${adApprove.industry }"></c:out></td>
      <td class='border_up' align='center' width='12' colspan='1'>종<br>목</td>
      <td class='border_top' align='center' width='106' colspan='3'><c:out value="${adApprove.industryDetail }"></c:out></td>
     </tr>
    </table>
    </c:forEach>
   </td>
  </tr>
  <tr>
   <td width='100%'>
    <c:forEach var="adApprove" items="${ requestScope.adApprove }">
    <table cellpadding='0' cellspacing='0' width='700'>
     <tr>
      <td class='border_up' align='center' width='85' height='21'>작 &nbsp; 성</td>
      <td class='border_up' colspan='12' width='250' align='center'>공 &nbsp; 급 &nbsp; 가 &nbsp; 액</td>
      <td class='border_up' rowspan='3' align='center' width='4' height='15'>&nbsp;</td>
      <td class='border_up' colspan='10' align='center' width='190' height='15'>세 &nbsp; 액</td>
      <td class='border_top' align='center' width='156'>비 &nbsp; 고</td>
     </tr>
     <tr>
      <td class='border_up' align='center' width='85' height='21'>년 &nbsp; 월 &nbsp; 일</td>
      <td class='border_up' align='center' width='35'><font size='1'>공란수</font></td>
      <td class='border_up' align='center' width='20'>백</td>
      <td class='border_up' align='center' width='20'>십</td>
      <td class='border_up' align='center' width='20'>억</td>
      <td class='border_up' align='center' width='20'>천</td>
      <td class='border_up' align='center' width='20'>백</td>
      <td class='border_up' align='center' width='20'>십</td>
      <td class='border_up' align='center' width='20'>만</td>
      <td class='border_up' align='center' width='20'>천</td>
      <td class='border_up' align='center' width='20'>백</td>
      <td class='border_up' align='center' width='20'>십</td>
      <td class='border_up' align='center' width='20'>일</td>
      
      <td class='border_up' align='center' width='20'>십</td>
      <td class='border_up' align='center' width='20'>억</td>
      <td class='border_up' align='center' width='20'>천</td>
      <td class='border_up' align='center' width='20'>백</td>
      <td class='border_up' align='center' width='20'>십</td>
      <td class='border_up' align='center' width='20'>만</td>
      <td class='border_up' align='center' width='20'>천</td>
      <td class='border_up' align='center' width='20'>백</td>
      <td class='border_up' align='center' width='20'>십</td>
      <td class='border_up' align='center' width='20'>일</td>
      <td class='border_top' align='center' width='156' rowspan='2'>&nbsp;</td>
     </tr>
     <tr>
      <td class='border_up' align='center' width='85' height='25'>${ adApprove.taxBillDate } </td>
      <td class='border_up' align='center' width='35'>&nbsp;</td>
      <td class='border_up' align='center' width='20'>&nbsp;</td>
      <td class='border_up' align='center' width='20'>&nbsp;</td>
      <td class='border_up' align='center' width='20'><script>document.write(last8)</script></td>
      <td class='border_up' align='center' width='20'><script>document.write(last7)</script></td>
      <td class='border_up' align='center' width='20'><script>document.write(last6)</script></td>
      <td class='border_up' align='center' width='20'><script>document.write(last5)</script></td>
      <td class='border_up' align='center' width='20'><script>document.write(last4)</script></td>
      <td class='border_up' align='center' width='20'><script>document.write(last3)</script></td>
      <td class='border_up' align='center' width='20'><script>document.write(last2)</script></td>
      <td class='border_up' align='center' width='20'><script>document.write(last1)</script></td>
      <td class='border_up' align='center' width='20'><script>document.write(last)</script></td>
      
      <td class='border_up' align='center' width='20'>&nbsp;</td>
      <td class='border_up' align='center' width='20'>&nbsp;</td>
      <td class='border_up' align='center' width='20'><script>document.write(tax9)</script></td>
      <td class='border_up' align='center' width='20'><script>document.write(tax8)</script></td>
      <td class='border_up' align='center' width='20'><script>document.write(tax7)</script></td>
      <td class='border_up' align='center' width='20'><script>document.write(tax6)</script></td>
      <td class='border_up' align='center' width='20'><script>document.write(tax5)</script></td>
      <td class='border_up' align='center' width='20'><script>document.write(tax4)</script></td>
      <td class='border_up' align='center' width='20'><script>document.write(tax3)</script></td>
      <td class='border_up' align='center' width='20'><script>document.write(tax2)</script></td>
     </tr>
    </table>
    </c:forEach>
   </td>
  </tr>
  <tr>
   <td width='100%'>
   <c:forEach var="adApprove" items="${ requestScope.adApprove }">
    <table cellpadding='0' cellspacing='0' width='700'>
     <tr>
      <td class='border_up' align='center' width='50' height='21'>월 일</td>
      <td class='border_up' align='center' width='195'>품 &nbsp; &nbsp; &nbsp; 목</td>
      <td class='border_up' align='center' width='42'>규 격</td>
      <td class='border_up' align='center' width='65'>수 량</td>
      <td class='border_up' align='center' width='55'>단 가</td>
      <td class='border_up' align='center' width='150'>공급가액</td>
      <td class='border_up' align='center' width='83'>세 액</td>
      <td class='border_top' align='center' width='60'>비고</td>
     </tr>
     <tr>
     <%-- <c:forEach var="taxFullDay" items="${ requestScope.taxFullDay }"> --%>
      <td class='border_up' align='center' width='50' height='25'><c:out value="${taxMonthDay}"/>-<c:out value="${taxDayDay}"/></td>
		<%-- </c:forEach>       --%>
      <td class='border_up' align='center' width='195'>
 		<c:choose>
			 <c:when test="${adApprove.adTypeCode eq 1}">
			 	장소 외
			 </c:when>
			 <c:when test="${adApprove.adTypeCode eq 3}">
			 	장소 외
			 </c:when>
			 <c:when test="${adApprove.adTypeCode eq 2}">
			 	장소
			 </c:when>
			 <c:when test="${adApprove.adTypeCode eq 4}">
			 	장소
			 </c:when>
	    </c:choose>
	  </td>
      <td class='border_up' align='center' width='42'>&nbsp;</td>
      <td class='border_up' align='center' width='65'>
       <c:choose>
		     <c:when test="${adApprove.adTypeCode eq 1}">
		     	1주
		     </c:when>
		     <c:when test="${adApprove.adTypeCode eq 2}">
		     	1주
		     </c:when>
		     <c:otherwise>
		     	2주
		     </c:otherwise>
       </c:choose>
      </td>
      <td class='border_up' align='center' width='55'><c:out value="${adApprove.price2nd }"></c:out></td>
      <td class='border_up' align='center' width='150'><c:out value="${adApprove.price2nd }"></c:out></td>
      <td class='border_up' align='center' width='83'><c:out value="${adApprove.taxPrice }"></c:out></td>
      <td class='border_top' align='center' width='60'>&nbsp;</td>
     </tr>
     <tr>
      <td class='border_up' align='center' width='50' height='25'>&nbsp;</td>
      <td class='border_up' align='center' width='195'>&nbsp;</td>
      <td class='border_up' align='center' width='42'>&nbsp;</td>
      <td class='border_up' align='center' width='65'>&nbsp;</td>
      <td class='border_up' align='center' width='55'>&nbsp;</td>
      <td class='border_up' align='center' width='150'>&nbsp;</td>
      <td class='border_up' align='center' width='83'>&nbsp;</td>
      <td class='border_top' align='center' width='60'>&nbsp;</td>
     </tr>
     <tr>
      <td class='border_up' align='center' width='50' height='25'>&nbsp;</td>
      <td class='border_up' align='center' width='195'>&nbsp;</td>
      <td class='border_up' align='center' width='42'>&nbsp;</td>
      <td class='border_up' align='center' width='65'>&nbsp;</td>
      <td class='border_up' align='center' width='55'>&nbsp;</td>
      <td class='border_up' align='center' width='150'>&nbsp;</td>
      <td class='border_up' align='center' width='83'>&nbsp;</td>
      <td class='border_top' align='center' width='60'>&nbsp;</td>
     </tr>
     <tr>
      <td class='border_up' align='center' width='50' height='25'>&nbsp;</td>
      <td class='border_up' align='center' width='195'>&nbsp;</td>
      <td class='border_up' align='center' width='42'>&nbsp;</td>
      <td class='border_up' align='center' width='65'>&nbsp;</td>
      <td class='border_up' align='center' width='55'>&nbsp;</td>
      <td class='border_up' align='center' width='150'>&nbsp;</td>
      <td class='border_up' align='center' width='83'>&nbsp;</td>
      <td class='border_top' align='center' width='60'>&nbsp;</td>
     </tr>
    </table>
    </c:forEach>
   </td>
  </tr>
  <tr>
   <td width='100%'>
   <c:forEach var="adApprove" items="${ requestScope.adApprove }">
    <table cellpadding='0' cellspacing='0' width='700'>
     <tr align='justify'>
      <td class='border_up' align='center' width='122' height='2'>합계금액</td>
      <td class='border_up' align='center' width='108'>현 &nbsp; &nbsp; 금</td>
      <td class='border_up' align='center' width='108'>수 &nbsp; &nbsp; 표</td>
      <td class='border_up' align='center' width='108'>어 &nbsp; &nbsp; 음</td>
      <td class='border_up' align='center' width='108'>외상미수금</td>
      <td class='border_top' rowspan='2' align='center' width='143'>이 금액을 징수 함</td>
     </tr>
     <tr>
      <td class='border_up' align='center' width='122' height='25'><c:out value="${adApprove.taxPrice + adApprove.price2nd }"></c:out></td>
      <td class='border_up' align='center' width='108'> V </td>
      <td class='border_up' align='center' width='108'>&nbsp;</td>
      <td class='border_up' align='center' width='108'>&nbsp;</td>
      <td class='border_up' align='center' width='108'>&nbsp;</td>
     </tr>
    </table>
    </c:forEach>
   </td>
  </tr>
</table>


</div>

<br><br>
<!------------------------------ 절취선 ------------------------------------------------->
<table width='700' cellpadding='0' cellspacing='0' align='center'>
   <tr>
      <td height='1' colspan=2 background='<?echo("$skin_dir/dot.gif")?>' border='0'></td>
   </tr>
</table>
<!------------------------------ 절취선 ------------------------------------------------->

<br><br>

<table width='700' cellpadding='0' cellspacing='0' align='center' class='border_all_red'>
 <tr>
  <td width='100%'>
    <table cellpadding='0' cellspacing='0' height='65' width='100%'><tr>
      <td rowspan='2' align='center' width='360' class='border_tit_red'><font size='6'><b>세 금 계 산 서</b></font></td>
      <td rowspan='2' width='5' align='center' class='border_tit_red'><font size='4'><b>[</b></font></td>
      <td rowspan='2' width='70' align='center' class='border_tit_red'>공 &nbsp;급 &nbsp;자&nbsp;<br>보 &nbsp;관 &nbsp;용&nbsp;</td>
      <td rowspan='2' width='5' align='center' class='border_tit_red'><font size='4'><b>]</b></font></td>
      <td align='right' width='85' class='border_tit_red'>책 번 호&nbsp;&nbsp;</td>
      <td colspan='3' align='right' class='border_both_red'>권 &nbsp;</td>
      <td colspan='4' align='right' class='border_tit_red'>호 &nbsp;</td>
     </tr>
     <tr>
      <td width='85' align='right' class='border_tit_red'>일련번호&nbsp;</td>
      <td colspan='1' class='border_back_red ' width='25'>&nbsp;</td>
      <td colspan='1' class='border_up_red' width='25'>&nbsp;</td>
      <td colspan='1' class='border_up_red' width='25'>&nbsp;</td>
      <td colspan='1' class='border_up_red' width='25'>&nbsp;</td>
      <td colspan='1' class='border_up_red' width='25'>&nbsp;</td>
      <td colspan='1' class='border_up_red' width='25'>&nbsp;</td>
      <td colspan='1' class='border_top_red' width='25'>&nbsp;</td>  <!-- 책,권 -->
     </tr>
    </table>
   </td>
  </tr>
  <tr> 
   <td> 
   <c:forEach var="adApprove" items="${ requestScope.adApprove }">
    <table cellpadding='0' cellspacing='0' width='700'>
     <tr>
      <td class='border_up_red' align='center' width='17' rowspan='4'>공<br><br><br>급<br><br><br>자</td>
      <td class='border_up_red' align='center' width='55' height='33'>등록번호</td>
      <td class='border_up_red' align='center' width='278' colspan='5'>&nbsp;</td>
      <td class='border_up_red' align='center' width='17' rowspan='4'>공<br>급<br>받<br>는<br>자</td>
      <td class='border_up_red' align='center' width='55'>등록번호</td>
      <td class='border_top_red' align='center' width='278' colspan='5'>${adApprove.companyNumber }</td>
     </tr>
     <tr>
      <td class='border_up_red' align='center' width='55' height='33'>상 호<br>(법입명)</td>
      <td class='border_up_red' align='center' width='160' colspan='3'>펫 팔</td>
      <td class='border_up_red' align='center' width='12' colspan='1'>성<br>명</td>
      <td class='border_up_red' align='right' width='94' colspan='1'>김해인 인</td>
      <td class='border_up_red' align='center' width='55'>상 호<br>(법입명)</td>
      <td class='border_up_red' align='center' width='160' colspan='3'><c:out value="${adApprove.companyName }"></c:out></td>
      <td class='border_up_red' align='center' width='12' colspan='1'>성<br>명</td>
      <td class='border_top_red' align='right' width='94' colspan='1'><c:out value="${adApprove.leaderName }"></c:out> 인</td>
     </tr>
     <tr>
      <td class='border_up_red' align='center' width='55' height='33'>사업장<br>주  소</td>
      <td class='border_up_red' align='center' width='278' colspan='5'>서울</td>
      <td class='border_up_red' align='center' width='55'>사업장<br>주  소</td>
      <td class='border_top_red' align='center' width='278' colspan='5'><c:out value="${adApprove.companyLocation }"></c:out></td>
     </tr>
     <tr>
      <td class='border_up_red' align='center' width='55' height='33'>업  태</td>
      <td class='border_up_red' align='center' width='148' colspan='1'>광고 대행업</td>
      <td class='border_up_red' align='center' width='12' colspan='1'>종<br>목</td>
      <td class='border_up_red' align='center' width='106' colspan='3'>반려동물 서비스업</td>
      <td class='border_up_red' align='center' width='55'>업 &nbsp; 태</td>
      <td class='border_up_red' align='center' width='148' colspan='1'><c:out value="${adApprove.industry }"></c:out></td>
      <td class='border_up_red' align='center' width='12' colspan='1'>종<br>목</td>
      <td class='border_top_red' align='center' width='106' colspan='3'><c:out value="${adApprove.industryDetail }"></c:out></td>
     </tr>
    </table>
    </c:forEach>
   </td>
  </tr>
  <tr>
   <td width='100%'>
   <c:forEach var="adApprove" items="${ requestScope.adApprove }">
    <table cellpadding='0' cellspacing='0' width='700'>
     <tr>
      <td class='border_up_red' align='center' width='85' height='21'>작 &nbsp; 성</td>
      <td class='border_up_red' colspan='12' width='250' align='center'>공 &nbsp; 급 &nbsp; 가 &nbsp; 액</td>
      <td class='border_up_red' rowspan='3' align='center' width='4' height='15'>&nbsp;</td>
      <td class='border_up_red' colspan='10' align='center' width='190' height='15'>세 &nbsp; 액</td>
      <td class='border_top_red' align='center' width='156'>비 &nbsp; 고</td>
     </tr>
     <tr>
      <td class='border_up_red' align='center' width='85' height='21'>년 &nbsp; 월 &nbsp; 일</td>
      <td class='border_up_red' align='center' width='35'><font size='1'>공란수</font></td>
      <td class='border_up_red' align='center' width='20'>백</td>
      <td class='border_up_red' align='center' width='20'>십</td>
      <td class='border_up_red' align='center' width='20'>억</td>
      <td class='border_up_red' align='center' width='20'>전</td>
      <td class='border_up_red' align='center' width='20'>백</td>
      <td class='border_up_red' align='center' width='20'>십</td>
      <td class='border_up_red' align='center' width='20'>만</td>
      <td class='border_up_red' align='center' width='20'>천</td>
      <td class='border_up_red' align='center' width='20'>백</td>
      <td class='border_up_red' align='center' width='20'>십</td>
      <td class='border_up_red' align='center' width='20'>일</td>
      
      <td class='border_up_red' align='center' width='20'>십</td>
      <td class='border_up_red' align='center' width='20'>억</td>
      <td class='border_up_red' align='center' width='20'>전</td>
      <td class='border_up_red' align='center' width='20'>백</td>
      <td class='border_up_red' align='center' width='20'>십</td>
      <td class='border_up_red' align='center' width='20'>만</td>
      <td class='border_up_red' align='center' width='20'>천</td>
      <td class='border_up_red' align='center' width='20'>백</td>
      <td class='border_up_red' align='center' width='20'>십</td>
      <td class='border_up_red' align='center' width='20'>일</td>
      <td class='border_top_red' align='center' width='156' rowspan='2'>&nbsp;</td>
     </tr>
     <tr>
      <td class='border_up_red' align='center' width='85' height='25'>${ adApprove.taxBillDate }</td>
      <td class='border_up_red' align='center' width='35'>&nbsp;</td>
      <td class='border_up_red' align='center' width='20'>&nbsp;</td>
      <td class='border_up_red' align='center' width='20'>&nbsp;</td>
      <td class='border_up_red' align='center' width='20'><script>document.write(last8)</script></td>
      <td class='border_up_red' align='center' width='20'><script>document.write(last7)</script></td>
      <td class='border_up_red' align='center' width='20'><script>document.write(last6)</script></td>
      <td class='border_up_red' align='center' width='20'><script>document.write(last5)</script></td>
      <td class='border_up_red' align='center' width='20'><script>document.write(last4)</script></td>
      <td class='border_up_red' align='center' width='20'><script>document.write(last3)</script></td>
      <td class='border_up_red' align='center' width='20'><script>document.write(last2)</script></td>
      <td class='border_up_red' align='center' width='20'><script>document.write(last1)</script></td>
      <td class='border_up_red' align='center' width='20'><script>document.write(last)</script></td>
      
      <td class='border_up_red' align='center' width='20'>&nbsp;</td>
      <td class='border_up_red' align='center' width='20'>&nbsp;</td>
      <td class='border_up_red' align='center' width='20'><script>document.write(tax9)</script></td>
      <td class='border_up_red' align='center' width='20'><script>document.write(tax8)</script></td>
      <td class='border_up_red' align='center' width='20'><script>document.write(tax7)</script></td>
      <td class='border_up_red' align='center' width='20'><script>document.write(tax6)</script></td>
      <td class='border_up_red' align='center' width='20'><script>document.write(tax5)</script></td>
      <td class='border_up_red' align='center' width='20'><script>document.write(tax4)</script></td>
      <td class='border_up_red' align='center' width='20'><script>document.write(tax3)</script></td>
      <td class='border_up_red' align='center' width='20'><script>document.write(tax2)</script></td>
     </tr>
    </table>
    </c:forEach>
   </td>
  </tr>
  <tr>
   <td width='100%'>
   <c:forEach var="adApprove" items="${ requestScope.adApprove }">
    <table cellpadding='0' cellspacing='0' width='700'>
     <tr>
      <td class='border_up_red' align='center' width='50' height='21'>월 일</td>
      <td class='border_up_red' align='center' width='195'>품 &nbsp; &nbsp; &nbsp; 목</td>
      <td class='border_up_red' align='center' width='42'>규 격</td>
      <td class='border_up_red' align='center' width='65'>수 량</td>
      <td class='border_up_red' align='center' width='55'>단 가</td>
      <td class='border_up_red' align='center' width='150'>공급가액</td>
      <td class='border_up_red' align='center' width='83'>세 액</td>
      <td class='border_top_red' align='center' width='60'>비고</td>
     </tr>
     <tr>
      <td class='border_up_red' align='center' width='50' height='25'><c:out value="${taxMonthDay}"/>-<c:out value="${taxDayDay}"/></td>
      <td class='border_up_red' align='center' width='195'>
      <c:choose>
			 <c:when test="${adApprove.adTypeCode eq 1}">
			 	장소 외
			 </c:when>
			 <c:when test="${adApprove.adTypeCode eq 3}">
			 	장소 외
			 </c:when>
			 <c:when test="${adApprove.adTypeCode eq 2}">
			 	장소
			 </c:when>
			 <c:when test="${adApprove.adTypeCode eq 4}">
			 	장소
			 </c:when>
	    </c:choose>
      </td>
      <td class='border_up_red' align='center' width='42'>&nbsp;</td>
      <td class='border_up_red' align='center' width='65'>
       <c:choose>
		     <c:when test="${adApprove.adTypeCode eq 1}">
		     	1주
		     </c:when>
		     <c:when test="${adApprove.adTypeCode eq 2}">
		     	1주
		     </c:when>
		     <c:otherwise>
		     	2주
		     </c:otherwise>
       </c:choose>
      </td>
      <td class='border_up_red' align='center' width='55'><c:out value="${adApprove.price2nd }"></c:out></td>
      <td class='border_up_red' align='center' width='150'><c:out value="${adApprove.price2nd }"></c:out></td>
      <td class='border_up_red' align='center' width='83'><c:out value="${adApprove.taxPrice }"></c:out></td>
      <td class='border_top_red' align='center' width='60'>&nbsp;</td>
     </tr>
     <tr>
      <td class='border_up_red' align='center' width='50' height='25'>&nbsp;</td>
      <td class='border_up_red' align='center' width='195'>&nbsp;</td>
      <td class='border_up_red' align='center' width='42'>&nbsp;</td>
      <td class='border_up_red' align='center' width='65'>&nbsp;</td>
      <td class='border_up_red' align='center' width='55'>&nbsp;</td>
      <td class='border_up_red' align='center' width='150'>&nbsp;</td>
      <td class='border_up_red' align='center' width='83'>&nbsp;</td>
      <td class='border_top_red' align='center' width='60'>&nbsp;</td>
     </tr>
     <tr>
      <td class='border_up_red' align='center' width='50' height='25'>&nbsp;</td>
      <td class='border_up_red' align='center' width='195'>&nbsp;</td>
      <td class='border_up_red' align='center' width='42'>&nbsp;</td>
      <td class='border_up_red' align='center' width='65'>&nbsp;</td>
      <td class='border_up_red' align='center' width='55'>&nbsp;</td>
      <td class='border_up_red' align='center' width='150'>&nbsp;</td>
      <td class='border_up_red' align='center' width='83'>&nbsp;</td>
      <td class='border_top_red' align='center' width='60'>&nbsp;</td>
     </tr>
     <tr>
      <td class='border_up_red' align='center' width='50' height='25'>&nbsp;</td>
      <td class='border_up_red' align='center' width='195'>&nbsp;</td>
      <td class='border_up_red' align='center' width='42'>&nbsp;</td>
      <td class='border_up_red' align='center' width='65'>&nbsp;</td>
      <td class='border_up_red' align='center' width='55'>&nbsp;</td>
      <td class='border_up_red' align='center' width='150'>&nbsp;</td>
      <td class='border_up_red' align='center' width='83'>&nbsp;</td>
      <td class='border_top_red' align='center' width='60'>&nbsp;</td>
     </tr>
    </table>
    </c:forEach>
   </td>
  </tr>
  <tr>
   <td width='100%'>
   <c:forEach var="adApprove" items="${ requestScope.adApprove }">
    <table cellpadding='0' cellspacing='0' width='700'>
     <tr align='justify'>
      <td class='border_up_red' align='center' width='122' height='2'>합계금액</td>
      <td class='border_up_red' align='center' width='108'>현 &nbsp; &nbsp; 금</td>
      <td class='border_up_red' align='center' width='108'>수 &nbsp; &nbsp; 표</td>
      <td class='border_up_red' align='center' width='108'>어 &nbsp; &nbsp; 음</td>
      <td class='border_up_red' align='center' width='108'>외상미수금</td>
      <td class='border_top_red' rowspan='2' align='center' width='143'>이 금액을 징수 함</td>
     </tr>
     <tr>
      <td class='border_up_red' align='center' width='122' height='25'><c:out value="${adApprove.taxPrice + adApprove.price2nd }"></c:out></td>
      <td class='border_up_red' align='center' width='108'> V </td>
      <td class='border_up_red' align='center' width='108'>&nbsp;</td>
      <td class='border_up_red' align='center' width='108'>&nbsp;</td>
      <td class='border_up_red' align='center' width='108'>&nbsp;</td>
     </tr>
    </table>
    </c:forEach>
   </td>
  </tr>
</table>
      

<br><br><br>
</td>
</tr>
</table>
         <!------------------- 세금계산서 태그 여기까지 -------------------->

</td>
</tr>
</table>
         <!------------------- body table 놓이는곳 -------------------->
      </div>
      </div>
      </div>
      </section>
<script>

$('#create_pdf').click(function() {
	  //pdf_wrap을 canvas객체로 변환
	  html2canvas($('#pdf_wrap')[0]).then(function(canvas) {
	    var doc = new jsPDF('p', 'mm', 'a4'); //jspdf객체 생성
	    var imgData = canvas.toDataURL('image/png'); //캔버스를 이미지로 변환
	    doc.addImage(imgData, 'PNG', 0, 0); //이미지를 기반으로 pdf생성

	    var imgWidth = 210; 
	    var pageHeight = 295; 
	    var imgHeight = canvas.height * imgWidth / canvas.width;
	    var heightLeft = imgHeight; 
	    var position = 0; 
	    doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight); 
	 
	   

	    doc.save('petpalTax' + '${ requestScope.tax.now }' + '${ requestScope.tax.bName }' + '.pdf'); //pdf저장
	    
	  });
	});
  
</script>

	<jsp:include page="../../admin/common/footer.jsp"></jsp:include> 

</body>
</html>

  