$(document).ready(function() {
	// 로그인
	$('#loginbtn').click(function() {
		$('#loginbtn').attr('href', '/festival/member/login.fes');
	});
	// 회원가입
	$('#joinbtn').click(function() {
		$('#joinbtn').attr('href', '/festival/member/join.fes');
	});
	// 축제정보
	$('#infobtn').click(function() {
		$('#infobtn').attr('href', '/festival/info/finfo.fes');
	})
	// 리뷰게시판
	$('#boardbtn').click(function() {
		$('#boardbtn').attr('href', '/festival/review/rboard.fes');
	});
	// 로고클릭
	$('#logo').click(function() {
		$('#logo').attr('href', '/festival/');
	});
	$('#mybtn').click(function() {
		$('#mybtn').attr('href', '/festival/mypage/mypage.fes');
	})
});