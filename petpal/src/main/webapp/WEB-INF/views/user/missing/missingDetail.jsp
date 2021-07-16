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
                margin-left: 300px;
                margin-right: 30px;
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
            
             /* The Modal (background) */
              .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            overflow-y: scroll;
           }
    
           /* Modal Content/Box */
           .modal-content {
               background-color: #fefefe;
               margin: 15% auto; /* 15% from the top and centered */
               padding: 20px;
               border: 1px solid #888;
               width: 900px; /* Could be more or less, depending on screen size */      
           }
           /* Modal Content/Box */
           .modal-content {
               background-color: #fefefe;
               margin: 15% auto; /* 15% from the top and centered */
               padding: 20px;
               margin-top: 10px;
               border: 1px solid #888;
               width: 700px;
               height:1000px;
               overflow-y: auto;                         
           }
           .modal-body{
            height: 250px;
            overflow-y: scroll;
         }
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
            @media print{
            .screen{
            display:none !important;
            
            }
            @page{maring:0;}
            }
        </style>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        <script src="https://kit.fontawesome.com/4978ce16d0.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jspdf.min.js" rel="stylesheet"></script>
		<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/html2canvas.js" rel="stylesheet"></script>
         <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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


        <div class="culmn">
            <!--Home page style-->
            <!--Home Sections-->
         <section>
       <!--      <div class="port_img" style="float: left; width: 600px;"> -->
                   <%-- <img src="${ pageContext.servletContext.contextPath }/resources/images/work-img1.jpg" style="float: left; margin-left: 50px;"alt="" /> --%>
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="float: left;margin-left: 180px;">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                            <c:forEach var="image" varStatus="status" items="${pictureMissingList}">
	                            	<c:if test="${status.index == '0' }" >
		                                <div class="item active">
			                                   <div class="port_img">
			                                       <img src="${ pageContext.servletContext.contextPath }/${ image.pictureUtilPath}" style="float: left; margin-left: 50px;"alt="" />
			                                   </div>
		                                </div>
	                                </c:if>
	                                <c:if test="${status.index != '0' }" >
		                                <div class="item">
		                                         <div class="port_img">
		                                             <img src="${ pageContext.servletContext.contextPath }/${ image.pictureUtilPath}" style="float: left; margin-left: 50px;"alt="" />
		                                         </div>
		                                </div>
	                                </c:if>
                                </c:forEach>
                              </div> 
                            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev" style="background-image:none !important;">
                                <i class="fas fa-arrow-circle-left fa-3x" style="margin-top: 250px;"></i>
                                <span class="sr-only">Previous</span>
                            </a>

                            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next" style="background-image:none !important;">
                           		<i class="fas fa-arrow-circle-right fa-3x" style="margin-top: 250px;"></i>
                                <span class="sr-only">Next</span>
                            </a>
                     </div>

	                <div style="float: left;width: 400px;margin-left:25px; display: flex;flex-direction: row;">
						<c:if test="${requestScope.missingDetail.stateCode eq '1'}">
		                   <h2 style="background-color: orange; width: 100px; border-radius: 8px; height: 60px; color: white; font-weight: bold; padding-top: 10px;" align="center">
		                   실종 
		                   </h2>
			            </c:if>
	                   <!-- 상태 값에 따른 c:if 처리 -->
	                   <c:if test="${requestScope.missingDetail.stateCode eq '2'}">
		                   <h2 style="background-color: #44B99C; width: 130px; border-radius: 8px; height: 60px; color: white; font-weight: bold; padding-top: 10px;" align="center">
		                   집 도착
		                   </h2> 
		                </c:if>
	                   <img onclick="location.href='#reportPost'" src="${ pageContext.servletContext.contextPath }/resources/images/report.jpg" style="height: 50px; width: 50px; margin-top: 0px; margin-bottom: 0px; margin-left: 20px; cursor:pointer;">
	                </div>
                <div>
                   <ul style="font-size: large;">
                      <li>&nbsp&nbsp&nbsp작성자 : 
                      <b><c:out value="${requestScope.missingDetail.userNickname}"/></b>
                      <img src="${ pageContext.servletContext.contextPath }/resources/images/message icon.png" onclick="location.href='#directMessage'" alt="" style="height: 50px; width: 50px; margin-top: 0px; margin-bottom: 0px; margin-left: 0px; cursor:pointer;"/>
                      </li>
                   </ul>
                </div>
                <div style="float: left;margin-left:-22%; margin-top: 15px;">
                   <h1 id="h1_itm" style="font-weight: bold;"><c:out value="${requestScope.missingDetail.breed}"/>/ 
                   <c:if test="${requestScope.missingDetail.gender eq 'M'}">
                   	남아  <br> 
                   </c:if>
                   <c:if test="${requestScope.missingDetail.gender eq 'F'}">
                   	여아  <br> 
                   </c:if>
                   
                   <c:out value="${requestScope.missingDetail.age}"/>살 / 
                   <c:out value="${requestScope.missingDetail.weigth}"/>KG / 
                   <c:out value="${requestScope.missingDetail.color}"/></h1>
                   <table style="margin-bottom: 50px;width: 600px;">
                    <tbody>
                        <tr>
                            <td style="text-align: center; font-size: 20px; font-weight: bold; width: 40px; height: 50px;">
                               날 짜 
                            </td>
                            <td style="font-size: 20px; padding-left: 30px;">
                            <c:out value="${requestScope.missingDetail.missingDate}"/>
                            </td>
                        </tr>
                        <tr>
                           <td style="text-align: center; font-size: 20px; font-weight: bold; width: 40px; height: 50px;">
                               장 소 
                           </td>
                           <td style="font-size: 20px; padding-left: 30px; ">
                                 <c:out value="${requestScope.missingDetail.area}"/>&nbsp<c:out value="${requestScope.missingDetail.place}"/>
                           </td>
                         </tr>
                         <tr>
                           <td style="text-align: center; font-size: 20px; font-weight: bold; width: 40px; height: 50px;">
                               특 징
                           </td>
                           <td style="font-size: 20px; padding-left: 30px; width: 300px;">
                                 <c:out value="${requestScope.missingDetail.character}"/>
                           </td>
                         </tr>
                         <tr>
                           <td style="text-align: center; font-size: 20px; font-weight: bold; width: 40px; height: 50px;">
                               기 타
                           </td>
                           <td style="font-size: 20px; padding-left: 30px; width: 300px;">
                                <c:out value="${requestScope.missingDetail.request}"/>
                           </td>
                         </tr>
                         <tr>
                           <td style="text-align: center; font-size: 20px; font-weight: bold; width: 40px; height: 50px;">
                               연 락 처
                           </td>
                           <td style="font-size: 20px; padding-left: 30px; width: 300px;">
                                 <c:out value="${requestScope.missingDetail.phone}"/>
                           </td>
                         </tr>
                    </tbody>
                </table>
                </div>
                <div style="float: left; width: 600px; margin-left: 30px;" align="center">
                <c:if test="${requestScope.missingDetail.stateCode == 1}">
                   <button onclick="show();" style="background-color: red; border: 0px; border-radius:10px; width: 250px; margin-left:10px;">
                         <h3 style="color: white; padding-top: 10px; font-weight: bold;">전단지 생성하기</h3>
                   </button>
                   	<c:if test="${sessionScope.loginUser.code eq requestScope.missingDetail.userCode}">
                		<input type="button" class="btn btn-light"style= "background-color: #45B99C;border: 0px;border-radius: 10px; width: 250px; margin-left: 60px; color: white; font-size: 22px; height: 50px; padding-top: 10px; margin-bottom: 7px" onclick="location.href='${ pageContext.servletContext.contextPath }/user/missing/update/status?board=${requestScope.missingDetail.boardCode}'" value ="찾았습니다!"/>
	                   <br>
	                   <div style="float:right;margin-top: 10px;">
					       <button class="btn btn-light" id="revised_btn" style="width:100px; color: orange;border:none; background-color:white; type="button" onclick="revisedfn();" >수정하기</button>
				       </div>
                    </c:if>
                    </c:if>
                   <!-- 찾았습니다 버튼이 눌릴시 아래의 h3이 나오면 된다. -> 상태에 따른 c:if처리 -->
                   <c:if test="${requestScope.missingDetail.stateCode == 2}">
	                   <h3 style="background-color: #45B99C; width: 600px; border-radius: 8px; height: 50px; color: white; font-weight: bold; padding-top: 10px;">
	                   찾았습니다! 많은 관심과 제보 감사합니다!
	                   </h3>
                   </c:if>
                </div>
         </section>
         
         <script type="text/javascript">
         
         function revisedfn(){
        	 
         		if(confirm("게시글 수정시 사진을 필수로 재업로드 해주셔야합니다. 계속 진행하시겠습니까?")){
         			location.href='${ pageContext.servletContext.contextPath }/user/missing/update/${requestScope.missingDetail.boardCode}';
         		}
         }
         </script>
            <section id="boradtable" class="boradtable">
               <div class="carousel-inner" role="listbox">
                   <div class="item active">
                       <div class="container">
                           <div class="row">
                               <table class="table" style="margin-bottom: 50px; width: 95%;">
                                <tbody id="tbody">
                                   
                                </tbody>
                            </table>
                            
                            <script>
				                $j3(document).ready(function(){
								     		console.log("MissingPage reply select script");
								     		
								     		var code = "${requestScope.missingDetail.boardCode}";
								     	
								     			$j3.ajax({
								     			url:"select/missingReply/"+code,
								     			type:"GET",
								     			success:function(data,status,xhr){
								     				const replyMList = JSON.parse(data.missingReplyList);
								     				/* debugger; */
								     				console.table(replyMList);
								     				console.log(replyMList.length);
								     				output='';
								     				if(replyMList.length == 0){
							     						output += '<tr>';
								     					output += '<td style="text-align: center; border:none;">'+' '+'</td>';
							     						output += '<td style="border:none;">'+'</td>';
							     						output += '<td style="text-align: center; border:none; font-weight:bold;">'+'작성된 댓글이 없습니다. 처음으로 댓글을 작성해 보세요~ ^^ '+'</td>';
								     					output += '<td style="border:none;">'+'</td>';
								     					output += '</tr>';
							     					}
								     				
								     				$j3.each(replyMList,function(i, item){
								     					
								     					var deleteYN = this.replyDeleteYN;
								     					var reportYN = this.reportYN;
								     					var length = $j3(this).length;
								     					console.log(length);
								     					
								     					
								     					if(deleteYN == 'N'){
								     						output += '<tr id="tr'+i+'">';
									     					output += '<td class="col-md-3" style="text-align: center;">'+this.userNickname+'</td>';
								     						output += '<td class="col-md-6">'+this.replyContent+'</td>';
								     						output += '<td class="col-md-3" style="text-align: center;">'+this.replyDate+'</td>';
									     					output += '<td><img onclick="test1(this)" class="'+ this.replyCode +'" title="'+this.replyUserCode +'" src="${ pageContext.servletContext.contextPath }/resources/images/report.jpg" style="width: 25px;height: 25px;margin-bottom: 0px;cursor:pointer;margin-right: 120px;margin-left: 50px;">'+'</td>';
									     					output += '</tr>';
								     					}
								     					if(deleteYN == 'Y'&& reportYN =='N'){
								     						output += '<tr id="tr'+i+'">';
									     					output += '<td style="text-align: center;">'+' '+'</td>';
								     						output += '<td><del>'+'삭제 된 댓글입니다.'+'</del></td>';
								     						output += '<td style="text-align: center;">'+' '+'</td>';
									     					output += '<td>'+'</td>';
									     					output += '</tr>';
								     					}
								     					if(deleteYN == 'N'&& reportYN =='Y'){
								     						output += '<tr id="tr'+i+'">';
									     					output += '<td style="text-align: center;">'+' '+'</td>';
								     						output += '<td><del>'+'신고에 의해 삭제 된 댓글입니다.'+'</del></td>';
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
                            <div class="text-center">
                        </div>
                            </div>
                        </div>
                    </div>
                </div>
                
               <!-- 댓글 작성 부분 -->
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
	             <section id="sendmessage" class="sendmessage">
               			<input style="width:850px; float:left;" type="text" id="messagecontent" placeholder="  혹시 이 아이를 보셨나요? 댓글로 목격 제보를 남겨보세요." >
		                <button class="sendmessagecontent" id="replySubmit" style="float:left;">댓글 작성</button>
		         </section>
          		<!-- 댓글 작성 부분 끝! -->

            </section>
                   <script>
		            
			            $j3("#replySubmit").click(function(){
				     		var code = ${requestScope.missingDetail.boardCode};
			     			var content = $j3('#messagecontent').val();
			     			
			     			if(${!empty sessionScope.loginUser}){
					     		if(content.trim()==''){
					     			alert('댓글을 입력하신 후 다시 눌러주시기 바랍니다.');

					     			return;
					     		}
			     			}else{
			     				alert('로그인 후 댓글을 추가할 수 있습니다!');
			     				return;
			     			}
				     		
				     		$j3.ajax({
			     			url:"insert/missingReply",
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
		            
            <!-- The Modal -->
               
            <div id="flyerModal" class="modal">
               <!-- Modal content -->
               <div class="modal-content" id="pdfDiv">
	               <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px; width: 30px; float: right; background-color: white;" onClick="close_pop();">
	                   <span class="pop_bt" style="font-size: 13pt; font-weight: bold;" >
	                     X
	                   </span>
	               </div>
                   <div style="width: 600px; background-color: yellow;" align="center">
                      <h2 style="color: red; font-weight: bold; margin-top: 0px;">강아지를 찾습니다</h2>
                   </div>
                   <div style="margin-top: 20px;" align="center">
	                   <c:forEach var="image" varStatus="status" items="${pictureMissingList}">
		                  <c:if test="${status.index == '0' }" >
	                     	 <img style="margin-left: 40px; margin-bottom: 20px; height: 500px; width: 500px;" src="${ pageContext.servletContext.contextPath }/${image.pictureUtilPath}" alt="" />
	                      </c:if>
	                   	</c:forEach>
                   </div>
                   <div style="background-color: red; margin-bottom: 20px;" align="center">
                      <h2 style="color: white; font-weight: bold; font-size: 25px; margin-bottom: 0px;">${requestScope.missingDetail.breed}</h2>
                      <h3 style="color: white; font-weight: bold; font-size: 25px; margin-bottom: 0px;">${requestScope.missingDetail.area} ${requestScope.missingDetail.place}</h3>
                      <h2 style="color: white; font-weight: bold; font-size: 25px; margin-bottom: 0px;">날짜: ${requestScope.missingDetail.missingDate}</h2>
                   </div>
                   <div align="center">
                      <ul style="font-size: 20px;">
                         <li>장소 : 
                         <b><c:out value="${requestScope.missingDetail.area}"/>&nbsp ${requestScope.missingDetail.place}</b>
                         </li>
                         <li>특징 : 
                         <b style="color: red;"><c:out value="${requestScope.missingDetail.character}"/></b>
                         </li>
                      </ul>
                      <br>
                      <h3 style="font-size: 20px;"><c:out value="${requestScope.missingDetail.request}"/></h3>
                      <!-- 아래의 전단지 자진수거는 따로 데이터가 들어오는 것이 아니라 기본적으로 적혀져있는 포멧 -->
                      <h3>※동물을 찾으면 자진수거 하겠습니다. 전단지를 떼지 말아주세요!</h3>
                   </div>
                   <div align="center">
                      <hr style="border: soild 1px; border-color: black;">
                      <div>
                         <h2 style="color: #19A985; font-weight: bold; width: 200px; float: left;">PET-PAL</h2>
                         <h2 style="color: red; font-weight: bold; width: 500px;">TEL) ${requestScope.missingDetail.phone}</h2>
                         <p style="font-size: 15px; width: 500px; padding-left: 35px;">반려동물 입양/실종동물 찾기는 '펫팔'을 검색해보세요!</p>
                      </div>
                      <hr style="border: soild 1px; border-color: black;">
                   </div>
                   	<div align="center" id="screen">
                      <button id="pdf_print" onclick="print();" style="background-color: #19A985; width: 250px; height: 60px; font-size: 20px; color: white;">
                         PDF 생성하기
                      </button> 
                      <!-- 카카오톡 버튼 -->
               		<a id="create-kakao-link-btn" href="javascript:;">
					  <img style = "width:60px;height:60px; margin-left:100px;" src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_small.png"/>
					</a>
					
						<script type="text/javascript">
						  Kakao.init('4ea76873bdaa8b3d5ba67d5d803dcc64'); 
						    	  var code = "${requestScope.missingDetail.boardCode}";
						  Kakao.Link.createDefaultButton({
						    container: '#create-kakao-link-btn',
						    objectType: 'feed',
						    content: {
						      title: '강아지/고양이를 찾아주세요!!',
						      description: '#실종 #강아지 #고양이 #신고 #목격 #찾아주세요!',
						      imageUrl:
						    	 'https://flexible.img.hani.co.kr/flexible/normal/970/739/imgdb/original/2020/0507/20200507502335.jpg'
						    ,
						      link: {
						        mobileWebUrl: 'http://localhost:8888/petpal/user/missing/detail/'+code,
						        webUrl: 'http://localhost:8888/petpal/user/missing/detail/'+code,
						      },
						    },
						  
						    buttons: [
						      {
						        title: '웹으로 보기',
						        link: {
						          mobileWebUrl: 'http://localhost:8888/petpal/user/missing/detail/'+code,
						          webUrl: 'http://localhost:8888/petpal/user/missing/detail/'+code,
						        },
						      },
						    ],
						  })
						  
						</script>
           			</div>
           		 </div>
           	</div>
</div>
             <!-- 게시글 신고 팝업창 -->
              <form action="${ pageContext.servletContext.contextPath }/user/missing/insert/report" method="POST">
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
	                   			var Bcode = ${requestScope.missingDetail.boardCode};
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
         
                  <!-- 쪽지 팝업창 -->
           <form action="${pageContext.servletContext.contextPath }/user/missing/insert/message" method="post">
            <div id="directMessage" class="overlay">
                <div class="popup">
                    <a class="close">&times;</a>
                    <p style="font-size: 20px; text-align: left; padding-bottom: 10px; margin-top: 10px;">받는이 : <c:out value="${ requestScope.missingDetail.userNickname }"/></p>
                    <div class="findpwd-content" id="contStep02" style="display: block;">
                        <!-- 쪽지 내용 입력 -->
                        	<div style="text-align: center; margin-top: 30px; width: 100%;"><input type="text" name="messageContent" placeholder="   내용을 적어주세요" style="height: 200px; width: 100%; border-radius: 10px; border: 1px solid;"></div>
                        	
                        	
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
                    		<input type="hidden" value="${ requestScope.missingDetail.userCode }" name="receivecode">
                        	<input type="hidden" value="${ requestScope.missingDetail.boardCode }" name="boardcode">
                        	<input type="hidden" value="${ requestScope.missingDetail.userNickname }" name="receiveUserNick">
                        <div style="text-align: center; margin-top: 30px;"><button type="submit" class="btn_submit" >확인</button></div>
                    </div>
                </div>
              </form>
            
           <script>
              function show(){
            	  $j3('#flyerModal').show();
              };
              //팝업 Close 기능
              function close_pop(flag) {
            	  $j3('#flyerModal').hide();
              };
              
              function print(){
            	  let printModal = $j3('#pdfDiv').html();
            	  let win = window.open('','_blank','fullscreen');
            	  win.document.write(printModal);
            	  win.focus();
            	  win.print();
              };
              
           </script>

            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>
             <jsp:include page="../common/footer.jsp"/>
            
	</body>
</html>