<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            a > img {
                width: 50%;
                height: 50%;
                margin-top: 20px;
                margin-bottom: 10px;
                margin-left: 15px;
                margin-right: 15px;
                text-align: center;
            }
            td > input {
            	height: 40px;
                width: 95%;
                border-radius: 10px;
                border: 1px solid rgb(175, 175, 175);
            }
            tr, td {
            	font-size: 17px;
				height: 55px;
				text-align: left;
			}
            td > button {
                background-color: #45B99C; 
                height: 35px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
            }
            div > button {
                background-color: #45B99C; 
                height: 35px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid;
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
                margin-left: 20px;
            }
            td > input::placeholder {
                font-size: 15px;
                color:#a1a1a1;
            }
        </style>
        <meta charset="utf-8">
        <title>PET-PAL</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="favicon.ico">

        <!--Google Font link-->
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">


        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/slick/slick.css"> 
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/slick/slick-theme.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/animate.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/iconfont.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/font-awesome.min.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/magnific-popup.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/bootsnav.css">

        <!--Theme custom css -->
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/style.css">

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/responsive.css" />

        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        <script>
	        const message = '${ requestScope.message }';
	    	if(message != null && message !== '') {
	    		alert(message);
	    	}
        </script>
    </head>

    <body data-spy="scroll" data-target=".navbar-collapse">


        <!-- Preloader -->
        <div id="loading">
            <div id="loading-center">
                <div id="loading-center-absolute">
                    <div class="object" id="object_one"></div>
                    <div class="object" id="object_two"></div>
                    <div class="object" id="object_three"></div>
                    <div class="object" id="object_four"></div>
                </div>
            </div>
        </div><!--End off Preloader -->


        <div class="culmn">
            <!--Home page style-->


            <jsp:include page="../common/userHeader.jsp"/>

            <section id="account" class="account" style="width: 70%; margin: 0px auto;  margin-bottom: 40px;">
                <div style="color: #45B99C; font-size: 25px; font-weight: 600;">광고 신청</div>
            </section>
            
			<section id="account" class="account" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
                <div style="font-size: 20px; font-weight: 600; float: left; margin-left: 10px;">광고 안내사항 및 약관동의</div>
                <br>
                <hr style="border-color: rgb(175, 175, 175);">
            </section>
            
            <section id="accountmanagement" class="accountmanagement">
                <div style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 35px; margin-bottom: 80px;">
					<table style="width: 90%; height: 83%; margin-left: 30px; margin-top: 20px; margin-bottom: 20px;">
						<tr>
							<td style="width: 25%">광고 안내사항</td>
							<td><textarea class="form-control" style="height: 90%">
(주)펫팔 (이하 "회사")이 운영하는 웹사이트(이하 "사이트")가 운영하는 광고에 대한 안내사항(개정 2021.06.23)
회사는 모든 웹사이트 광고를 네이티브 광고로 운영한다. 네이티브 광고란 Native와 Advertising의 합성어로 모바일 웹 또는 앱의 콘텐츠와 서비스 내에 자연스럽게 결합되어 있는 광고 포맷이다.
이는 전통적인 직사각형 배너광고와는 달리 콘텐츠를 기반으로 하며 사이트와 융합된 자연스러운 노출을 지향하는 것으로 웹사이트의 커뮤니티 게시글에 맞게 고유한 방식으로 기획 및 제작한 광고로 들어간다.
펫팔의 네이티브 광고는 모든 게시판에 랜덤한 방식으로 게시된다.
							</textarea></td>
							<td style="width:140px; padding-left: 20px"><label name="admit4" style="font-size: 15px; font-weight: normal;">
							<input type="checkbox" name='admit' id='admit0' style="width: 15px;">  약관 동의</label></td>
						</tr>
						<tr style="height:300px;">
							<td>광고 약관</td>
							<td><textarea class="form-control" style="height: 90%">
광고 약관 (개정 및 적용 2021. 06. 23)
제1장 총칙							

제1조(목적) 본 약관은 이용자가 본 서비스를 제공하는 펫팔 주식회사 또는 그 계열사(서비스제공의 주체가 되는 법인을 의미하며, 이하 ‘회사’라 통칭한다)의 웹사이트(www.pet-pal.com), 모바일 애플리케이션, 또는 모바일 웹에서 마케팅/광고상품을 매수하여 이를 시행함에 있어 회사와 이용자 간의 권리, 의무 등 필요한 제반 사항을 규정함을 목적으로 한다. 

