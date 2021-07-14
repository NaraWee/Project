window.onload = function() {
	
	if(document.getElementById("mypage")) {
		
		const $mypage = document.getElementById("mypage");
		$mypage.onclick = function() {
			
			location.href = "/bonggeuda/owner/mypage";
		}
	}
	
	if(document.getElementById("registration1")) {
		
		const $mypage = document.getElementById("registration1");
		$mypage.onclick = function() {
			
			location.href = "/bonggeuda/registration1";
		}
	}
	
	if(document.getElementById("roomManagement")) {
		
		const $roomManagement = document.getElementById("roomManagement");
		$roomManagement.onclick = function() {
			
			location.href = "/bonggeuda/owner/managementRoom";
		}
	}
}