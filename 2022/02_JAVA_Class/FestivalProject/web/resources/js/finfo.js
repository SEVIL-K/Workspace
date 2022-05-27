/*
    작성자 : 윤한기
    작성일 : 22-05-22
 */

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
});
