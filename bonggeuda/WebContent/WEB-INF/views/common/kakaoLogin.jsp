<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="js.bootstrap.js"></script>
<script src="https://api.jquery.com/jQuery.ajax"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

	var walletAddress;
	var totalReceived;
	var Key;
	var txIDarray = null;
	var txId = null;
	
	function api(code) {
		var grant_type = "authorization_code";
		var client_id = "0e7b4b3a3265b6903de2c662f14dacc2";
		var redirect_uri = "http://localhost:8989/bonggeuda/login/guest";
		var code = code;
		
		$.post("https://kauth.kakao.com/oauth/token", {grant_type:grant_type, client_id:client_id, redirect_uri:redirect_uri, code:code}),
		
		var access_token = data['access_token']
		$('body').append(access_token+'<br>');
		$('body').append('access_token : success | Loading...<br> <div class"loading" align="center">');
		
		tokenFunction(access_token);
	}
	

</script>




<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>