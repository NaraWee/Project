<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 상세 페이지</title>
<style>
.table>tr>td{
	text-align: center;
}
</style>
<script src="${ pageContext.servletContext.contextPath }/ckeditor/ckeditor.js"></script>
	
</head>
<body>
	<jsp:include page="../../admin/common/header.jsp"></jsp:include> 
	
	<div class="row">
	    <div class="col-md-2"></div>
	    	<div class="col-md-8">
		        <div class="head_title text-left fix">
			 			<p role="presentation" style="font-weight:800; font-size:25px; color:black; margin-top:10px; height:30px;">뉴스레터 상세보기</p>
			 			                               <a href="${ pageContext.servletContext.contextPath }/views/admin/main/newsletterList.jsp"><img src="${ pageContext.servletContext.contextPath }/resources/images/goback.png" 
                               			style="width:40px;height:42px; margin-right:30px; margin-top:-50px; float:right;"></a>
			 			<hr>
			 			
                    </div>	
			        <form action="">
					
					<span><img onclick="location.href=''" src="${ pageContext.servletContext.contextPath }/resources/images/edit-button.png" style="width:50px; float: right; cursor:pointer; margin-right:20px"></span>
						
			         <img alt="뉴스레터" src="${ pageContext.servletContext.contextPath }/resources/images/unnamed.gif" style="margin-left: 20%;">
			         <img alt="뉴스레터" src="${ pageContext.servletContext.contextPath }/resources/images/newslettersample.gif" style="margin-top:2px; margin-left: 20%;">

			        </form>
		    </div>
		</div>




	<jsp:include page="../../admin/common/footer.jsp"></jsp:include> 
	
	</body>
</html>