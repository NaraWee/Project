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

            <section id="borad" class="borad" style="width: 80%; margin: 0px auto;">
                <div style="color: #45B99C; font-size: 25px; font-weight: 600; margin-left: 5%;"><a style="color: #45B99C;" onclick="location.href='${ pageContext.servletContext.contextPath }/user/adopt'">입양홍보</a>
                <button id="adopt_wait_btn" 
                style="color: white; background-color: #FFA800; border-color: white; border: 1px solid; 
                border-radius:10px; width:180px; margin-left:30px;">
                	입양 대기중
                </button>
                <button id="adopt_com_btn" 
                style="color: white; background-color: #FF6230; border-color: white; border: 1px solid; 
                border-radius:10px; width:180px; margin-left:30px;">
                	입양 완료
                </button>
                </div>
                <hr style="border-color: rgb(175, 175, 175); width: 90%;">
            </section> <!--End off Home Sections-->
				<div style="width: 370px; position: relative; left: 60%; margin-bottom:20px;">
						<input type="search" id="search" name="search" placeholder="지역 키워드를 입력해주세요" aria-label="Search"
						style="width: 300px; border-radius: 5px; background-color: #F1FAF8; height:40px; border: solid 1px; border-color: black;" required/>
						<span>
							<button id="search_btn" type="submit" style="background-color: white; height: 40px; width: 50px; float: right; border: solid 1px; border-color: black; border-radius: 5px;">
								검색
							</button>
						</span>
				</div>
			
			<script>
			var adoptSearchList;
			var outputPage4='';
			var rsearch = '';
			$j3('#search_btn').click(function(){
					console.log("search ajax");
					rsearch = $j3('#search').val();
					if(!rsearch){
						alert("검색어 입력해주세요");
						return false;
					};
					
					console.log(rsearch);
					
					$j3("#adoptlistList").empty();
					
					$j3.ajax({
						url:"adopt/search/"+decodeURIComponent(rsearch,"UTF-8"),
						type:"GET",
						success: function(data,status,xhr){
							const adoptSearchList1 = JSON.parse(data.adoptSearchList);
		     				adoptSearchList = _.uniq(adoptSearchList1, 'boardCode');
							

                        	$j3("#adoptlistList").empty();
                        	$j3("#pagination").empty();
                        	
                        	totalCount = Math.ceil(adoptSearchList.length/12);
                        	console.table(adoptSearchList);
		     				
		     				output1='';
		     				
		     				var i;
		     				if(adoptSearchList.length == 0){
		     					output1 += '<h3 style="text-align:center;">검색 결과가 없습니다.</h3>';
		     				}
		     				for(i=0; i< adoptSearchList.length; i++){
		     					if( i < 12){
			     				
		     					output1 += '<div class="col-sm-3">';
		     					output1 += '<div class="port_item xs-m-top-30" style="cursor:pointer;height:400px">';
		     					output1 += '<div class="port_img" style="position: relative;" onclick="location.href='+'\'' + '${ pageContext.servletContext.contextPath }/user/adopt/detail/'+ adoptSearchList[i].boardCode +'\''+'">';
		     					output1 += '<input type="hidden" id="boardCode" value='+adoptSearchList[i].boardCode+'/>';
		     					
		     					if(adoptSearchList[i].stateName == '대기'){
		     						output1 += '<p style="position: absolute; font-size: 20px; background-color: orange; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 5px; font-weight: bold;" align="center">'+'대기중'+'</p>';
		     					}
		     					if(adoptSearchList[i].stateName == '승인'){
		     						output1+='<p style="position: absolute; font-size: 20px; background-color: #FF6230; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 5px; font-weight: bold;" align="center">'+'완료'+'</p>'
		     					}
		     					output1 += '<img style="width:100%; height:250px;" src="${ pageContext.servletContext.contextPath }/'+adoptSearchList[i].pictureUtilPath+'" alt="" />';
		     					output1 += '</div>';
		     					output1 += '<div class="port_caption m-top-20" align="center" style="margin-bottom: 30px;">';
		     					if(adoptSearchList[i].adoptGender == 'M'){
		     						output1 += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+adoptSearchList[i].adoptBreed+'/남아/'+adoptSearchList[i].adoptColor+'</p>';
		     					}
		     					if(adoptSearchList[i].adoptGender == 'F'){
		     						output1 += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+adoptSearchList[i].adoptBreed+'/여아/'+adoptSearchList[i].adoptColor+'</p>';
		     					}
		     					output1 += '<h6>'+adoptSearchList[i].userAddress+'</h6>';
		     					output1 += '</div>';
		     					output1 += '</div>';
		     					output1 += '</div>';
                                    
		     					}
		     				}
		     				
		     				$j3('#adoptlistList').append(output1);
		     				
		     				for(j=0; j< adoptSearchList.length; j++){
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
                                     <div class="row" id="adoptlistList">
                                     
                                            <script>
                                            
                                            var adoptList1;
                                            var totalCount = 0;
                                            var adoptList;
                                            var adoptWaitingList;
                                            var outputPage;
                                            var output = '';
                                            var outfil = '';
                                            var i;
                                            
                                            
                                            $j3(document).ready(function(){
										     		console.log("adoptPage select script");
										     		$j3.ajax({
										     			url:"/petpal/user/adoptData",
										     			success:function(data,status,xhr){
										     				adoptList1 = JSON.parse(data.adoptList);
										     				adoptList = _.uniq(adoptList1, 'boardCode');
										     				totalCount = Math.ceil(adoptList.length/12);
										     				
										     				for(i=0; i< adoptList.length; i++){
										     					if( i < 12){
										     		
										     					output += '<div class="col-sm-3">';
										     					output += '<div class="port_item xs-m-top-30" style="cursor:pointer; height:400px;">';
										     					output += '<div class="port_img" style="position: relative;" onclick="location.href='+'\'' + '${ pageContext.servletContext.contextPath }/user/adopt/detail/' + adoptList[i].boardCode +'\''+'">';
										     					output += '<input type="hidden" id="boardCode" value="'+adoptList[i].boardCode+'"/>';
										     					if(adoptList[i].stateName == '대기'){
										     						output += '<p style="position: absolute; font-size: 20px; background-color: orange; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius:0px 5px 5px 5px; font-weight: bold;" align="center">'+'대기중'+'</p>';
										     					}
										     					if(adoptList[i].stateName == '승인'){
										     						output+='<p style="position: absolute; font-size: 20px; background-color: #FF6230; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">'+'완료'+'</p>'
										     					}
										     					output += '<img style="width:100%; height:250px;" src="${ pageContext.servletContext.contextPath }/'+adoptList[i].pictureUtilPath+'" alt="" />';
										     					output += '</div>';
										     					output += '<div class="port_caption m-top-20" align="center" style="margin-bottom: 30px;">';
										     					if(adoptList[i].adoptGender == 'M'){
										     						output += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+adoptList[i].adoptBreed+'/남아/'+adoptList[i].adoptColor+'</p>';
										     					}
										     					if(adoptList[i].adoptGender == 'F'){
										     						output += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+adoptList[i].adoptBreed+'/여아/'+adoptList[i].adoptColor+'</p>';
										     					}
										     					output += '<h6>'+adoptList[i].userAddress+'</h6>';
										     					output += '</div>';
										     					output += '</div>';
										     					output += '</div>';
										     					}
								                             
										     				}
										     				$j3('#adoptlistList').append(output);
										                	
										     				for( let j=0; j<adoptList.length; j++){
										     					if(j<totalCount){
										     					outputPage = '<li><a onclick="pageClick(this);" value="'+(j+1)+'">'+(j+1)+'</a></li>';
										     					console.log(outputPage);
										     					
										     				$j3('#pagination').append(outputPage);
										     					}
										     				}
										     				
										     				
										     			},error:function(xhr,status,error){
										     				alert("에러 발생~삐뽀~");
										     				console.log(error);
										     			}
										     		});
										     	}); 
                                            
                                            /* 페이징 클릭시 나오는 함수 */
                                          	function pageClick(p){
                                          		$j3("#adoptlistList").empty();
                                          		console.log("여기오나?? pageclick");
                                          		let value = p.innerText;
                                          		
                                          		output='';
                                          		for(i=12*(value-1); i< adoptList.length; i++){
                                          		if(i<=(value*10)+(value*2-1)){
                        	     					output += '<div class="col-sm-3">';
							     					output += '<div class="port_item xs-m-top-30" style="cursor:pointer;height:400px;">';
							     					output += '<div class="port_img" style="position: relative;" onclick="location.href='+'\'' + '${ pageContext.servletContext.contextPath }/user/adopt/detail/' + adoptList[i].boardCode +'\''+'">';
							     					output += '<input type="hidden" id="boardCode" value="'+adoptList[i].boardCode+'"/>';
							     					if(adoptList[i].stateName == '대기'){
							     						output += '<p style="position: absolute; font-size: 20px; background-color: orange; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius:0px 5px 5px 5px; font-weight: bold;" align="center">'+'대기중'+'</p>';
							     					}
							     					if(adoptList[i].stateName == '승인'){
							     						output+='<p style="position: absolute; font-size: 20px; background-color: #FF6230; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">'+'완료'+'</p>'
							     					}
							     					output += '<img style="width:100%; height:250px;" src="${ pageContext.servletContext.contextPath }/'+adoptList[i].pictureUtilPath+'" alt="" />';
							     					output += '</div>';
							     					output += '<div class="port_caption m-top-20" align="center" style="margin-bottom: 30px;">';
							     					if(adoptList[i].adoptGender == 'M'){
							     						output += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+adoptList[i].adoptBreed+'/남아/'+adoptList[i].adoptColor+'</p>';
							     					}
							     					if(adoptList[i].adoptGender == 'F'){
							     						output += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+adoptList[i].adoptBreed+'/여아/'+adoptList[i].adoptColor+'</p>';
							     					}
							     					output += '<h6>'+adoptList[i].userAddress+'</h6>';
							     					output += '</div>';
							     					output += '</div>';
							     					output += '</div>';
							     					}
                                          		}
					                             
							     				$j3('#adoptlistList').append(output);
							     				
							     				
                                          		};
                                            
                                            /* 입양중 페이징*/
                                          	function pageIngClick(p){
                                          		$j3("#adoptlistList").empty();
                                          		console.log("여기오나?? pageclick");
                                          		let value = p.innerText;
                                          		
                                          		output2='';
                                          		for(i=12*(value-1); i< adoptWaitingList.length; i++){
                                          		if(i<=(value*10)+(value*2-1)){
                                          			output2 += '<div class="col-sm-3">';
							     					output2 += '<div class="port_item xs-m-top-30" style="cursor:pointer;height:400px;">';
							     					output2 += '<div class="port_img" style="position: relative;" onclick="location.href='+'\'' + '${ pageContext.servletContext.contextPath }/user/adopt/detail/' + adoptWaitingList[i].boardCode +'\''+'">';
							     					output2 += '<input type="hidden" id="boardCode" value="'+adoptWaitingList[i].boardCode+'"/>';
							     					output2 += '<p style="position: absolute; font-size: 20px; background-color: orange; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius:0px 5px 5px 5px; font-weight: bold;" align="center">'+'대기중'+'</p>';
							     					output2 += '<img style="width:100%; height:250px;" src="${ pageContext.servletContext.contextPath }/'+adoptWaitingList[i].pictureUtilPath+'" alt="" />';
							     					output2 += '</div>';
							     					output2 += '<div class="port_caption m-top-20" align="center" style="margin-bottom: 30px;">';
							     					if(adoptWaitingList[i].adoptGender == 'M'){
							     						output2 += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+adoptWaitingList[i].adoptBreed+'/남아/'+adoptWaitingList[i].adoptColor+'</p>';
							     					}
							     					if(adoptWaitingList[i].adoptGender == 'F'){
							     						output2 += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+adoptWaitingList[i].adoptBreed+'/여아/'+adoptWaitingList[i].adoptColor+'</p>';
							     					}
							     					output2 += '<h6>'+adoptWaitingList[i].userAddress+'</h6>';
							     					output2 += '</div>';
							     					output2 += '</div>';
							     					output2 += '</div>';
							     					}
                                          		}
					                             
							     				$j3('#adoptlistList').append(output2);
							     				
							     				
                                          		};
                                            
                                            /* 입양완료 페이징 버튼*/
                                          	function pageComClick(p){
                                          		$j3("#adoptlistList").empty();
                                          		console.log("여기오나?? pageclick");
                                          		let value = p.innerText;
                                          		
                                          		output3='';
                                          		for(i=12*(value-1); i< adoptWaitingList.length; i++){
                                          		if(i<=(value*10)+(value*2-1)){
                                          			output3 += '<div class="col-sm-3">';
							     					output3 += '<div class="port_item xs-m-top-30" style="cursor:pointer;height:400px">';
							     					output3 += '<div class="port_img" style="position: relative;" onclick="location.href='+'\'' + '${ pageContext.servletContext.contextPath }/user/adopt/detail/' + adoptWaitingList[i].boardCode +'\''+'">';
							     					output3 += '<input type="hidden" id="boardCode" value='+adoptWaitingList[i].boardCode+'/>';
							     					output3 +='<p style="position: absolute; font-size: 20px; background-color: #FF6230; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">'+'완료'+'</p>'
							     					output3 += '<img style="width:100%; height:250px;" src="${ pageContext.servletContext.contextPath }/'+adoptWaitingList[i].pictureUtilPath+'" alt="" />';
							     					output3 += '</div>';
							     					output3 += '<div class="port_caption m-top-20" align="center" style="margin-bottom: 30px;">';
							     					if(adoptWaitingList[i].adoptGender == 'M'){
							     						output3 += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+adoptWaitingList[i].adoptBreed+'/남아/'+adoptWaitingList[i].adoptColor+'</p>';
							     					}
							     					if(adoptWaitingList[i].adoptGender == 'F'){
							     						output3 += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+adoptWaitingList[i].adoptBreed+'/여아/'+adoptWaitingList[i].adoptColor+'</p>';
							     					}
							     					output3 += '<h6>'+adoptWaitingList[i].userAddress+'</h6>';
							     					output3 += '</div>';
							     					output3 += '</div>';
							     					output3 += '</div>';
					                                    
							     					}
                                          		}
					                             
							     				$j3('#adoptlistList').append(output3);
							     				
							     				
                                          		};
                                            /* 입양 검색 페이징 버튼*/
                                          	function pageSearchClick(p){
                                          		$j3("#adoptlistList").empty();
                                          		console.log("여기오나?? pageclick");
                                          		let value = p.innerText;
                                          		
                                          		output1='';
                                          		for(i=12*(value-1); i< adoptSearchList.length; i++){
                                          		if(i<=(value*10)+(value*2-1)){
                                          			output1 += '<div class="col-sm-3">';
                    		     					output1 += '<div class="port_item xs-m-top-30" style="cursor:pointer;height:400px;">';
                    		     					output1 += '<div class="port_img" style="position: relative;" onclick="location.href='+'\'' + '${ pageContext.servletContext.contextPath }/user/adopt/detail/' + adoptSearchList[i].boardCode +'\''+'">';
                    		     					output1 += '<input type="hidden" id="boardCode" value='+adoptSearchList[i].boardCode+'/>';
                    		     					
                    		     					if(adoptSearchList[i].stateName == '대기'){
                    		     						output1 += '<p style="position: absolute; font-size: 20px; background-color: orange; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 5px; font-weight: bold;" align="center">'+'대기중'+'</p>';
                    		     					}
                    		     					if(adoptSearchList[i].stateName == '승인'){
                    		     						output1+='<p style="position: absolute; font-size: 20px; background-color: #FF6230; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 5px; font-weight: bold;" align="center">'+'완료'+'</p>'
                    		     					}
                    		     					output1 += '<img style="width:100%; height:250px;" src="${ pageContext.servletContext.contextPath }/'+adoptSearchList[i].pictureUtilPath+'" alt="" />';
                    		     					output1 += '</div>';
                    		     					output1 += '<div class="port_caption m-top-20" align="center" style="margin-bottom: 30px;">';
                    		     					if(adoptSearchList[i].adoptGender == 'M'){
                    		     						output1 += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+adoptSearchList[i].adoptBreed+'/남아/'+adoptSearchList[i].adoptColor+'</p>';
                    		     					}
                    		     					if(adoptSearchList[i].adoptGender == 'F'){
                    		     						output1 += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+adoptSearchList[i].adoptBreed+'/여아/'+adoptSearchList[i].adoptColor+'</p>';
                    		     					}
                    		     					output1 += '<h6>'+adoptSearchList[i].userAddress+'</h6>';
                    		     					output1 += '</div>';
                    		     					output1 += '</div>';
                    		     					output1 += '</div>';
					                                    
							     					}
                                          		}
					                             
							     				$j3('#adoptlistList').append(output1);
							     				
							     				
                                          		};
                                            
                                            
                                            
                                            /* 입양 대기중 버튼 클릭시 필터  */
                                            $j3('#adopt_wait_btn').click(function(){
                                            	console.log("adopt_wait_btn 들어오나?");
                                            	
                                            	console.table(adoptList1);
                                            	var adoptWaitingList1 = _.uniq(adoptList1, 'boardCode');
                                            	
                                            	function isWaiting(w){
                                            		if(w.stateName == '대기'){
                                            			return true;
                                            		};
                                            	};
                                            	
                                            	$j3("#adoptlistList").empty();
                                            	$j3("#pagination").empty();
                                            	
                                            	adoptWaitingList = adoptWaitingList1.filter(isWaiting);
                                            	totalCount = Math.ceil(adoptWaitingList.length/12);
                                            	console.table(adoptWaitingList);
                                            	
                                            	output2='';
                                            	outputPage1 = '';
                                            	for(i=0; i< adoptWaitingList.length; i++){
							     					if( i < 12){
								     				
							     					output2 += '<div class="col-sm-3">';
							     					output2 += '<div class="port_item xs-m-top-30" style="cursor:pointer;height:400px;">';
							     					output2 += '<div class="port_img" style="position: relative;" onclick="location.href='+'\'' + '${ pageContext.servletContext.contextPath }/user/adopt/detail/' + adoptWaitingList[i].boardCode +'\''+'">';
							     					output2 += '<input type="hidden" id="boardCode" value="'+adoptWaitingList[i].boardCode+'"/>';
							     					output2 += '<p style="position: absolute; font-size: 20px; background-color: orange; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius:0px 5px 5px 5px; font-weight: bold;" align="center">'+'대기중'+'</p>';
							     					output2 += '<img style="width:100%; height:250px;" src="${ pageContext.servletContext.contextPath }/'+adoptWaitingList[i].pictureUtilPath+'" alt="" />';
							     					output2 += '</div>';
							     					output2 += '<div class="port_caption m-top-20" align="center" style="margin-bottom: 30px;">';
							     					if(adoptWaitingList[i].adoptGender == 'M'){
							     						output2 += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+adoptWaitingList[i].adoptBreed+'/남아/'+adoptWaitingList[i].adoptColor+'</p>';
							     					}
							     					if(adoptWaitingList[i].adoptGender == 'F'){
							     						output2 += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+adoptWaitingList[i].adoptBreed+'/여아/'+adoptWaitingList[i].adoptColor+'</p>';
							     					}
							     					output2 += '<h6>'+adoptWaitingList[i].userAddress+'</h6>';
							     					output2 += '</div>';
							     					output2 += '</div>';
							     					output2 += '</div>';
					                                    
							     					}
							     				}
							     				
							     				$j3('#adoptlistList').append(output2);

							     				for(j=0; j< adoptWaitingList.length; j++){
							     					if(j<totalCount){
							     					outputPage1 = '<li><a onclick="pageIngClick(this);" value="'+(j+1)+'">'+(j+1)+'</a></li>';
							     				$j3('#pagination').append(outputPage1);
							     				}
							     				}
							     				
                                            });
                                            
                                            /* 입양완료 버튼 클릭시 필터 적용 코드 */
                                            
                                            $j3('#adopt_com_btn').click(function(){
                                            	console.log("adopt_wait_btn 들어오나?");
                                            	
                                            	console.table(adoptList1);
                                            	var adoptWaitingList1 = _.uniq(adoptList1, 'boardCode');
                                            	
                                            	function isWaiting(w){
                                            		if(w.stateName == '승인'){
                                            			return true;
                                            		}
                                            		};
                                            		
                                            	$j3("#adoptlistList").empty();
                                            	$j3("#pagination").empty();
                                            	
                                            	adoptWaitingList = adoptWaitingList1.filter(isWaiting);
                                            	totalCount = Math.ceil(adoptWaitingList.length/12);
                                            	console.table(adoptWaitingList);
                                            	
                                            	output3='';
                                            	outputPage2='';
                                            	for(i=0; i< adoptWaitingList.length; i++){
							     					if( i < 12){
								     				
							     					output3 += '<div class="col-sm-3">';
							     					output3 += '<div class="port_item xs-m-top-30" style="cursor:pointer; height:400px;">';
							     					output3 += '<div class="port_img" style="position: relative;" onclick="location.href='+'\'' + '${ pageContext.servletContext.contextPath }/user/adopt/detail/' + adoptWaitingList[i].boardCode +'\''+'">';
							     					output3 += '<input type="hidden" id="boardCode" value='+adoptWaitingList[i].boardCode+'/>';
							     					output3 +='<p style="position: absolute; font-size: 20px; background-color: #FF6230; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">'+'완료'+'</p>'
							     					output3 += '<img style="width:100%; height:250px;" src="${ pageContext.servletContext.contextPath }/'+adoptWaitingList[i].pictureUtilPath+'" alt="" />';
							     					output3 += '</div>';
							     					output3 += '<div class="port_caption m-top-20" align="center" style="margin-bottom: 30px;">';
							     					if(adoptWaitingList[i].adoptGender == 'M'){
							     						output3 += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+adoptWaitingList[i].adoptBreed+'/남아/'+adoptWaitingList[i].adoptColor+'</p>';
							     					}
							     					if(adoptWaitingList[i].adoptGender == 'F'){
							     						output3 += '<p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 19px;">'+adoptWaitingList[i].adoptBreed+'/여아/'+adoptWaitingList[i].adoptColor+'</p>';
							     					}
							     					output3 += '<h6>'+adoptWaitingList[i].userAddress+'</h6>';
							     					output3 += '</div>';
							     					output3 += '</div>';
							     					output3 += '</div>';
					                                    
							     					}
                                            	}
							     				
							     				$j3('#adoptlistList').append(output3);
							     				
							     				for(j=0; j< adoptWaitingList.length; j++){
							     					if(j<totalCount){
							     					outputPage2 = '<li><a onclick="pageComClick(this);" value="'+(j+1)+'">'+(j+1)+'</a></li>';
								     				$j3('#pagination').append(outputPage2);
							     					}
							     				}
							     				
							     				
							     				
                                            });
                                            
                                            
										     	
										     </script>  
                                       
                                     </div>
                                 </div>
                             </div>
                          </div>
                          
                    <div class="text-center">
						<ul class="pagination" id="pagination">
						
						</ul>
					</div>
					<script>
						function moveData(){
							var specNum = $j3("#boardCode").val();
							alert(specNum);
						}
					</script>
					            

            </section>
            
										     					
            
            <div style="position: fixed; top: 310px; left: 10%;">
	            <button onclick="sessionCheck();" style="border: 0px; background-color: #19A985; width: 50px; height: 200px; border-radius: 10px;">
	            <h4 style="writing-mode: vertical-rl; color: white; font-weight: bold;" align="center">글 작성하기</h4>
	            </button>
			</div>

        </div>
        
        	<script type="text/javascript">
				function sessionCheck(){
					if(${empty sessionScope.loginUser}){
						alert("로그인 후 이용가능합니다.");
					}else{
						location.href='${ pageContext.servletContext.contextPath }/user/adopt/terms';
					};
				};
			</script>
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>
         <jsp:include page="../common/footer.jsp"/>    



</body>
</html>