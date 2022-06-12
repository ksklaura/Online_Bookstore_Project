<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_mypage_info_update_form</title>
</head>
<body>
	<div id='mypage_info_update'>
		<h2>회원정보 수정</h2>
		기본 정보 입력
		<hr/>
		<form name='frm_info_update' method='post'>
			<label>아이디</label>
			<input type='text' name='uId' readonly/><br/>
			<label>비밀번호</label>
			<input type='password' name='pwd'/><br/>
			<label>비밀번호 확인</label>
			<input type='password' name='pwd'/><br/> <!-- 두 비밀번호가 일치하지 않으면 alert -->
			<label>이름</label>
			<input type='text' name='uName' readonly/><br/> <!-- "이름 변경이 필요하신 경우, 고객센터로 문의하여 주세요." -->
			<label>생년월일</label>
			<input type='text' name='birthDate'/><br/>
			<label>휴대폰번호</label>
			<input type='text' name='phone'/><br/>
			<label>이메일주소</label>
			<input type='text' name='email'/><br/>
			<label>우편번호</label>
			<input type='text' name='zipCode'/><br/>
			<label>주소</label>
			<input type='text' name='address'/><br/>
			<label>상세주소</label>
			<input type='text' name='addressDetail'/><br/>
			<label>성별</label>
			<label><input type='radio' name='gender' value='M'/>남자</label>
			<label><input type='radio' name='gender' value='F'/>여자</label><br/>
			
			<label></label>
				<button type='button' id='btnSave'>저장</button>
				<button type='button' id='btnCancel'>취소</button><br/>
				<input type='hidden' name='findStr' value='${param.findStr}'/> <!-- 학생정보 조회 페이지의 검색창에 썼던 내용을 그대로 학생정보 입력 페이지에서도 보여지게끔 함. -->
				<input type='hidden' name='nowPage' value='${param.nowPage}'/>
		</form>
		<!-- 회원탈퇴 버튼도 아주아주 작게 만들지? -->
	</div>
</body>
</html>