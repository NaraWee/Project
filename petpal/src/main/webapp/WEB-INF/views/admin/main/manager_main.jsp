<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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

        <!--Theme custom css -->
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/style.css">

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/responsive.css" />

        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
   
   		<!-- 구글 차트 호출을 위한 js 파일 -->
		<script type="text/javascript" src="https://www.google.com/jsapi"></script>
		
		<script>
			// 구글 차트 라이브러리 로딩
			google.load('visualization','1',{
				'packages' : ['corechart']
			});
		
			// 로딩이 완료되면 drawChart함수를 호출
			 google.setOnLoadCallback(drawChart); //라이브러리를 불러오는 작업이 완료되었으면 drawChart작업을 실행하라는 뜻.
			 google.setOnLoadCallback(drawChart2); 
			 
			
			 function drawChart() {

               var jsonData =  $.ajax({ //월별 매출액
		        	url:"${ pageContext.servletContext.contextPath }/admin/adminMainPage/chart"
		          , dataType:"json"
		          , async: false
		          }).responseText;
               
		        console.log(jsonData);
		        
		        var data = new google.visualization.DataTable(jsonData);
		        
		        var chart = new google.visualization.LineChart(
		                document.getElementById('chart_div')); //선 그래프 
		          
		        
	                chart.draw(data, {
	                    title : "월별 매출액",
	                    //curveType : "function", //curveType는 차트의 모양이 곡선으로 바뀐다는 뜻
	                    width : 700,
	                    height : 450,
	                    hAxis: {
		        	          title: 'Month'
		        	    },
		        	    vAxis: {
		        	          title: 'Revenue(￦)'
		        	    },
		        	    backgroundColor: '#F1FAF8'
	                }); 
		                
		        };
		        
		        function drawChart2() {
		        	
		        	   var jsonData2 =   $.ajax({ //게시판별 조회수
				        	url:"${ pageContext.servletContext.contextPath }/admin/adminMainPage/chart2"
				          , dataType:"json"
				          , async: false
				          }).responseText;
				        
				         console.log(jsonData2);
				          
				         var data2 = new google.visualization.DataTable(jsonData2);
				         
				         var chart2 = new google.visualization.ColumnChart(
					                document.getElementById('chart_div2')); //선 그래프 
					          
				                chart2.draw(data2, {
				                    title : "게시판별 조회 수",
				                    width : 700,
				                    height : 450,
				                    hAxis: {
					        	          title: 'Board'
					        	    },
					        	    vAxis: {
					        	          title: 'Total Views(Count)'
					        	    },
					        	    backgroundColor: '#F1FAF8',
					        	    colors: ['#1b9e77'] 
					        	    
				        }); 
		       
		        };
	
		</script>
		
    </head>

    
    <body data-spy="scroll" data-target=".navbar-collapse">


            <!--Home page style-->
			<jsp:include page="../../admin/common/header.jsp"></jsp:include> 

            <!--Home Sections-->
           

           <!--Business Section-->
           <!--  <section id="business" class="business roomy-30" style="margin-top:0px; margin-bottom:0px; ">
                <div class="container">
                    <div class="row">
                        <div class="main_business">
                        <div class="col-md-6" style="width:100%;">
                                <div class="test_item fix" style="width: 280px; text-align: center; float:left;">
                                	<div style="width: 100%;height: 100px; ">
                                		<a style="text-align:center; font-size:60px;"><strong>3 건</strong></a>
                                	</div>
									<br>
                                     <h3 class="text-uppercase"><strong> 광고심사</strong></h3>
                                </div>
                                
                                <div class="test_item fix" style="width: 280px; text-align: center; float:left;">
                                	<div style="width: 100%;height: 100px; ">
                                		<a style="text-align:center; font-size:60px;"><strong>3 건</strong></a>
                                	</div>
									<br>
                                     <h3 class="text-uppercase"><strong> 검토게시판</strong></h3>
                                </div>
                                
                                <div class="test_item fix" style="width: 280px; text-align: center; float:left;">
                                	<div style="width: 100%;height: 100px; ">
                                		<a style="text-align:center; font-size:60px;"><strong>1 건</strong></a>
                                	</div>
									<br>
                                     <h3 class="text-uppercase"><strong> 신고게시판</strong></h3>
                                </div>
                               <div class="test_item fix" style="width: 280px; text-align: center; float:left;">
                                	<div style="width: 100%;height: 100px; ">
                                		<a style="text-align:center; font-size:60px;"><strong>5 건</strong></a>
                                	</div>
									<br>
                                     <h3 class="text-uppercase"><strong> 문의게시판</strong></h3>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </section> -->
            <!-- End off Business section -->
            
             <section id="business" class="businessroomy-70" style="height: 1050px; margin-top: 20px; margin-bottom:50px; padding-top:0px;">
                
                <div class="col-md-6" style="width:100%;">
                	
				<div class="container">
					<h3 class="text-uppercase"><strong>월별 매출액</strong></h3>
				</div>
                
                <!-- 월매출액 그래프 그려주는 부분 -->
                <div id="chart_div" class="container" style="margin-left: 200.222; margin-bottom: 50px;"></div>
                
                <div class="container">
					<h3 class="text-uppercase"><strong>게시판별 조회 수</strong></h3>
				</div>
                
                <!-- 게시판별 조회수 그래프 그려주는 부분 -->
                <div id="chart_div2" class="container" style="margin-left: 200.222;"></div>
                   
                </div>
            </section><!-- End off Business section -->


          <jsp:include page="../../admin/common/footer.jsp"></jsp:include>




        </div>

        <!-- JS includes -->

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
        </body>
</html>