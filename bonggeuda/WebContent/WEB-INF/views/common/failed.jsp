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
	(function(){
		const failedCode = "${ requestScope.failedCode }";
		
		let failMessage = "";
		let movePath = "";
		
		switch(failedCode){
			case "loginFail" : 
				failMessage = "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.";
				movePath = "${ pageContext.servletContext.contextPath }/login/test";
				break;
			case "failInsertUser" : 
				failMessage = "회원가입 중 오류가 발생하였습니다. 다시 시도해주세요.";
				movePath = "${ pageContext.servletContext.contextPath }/login/check/regist";
				break;
		}

		alert(failMessage);
		
		location.replace(movePath);
	})();
	</script>

</body>
</html>