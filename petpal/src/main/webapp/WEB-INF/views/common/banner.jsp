<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<div style="position: fixed;right: 10px;top:20%; background-color: #F1FAF8; border-radius: 20px;">
                <ul>
                    <li><a id="adQnA" onclick="userCheck()" href=""><img src="${ pageContext.servletContext.contextPath }/resources/images/conversation.png" style="width: 100px; height: 100px;"></a></li>
                    <li style="text-align: center;">광고 문의</li>
                    <li><a href="${ pageContext.servletContext.contextPath }/main#question"><img src="${ pageContext.servletContext.contextPath }/resources/images/adqna.png" style="width: 100px; height: 100px;"></a></li>
                    <li style="text-align: center;">불편 문의</li>
                    <li><a id="adsubmit" onclick="userCheck()" href=""><img src="${ pageContext.servletContext.contextPath }/resources/images/clipboard.png" style="width: 100px; height: 100px;"></a></li>
                    <li style="text-align: center; margin-bottom: 20px;">광고 신청</li>
                </ul>
     </div>
     
     <c:if test="${ empty sessionScope.loginUser.code }">
	     <script>
	     	function userCheck() {
	     		alert("로그인 후 이용하실 수 있습니다.");	
	     	}
	     </script>
     </c:if>
     <c:if test="${ !empty sessionScope.loginUser.code }">
     	<script>
     		function userCheck() {
     			document.getElementById("adQnA").href="${ pageContext.servletContext.contextPath }/user/write/adQnA";
     			document.getElementById("adsubmit").href="${ pageContext.servletContext.contextPath }/user/select/adsubmit";
     		}
     </script>
     </c:if>

</body>
</html>