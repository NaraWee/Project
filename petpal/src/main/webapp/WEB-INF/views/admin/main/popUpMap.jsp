<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adPopUp</title>

        <meta charset="utf-8">
        <title>PET-PAL</title>
        
        <!-- summerNote -->
    	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    	
		<style>
			p > img {
                margin-bottom: 20px;
				width: 500px !important;
                margin: 0px auto;
            }
            

            div > img {
                margin-bottom: 20px;
                text-align: center;
				width: 20%;
            }
            a > img {
                width: 50%;
                height: 50%;
                margin-top: 20px;
                margin-bottom: 10px;
                margin-left: 15px;
                margin-right: 15px;
                text-align: center;
            }
            .menutable > div > img {
                margin-bottom: 20px;
				width: 20%;
                margin: 0px auto;
                display: block;
            }
            .sendmessage > input {
                width: 87%;
                height: 50px;
                border-radius: 10px;
                border: 1px solid rgb(175, 175, 175);
                margin-bottom: 50px;
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
            td > img, span > img{
            	cursor: pointer !important;
            }
            			.overlay:target {
				visibility: visible;
				opacity: 1;
			}.overlay {
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
                height: 45px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
                width: 100px;
            }
            td > button {
            	float: right;
    			border-radius: 5px;
    			border: 1px solid;
    			color: #45B99C;
    			background: white;
            }
            td > button:hover {
            	float: right;
    			border-radius: 5px;
    			background-color: #45B99C;
                color: white;
                border-color: #45B99C; 
                border: 1px solid;
            }
            #underline-btn {
            	float: right;
    			border: none;
    			color: #45B99C;
    			background: white;
    			height: 40px;
    			width: 100px;
                font-size: 15px;
            }
            #underline-btn:hover {
            	float: right;
    			border-radius: 15px;
    			background-color: white;
                color: #45B99C;
                border-color: #45B99C; 
                border: 1px solid;
                height: 40px;
                width: 100px;
                font-size: 15px;
            }
            .findpwd-content > div, .findpwd-content > form > div {
                margin: 0px auto;
            }
        </style>

</head>
<body>
		<section id="popUp" class="popUp">
			<div style="width: 77%; margin-top: 40px; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 20px; margin-bottom: 50px;">
		            <table class="table" style="margin-bottom: 50px; border-collapse: separate;">
						<tbody>
							<tr>
								<td style="text-align: center; background-color: #F1FAF8; border-radius: 21px 0px 0px 0px;"><b>제목</b></td>
								<td>
								<c:out value="${ requestScope.popUp.boardTitle }"/> 
								</td>
							</tr>
							<tr>
								<td style="text-align: center; background-color: #F1FAF8;"><b>작성자</b></td>
								<td>
								<c:out value="${ requestScope.popUp.userId }"/>(<c:out value="${ requestScope.popUp.userName }"/>) 
								</td>
							</tr>
						</tbody>
					</table>
					<div style="margin-bottom: 30px; text-align:center;">
						<c:out value="${ requestScope.popUp.boardContent }" escapeXml="false"/>
					</div>
		        </div>
		 </section>
		 <div id="map" style="width:80%;height:500px; margin:0px auto; margin-bottom:30px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b85791a0e7d027a11d7cf8b979f0fb14&libraries=services"></script>
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						    mapOption = {
						        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						        level: 2 // 지도의 확대 레벨
						    };
						var placeAddress = '<c:out value="${ requestScope.popUp.mapValue }"/>';
						var placeName = '<c:out value="${ requestScope.popUp.mapname }"/>';
						
						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption); 
						
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();
						
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch(placeAddress, function(result, status) {
						
						    // 정상적으로 검색이 완료됐으면 
						     if (status === kakao.maps.services.Status.OK) {
						
						        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						
						        // 결과값으로 받은 위치를 마커로 표시합니다
						        var marker = new kakao.maps.Marker({
						            map: map,
						            position: coords
						        });
						
						        // 인포윈도우로 장소에 대한 설명을 표시합니다
						        var infowindow = new kakao.maps.InfoWindow({
						            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+placeName+'</div>'
						        });
						        infowindow.open(map, marker);
						
						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						    } 
						});    
					</script>
</body>
</html>