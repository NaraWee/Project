<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            img {
                width: 600px;
                height: 600px;
                margin-bottom: 90px;
/*                 margin-left: 30px;
                margin-right: 30px; */
                text-align: center;
            }
            .sendmessage > input {
                width: 1000px;
                height: 50px;
                border-radius: 10px;
                border: 1px solid rgb(175, 175, 175);
                margin-bottom: 50px;
                margin-left: 80px;
            }
            .sendmessage > button {
                background-color: #45B99C; 
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                width: 10%;
                height: 45px; 
                font-size: 16px; 
                font-weight: 600;
                border-radius: 10px;
                margin-left: 2%;
            }
            .sendmessage > input::placeholder {
                color:#45B99C;
            }
            /* 이미지 콜라주 */
			/* 이미지 크기는 최대로 그냥 두고 span에 너비를 지정해서 사용.*/
			.imgCollage { margin:auto; text-align: center; }
			@media screen and (min-width: 768px) {	
				.imgCollage { 
					display:flex; -webkit-flex:auto; -moz-display:flex; -ms-display:flex; 
					flex-wrap:wrap; -webkit-flex-wrap:wrap; -moz-flex-wrap:wrap; -ms-flex-wrap:wrap; 
				}
				.imgCollage > span { padding: 4px; } 
				.imgCollage > span > .imageblock:not(:last-child) { vertical-align: baseline; } 
			    .imgCollage .imageblock { padding:0; } 
				.imgCollage img { box-shadow: none; }
			}
			@media screen and (max-width: 767px) { 
				.imgCollage > span { padding: 0; width: 100% !important; }  
				.imgCollage .imageblock { padding: 16px 0; } 
				.imgCollage  > span:first-of-type .imageblock:first-of-type { padding-top: 8px; }
				.imgCollage  > span:last-of-type .imageblock:last-of-type { padding-bottom: 4px; }
			}
			/* 이미지 콜라주  끝 */
			
			.overlay {
  				position: fixed;
				top: 0;
				bottom: 0;
				left: 0;
				right: 0;
				background: rgba(0, 0, 0, 0.7);
				transition: opacity 500ms;
				visibility: hidden;
				opacity: 0;
				z-index: 900;
				height: 150% !important;
			}
			.overlay:target {
				visibility: visible;
				opacity: 1;
			}
			.popup {
				position: fixed;
				width: 60%;
				padding: 10px;
				max-width: 500px;
				border-radius: 10px;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				background: rgba(255, 255, 255, .9);
				-webkit-transition: opacity .5s, visibility 0s linear .5s;
				transition: opacity .5s, visibility 0s linear .5s;
				z-index: 1;
			}
			.popup:target {
				visibility: visible;
				opacity: 1;
				-webkit-transition-delay: 0s;
				transition-delay: 0s;
			}
			.popup-close {
				position: absolute;
				padding: 10px;
				max-width: 500px;
				border-radius: 10px;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				background: rgba(255, 255, 255, .9);
			}
			.popup .close {
				position: absolute;
				right: 5px;
				top: 5px;
				padding: 5px;
				color: #000;
				transition: color .3s;
				font-size: 2em;
				line-height: .6em;
			}
			.popup .close:hover {
				color: #007a5c;
			}
            .btn_submit, .certification {
                background-color: #45B99C; 
                height: 35px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
            }
            
            .findpwd-content > div {
                margin: 0px auto;
            }
            .fas{
            margin-top:300px;
            color: #45B99C;
            }
            .bg-img-none {
    background-image: none !important;
}
.bg-none {
    background: none !important;
}
        </style>


        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
       	<script src="https://kit.fontawesome.com/4978ce16d0.js" crossorigin="anonymous"></script>
       	
       <!-- 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
       	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
       	 -->
       	 <script type="text/javascript"src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
       	 <script>
          var $j3 = jQuery.noConflict();
       </script>
    </head>

    <jsp:include page="../common/userHeader.jsp"/>

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


 		   <img src="${ pageContext.servletContext.contextPath }/resources/images/back.png" onclick="location.href='${ pageContext.servletContext.contextPath }/user/adopt'" style="width:50px; height:50px; float: right; margin-bottom: 0px; margin-right:180px;">
        <div class="culmn">
            <!--Home page style-->
            <!--Home Sections-->
 		<section id="product" class="product">
                <div class="container">
                	<!-- slider image 시작  -->
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-bs-slide-to="0" class="active" style="color:black;"></li>
                                <li data-target="#carousel-example-generic" data-bs-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-bs-slide-to="2"></li>
                                <li data-target="#carousel-example-generic" data-bs-slide-to="3"></li> 
                            </ol>
                            
                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                            <c:forEach var="image" varStatus="status" items="${pictureList}">
								<c:if test="${status.index == '0' }" >
	                                <div class="item active">
                                         <div class="col-md-6 col-md-offset-3">
                                                 <div class="port_img">
                                                     <img src="${ pageContext.servletContext.contextPath }/${ image.pictureUtilPath}" alt="" />
                                                 </div>
                                         </div>
	                                </div>
	                              </c:if>
	                              <c:if test="${status.index != '0' }" >
	                                <div class="item">
                                         <div class="col-md-6 col-md-offset-3">
                                                 <div class="port_img">
                                                     <img src="${ pageContext.servletContext.contextPath }/${ image.pictureUtilPath}" alt="" />
                                                 </div>
                                         </div>
	                                </div>
	                              </c:if>
                                
                              </c:forEach>
                                </div> 
                                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev" style="background-image:none !important;">
                                <i class="fas fa-arrow-circle-left fa-3x" style="margin-right:-100px;"></i>
                                <span class="sr-only">Previous</span>
                            </a>

                            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next" style="background-image:none !important;">
                           		<i class="fas fa-arrow-circle-right fa-3x" style="margin-left:-100px;"></i>
                                <span class="sr-only">Next</span>
                            </a>
                         </div>
                      </div>
                   </section>
                                
            <section id="boradtable" class="boradtable">
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <div class="container">
                        <div class="row">
                        	<div style="width: 600px;">
                        	<c:if test="${requestScope.adoptDetail.stateCode eq '1'}">
			                	<h2 style="background-color: orange; width: 130px; border-radius: 8px; float:left; height: 60px; color: white; font-weight: bold; padding-top: 10px;" align="center">
			                	대기중
			                	</h2>
		                	</c:if>
		                	<c:if test="${requestScope.adoptDetail.userCode eq sessionScope.loginUser.code }">  
			                	<div style="float:right;margin-right: -550px;">
				                	<button class="btn btn-light" style="width:100px; color: orange;border:none; background-color:white;" type="button" onclick="revisedfn();">수정하기</button>
				                	<c:if test="${requestScope.adoptDetail.stateCode eq '1'}">
				                		<input type="button" class="btn btn-light" style="width:150px; color: green; font-weight: bolder; border:none; background-color:white;" onclick="location.href='${ pageContext.servletContext.contextPath }/user/adopt/update/status?board=${requestScope.adoptDetail.boardCode}'" value ="입양 완료하기"/>
									</c:if>
			               		</div>
			                </c:if> 
			                
		<!-- 수정진행 여부 alert창  -->	                
		<script type="text/javascript">
         
         function revisedfn(){
        	 
         		if(confirm("게시글 수정시 사진을 필수로 재업로드 해주셔야합니다. 계속 진행하시겠습니까?")){
         			location.href='${ pageContext.servletContext.contextPath }/user/adopt/update/${requestScope.adoptDetail.boardCode}';
         		};
         };
         </script>
                	<!-- 상태 값에 따른 c:if 처리 -->
		                	<c:if test="${requestScope.adoptDetail.stateCode eq '2'}">
			                	<h2 style="float:left; background-color: #FF6230; width: 130px; border-radius: 8px; height: 60px; color: white; font-weight: bold; padding-top: 10px;" align="center">
			                	완료
			                	</h2>
			                	
		                	</c:if>
               			 </div>
               			 <div>
		                	<ul style="font-size: large;">
		                		<li style="margin-bottom: 30px;">&nbsp&nbsp&nbsp작성자 : 
		                		<b><c:out value="${requestScope.adoptDetail.userNickname}"/></b>
		                		<img src="${ pageContext.servletContext.contextPath }/resources/images/message icon.png" onclick="location.href='#directMessage'" alt="" style="height: 50px; width: 50px; margin-top: 0px; margin-bottom: 0px; margin-left: 0px; cursor:pointer;"/>
		                		<img onclick="location.href='#reportPost'" src="${ pageContext.servletContext.contextPath }/resources/images/report.jpg" style="height: 50px; width: 50px; margin-top: 0px; margin-bottom: 0px; margin-left: 0px; cursor:pointer;">
		                		</li>
		                	</ul>
		                </div>
                <div align="center" style="height: 150px;">
                	<h1 id="h1_itm" style="font-weight: bold;"><c:out value="${requestScope.adoptDetail.adoptBreed}"/>/
	                	<c:if test="${requestScope.adoptDetail.adoptGender eq 'M'}">
	                	남아
	                	</c:if>
	                	<c:if test="${requestScope.adoptDetail.adoptGender eq 'F'}">
	                	여아
	                	</c:if>
                		<br> 
                	<c:out value="${requestScope.adoptDetail.adoptAge}"/>살 / 
                	<c:out value="${requestScope.adoptDetail.adoptWeight}"/>KG / <c:out value="${requestScope.adoptDetail.adoptColor}"/></h1>
                </div>
                <div align="center">
                <pre style="width: 900px; white-space: pre-wrap; background-color: white; border: 0px; overflow-x: hidden; font-size: 20px;">