제2조(용어의정의)
1. ‘이용자’란, 회사 웹사이트, 모바일 애플리케이션, 또는 모바일 웹에서 광고상품을 매수한 후 이를 이용하여 본인의 상품 또는 서비스를 광고할 목적으로 본 약관을 승인하고 회사와 개별 광고상품 서비스 이용계약을 체결한 자를 의미한다.
2. ‘플랫폼 서비스’란, 회사 웹사이트, 모바일 애플리케이션, 또는 모바일 웹을 통하여 이용자가 스스로 광고상품 및 상품 이용에 관한 제반 사항을 선택하여 회사로부터 제공받는 일체의 중개 서비스를 의미한다.
3. ‘광고상품’이란, 이용자가 회사 웹사이트, 모바일 애플리케이션, 또는 모바일 웹으로부터 매수한 광고 구좌에서 이용자의 상품을 광고할 수 있도록 회사가 제공하는 서비스 수단 일체를 의미한다. 4. ‘상품광고’란, 이용자가 매수한 ‘광고상품’에 따라 이루어지는 광고를 의미한다.
4. ‘이용료’란, 이용자가 광고상품을 매수하여 이용하는 대가로 회사에 지급하는 금전 일체를 의미한다.
5. ‘상품 콘텐츠’란, 광고상품 서비스에 따라 노출되는 광고에 활용되는 이용자 판매 상품의 이미지, 스펙, 상세 정보 등을 포함한 모든 정보를 의미한다.
6. ‘고객’이란, 광고상품을 통하여 이용자가 광고하는 쇼핑몰의 텍스트, 배너, 상품DB 등에 대한 URL Link 등을 클릭하여 이용자의 사이트로 방문하는 자를 의미한다.
  
제3조(약관의 명시 및 변경)
① 회사는 본 약관의 내용을 이용자가 쉽게 알 수 있도록 회사의 관련 웹페이지, 이용자 전용시스템등의 초기화면에 게시한다.
② 회사는 약관의 규제에 관한 법률 등 관련법을 위배하지 않는 범위에서 본 약관을 변경할 수 있다.
③ 회사가 본 약관을 변경할 경우에는 기존약관과 변경약관 및 변경약관의 적용일자와 변경사유를 명시하여 그 적용일자 7일 전부터 적용일 이후 상당한 기간 동안 이를 회사의 관련 웹페이지, 이용자 전용시스템등에 공지한다. 다만, 변경 내용이 이용자에게 불리한 경우에는 그 적용일자 14일 전부터 적용일 이후 상당한 기간 동안 각각 이를 회사의 관련 웹페이지, 이용자 전용시스템등에 공지하거나, 이용자에게 서면 또는 이메일 등으로 통지한다.
④ 이용자는 변경약관에 동의하지 않을 경우 개별 광고상품 서비스 이용계약을 해지할 수 있다.
⑤ 본 약관에서 정하지 아니한 사항과 본 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따른다.

