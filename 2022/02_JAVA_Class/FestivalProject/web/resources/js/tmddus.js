$(document).ready(function() {
	$('#lbtn').click(function() {
		var sid = $('#id').val();
		var spw = $('#pw').val();
		if(!sid) {
			$('#id').focus();
			return;
		}
		if(!spw) {
			$('#pw').focus();
			return;
		}
		$('#frm').attr('action', '/festival/member/loginProc.fes');
		$('#frm').submit();
	});
	$('#logoutbtn').click(function() {
		$(location).attr('href', '/festival/member/logoutProc.fes');
	});
	$('#backbtn').click(function() {
		window.history.back();
	});
	$('#jbtn').click(function() {
		var el = $('.lab');
		for(var i=0; i<el.length; i++) {
			if(!(el.eq(i).val())) {
				el.eq(i).focus();
				return;
			}
		}
		if(!($('input:radio[name=gen]').is(':checked'))) {
			alert('성별을 체크해주세요');
			return;
		}
		var namepat = /^{0, 10}$/;
		var idpat = /^[a-zA-Z0-9]{5,20}$/;
		var pwpat = /^[a-zA-Z0-9]{5,20}$/;
		
		var test = $('#birth').val();
		alert(test);
		
		
		// 정규표현식 검사
		$('#frm').attr('action', '/festival/member/joinProc.fes');
		$('#frm').submit();
	});
	
	$('#rwritebtn').click(function() {
		$(location).attr('href', '/festival/review/rboardWrite.fes');
	});
	
	$('#reditbtn').click(function() {
		$(location).attr('href', '/festival/review/rboardEdit.fes');
	})
});