<c:out value="${requestScope.adoptDetail.adoptIntroduce}"/>
                </pre>
                </div>
                <div align="center" style="margin-bottom: 70px;">
                
                <!-- 현재 로그인 되어 있는 사용자에 따라서 다르다. c:if처리 -->
                <!-- 작성자가 입양완료 버튼을 눌렀다면 상태값이 변하고 상태값에 따라 버튼이 보이기도 하고, 보이지 않기도 한다. -->
                	<c:if test="${requestScope.adoptDetail.stateCode eq '1'}">
	                	<button onclick="location.href='#agreeAction'"
			                style="background-color: #45B99C; border: 0px; border-radius:10px; width:250px; margin-left:10px;">
			                	<h3 style="color: white; padding-top: 10px; font-weight: bold;">입양하기</h3>
	                	</button>
                	
			             <div align="center" style="margin-top: 20px;">
			            	<a href="${ pageContext.servletContext.contextPath }/resources/files/dog.docx" download><h3><b>강아지 입양 신청서 다운로드</b></h3></a>
			            	<br>
			            	<a href="${ pageContext.servletContext.contextPath }/resources/files/cat.docx" download><h3><b>고양이 입양 신청서 다운로드</b></h3></a>
			            </div>
                	</c:if>
                	<c:if test="${requestScope.adoptDetail.stateCode eq '2'}">
	                	<button  
			                style="background-color: #FF6230; border: 0px; border-radius:10px; width:250px; margin-left:10px;">
			                	<h3 style="color: white; padding-top: 10px; font-weight: bold;">입양완료</h3>
	                	</button>
                	</c:if>
                </div>
                        </div>
                    </div>
                </div>
            </div>
            </section>

            <section id="boradtable" class="boradtable">
            	<div class="carousel-inner" role="listbox">
                	<div class="item active">
                    	<div class="container">
                        	<div class="row">
                            	<table class="table" style="margin-bottom: 50px;">
				                    <tbody id="tbody">
				                    	
				                    </tbody>
				                </table>
				               
				                <script>
				                $j3(document).ready(function(){
								     		console.log("adoptPage select script");
								     		
								     		var code = '<c:out value="${requestScope.adoptDetail.boardCode}"/>';
								     	
								     			$j3.ajax({
								     			url:"select/reply/"+code,
								     			type:"GET",
								     			success:function(data,status,xhr){
								     				const replyList = JSON.parse(data.replyList);
								     				/* debugger; */
								     				console.table(replyList);
								     				console.log(replyList.length);
								     				output='';
								     				if(replyList.length == 0){
							     						output += '<tr>';
								     					output += '<td style="text-align: center; border:none;">'+' '+'</td>';
							     						output += '<td style="border:none;">'+'</td>';
							     						output += '<td style="text-align: center; border:none; font-weight:bold;">'+'작성된 댓글이 없습니다. 처음으로 댓글을 작성해 보세요~ ^^ '+'</td>';
								     					output += '<td style="border:none;">'+'</td>';
								     					output += '</tr>';
							     					}
								     				
								     				$j3.each(replyList,function(i, item){
								     					
								     					var deleteYN = this.replyDeleteYN;
								     					var reportYN = this.reportYN;
								     					var length = $j3(this).length;
								     					console.log(length);
								     					
								     					
								     					if(deleteYN == 'N'){
								     						if(reportYN == 'N'){
								     						output += '<tr id="tr'+i+'">';
									     					output += '<td class="col-md-3" style="text-align: center;">'+this.userNickname+'</td>';
								     						output += '<td>'+this.replyContent+'</td>';
								     						output += '<td style="text-align: center;">'+this.replyDate+'</td>';
									     					output += '<td><img onclick="test1(this)" class="'+ this.replyCode +'" title="'+this.replyUserCode +'" src="${ pageContext.servletContext.contextPath }/resources/images/report.jpg" style="width: 25px; height: 25px; margin-bottom: 0px; cursor:pointer;">'+'</td>';
									     					output += '</tr>';
								     						}else if(reportYN =='Y'){
									     						output += '<tr id="tr'+i+'">';
										     					output += '<td style="text-align: center;">'+' '+'</td>';
									     						output += '<td><del>'+'신고에 의해 삭제 된 댓글입니다.'+'</del></td>';
									     						output += '<td style="text-align: center;">'+' '+'</td>';
										     					output += '<td>'+'</td>';
										     					output += '</tr>';
									     					}
								     					}
								     					if(deleteYN == 'Y'){
								     						output += '<tr id="tr'+i+'">';
									     					output += '<td style="text-align: center;">'+' '+'</td>';
								     						output += '<td><del>'+'삭제 된 댓글입니다.'+'</del></td>';
								     						output += '<td style="text-align: center;">'+' '+'</td>';
									     					output += '<td>'+'</td>';
									     					output += '</tr>';
								     					}
								     					
								                             
								     				});
								     				
								     				$('#tbody').append(output);
								                
								     				
								     			},error:function(xhr,status,error){
								     				alert("에러 발생~삐뽀~");
								     				console.log(error);
								     			}
								     		});
				               		});
				                
				                    	</script>
                            </div>
                        </div>
                    </div>
                </div>
                
		             <section id="sendmessage" class="sendmessage">
                	<c:if test="${ !empty sessionScope.loginUser}">
		             	<p style="margin-left: 14%;font-weight: bold;font-size: 20px;float: left;margin-right: -35px;margin-top: 10px;">
		             	${sessionScope.loginUser.nikname }
		             	</p>
		            </c:if>
                	<c:if test="${ empty sessionScope.loginUser}">
		             	<p style="margin-left: 14%;font-weight: bold;font-size: 20px;float: left;margin-right: -35px;margin-top: 10px;">
		             	비회원
		             	</p>
		            </c:if>
		                <input type="text" id="messagecontent" placeholder="  댓글로 임시보호자님을 응원해주세요!" style="width: 850px; float: left;" >
		                <button class="sendmessagecontent" id="replySubmit" style="float:left;">댓글 작성</button>
		            </section>
		            
		            <script>
		            
			            $j3("#replySubmit").click(function(){
				     		var code = ${requestScope.adoptDetail.boardCode};
			     			var content = $j3('#messagecontent').val();

			     			if(${ !empty sessionScope.loginUser}){
					     		if(content.trim()==''){
					     			alert('댓글을 입력하신 후 다시 눌러주시기 바랍니다.');
					     			return;
					     		}
			     			}else{
			     				alert('로그인 후 댓글을 추가할 수 있습니다!');
			     				return
			     			}
				     		
				     	
				     		$j3.ajax({
			     			url:"insert/reply",
			     			type:"POST",
		    				data:{"replyContent": content,
		    					"boardCode": code},
		    				success: function(data,status,xhr){
		    					if(data.message=="success"){
		    					alert("댓글등록 완료! ");
		    					location.reload();
		    						
		    					}
		    					if(data.message=="fail"){
		    						alert("댓글등록 실패! ");
		    						
		    					}
		    				},error:function(xhr,status,error){
			     				console.log(error);
			     			}
			     		});
           		});
		            </script>
                
         </section>
            <!-- 게시글 신고 팝업창 -->
             <form action="${ pageContext.servletContext.contextPath }/user/adopt/insert/report" method="POST">
	            <div id="reportPost" class="overlay">
	                <div class="popup">
	                    <a href="" class="close">&times;</a>
	                    <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 10px;">게시글 신고</p>
	                    <div class="findpwd-content" id="contStep02" style="display: block;">
	                        <div class="cont-step_preface">
	                            <hr style="border:0.5px solid #A8A8A8;">
	                        </div>
	                        <!-- 신고 내용 입력 -->
	                        <div style="text-align: center; margin-top: 30px; width: 80%;"><input type="text" id="reportContent_board" placeholder="신고내용을 입력하세요" style="height: 200px; width: 100%; border-radius: 10px; border: 1px solid;"></div>
	                        <c:if test="${!empty sessionScope.loginUser }"> 
	                        	<div style="text-align: center; margin-top: 30px;"><button type="button" class="btn_submit" onclick="location.href='#completeReport'">신고하기</button></div>
	                   		</c:if>
	                   		 <c:if test="${empty sessionScope.loginUser }">
	                        	<div style="text-align: center; margin-top: 30px;"><button class="btn_submit" disabled>로그인 후 신고가능합니다.</button></div>
	                   		</c:if>
	                    </div>
	                </div>
	            </div> 
            
            <!-- 댓글 신고 팝업창 -->
	            <div id="reportComment" class="overlay">
	                <div class="popup">
	                    <a href="" class="close">&times;</a>
	                    <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 10px;">댓글 신고</p>
	                    <div class="findpwd-content" id="contStep02" style="display: block;">
	                        <div class="cont-step_preface">
	                            <hr style="border:0.5px solid #A8A8A8;">
	                        </div>
	                        <!-- 신고 내용 입력 -->
	                        <div style="text-align: center; margin-top: 30px; width: 80%;"><input id="reportContent_reply" type="text" placeholder="신고내용을 입력하세요" style="height: 200px; width: 100%; border-radius: 10px; border: 1px solid;"></div>
	                        <c:if test="${!empty sessionScope.loginUser }"> 
	                        	<div style="text-align: center; margin-top: 30px;"><button type="button" class="btn_submit" onclick="location.href='#completeReport'">신고하기</button></div>
	                   		</c:if>
	                   		 <c:if test="${empty sessionScope.loginUser }">
	                        	<div style="text-align: center; margin-top: 30px;"><button class="btn_submit" disabled>로그인 후 신고가능합니다.</button></div>
	                   		</c:if>
	                    </div>
	                </div>
	            </div> 
            
             <!-- 신고 완료 팝업창 -->
	            <div id="completeReport" class="overlay">
	                <div class="popup">
	                    <p style="font-size: 30px; text-align: center; font-weight:bold; margin-top: 50px;">
	                     	신고가 정상적으로 접수되었습니다.<br>
	                    </p>
	                    <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 20px;">
	                     	신고에 대한 처리는 1~2일 소요될 수 있으며<br>
	                     	신고 내역에서 확인 가능합니다.
	                    </p>
	                    <input type="hidden" name="reportContent" id="reportContent">
	                    <input type="hidden" name="reportReply" id="reportReply">
	                    <input type="hidden" name="contentCode" id="contentCode">
	                    <input type="hidden" name="replycode" id="replycode">
	                    <input type="hidden" name="replyUsercode" id="replyUsercode">
	                    <input type="hidden" name="boardTitle" id="boardTitle">
	                    <input type="hidden" name="category" id="category">
	                    <div style="text-align: center; margin-top: 30px;"><button type = "submit" id = "btn_report_submit" class="btn_submit" onclick="location.href='#none'">확인</button></div>
                   		<script>
                   		
                   		function test1 (test) {
							
							let replyCode = test.className;
							let userCode1 = test.title;
							console.log(replyCode);
							console.log(userCode1);
							
							
							$j3("#replycode").val(replyCode);
							$j3("#replyUsercode").val(userCode1);
							location.href = '#reportComment';
                   		}
                   		 $j3("#btn_report_submit").click(function(){
	                   			console.log("여기오나?");
	                   			var content = $j3("#reportContent_board").val(); 
	                   			var reply = $j3("#reportContent_reply").val();
	                   			var Bcode = ${requestScope.adoptDetail.boardCode};
	                   			var Btitle = $('#h1_itm')[0].innerText;
	                   			
	                   			if($j3("#reportContent").val(content) != ''){
	                   				$j3("#category").val('content');
	                   			}
	                   			if($j3("#reportReply").val(reply) != ''){
	                   				$j3("#category").val('reply');
	                   				
	                   			}
	                   			$j3("#reportContent").val(content);
                   				$j3("#reportReply").val(reply);
                   				$j3("#contentCode").val(Bcode);
                   				$j3("#boardTitle").val(Btitle);
                   				
                   			});
                   		</script>
                    </div>
                </div>
            </form>
	      </div> 
            
            <!-- 입양약관 팝업창 -->
            <div id="agreeAction" class="overlay">
                <div class="popup">
                    <a href="" class="close">&times;</a>
                    <h3 style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 10px; color: #19A985; font-weight: bold;">입양하기로 결정하셨나요?</h3>
                    <h3 style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 10px; color: #19A985; font-weight: bold;">아래의 약관 동의를 <b style="color: red;">반드시 읽어주세요!</b></h3>
                    <h3 style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 10px; color: #19A985; font-weight: bold;">읽지 않은 불이익은 책임지지 않습니다.</h3>
                    <div class="findpwd-content" id="contStep02" style="display: block;">
                        <div class="cont-step_preface">
                            <hr style="border:0.5px solid #A8A8A8;">
                        </div>
                        <!-- 약관 내용 -->
                        <div>
                        	<pre style="height: 300px; background-color: white; white-space: pre-wrap;">
