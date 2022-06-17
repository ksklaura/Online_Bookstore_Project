<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_mypage_main</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel='stylesheet' href='../../css/user_mypage.css'>
<script src='../../js/userMypage.js'></script>

</head>
<body>
	<div id='mypageMain'>
		<form name='frm_mypageMain' id='frm_mypageMain' method='post'>
			<button type='button' onclick='mypage.selectOneInfo(this.form)'>회원정보 수정</button><br/>
			<button type='button' onclick='mypage.selectOrder(this.form)'>구매내역 조회</button><br/>
			<button>장바구니 보기</button>
			<input type='text' name='uId' value='a001'/>
		</form>
	</div>
</body>
</html>