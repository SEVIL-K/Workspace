// join.html 에서 전송한 데이터를 
// 페이지에 h1 태그로 추가해서 보여주세요.
var param = location.search.substring(1);
// 한글 깨짐 처리...
param = decodeURIComponent(param);
var arr = param.split('&');
/*
param : 'id=jennie&pw=j12345&name=제니'

==> 문자열 배열로 변환
a rr : ['id=jennie', 'pw=j12345', 'name=제니']

==>
tmp : ['id', 'jennie']  ['pw', 'j12345']   ['name', '제니']
*/
var data = {};
var key = [];

for(var i = 0 ; i < arr.length; i++ ){
	var tmp = arr[i].split('=');
	key[i] = tmp[0];
	data[tmp[0]] = tmp[1];
}

for(var i = 0 ; i < arr.length ; i++ ){
	document.write('<h1 class="w3-center w3-padding w3-blue">' + key[i] + ' : '+ data[key[i]]+ '</h1>');
}
	