목적
입양의 목표는 임시 보호중인 동물들에게 평생 함께 할 수 있는 가정을 찾아주는 것입니다.

반드시 숙지해야 할 상황
입양할 동물들의 건강과 특성과 행동은 환경과 상황에 따라 달라집니다. 따라서 입양은 주의 사항들을 동반합니다. 부디 아래에 적힌 주의사항들을 고려하시기 바랍니다. 펫팔은 임시보호자와 입양신청자가 만날 수 있는 공간을 제공하는 곳입니다. 개인정보 악용으로 인한 책임은 지지 않습니다. 

입양된 반려동물이 입양자의 소유물을 망가뜨릴 수도 있습니다. 
입양된 반려동물로부터 사람들이나 다른 반려동물이 질병이 노출 될 수도 있습니다. 
입양된 반려동물로부터 사람들이나 다른 반려동물이 상해를 입을 수 있습니다.
입양한 동물이 너무 일찍 죽을 수도 있습니다. 

입양 과정
1. 입양신청자는 성인이어야 하며 모든 가족구성원들이 입양에 찬성, 동의를 해야합니다. 또한 자가 주택이 아닌 경우 집주인의 동의 또한 얻어야 합니다. 임시보호자가 이러한 동의를 서명한 계약서를 요청 할 수도 있습니다.  또한 임시보호자는 동물을 입양하는데 적합하지 않다고 판단되는 신청자들을 거절할 권리가 있습니다. 
 
