// javascript 방식
// home 버튼 클릭이벤트
/*
document.getElementById('hbtn').onclick = function(){
	location.href = '/whistle/';
};

// 로그인버튼 클릭이벤트
document.getElementById('lbtn').onclick = function(){
	// 할일
	// 데이터 유효성검사를 한다.
	var sid = document.frm.id.value; // name 속성값으로 접근하는 방법
	if(!sid){
		// 아이디를 꺼냈는데 꺼낸데이터가 없으면(비어있으면)
		alert('아이디가 입력되지 않았습니다.');
		document.frm.id.focus();
		return;
	}
	var spw = document.getElementById('pw').value;
	if(!spw){
		alert('비밀번호를 입력하세요!');
		document.getElementById('pw').focus();
		return;
	}
	
	// 이 행을 실행하는 경우는 아이디와 비밀번호가 입력된 상태이다.
	// 정규 표현식 검사를 한다.
	var idpat = /^[a-zA-Z0-9]{4,10}$/;
	var idResult = idpat.test(sid);
	if(!idResult){
		alert('형식에 맞지 않은 아이디입니다.');
		document.frm.id.value= '';
		document.frm.id.focus();
		return;
	}
	
	var pwpat = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#-*_$])([a-zA-Z0-9!@#-*_$]{4,10})$/;
	var pwResult = pwpat.test(spw);
	if(!pwResult){
		alert('형식에 맞지 않은 비밀번호입니다.');
		document.frm.pw.value= '';
		document.frm.pw.focus();
		return;
	}
	
	// 모든 데이터가 유효하므로 서버에 보낸다.
	document.frm.setAttribute('action', '/whistle/test/loginProc.pink');
	document.getElementById('frm').submit();
};
*/


// jquery 로 처리...
$(document).ready(function(){
	// home 버튼 클릭이벤트
	$('#hbtn').click(function(){
		$(location).attr('href', '/whistle/');
	});
	
	// 리셋버튼 클릭이벤트
	$('#rbtn').click(function(){
		$('input').val('');
	});
	
	// 로그인 버튼 클릭이벤트
	$('#lbtn').click(function(){
		// 할일
		// 데이터 유효성검사
		var tid = $('#id').val();
		if(!tid){
			alert('아이디는 필수 입력사항입니다.');
			$('#id').focus();
			return;
		}
		
		var tpw = $('#pw').val();
		if(!tpw){
			alert('비밀번호를 입력하세요.');
			$('#pw').focus();
			return;
		}
		
		// 정규 표현식 검사를 한다.
		var idpat = /^[a-zA-Z0-9]{4,10}$/;
		var idResult = idpat.test(tid);
		if(!idResult){
			alert('형식에 맞지 않은 아이디입니다.');
			$('#id').val('');
			$('#id').focus();
			return;
		}
		
		var pwpat = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#-*_$])([a-zA-Z0-9!@#-*_$]{4,10})$/;
		var pwResult = pwpat.test(tpw);
		if(!pwResult){
			alert('형식에 맞지 않은 비밀번호입니다.');
			$('#pw').val('');
			$('#pw').focus();
			return;
		}
		
		// 이 행을 실행하는 경우는 입력한 데이터가 사용가능한 데이터인 경우이므로
		$('#frm').attr('action', '/whistle/test/loginProc.pink');
		$('#frm').submit();
	});
	
	// ajax  버튼 클릭이벤트
	$('#abtn').click(function(){
		// 할일
		// 데이터 유효성검사
		var tid = $('#id').val();
		if(!tid){
			alert('아이디는 필수 입력사항입니다.');
			$('#id').focus();
			return;
		}
		
		var tpw = $('#pw').val();
		if(!tpw){
			alert('비밀번호를 입력하세요.');
			$('#pw').focus();
			return;
		}
		
		// 정규 표현식 검사를 한다.
		var idpat = /^[a-zA-Z0-9]{4,10}$/;
		var idResult = idpat.test(tid);
		if(!idResult){
			alert('형식에 맞지 않은 아이디입니다.');
			$('#id').val('');
			$('#id').focus();
			return;
		}
		
		var pwpat = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#-*_$])([a-zA-Z0-9!@#-*_$]{4,10})$/;
		var pwResult = pwpat.test(tpw);
		if(!pwResult){
			alert('형식에 맞지 않은 비밀번호입니다.');
			$('#pw').val('');
			$('#pw').focus();
			return;
		}
		
		// 데이터가 유효하므로 폼을 비동기 통신으로 전송한다.
		$.ajax({
			url: '/whistle/test/loginAjax.pink',
			type: 'post',
			dataType: 'json',
			data: {
				id: tid,
				pw: tpw
			},
			success: function(obj){
				// var obj = {"result": "OK"} 또는 var obj = {"result": "NO"}
				 var result = obj.result;
				 
				 if(result == 'OK'){
					// 로그인 처리해줘야하는 경우
					alert(tid + ' 회원님은 로그인 처리되었습니다.');
					// 요청을 새롭게 만든다.
					$(location).attr('href', '/whistle/');
				} else {
					// 다시 로그인해야 하는 경우
					alert('로그인에 실패했습니다. 다시 입력하세요!');
					// 입력태그의 내용 모두 지우고
					document.frm.reset();
					$('#id').focus();
				}
			},
			error: function(){
				alert('### 통신실패 ###');
			}
		});
	});
});