제4조(약관의 동의)
① 광고상품 서비스를 이용하고자 하는 자(이하 “이용신청자”)는 회사가 정한 절차에 따라 본 약관에 동의하고 회사가 이를 승낙함으로써, 광고게재 신청서를 작성한 날로부터 본 약관과 자신이 이용하고자 하는 개별 계약에 규정된 내용에 따라 광고상품 서비스를 이용할 수 있다.
② 회사는 제1항에 따른 이용신청자가 아래 각호에 해당되는 경우에는 승낙을 거부할 수 있다. 
1. 회사와 본 약관 또는 펫팔 입점계약에 따른 계약내용을 이행하지 않거나 계약관계가 종료된 경우	
2. 본 약관에 의하여 이전에 광고상품 이용 자격을 상실한 적이 있는 경우
3. 실명이 아니거나 타인의 명의를 이용한 경우
4. 이용신청자의 귀책사유로 인하여 회사의 승낙이 불가능한 경우
5. 기타 제1호 내지 제4호에 준하는 사유로 회사가 승낙을 거부할 합리적인 사유가 있는 경우
③ 회사는 개별 세부정책에 대한 약관 및 이용조건을 각각 별도로 정하여 이용자의 동의를 얻을 수 있고, 이 경우 개별 세부정책에 대한 이용약관 등이 본 약관에 우선한다.
제5조(광고상품 서비스의 내용) 회사는 개별 광고상품 서비스의 종류 및 세부유형, 이용정책 등의 내용(이하 “광고상품 서비스의 내용”)을 회사의 관련 웹페이지, 이용자 전용시스템 등에 공지하고, 이용자는 광고상품 서비스 이용 전 이를 신중히 확인하여야 한다. 제6조(개별 광고상품 서비스 이용계약 체결 등)
① 개별 광고상품의 이용을 원하는 자는 회사가 정한 절차에 따라 광고게재를 신청하고, 회사가 이를 승인한 경우 회사의 개별 광고상품을 이용할 수 있다. 광고상품 이용을 위한 구체적인 신청 및 승인절차는 광고상품별로 회사의 관련 웹페이지, 이용자 전용시스템 등을 통해 공지한다.
② 개별 광고상품의 이용을 원하는 자는 회사가 요구하는 양식과 절차에 따라 개별 광고상품 이용을 신청하여야 한다. 회사는 이용자를 선정하는 기준, 방식 및 절차 등을 결정할 권한을 가지고, 관련 법령 및 회사의 기준에 따라 개별 광고상품의 이용을 원하는 자에게 신청한 내용의 변경을 요청할 수 있다.
③ 회사는 광고상품을 이용하기를 원하는 자가 제2항 후문에 따른 회사의 변경요청을 수용하지 않거나, 회사가 정한 이용자 선정 기준에 부합하지 않는 경우에는 개별 광고상품 이용 요청에 대한 승인을 거부할 수 있다.
④ 회사는 제1항의 개별 광고상품의 이용을 원하는 자가 제시하는 제반 조건들을 고려하여 선정된 이용자와 개별 광고상품 서비스 이용계약을 체결하여 본 광고상품의 내용에 따른 광고 구좌를 판매한다.

제5조(광고상품 서비스의 내용) 회사는 개별 광고상품 서비스의 종류 및 세부유형, 이용정책 등의 내용(이하 “광고상품 서비스의 내용”)을 회사의 관련 웹페이지, 이용자 전용시스템 등에 공지하고, 이용자는 광고상품 서비스 이용 전 이를 신중히 확인하여야 한다. 제6조(개별 광고상품 서비스 이용계약 체결 등)
① 개별 광고상품의 이용을 원하는 자는 회사가 정한 절차에 따라 광고게재를 신청하고, 회사가 이를 승인한 경우 회사의 개별 광고상품을 이용할 수 있다. 광고상품 이용을 위한 구체적인 신청 및 승인절차는 광고상품별로 회사의 관련 웹페이지, 이용자 전용시스템 등을 통해 공지한다.
② 개별 광고상품의 이용을 원하는 자는 회사가 요구하는 양식과 절차에 따라 개별 광고상품 이용을 신청하여야 한다. 회사는 이용자를 선정하는 기준, 방식 및 절차 등을 결정할 권한을 가지고, 관련 법령 및 회사의 기준에 따라 개별 광고상품의 이용을 원하는 자에게 신청한 내용의 변경을 요청할 수 있다.
③ 회사는 광고상품을 이용하기를 원하는 자가 제2항 후문에 따른 회사의 변경요청을 수용하지 않거나, 회사가 정한 이용자 선정 기준에 부합하지 않는 경우에는 개별 광고상품 이용 요청에 대한 승인을 거부할 수 있다.
④ 회사는 제1항의 개별 광고상품의 이용을 원하는 자가 제시하는 제반 조건들을 고려하여 선정된 이용자와 개별 광고상품 서비스 이용계약을 체결하여 본 광고상품의 내용에 따른 광고 구좌를 판매한다.

제6조(이용료) 개별 광고상품은 네이티브광고의 특성 상 CPC(Cost Per Cost) 방식을 사용하며, 2차에 걸쳐서 1차는 기본금 납부, 2차는 광고 게시물 클릭 수에 따른 CPC 납부를 한다.
1. 1차 결제(기본금)
광고 게시 기간에 따라 달라진다.
1주 : 200,000원 (20만원)
2주 : 350,000원 (35만원)
납입 시점 : 광고 승인 시 3일 내에 결제
납입 방법 : 카카오페이
2.	2차 결제
클릭 수에 따라 달라진다.
150원 / Click (1회 클릭 당 150원 산정)
납입 시점 : 당월 말일까지 결제
납입 방법 : 회사 통장으로 입금