2. 입양신청자는 신청서를 잘 작성하신 후에 임시보호자가 입양홍보글에 제공한 정보를 통해 직접 연락을 합니다. 이후 입양보호자의 판단에 의해 입양 여부가 결정됩니다. 입양 전 테스트기간동안에 반려동물은 임시보호자의 소속입니다. 

3. 임시보호자의 판단 기간이 끝난 후에 그 동물을 입양하기를 원하시면 계약서에 서명하시고 임시보호자가 입양 비용 조건을 걸었다면 입양 비용을 지불해야 합니다. (단, 임시보호자는 일정 기간 이후 입양자가 다시 반려동물을 파양하지 않았다면 환불해줘야 합니다. 이는 개인과 개인의 거래이므로 펫팔은 책임지지 않습니다.) 모든 단계가 완료되면 반려동물의 소속이 입양자에게로 이전됩니다.

4. 입양 후일 안에 동물병원에 입양한 동물을 데려가셔서 검사 받으시길 권합니다.

5. 펫팔의 입양 방침 동의서 외에 임시보호자가 다른 서류를 요구할 수 있습니다. 입양신청자는 이에 서류를 따른 작성해야 합니다.

입양 후
1. 임시보호자들이 입양자에게 가끔 연락하여 입양된 반려동물이 어떻게 지내고 있는지 소식을 요청할 수 있습니다. 입양된 동물이 새로운 가정에서 잘 적응하고 지내기를 바랍니다. 

