// join 버튼 클릭이벤트

document.getElementById('jbtn').onclick = function () {
    /*
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
    */

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


// reset 버튼

document.getElementById('rbtn').onclick = function () {
    document.getElementById('frm').value = '';
};