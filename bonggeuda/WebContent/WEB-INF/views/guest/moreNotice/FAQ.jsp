<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		div.tab, div.tab-content {
    	margin-left: 25%;
    	width: 740px;
		}
		div.tab_each, div.list_none {
		margin-left: 25%;
    	width: 740px;
		}
		.inquiry .tab_each{display:none}
		.inquiry .tab_each:first-child{display:block}
		.inquiry .tab{display:none}
		.tab_each{clear:both;border-top:1px solid rgba(0,0,0,0.08)}

		.tab-content {
    		width: 740px;
		}
		.tab-content>div {
			min-height: 435px;
			text-align: left;
			float: left;
		}
		.tab-content>div>div {
			text-align: left;
		}
	</style>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>봉그다 숙박숙박</title>
<link href="${ pageContext.servletContext.contextPath }/resources/guest/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${ pageContext.servletContext.contextPath }/resources/guest/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--menu-->
<script src="${ pageContext.servletContext.contextPath }/resources/guest/js/scripts.js"></script>
<link href="${ pageContext.servletContext.contextPath }/resources/guest/css/styles.css" rel="stylesheet">
<!--//menu-->
<!--theme-style-->
<link href="${ pageContext.servletContext.contextPath }/resources/guest/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Real Home Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</head>
<body>
<!--header-->
<jsp:include page="../../common/guestheader.jsp"/>

<div class=" banner-buying">
	<div class=" container">
	<h3><span>더보기</span></h3> 

	<div class="clearfix"> </div>      		
	</div>
