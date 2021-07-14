<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		(function() {
			
			const successCode = "${ requestScope.successCode}";
			let successMessage = "";
			let movePath = "";
			
			 switch (successCode) {
			case "insert":
				successMessage = "등록 되었습니다.";
				movePath = "${ pageContext.servletContext.contextPath }/owner/rmlist";
				break;
			case "update":
				successMessage = "수정 되었습니다.";
				movePath = "${ pageContext.servletContext.contextPath }/owner/rmlist";
				break;
			case "cancle":
				successMessage = "등록/수정이 거절 되었습니다.";
				movePath = "${ pageContext.servletContext.contextPath }/owner/rmlist";
				break;
			case "stl":
				successMessage = "정산이 완료 되었습니다.";
				movePath = "${ pageContext.servletContext.contextPath }/sales/stlinfo?accomoNo=${accomoNo}";
				break;
			case "taxSuccess":
				successMessage = "세금계산서 발행이 완료 되었습니다.";
				movePath = "${ pageContext.servletContext.contextPath }/sales/taxrequest";
				break;
			case "stlRequestYn":
				successMessage = "세금계산서 요청 상태가 변경 되었습니다.";
				movePath = "${ pageContext.servletContext.contextPath }/sales/taxrequest";
				break;
			} 

			alert(successMessage); 
			location.replace(movePath);
		})();
	</script>

</body>
</html>