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
			img {
                margin-bottom: 20px;
				width: 500px !important;
                margin: 0px auto;
                display: block;
            }
            

		</style>

</head>
<body>
 		<section id="product" class="product">
                <div class="container">
                	<!-- slider image 시작  -->
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            
                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                            <c:forEach var="image" varStatus="status" items="${requestScope.pictureMissingList}">
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
		<section id="popUp" class="popUp">
			<div style="width: 77%; margin-top: 40px; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 20px; margin-bottom: 50px;">
		            <table class="table" style="margin-bottom: 50px; border-collapse: separate;">
						<tbody>
							<tr>
								<td style="text-align: center; background-color: #F1FAF8; border-radius: 21px 0px 0px 0px;"><b>제목</b></td>
								<td>
								<c:out value="${requestScope.missingDetail.breed}"/>/ 
				                   <c:if test="${requestScope.missingDetail.gender eq 'M'}">
				                   	남아  <br> 
				                   </c:if>
				                   <c:if test="${requestScope.missingDetail.gender eq 'F'}">
				                   	여아  <br> 
				                   </c:if>
				                   
				                   <c:out value="${requestScope.missingDetail.age}"/>살 / 
				                   <c:out value="${requestScope.missingDetail.weigth}"/>KG / 
				                   <c:out value="${requestScope.missingDetail.color}"/>
								</td>
							</tr>
							<tr>
								<td style="text-align: center; background-color: #F1FAF8;"><b>작성자</b></td>
								<td>
								<c:out value="${requestScope.missingDetail.userNickname}"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="table" style="margin-bottom: 50px; border-collapse: separate;">
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
		 </section>

</body>
</html>