제7조(양 당사자의 권리와 의무)
① 회사는 관련법령과 본 약관이 금지하는 행위를 하지 않으며, 본 약관에 따라 안정적으로 광고상품을 제공하는데 최선을 다한다.
② 회사는 이용자의 서비스 이용과 관련하여 그의 권리∙의무에 영향을 주지 않을 경우, 분할∙합병 등을 통해 서비스제공의 주체를 변경할 수 있다. 단, 이경우 제13조 5항에 따라 적법하게 통지하여야 한다.
③ 이용자는 이용자의 광고상품을 이용하기 위해 필요한 모든 상품정보를 회사에게 성실히 제공하여야 한다.
④ 이용자는 이용자가 광고상품 이용을 위하여 플랫폼에 입력하는 모든 상품 콘텐츠 및 기타 정보를 신의에 따라 성실하게 관리하여야 한다.
⑤ 이용자는 자동화된 방법 또는 기타 부정한 방법 등을 통하여 자신 또는 다른 이용자의 광고상품의 노출횟수, 클릭횟수 등을 부정하게 생성 또는 변경하게 하거나, 광고상품을 제3자에게 재 판매하는 행위를 하여서는 아니된다.

제8조(상품정보 등록제한)
① 회사는 법령상 상품 판매를 함에 있어 행정기관 또는 권리자의 인허가가 필요하거나 또는 제3자로부터 권리침해 등의 주장이 있는 경우 해당 증빙 자료를 이용자에게 요구할 수 있다. 이 경우 이용자는 증빙 자료를 즉시 회사에 제공하여야 하며, 이를 지연할 경우 회사는 광고상품 서비스 제공을 중지할 수 있다.
② 이용자는 제1항을 위반하여 상품정보를 게재하거나 상품을 판매한 경우 그로 인한 모든 법적 책임을 부담하여야 하며, 즉시 이용자의 비용과 책임으로 회사를 면책하여야 한다.

제10조(환불 및 취소)
① 이용자는 승인된 광고에 대해 광고상품을 취소할 수 있다. 1차 결제가 여부에 따라, 취소신청일자에 따라 환불여부와 2차 금액 징수 여부가 달라진다.
② 1차 광고비 결제 전엔 고객이 광고 취소요청시 광고 대기 리스트에서 광고를 삭제해준다.
③ 1차 광고비 결제를 하고 결제 당일 취소요청 시 100% 전액 환불을 해준다.
④ 1차 광고비 결제를 하고 결제일 이후 취소요청 시 게시물을 클릭한 횟수에 따라 2차 광고비가 청구되고 광고가 삭제된다.
1. 회사 또는 이용자는 언제든지 상대방에 대한 사전 통지를 함으로써 본 계약을 해지할 수 있다. 이 경우, 회사 또는 이용자는 집행되지 않은 잔여기간에 대한 광고비는 상호간의 협의를 거쳐 정산하도록 한다. 단, 별도의 위약금 약정이 있는 경우에는 그 약정에 따른다.
2. 회사는 제12조(광고상품 서비스 이용의 제한 및 중지)에 해당하는 사유가 발생한 경우 이용자에 대한 서비스를 중지하고, 상당한 기간을 정하여 그 시정을 요구할 수 있으며, 시정이 이루어지지 않을 경우에는 본 약관에 따른 계약을 해지할 수 있다.
3. 회사는 본 약관에 따른 계약을 해지하고자 하는 경우, 해지 사유를 기재한 서면으로 상대방에게 계약해지의 의사표시를 하여야 한다. 이용자는 본 약관에 따른 계약을 해지하고자 하는 경우, 사전에 공지된 절차에 따라 회사의 고객센터로 요청/해지 사유를 기재한 서면으로 계약해지의 의사표시를 하여야 하며, 휴일 접수된 건은 휴일 이후 첫 영업일에 의사표시가 접수된 것으로 본다. 제1항에 따른 회사 또는 이용자의 해지의 경우에는 서면에 해지 사유를 기재하지 아니할 수 있다.
4. 회사 또는 이용자는 상대방이 다음 각 호에 해당할 경우 본 약관에 따른 계약을 즉시 해지할 수 있다. 
o. 당사자 일방이 파산신청, 회사정리절차, 기업회생절차 신청, 해산, 영업취소, 영업정지, 강제집행, 압류 등으로 인하여 정상적인 영업활동을 할 수 없게 된 경우
o. 본 약관의 비밀유지의무, 양도금지의무를 위반한 경우

