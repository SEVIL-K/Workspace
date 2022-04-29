/*
var pat1 = /^[a-z]{5}/i;

var str = 'Black pink';

var result = pat1.test(str);
var result2 = pat1.exec(str);

console.log('result : ' + result);
console.log('result2 : ' + result2);

*/



// 리셋버튼 클릭이벤트
document.getElementById('rbtn').onclick = function(){
//	document.getElementById('tid').value = '';
	var sid = document.getElementById('tid').value;
	if(sid){
		// 변수에 데이터가 채워져 있는 경우(null 또는 undefined 가 아닌 상태)
		document.getElementById('tpw').focus();
	} else {
		// sid에 데이터가 채워져 있지 않은 경우(null 또는 undefined 인 경우)
		document.getElementById('tid').focus();
	}
};

// 아이디를 입력받아서 아이디가 영문자 4글자이상 8글자 이내이면 
// 콘솔화면에 출력하고
// 형식에 맞지 않으면 입력된 내용을 지우고 
// '형식에 맞지않은 아이디입니다.' 를 출력하세요.

/*
// 로그인버튼 클릭이벤트
document.getElementById('lbtn').onclick = function(){
	var sid = document.getElementById('tid').value; // 입력데이터 꺼내고...
	
	// 정규식 패턴을 만든다.
	var pat = new RegExp('^[a-zA-Z]{4,8}$');
	
	// 검사한다.
	var result = pat.test(sid);
	
	// 결과에 따라서 처리
	if(result){
		// 패턴에 맞는 경우
		console.log('입력아이디 : ' + sid);
	} else {
		// 패턴에 맞지 않은 경우
		document.getElementById('tid').value = '';
		console.log('형식에 맞지않은 아이디입니다.');
	}
};
*/

// 로그인 버튼을 클릭하면 아이디와 비밀번호를 읽어서 
// 유효성 검사를 하고
// 검사에 통과하면 test.html 로 아이디로 비밀번호를 전달하세요.
// 통과하지 않은 경우는 입력내용을 모두 지우고 다시 입력하도록 하세요.

// 비밀번호는 첫문자는 알파벳이어야하고 
// 숫자와 알파벳으로 구성된 4글자이상 8글자 이하로 입력해야한다.

document.getElementById('lbtn').onclick = function(){
	// 할일
	// 1. 입력내용을 읽는다.
	var sid = document.getElementById('tid').value;
	var spw = document.getElementById('tpw').value;
	// 2. 검사를 한다.
	// 2-1. 패턴을 만든다.
	var idPat = /^[a-zA-Z]{4,8}$/;
	var pwPat = /^[a-zA-Z][a-zA-Z0-9]{3,7}$/;
	// 2-2. 검사를 한다.
	var idResult = idPat.test(sid);
	var pwResult = pwPat.test(spw);
	// 3. 검사결과에 대한 처리를 한다.
	if(idResult && pwResult){
		// 3-1. 통과한 경우
		// ==> test.html 로 입력내용을 전송한다.
//		location.href = 'test.html?id=' + sid + '&pw=' + spw; // GET 방식 전송

		// 데이터전송용 form 태그의 input 태그에 읽은 데이터를 입력해서 전송하세요.
		// 1. 아이디가 id, pw 인 태그에 전송데이터를 채워넣는다.
		document.getElementById('id').value = sid;
		document.getElementById('pw').value = spw;
		// 2. 폼 태그를 전송한다.
		document.getElementById('frm').submit();
	} else {
		// 3-2. 통과 못한 경우
		document.getElementById('tid').value = '';
		document.getElementById('tpw').value = '';
		document.getElementById('tid').focus();
	}
	
};











