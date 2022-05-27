$(document).ready(function(){
    /* 페이지 버튼 클릭이벤트 처리 */
    $('.pbtn').click(function(){
        // 페이지번호 읽고
        var pno = $(this).attr('id');
        // 페이지 번호 셋팅하고
        $('#nowPage').val(pno);
        // 폼 태그 전송
        $('#frm').submit();
    });

    $('.fest_title.w3-button').click(function () {
        var fno = $(this).attr('id');
        $('#fno').val(fno);
        $('#frm').attr('action','/festival/info/finfodetail.fes');
        $('#frm').submit();
    });

    $('#searchbtn').click(function () {
        var str = $('#searchtxt').val();
        $('#schstr').val(str);
        $('#frm').submit();
    });

/*
    1. asdf 검색
    2. 단어 넘겨주고
    3. 단어를 sql에 넣어서 내놓으라고 하고
    4. 받아온걸 뿌려주고
    */
});