</div>
<!--//header-->
<!--blog-->
<div class="blog">
<div class="container">
	<h3></h3>
	<div class="blog-list">
		<nav>
		<div class="col-md-3 blog-sidebar">
			<ul style="padding-top: 70px;">
				<li class="blog-list"><a href="${ pageContext.servletContext.contextPath }/usernotice/select">공지사항</a></li>
				<li class="blog-list"><a href="${ pageContext.servletContext.contextPath }/userevent/select">이벤트</a></li>
				<li class="blog-list" style="font-size: 1.3em; font-weight: 600;"><a href="${ pageContext.servletContext.contextPath }/userfaq/select" style="color: #6eceda;">자주 묻는 질문</a></li>
				<li class="blog-list"><a href="${ pageContext.servletContext.contextPath }/userqnalist/select">1:1 문의</a></li>
				<li class="blog-list"><a href="${ pageContext.servletContext.contextPath }/userpolicy/select">약관 및 정책</a></li>
			</ul>
		</div>
		</nav>
	</div>

	<div class="tab" data-default="term">
		<span class="tab_btn active" data-toggle="tab" href="#home" >예약취소</span>
		<span class="tab_btn" data-toggle="tab" href="#menu1">쿠폰/포인트</span>
		<span class="tab_btn" data-toggle="tab" href="#menu2">회원정보</span>
		<span class="tab_btn" data-toggle="tab" href="#menu3">리뷰</span>
	</div>

	<div class="tab-content">
		<!-- 나의 문의내역 탭 -->
		<div id="home" class="tab-pane fade in active">
			<br>
			<div style="font-weight: bold;">예약을 취소하고 싶어요.</div>
			<p style="font-size: 13.3333px; background: #e9ebebbe;"><br>예약취소는 앱 하단 내정보 &gt; 예약/구매내역에서 직접 가능합니다.<br>
			예약/결제 진행 당시 안내된 취소/환불 규정에 따라 처리되며, 취소수수료가 발생할 경우 취소수수료를 차감한 금액으로 환불 처리됩니다.
			일부 숙소에 한해 취소가 가능한 시점이나 앱에서 취소가 불가할 수 있으니 이 경우에는 고객행복센터로 요청해 주시길 바랍니다.
			<br><br></p>

			<br><div style="font-weight: bold;">천재지변으로 인한 예약취소는 어떻게 하나요?</div>
			<p style="font-size: 13.3333px; background: #e9ebebbe;"><br>천재지변(기상악화)으로 숙소 이용이 불가할 경우 고객행복센터로 예약내역 및 증빙서류(결항확인서, e-티켓 등)를 보내주시면 확인 후 예약취소 여부를 안내해 드립니다.</span></font>
			다만, 상황에 따라 취소가 어려울 수 있는 점 참고 부탁드립니다.<br>
			[접수방법]<br>
			※ 이메일 : help@goodchoice.kr (예약자명, 숙소명, 체크인 날짜 필수)<br>
			※ 카카오톡 : 카카오톡 내 플러스 친구 &gt; 봉그다 숙박숙박 고객행복센터 추가
			<br><br></p>

			<br><div style="font-weight: bold;">예약대기 건 예약취소하고 싶어요.</div>
			<p style="font-size: 13.3333px; background: #e9ebebbe;"><br>예약 대기중에는 봉그다 숙박숙박 고객행복센터에 예약취소 요청해주시길 바랍니다.<br>
			단, 예약확정이 될 경우 수수료가 발생하거나 예약취소가 불가할 수 있습니다.
			<br><br></p>

			<br><div style="font-weight: bold;">숙소에서 예약취소 했어요. 어떻게 하나요?</div>
			<p style="font-size: 13.3333px; background: #e9ebebbe;"><br>봉그다 숙박숙박 숙소 사정으로 미리 예약하신 상품이 취소된 경우 대안 숙소를 찾아드리는 안심예약제를 운영하고 있습니다.
			단순 환불 처리에 그치지 않고 더 좋은 숙소에서 이용하실 수 있도록 도움드리고 있으니
			고객행복센터로 문의해주시길 바랍니다.
			<br><br></p>

			<br><div style="font-weight: bold;">체크인날짜/객실타입을 변경하고 싶어요.</div>
			<p style="font-size: 13.3333px; background: #e9ebebbe;"><br>예약 결제 완료 후 날짜 및 객실타입 등 부분 변경은 불가합니다.<br>
			예약취소와 동일하게 취소 및 환불 규정에 따라 처리되므로 예약취소가 가능한 기간에는 예약취소 후 재결제 하셔서 이용 부탁드립니다.<br>
			만약, 예약취소가 불가하거나 수수료가 발생하는 경우라면 고객행복센터로 문의해주시길 바랍니다.
			<br><br></p>

			<br><div style="font-weight: bold;">취소수수료 계산 기준은 어떻게되나요?</div>
			<p style="font-size: 13.3333px; background: #e9ebebbe;"><br>취소수수료는 할인쿠폰 적용 전 객실 판매금액 기준으로 계산되며, 실 결제금액에서 취소수수료를 차감한 금액으로 환불 처리됩니다.
			만약, 결제 시 포인트를 사용한 경우 포인트 -&gt; 현금 순으로 차감됩니다.<br>
			환불 예정금액은 조회 시점 및 실제 환불 진행 시점에 따라 달라질 수 있으므로 예약/결제 진행 당시 안내된 취소/환불 규정을 꼭 숙지하여 이용해 주시길 바랍니다.
			<br><br></p>

			<br><div style="font-weight: bold;">전월 휴대폰 결제 취소는 어떻게 하나요?</div>
			<p style="font-size: 13.3333px; background: #e9ebebbe;"><br>전월 휴대폰 결제 건은 결제 금액이 휴대폰 대금으로 청구 되기 때문에 봉그다 숙박숙박 고객행복센터에서 예약취소 후 예약자 본인 명의의 통장으로 환불 처리를 도와드리고 있습니다.<br>
			예약내역, 예금주명(예약자 성함과 동일), 계좌번호, 은행명을 고객행복센터에 남겨주시길 바라며, 접수 후 처리까지는 영업일 기준 최대 5~7일 소요되오니 시간 양해 부탁드립니다.
			<br><br></p>
			
			<br><div style="font-weight: bold;">예약취소했는데 언제 환불되나요?</div>
			<p style="font-size: 13.3333px; background: #e9ebebbe;"><br>환불은 예약취소 후 PG사 승인 취소 기간에 따라 주말, 공휴일을 제외한 영업일 기준 최대 3~5일 소요되오니 시간 양해 부탁드립니다.
				<br><br></p>
			<br><br><br>
		</div>

		<!-- 쿠폰/포인트 탭 -->
		<div id="menu1" class="tab-pane fade">
			<br>

			<div style="font-weight: bold;">쿠폰함에서 쿠폰이 사라졌어요.</div>
			<p style="font-size: 13.3333px; background: #e9ebebbe;"><br>사용하지 않은 쿠폰은 유효기간이 지나면 쿠폰함에서 자동 삭제가 됩니다.
			<br>앱 하단 내정보 &gt; 쿠폰함에서 유효기간을 미리 확인해 주세요.
			<br><br></p>

			<br><div style="font-weight: bold;">무료초대권은 어떻게 사용하나요?</div>
			<p style="font-size: 13.3333px; background: #e9ebebbe;"><br>앱 하단 내정보 &gt; 쿠폰함에서 무료초대권을 확인한 후 숙소에 직접 예약 문의하시면 됩니다.
			숙소마다 사용조건이 다르며, 현장 상황에 따라 잔여 객실이 없을 수 있기 때문에 꼭! 사용 희망일 최소 3일 전 숙소에 문의 후 이용해 주시길 바랍니다.
			<br><br></p>

			<br><div style="font-weight: bold;">예약 시 사용가능한 쿠폰이 없어요.</div>
			<p style="font-size: 13.3333px; background: #e9ebebbe;"><br>쿠폰마다 사용 가능한 숙소/요일/객실타입/금액대 등이 다르게 적용되며, 유효기간 및 사용 기준이 달라집니다.<br>
			앱 하단 내정보 &gt; 쿠폰함에서 보유한 쿠폰의 사용 기준을 확인해 주세요.
			<br><br></p>

			<br><div style="font-weight: bold;">사용한 쿠폰을 쿠폰함에서 삭제하고 싶어요.</div>
			<p style="font-size: 13.3333px; background: #e9ebebbe;"><br>사용 완료된 쿠폰 내역은 앱 하단 더보기 &gt; 사용내역 관리 &gt; 쿠폰함에서 삭제가 가능합니다.
			<br><br></p>

			<br><div style="font-weight: bold;">지류 쿠폰은 어떻게 등록하나요?</div>
			<p style="font-size: 13.3333px; background: #e9ebebbe;"><br>앱 하단 내정보 &gt; 쿠폰함 &gt; 상단 오른쪽 '쿠폰등록' 에서 쿠폰코드 등록이 가능합니다.
			<br><br></p>

			<br><br><br>
		</div>

		<!-- 회원정보 탭 -->
		<div id="menu2" class="tab-pane fade">
			<br>

			<div style="font-weight: bold;">회원탈퇴는 어떻게 하나요?</div>
            <p style="font-size: 13.3333px; background: #e9ebebbe;"><br>회원탈퇴는 아래 방법을 통해 가능하며,&nbsp;반드시 주의사항을 확인 후 진행해 주시기 바랍니다.<br>
				[일반회원]<br>
				- 여기어때 앱/웹 &gt; 내정보 &gt; 내정보 관리 &gt; 회원탈퇴&nbsp;<br>
				[기업회원]<br>
				- 개별적으로 회원탈퇴 불가<br>
				- 기업 담당자 문의 또는 여기어때 고객행복센터로 기업회원 탈퇴요청<br>
				*주의사항<br>
				· 회원탈퇴 시 계정 정보는 복구가 불가하며 1일 이후 재가입이 가능합니다.<br>
				· 현재 보유 중인 포인트, 쿠폰은 모두 소멸되며 복구할 수 없습니다.<br>
				· 탈퇴 후, 기존 가입 휴대기기로 재가입 시 첫 혜택을 받을 수 없습니다. (신규 회원 쿠폰, 첫 리뷰 작성 1,000포인트 등)
			<br><br></p>

            <br><div style="font-weight: bold;">개인이 여러 개의 아이디를 만들 수 있나요?</div>
			<p style="font-size: 13.3333px; background: #e9ebebbe;"><br>여기어때는 한 명이 여러 개의 아이디를 만드는 것을 허용합니다.<br>
			단, 개별 아이디에 적립된 포인트나 쿠폰, 구매내역 등은 통합 또는 양도가 불가하며, 각각의 아이디에서만 확인 가능합니다.
			<br><br></p>

			<br><div style="font-weight: bold;">아이디와 비밀번호를 잊었어요.</div>
            <p style="font-size: 13.3333px; background: #e9ebebbe;"><br>[아이디 찾기]<br>
			1. 이메일 주소로 가입한 회원 : 가입 시 등록한 닉네임이나 이메일 주소 일부를 고객행복센터에 조회 요청<br>
			2. 카카오톡/페이스북/네이버 계정으로 가입한 회원 : 해당 계정관리 업체의 고객센터에 문의<br>
			[비밀번호 찾기]<br>
			- 이메일주소 가입만 해당<br>
			1. 이메일로 로그인하기 &gt; 비밀번호 재설정<br>
			2. 가입 시 등록한 이메일 주소 입력<br>
			3. 인증수단 선택 (휴대폰번호 또는 이메일 주소)<br>
			4. 발급받은 인증번호 입력을 통해 새로운 비밀번호 생성<br>
			위 방법으로도 이용에 불편을 겪으실 경우 여기어때 고객행복센터로 문의해주시길 바랍니다.
			<br><br></p>

            <br><div style="font-weight: bold;">회원정보 수정은 어떻게 하나요?</div>
            <p style="font-size: 13.3333px; background: #e9ebebbe;"><br>앱 하단 내정보 &gt; 내 정보 관리에서 회원정보를 수정할 수 있습니다<br>
			닉네임 변경 시, 이미 사용중인 닉네임으로는 변경이 어려우며, 최근 30일 동안 1회만 변경 가능합니다.<br>
			* 회원정보 : 닉네임, 예약자명, 휴대폰 번호, 비밀번호(이메일 로그인 시에만 변경 가능)<br>
			<br></p>

			<br><br><br>
		</div>

		<!-- 리뷰 탭 -->
		<div id="menu3" class="tab-pane fade">
			<br>

			<div style="font-weight: bold;">리뷰는 어떻게 등록할 수 있나요?</div>
			<p style="font-size: 13.3333px; background: #e9ebebbe;"><br>여기어때 예약 서비스를 이용한 회원만 체크인 후 모텔 14일, 그 외 30일 이내에 리얼리뷰 작성 및 등록이 가능합니다.<br>
			[등록방법]<br>
			- 방문한 숙소 리뷰 페이지 상단 '리얼리뷰 작성하기'에서 리뷰 작성<br>
			- 앱 하단 내정보 &gt; 숙소 예약내역 &gt; 이용전/이용후 예약상세 &gt; 리뷰 작성
			<br><br></p>

            <br><div style="font-weight: bold;">리뷰 등록 포인트는 얼마인가요?</div>
			<p style="font-size: 13.3333px; background: #e9ebebbe;"><br>숙소 상품 이용 후 리얼리뷰를 남겨 주시면 포인트를 드립니다.<br>
			포인트는 최초 리얼리뷰 기준으로 적립되며, 수정 시 추가 지급은 없습니다.<br>
			[모텔, 게스트하우스]<br>
			기본 리뷰 작성 시 200포인트<br>
			100자 이상 리뷰 작성 시 1,000포인트<br>
			[호텔, 리조트, 펜션, 캠핑]<br>
			기본 리뷰 작성 시 500포인트<br>
			200자 이상 + 사진1장 이상 리뷰 작성 시 2,000포인트<br>
			[모바일티켓]<br>
			포인트 적립혜택 제외
			<br><br></p>

            <br><div style="font-weight: bold;">등록한 리뷰를 수정/삭제 하고 싶어요.</div>
			<p style="font-size: 13.3333px; background: #e9ebebbe;"><br>등록한 리뷰는 앱 하단 내정보 &gt; 나의 리뷰에서 직접 수정/삭제가 가능합니다.<br>
			단, 리뷰 수정은 작성 후 48시간 이전까지만 가능하며 리뷰 삭제 시 지급된 포인트는 차감되는 점 참고 부탁드립니다.
			<br><br></p>

            <br><div style="font-weight: bold;">등록한 리뷰가 사라졌어요.</div>
			<p style="font-size: 13.3333px; background: #e9ebebbe;"><br>리얼리뷰는 리뷰 관리 정책에 의거하여 운영되고 있습니다.<br>
			리뷰 관리 정책에 위배될 경우 사전 고지 없이 삭제 처리가 되며, 적립된 포인트도 차감되는 점 이용에 참고 부탁드립니다.<br>
			[삭제 정책]<br>
			>1) 욕설, 비속어, 음란성<br>2) 스팸, 광고, 도배성<br>
			3) 방문한 숙소와 전혀 관계없는 내용<br>
			4) 리모델링, 사업주 변경의 경우<br>
			>5) 타업체를 거론한 게시물<br>
			6) 예약을 취소한 리뷰
			<br><br></p>

			<br><br><br>
		</div>
	</div>

	<script>
		let targetLink = document.querySelectorAll('.tab span');
		for(var i = 0; i < targetLink.length; i++) {
			targetLink[i].addEventListener('click', function(e){
        		e.preventDefault();
				for(var x = 0; x < targetLink.length; x++){
            		targetLink[x].classList.remove('active');
            		e.target.classList.add('active');
        		}
			}
		)};
	</script>
	<div class="clearfix"> </div>
