/*
var pat1 = /^[a-z]{5}/i;

var str = 'Black Pink';

var result = pat1.test(str);
var result2 = pat1.exec(str);

console.log('relust = ' + result);
console.log('result2 = ' + result2);

*/

/*

아이디를 입력받아서 아이디가 영문자 8글자 이내이면
콘솔화면에 출력하고
형식에 맞지 않으면 입력된 내용을 지우고
'형식에 맞지 않는 아이디입니다' 를 출력하세요
*/

// 리셋버튼 클릭이벤트
document.getElementById('rbtn').onclick = function () {
    document.getElementById('id').value = '';
};


// 로그인버튼 클릭이벤트
document.getElementById('lbtn').onclick = function () {
    var sid = document.getElementById('id').value;

    var pat = new RegExp('^[a-zA-Z]{4, 8}$');

    var result = pat.test(sid);

    if (result) {
        // 패턴에 맞는 경우
        
    } else {
        // 패턴에 맞지 않은 경우

    }
};