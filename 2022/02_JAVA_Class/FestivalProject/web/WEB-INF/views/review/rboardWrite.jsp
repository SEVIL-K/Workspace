<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script language = "javascript">  // 자바 스크립트 시작

function writeCheck()
  {
   var form = document.writeform;
   
   
   if( !form.title.value )
    {
     alert( "제목을 적어주세요" );
     form.title.focus();
     return;
    }
   
   if( !form.name.value )   // form 에 있는 name 값이 없을 때
   {
    alert( "이름을 적어주세요" ); // 경고창 띄움
    form.name.focus();   // form 에 있는 name 위치로 이동
    return;
   }
   
   if( !form.starpoint.value )
   {
    alert( "별점을 평가해 주세요" );
    return;
   }

 
  if( !form.memo.value )
   {
    alert( "내용을 적어주세요" );
    form.memo.focus();
    return;
   }
 
  form.submit();
  }
 </script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 
 <script type="text/javascript"
	src="/FestivalProject/resources/js/jquery-3.6.0.min.js"></script>
	
	
 <title>게시판</title>
 
 
 
<style type="text/css">


.starpoint_wrap{display:inline-block;}
.starpoint_box{position:relative;background:url(https://hsecode.github.io/images_codepen/codepen_sp_star.png) 0 0 no-repeat;font-size:0;}
.starpoint_box .starpoint_bg{display:block;position:absolute;top:0;left:0;height:18px;background:url(https://hsecode.github.io/images_codepen/codepen_sp_star.png) 0 -20px no-repeat;pointer-events:none;}
.starpoint_box .label_star{display:inline-block;width:10px;height:18px;box-sizing:border-box;}
.starpoint_box .star_radio{opacity:0;width:0;height:0;position:absolute;}
.starpoint_box .star_radio:nth-of-type(1):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(1):checked ~ .starpoint_bg{width:10%;}
.starpoint_box .star_radio:nth-of-type(2):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(2):checked ~ .starpoint_bg{width:20%;}
.starpoint_box .star_radio:nth-of-type(3):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(3):checked ~ .starpoint_bg{width:30%;}
.starpoint_box .star_radio:nth-of-type(4):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(4):checked ~ .starpoint_bg{width:40%;}
.starpoint_box .star_radio:nth-of-type(5):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(5):checked ~ .starpoint_bg{width:50%;}
.starpoint_box .star_radio:nth-of-type(6):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(6):checked ~ .starpoint_bg{width:60%;}
.starpoint_box .star_radio:nth-of-type(7):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(7):checked ~ .starpoint_bg{width:70%;}
.starpoint_box .star_radio:nth-of-type(8):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(8):checked ~ .starpoint_bg{width:80%;}
.starpoint_box .star_radio:nth-of-type(9):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(9):checked ~ .starpoint_bg{width:90%;}
.starpoint_box .star_radio:nth-of-type(10):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(10):checked ~ .starpoint_bg{width:100%;}

.blind{position:absolute;clip:rect(0 0 0 0);margin:-1px;width:1px;height: 1px;overflow:hidden;}

<!-- 검색창css -->
<style type="text/css">
.logo {
	margin: 0px;
	padding: 0px;
}

body {
	margin: 0;
	padding: 0;
	font-family: "Montserrat";
}

.searchbox {
	width: 90%;
	margin: 10px auto;
}

.header {
	background: gray;
	overflow: hidden;
	padding: 20px;
	text-align: center;
}

.header h1 {
	text-transform: uppercase;
	color: white;
	margin: 0;
	margin-bottom: 8px;
}

#value {
	border: none;
	background: lightgray;
	padding: 6px;
	font-size: 18px;
	width: 80%;
	border-radius: 6px;
	color: white;
}

#value:focus {
	outline: none;
}

.searchcontainer {
	background: lightgray;
	padding: 1%;
	display: none;
}

.item {
	margin: 3% 0px;
	display: flex;
	align-items: center;
}

.icon {
	width: 25px;
	height: 25px;
	background: #E0D3B6;
	color: white;
	font-size: 15px;
	text-align: center;
	line-height: 25px;
	border-radius: 50%;
	margin-right: 8px;
}

.name {
	font-size: 17px;
	font-weight: 470;
	color: #333;
}

</style>


 
 </head>
 <body>
<table>
<form name=writeform method=post action="write_ok.jsp">
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      <td>글쓰기</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input name="title" size="50" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      
      <td align="center">제목</td>
      <td class="searchbox">
			<input onkeyup="filter()" type="text" id="value"
				placeholder="축제이름으로 검색하기">
		<div class="searchcontainer" id="searchlist">

			<div class="item">
				<span class="icon">1</span> <span class="name"><a href="http://stackoverflow.com">서울 한강축제</a></span>
			</div>

			<div class="item">
				<span class="icon">2</span> <span class="name">광주 비엔날레</span>
			</div>

			<div class="item">
				<span class="icon">3</span> <span class="name">대구 컬러풀</span>
			</div>

			<div class="item">
				<span class="icon">4</span> <span class="name">부산 다이나믹</span>
			</div>

			<div class="item">
				<span class="icon">5</span> <span class="name">인천 돌핀스</span>
			</div>

			<div class="item">
				<span class="icon">6</span> <span class="name">강릉 기행</span>
			</div>

			<div class="item">
				<span class="icon">7</span> <span class="name">상주 곶감</span>
			</div>

			<div class="item">
				<span class="icon">8</span> <span class="name">제주 하르방</span>
			</div>

			<div class="item">
				<span class="icon">9</span> <span class="name">천안 버드나무</span>
			</div>

			<div class="item">
				<span class="icon">10</span> <span class="name">울릉 호박엿</span>
			</div>
		</div>
	</td>
      
      
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
      
      
      
    <tr>
      <td>&nbsp;</td>
      <td align="center">별점</td>
      <td>
      
      
    

<div class="starpoint_wrap">
  <div class="starpoint_box">
    <label for="starpoint_1" class="label_star" title="0.5"><span class="blind">0.5점</span></label>
    <label for="starpoint_2" class="label_star" title="1"><span class="blind">1점</span></label>
    <label for="starpoint_3" class="label_star" title="1.5"><span class="blind">1.5점</span></label>
    <label for="starpoint_4" class="label_star" title="2"><span class="blind">2점</span></label>
    <label for="starpoint_5" class="label_star" title="2.5"><span class="blind">2.5점</span></label>
    <label for="starpoint_6" class="label_star" title="3"><span class="blind">3점</span></label>
    <label for="starpoint_7" class="label_star" title="3.5"><span class="blind">3.5점</span></label>
    <label for="starpoint_8" class="label_star" title="4"><span class="blind">4점</span></label>
    <label for="starpoint_9" class="label_star" title="4.5"><span class="blind">4.5점</span></label>
    <label for="starpoint_10" class="label_star" title="5"><span class="blind">5점</span></label>
    <input type="radio" name="starpoint" id="starpoint_1" class="star_radio">
    <input type="radio" name="starpoint" id="starpoint_2" class="star_radio">
    <input type="radio" name="starpoint" id="starpoint_3" class="star_radio">
    <input type="radio" name="starpoint" id="starpoint_4" class="star_radio">
    <input type="radio" name="starpoint" id="starpoint_5" class="star_radio">
    <input type="radio" name="starpoint" id="starpoint_6" class="star_radio">
    <input type="radio" name="starpoint" id="starpoint_7" class="star_radio">
    <input type="radio" name="starpoint" id="starpoint_8" class="star_radio">
    <input type="radio" name="starpoint" id="starpoint_9" class="star_radio">
    <input type="radio" name="starpoint" id="starpoint_10" class="star_radio">
    <span class="starpoint_bg"></span>
  </div>
</div>




</td>
      <td>&nbsp;</td>
     </tr>
     
     
     
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     
     
  
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name="memo" cols="50" rows="13"></textarea></td>
      <td>&nbsp;</td>
     </tr>
     
     
     <tr>
      <td>&nbsp;</td>
      <td align="center">첨부</td>
      
      
      <td>
      <form method="post" action="upload" enctype="multipart/form-data">

  <div>
   사진선택<input type="file" name="file" accept="image/*">
  </div>  
  <div>
    동영상선택<input type="file" name="file" accept="video/*">
  </div>

</form>
      
      </td>
      
      
      
      <td>&nbsp;</td>
     </tr>
     
     
     
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type=button value="등록" OnClick="javascript:writeCheck();">
       <input type=button value="취소" OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
  </form>
 </table>
 
 
 
 
 
 
 

	<!-- 검색스크립트 -->
	<script type="text/javascript">
	
	$("#value").click(function() {
		$("#searchlist").fadeIn(200).css("display", "block");
	})
	
	
	$("#value").focusout(function() {
		$("#searchlist").css("display", "none");
	})
	
	
	
      function filter(){

        var value, name, item, i;

        value = document.getElementById("value").value.toUpperCase();
        item = document.getElementsByClassName("item");


        for(i=0;i<item.length;i++){
          name = item[i].getElementsByClassName("name");
          if(name[0].innerHTML.toUpperCase().indexOf(value) > -1){
            item[i].style.display = "flex";
          }else{
            item[i].style.display = "none";
          }
        }
      }
</script>
 
 
 
 
 
 
</body>
 </html>
