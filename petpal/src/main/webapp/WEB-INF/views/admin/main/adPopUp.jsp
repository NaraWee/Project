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
		<section id="adPopUp" class="adPopUp">
			<div style="width: 77%; margin-top: 40px; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 20px; margin-bottom: 50px;">
		            <table class="table" style="margin-bottom: 50px; border-collapse: separate;">
						<c:forEach var="adPopUp" items="${ requestScope.adPopUp }">
						<tbody>
							<tr>
								<td style="text-align: center; background-color: #F1FAF8; border-radius: 21px 0px 0px 0px;"><b>제목</b></td>
								<td>
								<c:out value="${ adPopUp.adTitle }"/> 
								</td>
							</tr>
							<tr>
								<td style="text-align: center; background-color: #F1FAF8;"><b>광고 신청자</b></td>
								<td>
								<c:out value="${ adPopUp.user.name }"/>(<c:out value="${ adPopUp.user.id }"/>) 
								</td>
							</tr>
							<tr>
							<td style="text-align: center; background-color: #F1FAF8;"><b>신청일자</b></td>
								<td>
								<c:out value="${ adPopUp.applyDate }"/>
								</td>
							</tr>
						</tbody>
						</c:forEach>
					</table>
					<c:forEach var="adPopUp" items="${ requestScope.adPopUp }">
					<div style="margin-bottom: 30px; text-align:center;">
						<c:out value="${ adPopUp.adContent }" escapeXml="false"/>
					</div>
					</c:forEach>
		        </div>
		 </section>

</body>
</html>