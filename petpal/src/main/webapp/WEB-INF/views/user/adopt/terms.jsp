<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
			td > button {
				background-color: #45B99C; 
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                width: 10px; 
                height: 15px;
                border-radius: 10px;
				margin-left: 5px;
			}
			td > button:hover {
				background-color: white; 
                color: #45B99C;
                border-color: white; 
                border: 1px solid;
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
                width: 130px;
                margin-right: 20px;
            }
            tr, td {
            	font-size: 17px;
				height: 70px;
				text-align: left;
			}
			td > input {
            	height: 40px;
                width: 95%;
                border-radius: 10px;
                border: 1px solid rgb(175, 175, 175);
            }
            td > textarea {
            	height: 100px;
                width: 95%;
                border-radius: 10px;
                border: 1px solid rgb(175, 175, 175);
                resize: vertical;
            }
            input::placeholder {
			  color: #A5A5A5;
			}
			textarea::placeholder {
			  color: #A5A5A5;
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

        <!-- xsslider slider css -->


        <!--<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/xsslider.css">-->




        <!--For Plugins external css-->
        <!--<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/plugins.css" />-->

        <!--Theme custom css -->
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/style.css">
        <!--<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/colors/maron.css">-->

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/responsive.css" />

        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
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
            <!--Home Sections-->
			                
			
            <section id="board" class="board" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
                
            </section> <!--End off Home Sections-->
            <section id="menutable" class="menutable">
            
						<div style="width: 55%;  margin: 0px auto;  margin-bottom: 50px; ">
						<div style="color: #19A985; font-size: 25px; font-weight: 600; float:left; ">입양 홍보글 작성을 위한 약관동의
		                </div>
		                <img src="${ pageContext.servletContext.contextPath }/resources/images/back.png" onclick="location.href='${ pageContext.servletContext.contextPath }/views/user/mypage/adApplyDetail.jsp'" style="width:50px; float: right; margin-bottom:20px; maring-right:-10px;">
		                <hr style="border: 1px solid #000000; width: 1066px;height: 0px;left: 177.5px;">
		                
		                <textarea readonly rows="3" id="textArea" class="input-xlarge" style="width: 1066px;height: 700px; resize: none;"
									placeholder="**목적**

입양의 목표는 임시 보호중인 동물들에게 평생 함께 할 수 있는 가정을 찾아주는 것입니다.

**반드시 숙지해야 할 상황**

입양할 동물들의 건강과 특성과 행동은 환경과 상황에 따라 달라집니다. 따라서 입양은 주의 사항들을 동반합니다. 부디 아래에 적힌 주의사항들을 고려하시기 바랍니다. “우리”는 임시보호자와 입양신청자가 만날 수 있는 공간을 제공하는 곳입니다. 개인정보 악용으로 인한 책임은 지지 않습니다.

·   입양된 반려동물이 입양자의 소유물을 망가뜨릴 수도 있습니다.

·   입양된 반려동물로부터 사람들이나 다른 반려동물이 질병이 노출 될 수도 있습니다.

·   입양된 반려동물로부터 사람들이나 다른 반려동물이 상해를 입을 수 있습니다.

·   입양한 동물이 너무 일찍 죽을 수도 있습니다.

**입양 과정**

1. 입양신청자는 성인이어야 하며 모든 가족구성원들이 입양에 찬성, 동의를 해야합니다. 또한 자가 주택이 아닌 경우 집주인의 동의 또한 얻어야 합니다. 임시보호자가 이러한 동의를 서명한 계약서를 요청 할 수도 있습니다.  또한 임시보호자는 동물을 입양하는데 적합하지 않다고 판단되는 신청자들을 거절할 권리가 있습니다.

2. 입양신청자는 신청서를 잘 작성하신 후에 임시보호자가 입양홍보글에 제공한 정보를 통해 직접 연락을 합니다. 이후 입양보호자의 판단에 의해 입양 여부가 결정됩니다. 입양 전 테스트기간동안에 반려동물은 임시보호자의 소속입니다.

3. 임시보호자의 판단 기간이 끝난 후에 그 동물을 입양하기를 원하시면 계약서에 서명하시고 임시보호자가 입양 비용 조건을 걸었다면 입양 비용을 지불해야 합니다. (단, 임시보호자는 일정 기간 이후 입양자가 다시 반려동물을 파양하지 않았다면 환불해줘야 합니다. 이는 개인과 개인의 거래이므로 “우리”는 책임지지 않습니다.) 모든 단계가 완료되면 반려동물의 소속이 입양자에게로 이전됩니다.

4. 입양 후 7일 안에 동물병원에 입양한 동물을 데려가셔서 검사 받으시길 권합니다.

5. “우리”의 입양 방침 동의서 외에 임시보호자가 다른 서류를 요구할 수 있습니다. 입양신청자는 이에 서류를 따른 작성해야 합니다.

**입양 후**

1. 임시보호자들이 입양자에게 가끔 연락하여 입양된 반려동물이 어떻게 지내고 있는지 소식을 요청할 수 있습니다. 입양된 동물이 새로운 가정에서 잘 적응하고 지내기를 바랍니다.

2. 입양신청서에 명시되어 있듯이 고양이나 개에게 미용을 목적으로 하는 발톱 제거 수술, 꼬리 절제 수술, 귀의 일부를 잘라내는 수술, 성대 제거 수술, 힘줄 절제술 등을 불필요한 수술을 해서는 안 됩니다.

3. 만약 입양자가 입양한 동물을 파양 하기 바란다면 전 임시보호자의 동의 없이 다른 사람에게 입양 보내시는 안 됩니다. 파양 하는 동물은 다시 전 임시보호자에게 돌아가야 합니다. 또한 그 과정에서 발생한 비용은 모두 본인이 부담해야 합니다.

5. 파양시 입양비 환불은 불가합니다.

6. 만약 전 임시보호자의 반려동물과 관계 없는 연락을 취하거나 개인정보도용시 “우리”에게 신고해주시길 바랍니다."
									></textarea>
		                
		                <br>
		                <div class="custom-control custom-checkbox text-center">
		                <label class="custom-control-label" style="margin-left:3px; margin-top:10px; font-size:18px;">
						  <input type="checkbox" name="pointCheck1" value ="1" class="custom-control-input" id="pointCheck1" style="zoom: 1.5; margin-top:10px; margin-left:50px;" required/>
						  위의 약관사항을 모두 읽었으며 이에 따른 방침에 모두 동의합니다.
						</label>
						</div>
						<button onclick="checkbox();" style="margin-top:10px; margin-left: 50%; text-align: center; margin-bottom: 50px; font-weight:bold;">다음으로</button>
                    	
            </section>
            <script>
            function checkbox(){
		        if ($("#pointCheck1").prop("checked")) {
		        	location.href='${ pageContext.servletContext.contextPath }/user/adopt/write';
		        }else{
		        	alert("약관에 동의해주셔야합니다.");
		        	$("pointCheck1").focus();
		        	return false;
		                
		        }
		    }
			</script>
            
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>

            <!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"/>
        </div>
        
</html>