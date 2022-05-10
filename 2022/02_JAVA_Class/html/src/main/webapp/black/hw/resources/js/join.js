// 정규표현식
var idPat = /^[a-zA-Z0-9]{4,10}$/
var pwPat = /^[a-zA-Z0-9]{4,10}$/
var mailPat = /^[a-zA-Z0-9]{4,10}@[a-zA-Z]{2,10}.[a-zA-Z]{2,3}$/
var telPat = /^010-[0-9]{4}-[0-9]{4}$/


var genValue = '';
var avtValue = '';


// check avatar
$('[name="gen"]').click(function () {

    var avtv = $('[name="gen"]');

    for (var i = 0; i < avtv.length; i++) {
        if (avtv.eq(i).is(':checked')) {
            genValue = avtv.eq(i).val();
        }
    }

    if (genValue == 'F') {
        $('[name="avt"]').prop('checked', false);
        $('#avtblock1').css('display', 'none');
        $('#avtblock2').css('display', 'block');
    } else if (genValue == 'M') {
        $('[name="avt"]').prop('checked', false);
        $('#avtblock2').css('display', 'none');
        $('#avtblock1').css('display', 'block');
    }
});

// check password
$('#pwck').keyup(function () {
    $('#pwis').css('display', 'block');
    var ppw = $('#pw').val();
    var ppwck = $('#pwck').val();


    if (ppw == ppwck) {
        $('#pwis').css('color', 'blue');
        $('#pwis').html('패스워드가 일치합니다.')
    } else {
        $('#pwis').css('color', 'red');
        $('#pwis').html('패스워드가 일치하지 않습니다.')
    }
});


// btn join
$('#jbtn').click(function () {

    var pname = $('#name').val();
    var pid = $('#id').val();
    var ppw = $('#pw').val();
    var ppwck = $('#pwck').val();
    var pmail = $('#mail').val();
    var ptel = $('#tel').val();


    var idResult = idPat.test(pid);
    var pwResult = pwPat.test(ppw);
    var mailResult = mailPat.test(pmail);
    var telResult = telPat.test(ptel);


    // avatar
    var el = $('[name="avt"]');

    for (var i = 0; i < el.length; i++) {
        if (el.eq(i).is(':checked')) {
            avtValue = el.eq(i).val();

        }
    }

    if (!pname) {
        alert('이름을 입력해주세요');
        $('#name').focus();
    } else if (!pid) {
        alert('아이디를 입력해주세요');
        $('#id').focus();
    } else if (!idResult) {
        alert('잘못된 아이디입니다. 4~10 자 이내로 생성해주세요');
        $('#id').val('');
        $('#id').focus();
    } else if (!ppw) {
        alert('비밀번호를 입력해주세요');
        $('#pw').focus();
    } else if (!pwResult) {
        alert('잘못된 비밀번호입니다. 4~10 자 이내로 생성해주세요');
        $('#pw').val('');
        $('#pw').focus();
    } else if (!ppwck) {
        alert('비밀번호 확인을 입력하세요');
        $('#pwck').focus();
    } else if (ppw != ppwck) {
        alert('비밀번호가 일치하지 않습니다.');
        $('#pwck').val('');
        $('#pwck').focus();
    } else if (!pmail) {
        alert('메일을 입력해주세요');
        $('#mail').focus();
    } else if (!mailResult) {
        alert('잘못된 메일 형식입니다. 올바르게 기입해주세요.');
        $('#mail').val('');
        $('#mail').focus();
    } else if (!ptel) {
        alert('전화번호를 입력해주세요');
        $('#tel').focus();
    } else if (!telResult) {
        alert('잘못된 전화번호입니다. 010-0000-0000 형식으로 입력해주세요');
        $('#tel').val('');
        $('#tel').focus();
    } else if (!genValue) {
        alert('성별을 입력해주세요');
    } else if (!avtValue) {
        alert('아바타를 입력해주세요');
    } else {
        $('#frm').submit();
    }

    $('#frm').submit();
    /*$(document).frm.submit()*/

});





/*


// join 버튼 클릭이벤트

document.getElementById('jbtn').onclick = function () {
    /!*
        // 데이터 입력체크
        var sname = document.getElementById('name').value;
        if (!sname) {
            document.getElementById('name').focus();
            return;
        }
        var sid = document.getElementById('id').value;
        if (!sid) {
            document.getElementById('id').focus();
            return;
        }
        var spw = document.getElementById('pw').value;
        if (!spw) {
            document.getElementById('pw').focus();
            return;
        }
    *!/

var el = document.getElementsByClassName('ck');
for (var i = 0; i < el.length; i++) {
	var tmp = el[i].value;
	if (!tmp) {
		el[i].focus();
		return;
	}
}


// 정규 표현식 검사


// 제출
}
;

// reset
document.getElementById('rbtn').onclick = function () {
    document.getElementById('frm').value = '';
};




*/