제11조(이용자에 대한 통지)
① 회사가 이용자에 대한 통지를 하는 경우 본 약관에 별도규정이 없는 한 이용자가 제공한 전자우편, (휴대)전화번호, 주소 등의 수단으로 할 수 있다.
② 회사는 이용자 전체에 대한 통지를 하는 경우 본 약관에 별도규정이 없는 한 7일 이상 회사의 관련 웹페이지, 이용자 전용시스템등의 초기화면에 게시함으로써 전항의 통지에 갈음할 수 있다. 다만, 이용자의 서비스 이용과 관련하여 중대한 영향을 미치는 사항에 대해서는 제1항에 따른 방법으로 통지한다.
③ 이용자는 회사에 실제로 연락이 가능한 전자우편, (휴대)전화번호, 주소 등의 정보를 제공하고 해당 정보들을 최신으로 유지하여야 한다.
④ 회사가 제1항의 방법에 따라 통지하거나, 제2항의 방법에 따라 게시할 경우, 이용자에 대한 통지의무를 다한 것으로 보며, 이용자가 회사에 제공한 전자우편, (휴대)전화번호, 주소 등이 사실과 다르거나, 이용자가 통지를 확인하지 않아 발생한 문제에 대하여는 책임지지 않는다.
⑤ 회사는 이용자의 서비스 이용과 관련하여 그의 권리∙의무에 영향을 주지 않을 경우, 분할∙합병 등을 통해 서비스제공의 주체가 변경되었음을 제2항의 방법에 따라 통지할 수 있다.

제12조(지식재산권)
① 이용자는 이용자가 제작한 상품 콘텐츠 또는 광고 콘텐츠에 대한 지식재산권 (특허∙실용신안∙의장∙상표권 및 저작권 등을 포함)과 기타 사용할 수 있는 권한을 보유하고 있으며, 이러한 상품 콘텐츠가 제3자의 지식재산권을 포함한 기타의 적법한 권리와 관련 법률을 침해하거나 위반하지 않음을 보장한다.
② 이용자는 회사에 제1항의 상품 콘텐츠를 광고를 위한 용도로 사용∙복제∙전시∙유포∙전송 등을 할 수 있는 권한을 부여하고, 회사는 광고 목적으로만 이용자의 상품콘텐츠를 사용하여야 한다.
③ 제1항의 상품 콘텐츠가 국내 및 국외의 제3자의 지식재산권 등의 권리를 침해하거나 관련 법률을 위반하였거나 위반할 위험이 있는 경우, 회사는 이용자에 사전통지를 거쳐 문제되는 상품 콘텐츠를 삭제하거나 광고상품 서비스 자체를 중단할 수 있다.
④ 회사는 회사가 자체적으로 제작한 광고 콘텐츠에 관한 지식재산권을 소유하고, 이용자는 회사의 사전동의 없이 이러한 광고 콘텐츠를 사용하거나, 사용이 허락된 목적 및 범위를 벗어나 사용할 경우, 그에 따른 모든 법적 책임을 부담한다.
⑤ 회사는 광고상품의 집행 결과로 생성되는 각종 콘텐츠, 보고서, 문서 및 기타 자료에 대한 지식재산권을 소유한다.

제13조(개인정보 보호)
① 이용자는 업무상 취득한 고객의 정보를 고객과의 거래 이행에 필요한 목적 이외에 다른 용도로 사용해서는 아니된다. 이용자는 고객이 제공한 정보를 관리함에 있어서 선량한 관리자로서의 주의의무를 다하여야 하고, 전자거래기본법, 정보통신망 이용 촉진 및 정보보호등에 관한 법률을 비롯한 관계법령의 규정을 준수하여야 한다.
② 회사는 이용자의 별도 파기 요청이 있기 전까지 업무수행을 위하여 전달받은 이용자의 개인정보를 보관하고, 이용자의 개인정보를 본 약관상의 업무수행만을 위하여 사용하여야 한다.
							</textarea></td>
							<td style="width:140px; padding-left: 20px"><label name="admit4" style="font-size: 15px; font-weight: normal;">
							<input type="checkbox" name='admit' id='admit1' style="width: 15px;">  약관 동의</label></td>
						</tr>
						<tr>
							<td style="width: 20%">기업정보의 수집·이용·제공</td>
							<td><textarea class="form-control" style="height: 90%">