2. 입양신청서에 명시되어 있듯이 고양이나 개에게 미용을 목적으로 하는 발톱 제거 수술, 꼬리 절제 수술, 귀의 일부를 잘라내는 수술, 성대 제거 수술, 힘줄 절제술 등을 불필요한 수술을 해서는 안 됩니다.

3. 만약 입양자가 입양한 동물을 파양 하기 바란다면 전 임시보호자의 동의 없이 다른 사람에게 입양 보내시는 안 됩니다. 파양 하는 동물은 다시 전 임시보호자에게 돌아가야 합니다. 또한 그 과정에서 발생한 비용은 모두 본인이 부담해야 합니다. 

5. 파양시 입양비 환불은 불가합니다.
                        	</pre>
                        </div>
                        <!-- 동의 버튼 -->
                        <div align="center">
                        <input type="checkbox" name="pointCheck"><b style="margin-left: 10px;">위의 약관사항을 모두 읽었으며, 이에 따른 방침에 모두 동의합니다.</b>
                        <br><br>
                        <button style="background-color: #19A985; border: 0px; width: 300px; border-radius: 7px;" onclick="checkbox_Check();">
                       		<h3 style="color: white; font-weight: bold; margin-top: 10px;">가족 만나러 가기</h3>
                        </button>
                        </div>
                    </div>
                </div>
            </div> 
            <script>
			    function checkbox_Check(){
			        if ($("input:checkbox[name=pointCheck]").is(":checked") == true) {
			        	location.href='#agreeAfter';
			        } else {
			        	alert("약관에 동의해주셔야합니다.");
			                
			        }
			    }
			</script>
            
            <!-- 동의완료 팝업창 -->
            <div id="agreeAfter" class="overlay">
                <div class="popup">
                    <p style="font-size: 25px; text-align: center; font-weight:bold; margin-top: 50px;">
                     	임시보호자분이 남기신 연락처입니다.<br>
                    </p>
                    
                    <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 20px;">
                     	연락처 : <c:out value="${requestScope.adoptDetail.adoptPhone}"/><br><br>
                     	연릭시 주의사항 : <c:out value="${requestScope.adoptDetail.adoptCaution}"/>
                    </p>
                    <div style="text-align: center; margin-top: 30px;"><button class="btn_submit" onclick="location.href='#none'">확인</button></div>
                    </div>
                </div>
            
                 <!-- 쪽지 팝업창 -->
          <form action="${pageContext.servletContext.contextPath }/user/insert/adopt/message" method="post">
            <div id="directMessage" class="overlay">
                <div class="popup">
                    <a href="" class="close">&times;</a>
                    <p style="font-size: 20px; text-align: left; padding-bottom: 10px; margin-top: 10px;">받는이 : <c:out value="${ requestScope.adoptDetail.userNickname }"/></p>
                    <div class="findpwd-content" id="contStep02" style="display: block;">
                        <!-- 쪽지 내용 입력 -->
                       	<div style="text-align: center; margin-top: 30px; width: 100%;"><input type="text" name="messageContent" placeholder="내용을 적어주세요" style="height: 200px; width: 100%; border-radius: 10px; border: 1px solid;"></div>
                       	 <c:if test="${!empty sessionScope.loginUser }"> 
                   			<div style="text-align: center; margin-top: 30px;"><button type="button" class="btn_submit" onclick="location.href='#completeMessage'">보내기</button></div>
                   		</c:if>
                   		 <c:if test="${empty sessionScope.loginUser }">
                        	<div style="text-align: center; margin-top: 30px;"><button type="button" class="btn_submit" disabled>로그인 후 이용가능합니다.</button></div>
                   		</c:if>
                    </div>
                </div>
            </div>
            
            <!-- 전송 완료 팝업창 -->
            <div id="completeMessage" class="overlay">
                <div class="popup">
                    <p style="font-size: 30px; text-align: center; font-weight:bold; margin-top: 50px;">
                     	쪽지 전송에 성공하였습니다.<br>
                    </p>
                    <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 20px;">
                     	보낸 쪽지는 마이페이지에서 확인 가능합니다.
                    </p>
                    <input type="hidden" value="${ requestScope.adoptDetail.userCode }" name="receivecode">
                    <input type="hidden" value="${ requestScope.adoptDetail.boardCode }" name="boardcode">
                    <input type="hidden" value="${ requestScope.adoptDetail.userNickname }" name="receiveUserNick">
                    <div style="text-align: center; margin-top: 30px;"><button type="submit" class="btn_submit">확인</button></div>
                  </div>
              </div>
         </form>
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>
            
            <jsp:include page="../common/footer.jsp"/>
            
	</body>
</html>