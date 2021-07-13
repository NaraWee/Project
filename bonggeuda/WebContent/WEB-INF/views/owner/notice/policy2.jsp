<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
	<style>
		ul.policy_tab {
			font-size: 18px;
		}
		ul.policy_tab li a {
			color: darkgray;
		}
		div.txt term-basic-wrap {
			padding-left: 100px;
			padding-right: 100px;
		}
		#cont_area {
    		float: left;
    		width: 850px;
		}
		div.cont_inner span {
			font-weight: bold;
		}

		ul {
          padding: 0;
          list-style: none;
        } 
	</style>
<title>봉그다 숙박숙박 :: 약관 및 정책</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.servletContext.contextPath}/resources/owner/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<script src="${pageContext.servletContext.contextPath}/resources/owner/js/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/owner/js/scripts.js"></script>
<link href="${pageContext.servletContext.contextPath}/resources/owner/css/styles.css" rel="stylesheet">
<link href="${pageContext.servletContext.contextPath}/resources/owner/css/style.css" rel="stylesheet" type="text/css" media="all" />
<script src="${pageContext.servletContext.contextPath}/resources/owner/js/responsiveslides.min.js"></script>
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Real Home Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</head>
<body>
<!--header-->
<div class="header">
	<div class="container">
		<!--logo-->
			<div class="logo">
				<h1><a href="/bonggeuda/owner/main">Bonggeuda</a></h1>
			</div>
		<!--//logo-->
		<div class="top-nav">
			<ul class="right-icons">
				<li><a href="/bonggeuda/owner/registration">숙소등록</a></li>
				<li><a href="/bonggeuda/owner/managementRoom">숙소관리</a></li>
				<li><a href="/bonggeuda/owner/bookingList">예약관리</a></li>
				<li><a href="/bonggeuda/owner/notice">공지사항</a></li>
				<li><a href="/bonggeuda/owner/mypage">마이페이지</a></li>
				<li><a href="/bonggeuda/"><i class="glyphicon glyphicon-user"></i>Logout</a></li>
			</ul>
		</div>
	</div>
</div>
<!--header-->
<!--//-->	
<div class=" banner-notice"> <!--상단 메뉴바-->
	<div class=" container">
		<h3>약관 및 정책</h3> 
	<div class="clearfix"> </div>
		<!--initiate accordion-->
		<script type="text/javascript">
			$(function() {
			    var menu_ul = $('.menu > li > ul'),
			           menu_a  = $('.menu > li > a');
			    menu_ul.hide();
			    menu_a.click(function(e) {
			        e.preventDefault();
			        if(!$(this).hasClass('active')) {
			            menu_a.removeClass('active');
			            menu_ul.filter(':visible').slideUp('normal');
			            $(this).addClass('active').next().stop(true,true).slideDown('normal');
			        } else {
			            $(this).removeClass('active');
			            $(this).next().stop(true,true).slideUp('normal');
			        }
			    });
			});
		</script>
	</div>