개인 및 기업정보의 수집·이용·제공에 관한 사항
① 개인 및 기업정보의 수집·이용·제공 목적
-  귀하의 개인 및 기업정보는 회사의 광고 운영과 관련하여 귀하의 개인 또는 기업정보를 조회하기 위한 목적으로 관리시스템에 수집·조회·활용·제공됩니다.
-  귀하의 개인 및 기업정보의 수집·이용·제공의 동의서 징구는 민법 제114조의 행정행위의 대리권 행사방식의 현명주의를 적용하여, 광고 관리 시스템의 효율적인 운영을 위해 본 사업의 소관부처 및 수행기관이 대신하여 받는 것임을 알려 드립니다.
② 개인 및 기업정보의 수집·이용·제공 항목
-  귀하의 개인 및 기업정보는 다음과 같은 항목(업체명, 주소, 사업자번호, 전화번호, 이메일정보, 휴대전화번호, 국세기본법 제81조의13의 과세정보로서 매출액, 납입자본금, 자산총액, 부채총액, 영업이익, 당기순이익 및 창․휴․폐업일, 소득세 원천징수 인원, 관세법 제116조에 따른 수출액, 고용보험법 제2조의 1의 피보험자수 등 사업진행 시 요구되는 자료일체 등 이 수집·이용·제공됩니다.
③ 개인 및 기업정보의 수집·이용·제공 기간
-  귀하의 개인 및 기업정보는 수집·이용·제공에 관한 동의로부터 본인에 대한 개인정보 제공·조회 동의의 효력기간 만료 시까지 수집·이용·제공됩니다.
-  귀하의 개인 및 기업정보는 수집·이용·제공 동의의 효력기간 만료 시 파기됩니다.
④ 동의를 거부할 권리 및 동의를 거부할 경우의 불이익
-  귀하의 개인 및 기업정보의 수집·이용·제공에 동의는 본 광고 신청을 위해 필수적이므로 이에 동의하셔야 이후 절차를 진행할 수 있습니다.
-  귀하의 개인 및 기업정보의 수집·이용·제공에 관한 동의는 거부하실 수 있으며, 다만 동의하지 않으시는 경우 본 광고 참여가 불가합니다.
							</textarea></td>
							<td style="width:140px; padding-left: 20px"><label name="admit4" style="font-size: 15px; font-weight: normal;">
							<input type="checkbox" name='admit' id='admit2' style="width: 15px;"> 약관 동의</label></td>
						</tr>
					</table>
					<div style="margin: 0px auto; text-align: center; margin-bottom: 10px;"><label name="admitAll" style="font-size: 15px; font-weight: normal;">
					<input type="checkbox" name='admit' value='selectall' onclick='selectAll(this)' style="width: 15px;">전체 약관 동의하기</label></div>
                    <div style="margin: 0px auto; text-align: center; margin-bottom:30px;">
                    <button onclick="admit_check()" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/adsubmit2'">다음으로</button></div>
				</div>
            </section>

            
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>

			<!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"/>
            
        </div>
            

        <!-- JS includes -->
        <script>
        function selectAll(selectAll)  {
		  const checkboxes = document.getElementsByName('admit');
		  
		  checkboxes.forEach((checkbox) =>  {
		    checkbox.checked = selectAll.checked;
		  })
		}
        
        <!-- 이용약관 유효성 -->
        function admit_check() {

        	if (!$("input:checked[id='admit0']").is(":checked")){ 
        		alert("약관에 모두 동의하지 않으면 광고 신청이 불가합니다.");
        		return false;
        	} else if (!$("input:checked[id='admit1']").is(":checked")){ 
        		alert("약관에 모두 동의하지 않으면 광고 신청이 불가합니다.");
        		return false;
        	} else if (!$("input:checked[id='admit2']").is(":checked")){ 
        		alert("약관에 모두 동의하지 않으면 광고 신청이 불가합니다.");
        		return false;
        	} else {
        		return location.href='${ pageContext.servletContext.contextPath }/user/select/adsubmit2';
        	}
        }
        </script>
        

        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/jquery-1.11.2.min.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/bootstrap.min.js"></script>

        <script src="${ pageContext.servletContext.contextPath }/resources/js/owl.carousel.min.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/jquery.magnific-popup.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/jquery.easing.1.3.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/css/slick/slick.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/css/slick/slick.min.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/jquery.collapse.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/bootsnav.js"></script>



        <script src="${ pageContext.servletContext.contextPath }/resources/js/plugins.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/main.js"></script>
</html>