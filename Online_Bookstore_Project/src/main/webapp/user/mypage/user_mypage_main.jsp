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
			<input type='hidden' id='job' name='job' value='a'/> <!-- ${vo.job} -->
			<input type='hidden' id='uId' name='uId' value='a001'/> <!-- ${vo.uId} -->
			<div class='header1'>
				<div class='header2'>
					<div class='userInfo'>
						<label class='wisewords'>"배움에 대한 애정과 세상을 등진 외딴 곳. 책이 주는 그 모든 달콤한 평온."</label><br/>
						<label class='henry'>-헨리 워즈워스 롱펠로우-</label><br/><br/>
						<label class='welcome'>오늘도 BOOKEND와 함께 달콤한 평온 속으로 빠져볼까요?</label>
					</div>
					<div class='infoBoard-wrapper'>
						<div class='infoBoard'>
							<div class='infoBoards'>
								<label class='infoBoardName'>이지은</label> 님, 환영합니다.<br/><!-- '${vo.uName}' -->
								회원정보와 주문내역을 확인해보세요.
							</div>
						</div>
					</div>
				</div>
			</div>
			<br/>
			<div class='button1'>
				<button type='button' class='btnIcon' id='btnToUpdate' onclick='mypage.selectOneInfo(this.form)'><i class="fa-solid fa-id-card" id='icons'></i><label class='text1'>회원정보 수정하기</label></button>
			</div>
			<div class='button1_2'>
				<button type='button' class='btnIcon' onclick='mypage.selectOnePwd(this.form)'><i class="fa-solid fa-key" id='icons'></i><label class='text1_2'>비밀번호 변경하기</label></button>
			</div>
			<div class='button2'>
				<button type='button' class='btnIcon' onclick='mypage.selectOrder(this.form)'><i class="fa-solid fa-receipt" id='icons'></i><label class='text2'>구매내역 조회하기</label></button>
			</div>
			<div class='button3'>
				<button type='button' class='btnIcon' id='btnToAdmin' onclick='mypage.toAdminPage(this.form)'><i class="fa-solid fa-screwdriver-wrench"></i><label class='text3'>관리자 페이지 바로가기</label></button>
			</div>
			<br/>
			<br/>
			<button type='button' class='btnToIndex' onclick='mypage.toIndexPage()'>HOME 바로가기</button>
		</form>
	</div>
	<script>
		mypage.init();
	</script>
</body>
</html>