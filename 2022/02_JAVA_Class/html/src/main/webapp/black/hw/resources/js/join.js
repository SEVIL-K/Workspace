// join 버튼 클릭이벤트
document.getElementById('jbtn').onclick = function () {
    // 데이터 입력체크
    var sname = document.getElementById('name').value;
    if (!sname) {
        document.getElementById('name').focus();
        return;
    }
    var sid = document.getElementById('id').value;
    if (!sname) {
        document.getElementById('id').focus();
        return;
    }
    var spw = document.getElementById('pw').value;
    if (!sname) {
        document.getElementById('pw').focus();
        return;
    }
};