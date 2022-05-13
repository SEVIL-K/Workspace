/**
 * /resources/js/whistle/main.js
 */
 $(document).ready(function(){
	// 회원가입버튼 클릭이벤트
	$('#jbtn').click(function(){
		$(location).attr('href', '/whistle/member/join.blp');
	});

	$('#lbtn').click(function(){
		$(location).attr('href', '/whistle/member/login.blp');
	});
});
 