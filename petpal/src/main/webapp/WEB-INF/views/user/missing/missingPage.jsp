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
        </style>

        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
       	<script src='https://cdn.jsdelivr.net/npm/underscore@1.12.0/underscore-min.js'></script>
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
            <section id="borad" class="borad" style="width: 80%; margin: 0px auto;">
                <div style="color: #45B99C; font-size: 25px; font-weight: 600; margin-left: 7%;">
                <a style="color: #45B99C;" onclick="location.href='${ pageContext.servletContext.contextPath }/user/missing'">실종신고</a>
                <button id="miss_wait_btn"
                style="color: white; background-color: #FFA800; border-color: white; border: 1px solid; 
                border-radius:10px; width:180px; margin-left:30px;">
                	실종
                </button>
                <button id="come_btn"
                style="color: white; background-color: #45B99C; border-color: white; border: 1px solid; 
                border-radius:10px; width:180px; margin-left:30px; position: relative; bottom: 10%;">
                	집에 왔어요!
                </button>
                </div>
                <hr style="border-color: rgb(175, 175, 175); width: 90%;">
            </section> <!--End off Home Sections-->
            <div style="width: 370px; position: relative; left: 60%; margin-bottom:15px;">
				<input type="search" id="search1" placeholder="지역 키워드를 입력해주세요" aria-label="Search"
				style="width: 300px; border-radius: 5px; background-color: #F1FAF8; height:40px; border: solid 1px; border-color: black;" required>
				<span>
					<button id="search_btn1" type="submit" style="background-color: white; height: 40px; width: 50px; float: right; border: solid 1px; border-color: black; border-radius: 5px;">
						검색
					</button>
				</span>
			</div>
			<script>
			var missingSearchList;
			var outputPage4;
			$j3('#search_btn1').click(function(){
					
					console.log("search Missing ajax");
					var rsearch = $j3('#search1').val();
					if(!rsearch){
						alert("검색어 입력해주세요");
						return false;
					};
					console.log(rsearch);
					
					$j3("#missingTotalList").empty();
					$j3("#pagination").empty();
					
					$j3.ajax({
						url:"missing/search/"+decodeURIComponent(rsearch,"UTF-8"),
						type:"GET",
						success: function(data,status,xhr){
							const missingSearchList1 = JSON.parse(data.missingSearchList);
		     				missingSearchList = _.uniq(missingSearchList1, 'boardCode');
							
		     				console.table(missingSearchList);
		     				
		     				output1='';
		     				
		     				var i;
		     				
		     				if(missingSearchList.length == 0){
		     					output1 +='<h1></h1>';
		     					output1 += '<h1 style="text-align:center;">검색 결과가 없습니다</h1>';
		     				}
		     				
		     				for(i=0; i< missingSearchList.length; i++){
		     					if(missingSearchList.length <1){
		     						output1 +='<h3> 검색 결과가 없습니다. </h3>';
		     					}
		     					if( i < 12){
			     				
			     					output1 += '<div class="col-sm-3">';
			     					output1 += '<div class="port_item xs-m-top-30" style="cursor:pointer;">';
			     					output1 += '<div class="port_img" style="position: relative;" onclick="location.href='+'\'' + '${ pageContext.servletContext.contextPath }/user/missing/detail/' + missingSearchList[i].boardCode +'\''+'">';
			     					output1 += '<input type="hidden" id="boardCode" value='+missingSearchList[i].boardCode+'/>';
			     					if(missingSearchList[i].stateName == '대기'){
			     						output1 += '<p style="position: absolute; font-size: 20px; background-color: orange; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">실종</p>';
			     					}
			     					if(missingSearchList[i].stateName == '승인'){
			     						output1 +='<p style="position: absolute; font-size: 20px; background-color: #45B99C; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">집 도착</p>'
			     					}
			     					output1 += '<img style="width:290px; height:250px;" src="${ pageContext.servletContext.contextPath }/'+missingSearchList[i].pictureUtilPath+'" alt="" />';
			     					output1 += '</div>';
			     					output1 += '<div class="port_caption m-top-20" align="center" style="margin-bottom: 30px;">';
			     					if(missingSearchList[i].missingGender == 'M'){
			     						output1 += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+missingSearchList[i].missingBreed+'/남아/'+missingSearchList[i].missingColor+'</p>';
			     					}
			     					if(missingSearchList[i].missingGender == 'F'){
			     						output1 += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+missingSearchList[i].missingBreed+'/여아/'+missingSearchList[i].missingColor+'</p>';
			     					}
			     					output1 += '<h6>'+missingSearchList[i].missingArea+'</h6>';
			     					output1 += '</div>';
			     					output1 += '</div>';
			     					output1 += '</div>';
                                    
		     					}
		     				}
		     				
		     				$j3('#missingTotalList').append(output1);
		     				
		     				for(j=0; j< missingSearchList.length; j++){
		     					
		     					if(j<totalCount){
		     						
			     					outputPage4 = '<li><a onclick="pageSearchClick(this);" value="'+(j+1)+'">'+(j+1)+'</a></li>';
				     				$j3('#pagination').append(outputPage4);
		     				}
		     				}
		     				
		     				
		     				
						},error: function(xhr,status,error){
							
							alert("에러 발생~삐뽀~");
		     				console.log(error);
						}
					});
				});
			
			</script>

            <section id="boradtable" class="boradtable">
                 <!-- Wrapper for slides -->
                            <div class="carousel-inner" role="listbox">
                                <div class="item active">
                                    <div class="container">
                                        <div class="row" id="missingTotalList">
                                        
                                        <script>
                                            /* 전역변수로 쓸 전체리스트 */
                                            var missingList1;
                                            var missingList;
                                            var totalCount = 0;
                                            var output = '';
                                            var outputPage;
                                            var missList;
                                            var completeList;
                                            
                                            /* 전체 조회용 json 호출 */
                                            $j3(document).ready(function(){
										     		
										     		$j3.ajax({
										     			url:"/petpal/user/missingList",
										     			success:function(data,status,xhr){
										     				missingList1 = JSON.parse(data.missingList);
										     				missingList = _.uniq(missingList1, 'boardCode');
										     				totalCount = Math.ceil(missingList.length/12);
										     				
										     				for(i=0; i< missingList.length; i++){
										     					if( i < 12){
										     					output += '<div class="col-sm-3">';
										     					output += '<div class="port_item xs-m-top-30" style="cursor:pointer;">';
										     					output += '<div class="port_img" style="position: relative;" onclick="location.href='+'\'' + '${ pageContext.servletContext.contextPath }/user/missing/detail/' + missingList[i].boardCode +'\''+'">';
										     					output += '<input type="hidden" id="boardCode" value='+missingList[i].boardCode+'/>';
										     					if(missingList[i].stateName == '대기'){
										     						output += '<p style="position: absolute; font-size: 20px; background-color: orange; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">실종</p>';
										     					}
										     					if(missingList[i].stateName == '승인'){
										     						output+='<p style="position: absolute; font-size: 20px; background-color: #45B99C; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">집 도착</p>'
										     					}
										     					output += '<img style="width:290px; height:250px;" src="${ pageContext.servletContext.contextPath }/'+missingList[i].pictureUtilPath+'" alt="" />';
										     					output += '</div>';
										     					output += '<div class="port_caption m-top-20" align="center" style="margin-bottom: 30px;">';
										     					if(missingList[i].missingGender == 'M'){
										     						output += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+missingList[i].missingBreed+'/남아/'+missingList[i].missingColor+'</p>';
										     					}
										     					if(missingList[i].missingGender == 'F'){
										     						output += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+missingList[i].missingBreed+'/여아/'+missingList[i].missingColor+'</p>';
										     					}
										     					output += '<h6>'+missingList[i].missingArea+'</h6>';
										     					output += '</div>';
										     					output += '</div>';
										     					output += '</div>';
										     					}
										     				}
										     				$j3('#missingTotalList').append(output);
										     				
										     				for(j=0; j< missingList.length; j++){
										     					
										     					if(j<totalCount){
										     						
											     					outputPage = '<li><a onclick="pageAllClick(this);" value="'+(j+1)+'">'+(j+1)+'</a></li>';
												     				$j3('#pagination').append(outputPage);
										     					}
										     				}
										     			},error:function(xhr,status,error){
										     				alert("에러 발생~삐뽀~");
										     				console.log(error);
										     			}
										     		});
										     	}); 
                                            
                                            /* 전체 페이징 함수*/
                                            function pageSearchClick(p){
                                          		$j3("#missingTotalList").empty();
                                          		let value = p.innerText;
                                          		output='';
                                          		for(i=12*(value-1); i< missingList.length; i++){
                                          		if(i<=(value*10)+(value*2-1)){
                                          			output += '<div class="col-sm-3">';
							     					output += '<div class="port_item xs-m-top-30" style="cursor:pointer;">';
							     					output += '<div class="port_img" style="position: relative;" onclick="location.href='+'\'' + '${ pageContext.servletContext.contextPath }/user/missing/detail/' + missingList[i].boardCode +'\''+'">';
							     					output += '<input type="hidden" id="boardCode" value='+missingList[i].boardCode+'/>';
							     					if(missingList[i].stateName == '대기'){
							     						output += '<p style="position: absolute; font-size: 20px; background-color: orange; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">실종</p>';
							     					}
							     					if(missingList[i].stateName == '승인'){
							     						output+='<p style="position: absolute; font-size: 20px; background-color: #45B99C; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">집 도착</p>'
							     					}
							     					output += '<img style="width:290px; height:250px;" src="${ pageContext.servletContext.contextPath }/'+missingList[i].pictureUtilPath+'" alt="" />';
							     					output += '</div>';
							     					output += '<div class="port_caption m-top-20" align="center" style="margin-bottom: 30px;">';
							     					if(missingList[i].missingGender == 'M'){
							     						output += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+missingList[i].missingBreed+'/남아/'+missingList[i].missingColor+'</p>';
							     					}
							     					if(missingList[i].missingGender == 'F'){
							     						output += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+missingList[i].missingBreed+'/여아/'+missingList[i].missingColor+'</p>';
							     					}
							     					output += '<h6>'+missingList[i].missingArea+'</h6>';
							     					output += '</div>';
							     					output += '</div>';
							     					output += '</div>';
					                                    
							     					}
							     				}
							     				
							     				$j3('#missingTotalList').append(output);
							     				
                                          		};
                                          		
                                          		/* 검색 페이징 함수 */
                                            function pageAllClick(p){
                                          		$j3("#missingTotalList").empty();
                                          		console.log("여기오나?? pageclick");
                                          		let value = p.innerText;
                                          		
                                          		output='';
                                          		for(i=12*(value-1); i< missingList.length; i++){
                                          		if(i<=(value*10)+(value*2-1)){
                                          			output += '<div class="col-sm-3">';
							     					output += '<div class="port_item xs-m-top-30" style="cursor:pointer;">';
							     					output += '<div class="port_img" style="position: relative;" onclick="location.href='+'\'' + '${ pageContext.servletContext.contextPath }/user/missing/detail/' + missingList[i].boardCode +'\''+'">';
							     					output += '<input type="hidden" id="boardCode" value='+missingList[i].boardCode+'/>';
							     					if(missingList[i].stateName == '대기'){
							     						output += '<p style="position: absolute; font-size: 20px; background-color: orange; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">실종</p>';
							     					}
							     					if(missingList[i].stateName == '승인'){
							     						output+='<p style="position: absolute; font-size: 20px; background-color: #45B99C; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">집 도착</p>'
							     					}
							     					output += '<img style="width:290px; height:250px;" src="${ pageContext.servletContext.contextPath }/'+missingList[i].pictureUtilPath+'" alt="" />';
							     					output += '</div>';
							     					output += '<div class="port_caption m-top-20" align="center" style="margin-bottom: 30px;">';
							     					if(missingList[i].missingGender == 'M'){
							     						output += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+missingList[i].missingBreed+'/남아/'+missingList[i].missingColor+'</p>';
							     					}
							     					if(missingList[i].missingGender == 'F'){
							     						output += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+missingList[i].missingBreed+'/여아/'+missingList[i].missingColor+'</p>';
							     					}
							     					output += '<h6>'+missingList[i].missingArea+'</h6>';
							     					output += '</div>';
							     					output += '</div>';
							     					output += '</div>';
					                                    
							     					}
							     				}
							     				
							     				$j3('#missingTotalList').append(output);
							     				
                                          		};
                                          	
                                          	/* 실종 페이징 함수*/
                                            function pageMissClick(p){
                                          		$j3("#missingTotalList").empty();
                                          		console.log("여기오나?? pageclick");
                                          		let value = p.innerText;
                                          		
                                          		output2='';
                                          		for(i=12*(value-1); i< missList.length; i++){
                                          		if(i<=(value*10)+(value*2-1)){
                                          			output2 += '<div class="col-sm-3">';
							     					output2 += '<div class="port_item xs-m-top-30" style="cursor:pointer;">';
							     					output2 += '<div class="port_img" style="position: relative;" onclick="location.href='+'\'' + '${ pageContext.servletContext.contextPath }/user/missing/detail/' + missList[i].boardCode +'\''+'">';
							     					output2 += '<input type="hidden" id="boardCode" value='+missList[i].boardCode+'/>';
							     					output2 += '<p style="position: absolute; font-size: 20px; background-color: orange; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">실종</p>';
							     					output2 += '<img style="width:290px; height:250px;" src="${ pageContext.servletContext.contextPath }/'+missList[i].pictureUtilPath+'" alt="" />';
							     					output2 += '</div>';
							     					output2 += '<div class="port_caption m-top-20" align="center" style="margin-bottom: 30px;">';
							     					if(missList[i].missingGender == 'M'){
							     						output2 += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+missList[i].missingBreed+'/남아/'+missList[i].missingColor+'</p>';
							     					}
							     					if(missList[i].missingGender == 'F'){
							     						output2 += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+missList[i].missingBreed+'/여아/'+missList[i].missingColor+'</p>';
							     					}
							     					output2 += '<h6>'+missList[i].missingArea+'</h6>';
							     					output2 += '</div>';
							     					output2 += '</div>';
							     					output2 += '</div>';
					                                    
							     					}
							     				}
							     				
							     				$j3('#missingTotalList').append(output2);
							     				
                                          		};
                                          	
                                          	/* 찾기완료 페이징 */
                                            function pageComClick(p){
                                          		$j3("#missingTotalList").empty();
                                          		console.log("여기오나?? pageclick");
                                          		let value = p.innerText;
                                          		
                                          		output1='';
                                          		for(i=12*(value-1); i< completeList.length; i++){
                                          		if(i<=(value*10)+(value*2-1)){
                                          			output1 += '<div class="col-sm-3">';
                			     					output1 += '<div class="port_item xs-m-top-30" style="cursor:pointer;">';
                			     					output1 += '<div class="port_img" style="position: relative;" onclick="location.href='+'\'' + '${ pageContext.servletContext.contextPath }/user/missing/detail/' + missingSearchList[i].boardCode +'\''+'">';
                			     					output1 += '<input type="hidden" id="boardCode" value='+missingSearchList[i].boardCode+'/>';
                			     					if(missingSearchList[i].stateName == '대기'){
                			     						output1 += '<p style="position: absolute; font-size: 20px; background-color: orange; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">실종</p>';
                			     					}
                			     					if(missingSearchList[i].stateName == '승인'){
                			     						output1 +='<p style="position: absolute; font-size: 20px; background-color: #45B99C; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">집 도착</p>'
                			     					}
                			     					output1 += '<img style="width:290px; height:250px;" src="${ pageContext.servletContext.contextPath }/'+missingSearchList[i].pictureUtilPath+'" alt="" />';
                			     					output1 += '</div>';
                			     					output1 += '<div class="port_caption m-top-20" align="center" style="margin-bottom: 30px;">';
                			     					if(missingSearchList[i].missingGender == 'M'){
                			     						output1 += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+missingSearchList[i].missingBreed+'/남아/'+missingSearchList[i].missingColor+'</p>';
                			     					}
                			     					if(missingSearchList[i].missingGender == 'F'){
                			     						output1 += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+missingSearchList[i].missingBreed+'/여아/'+missingSearchList[i].missingColor+'</p>';
                			     					}
                			     					output1 += '<h6>'+missingSearchList[i].missingArea+'</h6>';
                			     					output1 += '</div>';
                			     					output1 += '</div>';
                			     					output1 += '</div>';
					                                    
							     					}
							     				}
							     				
							     				$j3('#missingTotalList').append(output1);
							     				
							     			
                                          		};
                                            
                                            /* 실종 버튼 클릭시 필터  */
                                            $j3('#miss_wait_btn').click(function(){
                                            	console.log("miss_wait_btn 들어오나?");
                                            	
                                            	console.table(missingList1);
                                            	var missWaitingList1 = _.uniq(missingList1, 'boardCode');
                                            	
                                            	$j3("#missingTotalList").empty();
                                            	$j3('#pagination').empty();
                                            	
                                            	function isWaiting(w){
                                            		if(w.stateName == '대기'){
                                            			return true;
                                            		};
                                            	};
                                            	
                                            	
                                            	missList = missWaitingList1.filter(isWaiting);
                                            	totalCount = Math.ceil(missList.length/12);
                                            	console.table(missList);
                                            	
                                            	output2='';
                                            	outputPage2='';
                                            	for(i=0; i< missList.length; i++){
							     					if( i < 12){
								     				
								     				output2 += '<div class="col-sm-3">';
							     					output2 += '<div class="port_item xs-m-top-30" style="cursor:pointer;">';
							     					output2 += '<div class="port_img" style="position: relative;" onclick="location.href='+'\'' + '${ pageContext.servletContext.contextPath }/user/missing/detail/' + missList[i].boardCode +'\''+'">';
							     					output2 += '<input type="hidden" id="boardCode" value='+missList[i].boardCode+'/>';
							     					output2 += '<p style="position: absolute; font-size: 20px; background-color: orange; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">실종</p>';
							     					output2 += '<img style="width:290px; height:250px;" src="${ pageContext.servletContext.contextPath }/'+missList[i].pictureUtilPath+'" alt="" />';
							     					output2 += '</div>';
							     					output2 += '<div class="port_caption m-top-20" align="center" style="margin-bottom: 30px;">';
							     					if(missList[i].missingGender == 'M'){
							     						output2 += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+missList[i].missingBreed+'/남아/'+missList[i].missingColor+'</p>';
							     					}
							     					if(missList[i].missingGender == 'F'){
							     						output2 += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+missList[i].missingBreed+'/여아/'+missList[i].missingColor+'</p>';
							     					}
							     					output2 += '<h6>'+missList[i].missingArea+'</h6>';
							     					output2 += '</div>';
							     					output2 += '</div>';
							     					output2 += '</div>';
					                                    
                                              		}
                                              	}
							     				
							     				$j3('#missingTotalList').append(output2);
							     				
							     				for(j=0; j< missingList.length; j++){
							     					if(j<totalCount){
							     						
							     						outputPage2 = '<li><a onclick="pageMissClick(this);" value="'+(j+1)+'">'+(j+1)+'</a></li>';
									     				$j3('#pagination').append(outputPage2);
							     					}
							     				}
							     				
							     				
                                            })
                                            
                                            /* 찾기완료 버튼 클릭시 필터 적용 코드 */
                                            
                                            $j3('#come_btn').click(function(){
                                            	console.log("come_btn 들어오나?");
                                            	
                                            	console.table(missingList1);
                                            	var completeList1 = _.uniq(missingList1, 'boardCode');
                                            	function isWaiting(w){
                                            		if(w.stateName == '승인'){
                                            			return true;
                                            		};
                                            	};
                                            	
                                            	$j3("#missingTotalList").empty();
                                            	$j3('#pagination').empty();
                                            	
                                            	completeList = completeList1.filter(isWaiting);
                                            	totalCount = Math.ceil(completeList.length/12);
                                            	console.table(completeList);
                                            	
                                            	output3='';
                                            	outputPage4='';
                                            	for(i=0; i< completeList.length; i++){
							     					if( i < 12){
								     				
								     				output3 += '<div class="col-sm-3">';
							     					output3 += '<div class="port_item xs-m-top-30" style="cursor:pointer;">';
							     					output3 += '<div class="port_img" style="position: relative;" onclick="location.href='+'\'' + '${ pageContext.servletContext.contextPath }/user/missing/detail/' + completeList[i].boardCode +'\''+'">';
							     					output3 += '<input type="hidden" id="boardCode" value='+completeList[i].boardCode+'/>';
							     					output3 +='<p style="position: absolute; font-size: 20px; background-color: #45B99C; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">집 도착</p>'
							     					output3 += '<img style="width:290px; height:250px;" src="${ pageContext.servletContext.contextPath }/'+completeList[i].pictureUtilPath+'" alt="" />';
							     					output3 += '</div>';
							     					output3 += '<div class="port_caption m-top-20" align="center" style="margin-bottom: 30px;">';
							     					if(completeList[i].missingGender == 'M'){
							     						output3 += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+completeList[i].missingBreed+'/남아/'+completeList[i].missingColor+'</p>';
							     					}
							     					if(completeList[i].missingGender == 'F'){
							     						output3 += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+completeList[i].missingBreed+'/여아/'+completeList[i].missingColor+'</p>';
							     					}
							     					output3 += '<h6>'+completeList[i].missingArea+'</h6>';
							     					output3 += '</div>';
							     					output3 += '</div>';
							     					output3 += '</div>';
					                                    
                                              		}
                                            	}
							     				
							     				$j3('#missingTotalList').append(output3);
							     				
							     				for(j=0; j< completeList.length; j++){
							     					if(j<totalCount){
							     						
							     						outputPage4 = '<li><a onclick="pageComClick(this);" value="'+(j+1)+'">'+(j+1)+'</a></li>';
									     				$j3('#pagination').append(outputPage4);
							     					}
							     				}
							     				
                                            })
                                            
                                            </script>
                                        </div>
                                    </div>
                                </div>
                             </div>
                    <div class="text-center">
						<ul class="pagination" id="pagination">
							
						</ul>
					</div>
            </section>
            <div style="position: fixed; top: 310px; left: 200px;">
	            <button style="border: 0px; background-color: red; width: 50px; height: 200px; border-radius: 10px;" onclick="sessionCheck();" >
	            <h4 style="writing-mode: vertical-rl; color: white; font-weight: bold;" align="center">실종 알리기</h4>
	            </button>
			</div>
			
            <script type="text/javascript">
				function sessionCheck(){
					if(${empty sessionScope.loginUser}){
						alert("로그인 후 이용가능합니다.");
					}else{
						location.href='${ pageContext.servletContext.contextPath }/user/missing/write';
					};
				};
			</script>
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>
        </div>
         <jsp:include page="../common/footer.jsp"/>

	</body>            
</html>