</div>
<!--//header-->
<br><br>
<div class="blog">
	<div class="container">
		<div class="blog-list">
			<nav>
				<div class="col-md-3 blog-sidebar">
					<ul>
						<li class="blog-list"><a href="/bonggeuda/owner/notice">공지사항</a></li>
						<li class="blog-list"><a href="/bonggeuda/owner/frequently">자주 묻는 질문</a></li>
						<li class="blog-list"><a href="/bonggeuda/owner/question/list">1:1 문의</a></li>
						<li class="blog-list" style="font-size: 1.3em; font-weight: 600;"><a href="/bonggeuda/owner/policy" style="color: #6eceda;">약관 및 정책</a></li>					</ul>
				</div>
			</nav>
	<div class="policy_tab" data-default="term">
		<ul class="policy_tab" style="display: flex;">
			<li style="margin-right: 20px;"><a href="/bonggeuda/owner/policy">이용약관</a></li>
			<li style="margin-right: 20px;"><a href="/bonggeuda/owner/policy2" style="color: #6eceda; font-weight: bold;">위치기반 서비스 이용약관</a></li>
			<li style="margin-right: 20px;"><a href="/bonggeuda/owner/policy3">개인정보 처리방침</a></li>
			<li style="margin-right: 20px;"><a href="/bonggeuda/owner/policy4">청소년 보호정책</a></li>
		</ul> 
	</div>
	<div id="cont_area"><!-- 본문 콘텐츠-->
		<div class="cont_inner" id="policy_page" style="min-height: 435px; text-align: left; float: left;">
			<br>
	<br><span>제 1조 (목적)</span><i></i>
	<p>본 약관은 주식회사 봉그다 숙박숙박(이하 "회사"라 함)이 제공하는 위치기반서비스(이하 "서비스"라 함)를 이용함에 있어 "회사"와 서비스를 이용하고자 하는 자(이하 "이용자"라 함)의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.</p>
	<br><span>제 2조 (이용약관의 효력 및 변경)</span><i></i>
	<ul>
		<li>① 본 약관은 이용자가  본 약관에 동의하고 회사가 정한 소정의 절차에 따라 서비스의 이용자로 인정함으로써 효력이 발생합니다.</li>
		<li>② 이용자가 서비스를 이용하는 과정에서 약관 동의에 체크한 경우, 본 약관의 내용을 모두 읽고 이를 충분히 이해하였으며, 그 적용에 동의한 것으로 간주합니다.</li>
		<li>③ 회사는 위치정보의 보호 및 이용 등에 관한 법률, 콘텐츠산업 진흥법, 전자상거래 등에서의 소비자보호에 관한 법률, 소비자기본법 약관의 규제에 관한 법률 등 관련법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.</li>
		<li>④ 회사가 약관을 개정할 경우에는 기존약관과 개정약관 및 개정약관의 적용일자와 개정사유를 명시하여 현행약관과 함께 그 적용일자 10일 전부터 적용일 이후 상당한 기간 동안 공지만을 하고, 개정 내용이 이용자에게 불리한 경우에는 그 적용일자 30일 전부터 적용일 이후 상당한 기간 동안 각각 이를 서비스 홈페이지에 게시하거나 이용자에게 전자적 형태(E-mail, SMS, App 메시지 등)로 약관 개정 사실을 발송하여 고지합니다.</li>
		<li>⑤ 회사가 전항에 따라 이용자에게 통지하면서 공지 또는 공지∙고지일로부터 개정약관 시행일 7일 후까지 거부의사를 표시하지 아니하면 이용약관에 승인한 것으로 봅니다. 이용자가 개정약관에 동의하지 않을 경우 이용자는 이용계약을 해지할 수 있습니다.</li>
	</ul>
	<br><span>제 3조 (관계법령의 적용)</span><i></i>
	<p>본 약관은 신의성실의 원칙에 따라 공정하게 적용하며, 본 약관에 명시되지 아니한 사항에 대하여는 관계법령 또는 상관례에 따릅니다.</p>
	<br><span>제 4조 (서비스의 내용)</span><i></i>
	<p>회사가 제공하는 서비스는 아래와 같습니다.</p>
	<table>
		<colgroup><col width="40%"><col></colgroup>
		<tbody><tr>
			<th>서비스 명</th>
			<th>서비스 내용</th>
		</tr><br>
		<tr>
			<td>봉그다 숙박숙박 서비스</td>
			<td>
				- 위치정보수집 대상의 실시간 위치확인<br>
				- 이용자의 위치에서 근접한 업소정보제공
			</td>
		</tr>
		<tr>
			<td>QR코드 현장혜택 서비스</td>
			<td>
				- 정상 이용 판단을 위한 단말기 위치정보수집<br>
				- 이용자에게 서비스 이용 혜택 제공
			</td>
		</tr>
	</tbody></table>
	<br><span>제 5조 (서비스 이용요금)</span><i></i>
	<ul>
		<li>① 회사가 제공하는 서비스는 기본적으로 무료입니다. 단, 별도의 유료 서비스의 경우 해당 서비스에 명시된 요금을 지불하여야 사용 가능합니다.</li>
		<li>② 회사는 유료 서비스 이용요금을 회사와 계약한 전자지불업체에서 정한 방법에 의하거나 회사가 정한 청구서에 합산하여 청구할 수 있습니다.</li> 
		<li>③ 유료서비스 이용을 통하여 결제된 대금에 대한 취소 및 환불은 회사의 결제 이용약관 등 관계법에 따릅니다.</li>
		<li>④ 이용자의 개인정보도용 및 결제사기로 인한 환불요청 또는 결제자의 개인정보 요구는 법률이 정한 경우 외에는 거절될 수 있습니다.</li>
		<li>⑤ 무선 서비스 이용 시 발생하는 데이터 통신료는 별도이며 가입한 각 이동통신사의 정책에 따릅니다.</li> 
	</ul>
	<br><span>제 6조 (서비스내용변경 통지 등)</span><i></i>
	<ul>
		<li>① 회사가 서비스 내용을 변경하거나 종료하는 경우, 회사는 이용자가 회원가입 시 제공한 E-mail, SMS 또는 App 메시지 등을 통하여 서비스 내용의 변경 사항 또는 종료를 통지할 수 있습니다.</li>
		<li>② ①항의 경우 불특정 다수인을 상대로 통지를 함에 있어서는 웹사이트 등 기타 회사의 공지사항을 통하여 이용자들에게 통지할 수 있습니다.</li>
	</ul>
	<br><span>제 7조 (서비스이용의 제한 및 중지)</span><i></i>
	<ul>
		<li>① 회사는 아래 각 호의 1에 해당하는 사유가 발생한 경우에는 이용자의 서비스 이용을 제한하거나 중지시킬 수 있습니다.
			<ul>
				<li>1. 이용자가 회사 서비스의 운영을 고의 또는 중과실로 방해하는 경우</li>
				<li>2. 서비스용 설비 점검, 보수 또는 공사로 인하여 부득이한 경우</li>
				<li>3. 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우</li>
				<li>4. 국가비상사태, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 서비스 이용에 지장이 있는 때</li>
				<li>5. 기타 중대한 사유로 인하여 회사가 서비스 제공을 지속하는 것이 부적당하다고 인정하는 경우</li>
			</ul>
		</li>
		<li>② 회사는 전항의 규정에 의하여 서비스의 이용을 제한하거나 중지한 때에는 그 사유 및 제한기간 등을 이용자에게 알려야 합니다.</li>
	</ul>
	<br><span>제 8조 (개인위치정보의 이용 또는 제공)</span><i></i>
	<ul>
		<li>① 회사는 개인위치정보를 이용하여 서비스를 제공하고자 하는 경우에는 미리 이용약관에 명시한 후 개인위치정보주체의 동의를 얻어야 합니다.</li>
		<li>② 이용자 및 법정대리인의 권리와 그 행사방법은 제소 당시의 이용자의 주소에 의하며, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.</li>
		<li>③ 회사는 타사업자 또는 이용자와의 요금정산 및 민원처리를 위해 위치정보 이용•제공․사실 확인자료를 자동 기록•보존하며, 해당 자료는 1년간 보관합니다.</li>
		<li>④ 회사는 개인위치정보를 이용자가 지정하는 제3자에게 제공하는 경우에는 개인위치정보를 수집한 당해 통신 단말장치로 매회 이용자에게 제공받는 자, 제공일시 및 제공목적을 즉시 통보합니다. 단, 아래 각 호의 1에 해당하는 경우에는 이용자가 미리 특정하여 지정한 통신 단말장치 또는 전자우편주소로 통보합니다.
			<ul>
				<li>1. 개인위치정보를 수집한 당해 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 아니한 경우</li>
				<li>2. 이용자가 온라인 게시 등의 방법으로 통보할 것을 미리 요청한 경우</li>
			</ul>
		</li> 
	</ul>
	<br><span>제 9조 (개인위치정보주체의 권리)</span><i></i>
		<ul>
			<li>① 이용자는 회사에 대하여 언제든지 개인위치정보를 이용한 위치기반서비스 제공 및 개인위치정보의 제3자 제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다. 이 경우 회사는 수집한 개인위치정보 및 위치정보 이용, 제공사실 확인자료를 파기합니다.</li>
			<li>② 이용자는 회사에 대하여 언제든지 개인위치정보의 수집, 이용 또는 제공의 일시적인 중지를 요구할 수 있으며, 회사는 이를 거절할 수 없고 이를 위한 기술적 수단을 갖추고 있습니다.</li>
			<li>③ 이용자는 회사에 대하여 아래 각 호의 자료에 대한 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 회사는 정당한 사유 없이 회원의 요구를 거절할 수 없습니다.
				<ul>
					<li>1. 본인에 대한 위치정보 수집, 이용, 제공사실 확인자료</li>
					<li>2. 본인의 개인위치정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법률 규정에 의하여 제3자에게 제공된 이유 및 내용</li>
				</ul>
			</li>
			<li>④ 이용자는 제1항 내지 제3항의 권리행사를 위해 회사의 소정의 절차를 통해 요구할 수 있습니다.</li>
		</ul>
		<br><span>제 10조 (법정대리인의 권리)</span> <i></i>
	<ul>
		<li>① 만 14세 미만 이용자로서 개인위치정보를 활용한 위치기반 서비스를 이용하는 경우 회사는 이용자의 개인위치정보를 이용 및 제3자에게 제공하게 되며, 법정대리인의 동의를 받아야 합니다.(서면, 고객행복센터 등을 통해)</li>
		<li>② 1항의 경우 법정대리인은 제9조에 의한 이용자의 권리를 모두 가집니다.</li>
		<li>③ 만 14세 미만 이용자가 법정대리인의 동의 없이 위치기반 서비스를 이용한 것으로 판명된 때에는 회사는 즉시 해당 개인위치정보를 삭제하거나, 위치기반 서비스 이용을 중단하는 등 적절한 제한을 할 수 있습니다.</li>
	</ul>
	<br><span>제 11조 (위치정보관리책임자의 지정)</span><i></i>
	<ul>
		<li>① 회사는 위치정보를 적절히 관리․보호하고 개인위치정보주체의 불만을 원활히 처리할 수 있도록 실질적인 책임을 질 수 있는 지위에 있는 자를 위치정보관리책임자로 지정해 운영합니다. </li>
		<li>② 위치정보관리책임자는 위치기반서비스를 제공하는 부서의 부서장으로서 구체적인 사항은 본 약관의 부칙에 따릅니다.</li>
	</ul>
	<br><span>제 12조 (손해배상)</span><i></i>
	<ul>
		<li>① 회사가 위치정보의 보호 및 이용 등에 관한 법률 제15조 내지 제26조의 규정을 위반한 행위로 이용자에게 손해가 발생한 경우 이용자는 회사에 대하여 손해배상 청구를 할 수 있습니다. 이 경우 회사는 고의, 과실이 없음을 입증하지 못하는 경우 책임을 면할 수 없습니다.<br>이용자가 서비스 및 혜택받기를 이용하면서 불법행위 또는 고의나 과실로 이 약관을 위반하여 회사가 해당 고객 이외의 제 3자로부터 손해배상청구 또는 소송을 비롯한 각종 이의제기를 받는다면 해당 이용자는 그 때문에 회사에 발생한 손해를 배상해야 합니다.</li>
		<li>② 이용자가 본 약관의 규정을 위반하여 회사에 손해가 발생한 경우 회사는 이용자에 대하여 손해배상을 청구할 수 있습니다. 이 경우 이용자는 고의, 과실이 없음을 입증하지 못하는 경우 책임을 면할 수 없습니다.</li>
	</ul>
	<br><span>제 13조 (면책)</span><i></i>
	<ul>
		<li>① 회사는 다음 각 호의 경우로 서비스를 제공할 수 없는 경우 이로 인하여 이용자에게 발생한 손해에 대해서는 책임을 부담하지 않습니다.
			<ul>
				<li>1. 천재지변 또는 이에 준하는 불가항력의 상태가 있는 경우</li>
				<li>2. 서비스 제공을 위하여 회사와 서비스 제휴계약을 체결한 제3자의 고의적인 서비스 방해가 있는 경우</li>
				<li>3. 이용자의 귀책사유로 서비스 이용에 장애가 있는 경우</li>
				<li>4. 제1호 내지 제3호를 제외한 기타 회사의 고의∙과실이 없는 사유로 인한 경우</li>
			</ul>
		</li>
		<li>② 회사는 서비스 및 서비스에 게재된 정보, 자료, 사실의 신뢰도, 정확성 등에 대해서는 보증을 하지 않으며 이로 인해 발생한 이용자의 손해에 대하여는 책임을 부담하지 아니합니다.</li>
	</ul>
	<br><span>제 14조 (규정의 준용)</span> <i></i>
	<ul>
		<li>① 본 약관은 대한민국법령에 의하여 규정되고 이행됩니다.</li>
		<li>② 본 약관에 규정되지 않은 사항에 대해서는 관련법령 및 상관습에 의합니다.</li>
	</ul>
	<br><span>제 15조 (분쟁의 조정 및 기타)</span><i></i>
	<ul>
		<li>① 회사는 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 위치정보의 보호 및 이용 등에 관한 법률 제28조의 규정에 의한 방송통신위원회에 재정을 신청할 수 있습니다.</li>
		<li>② 회사 또는 이용자는 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 개인정보보호법 제43조의 규정에 의한 개인정보분쟁조정위원회에 조정을 신청할 수 있습니다.</li>
	</ul>
	<br><span>제 16조 (회사의 연락처)</span><i></i>
	<p>회사의 상호 및 주소 등은 다음과 같습니다.</p>
	<ul>
		<li>1. 상 호 : 주식회사 봉그다 숙박숙박</li>
		<li>2. 대 표 자 : 유승제</li>
		<li>3. 주 소 : 서울시 서초구 강남대로 441</li>
		<li>4. 대표전화 : 1234-7777</li>
	</ul>
	<br><br><br>
</div>
</div>
</div>
</div>
</div>
<!-- footer -->
<div class="footer-bottom">
	<div class="container">
		<div class="col-md-4 footer-logo">
			<h2><a href="index.html">Bonggeuda</a></h2>
		</div>
		<div class="col-md-8 footer-class">
			<p >© 2021 Bonggeuda SUKBAKSUKBAK. All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">Bonggeuda</a> </p>
		</div>
	<div class="clearfix"> </div>
	 </div>
</div>
</div>
<!--//footer-->
</body>
</html>