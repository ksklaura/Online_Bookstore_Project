<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_mypage_main</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/0dba496a80.js" crossorigin="anonymous"></script>
<link rel='stylesheet' href='../../css/user_mypage.css'>
<script src='../../js/userMypage.js'></script>

</head>
<body>
	<div id='mypage_main'>
		<h1>마이페이지</h1>
		<form name='frm_mypage_main' id='frm_mypage_main' method='post'>
			<div class='header1'>
				<div class='header2'>
					<div class='userInfo'>
						<label class='uName'>"배움에 대한 애정과 세상을 등진 외딴 곳. 책이 주는 그 모든 달콤한 평온."</label><br/>
						<label class='henry'>-헨리 워즈워스 롱펠로우-</label><br/><br/>
						<label class='welcome'>오늘도 BOOKEND와 함께 달콤한 평온 속으로 빠져볼까요?</label>
					</div>
					<div class='infoBoard-wrapper'>
						<div class='infoBoard'>
							<label>뭘 넣을지 고민중~_~</label>
						</div>
					</div>
				</div>
			</div>
			<br/>
			<div class='button1'>
				<button type='button' class='btnIcon' onclick='mypage.selectOneInfo(this.form)'><i class="fa-solid fa-id-card" id='icons'></i><label class='text1'>회원정보 수정하기</label></button>
			</div>
			<div class='button2'>
				<button type='button' class='btnIcon' onclick='mypage.selectOrder(this.form)'><i class="fa-solid fa-receipt" id='icons'></i><label class='text2'>구매내역 조회하기</label></button>
			</div>
			<br/>
			<br/>
			<input type='hidden' id='uId' name='uId' value='a001'/>
			<button type='button' class='btnToIndex' onclick='mypage.toIndexPage()'>HOME 바로가기</button>
		</form>
	</div>
</body>
</html>