</div>
</div>
	
<!--//blog-->
<!--footer-->
<div class="footer">
	<div class="container">
		<div class="footer-top-at">
			<div class="col-md-3 amet-sed">
				<h4>Our Company</h4>
				<ul class="nav-bottom">
					<li><a href="about.html">About Us</a></li>
					<li><a href="blog.html">For Sale By Owner Blog</a></li>
					<li><a href="mobile_app.html">Mobile</a></li>
					<li><a href="terms.html">Terms & Conditions</a></li>
					<li><a href="privacy.html">Privacy Policy</a></li>	
					<li><a href="blog.html">Blog</a></li>
					
				</ul>	
			</div>
			<div class="col-md-3 amet-sed ">
				<h4>Work With Us</h4>
					<ul class="nav-bottom">
						<li><a href="single.html">Real Estate Brokers</a></li>
						<li><a href="single.html">Business Development</a></li>
						<li><a href="single.html">Affiliate Programs</a></li>
						<li><a href="contact.html">Sitemap</a></li>
						<li><a href="career.html">Careers</a></li>
						<li><a href="feedback.html">Feedback</a></li>	
					</ul>	
			</div>
			<div class="col-md-3 amet-sed">
				<h4>Customer Support</h4>
				<p>Mon-Fri, 7AM-7PM </p>
				<p>Sat-Sun, 8AM-5PM </p>
				<p>177-869-6559</p>
					<ul class="nav-bottom">
						<li><a href="#">Live Chat</a></li>
						<li><a href="faqs.html">Frequently Asked Questions</a></li>
						<li><a href="suggestion.html">Make a Suggestion</a></li>
					</ul>	
			</div>
			<div class="col-md-3 amet-sed ">
				<h4>Property Services</h4>
				   <ul class="nav-bottom">
						<li><a href="single.html">Residential Property</a></li>
						<li><a href="single.html">Commercial Property</a></li>
						<li><a href="login.html">Login</a></li>
						<li><a href="register.html">Register</a></li>
						<li><a href="typo.html">Short Codes</a></li>	
					</ul>	
					<ul class="social">
						<li><a href="#"><i> </i></a></li>
						<li><a href="#"><i class="gmail"> </i></a></li>
						<li><a href="#"><i class="twitter"> </i></a></li>
						<li><a href="#"><i class="camera"> </i></a></li>
						<li><a href="#"><i class="dribble"> </i></a></li>
					</ul>
			</div>
		<div class="clearfix"> </div>
		</div>
	</div>
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
<!--//footer-->
</body>
</html>