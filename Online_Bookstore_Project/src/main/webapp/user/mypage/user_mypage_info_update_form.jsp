<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_mypage_info_update_form</title>

<!-- 다음 API 연결 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel='stylesheet' href='../../css/user_mypage.css'>
</head>
<body>
	<div id='mypage_info_update'>
		<h2>회원정보 수정</h2>
		기본 정보 입력
		<hr/>
		<form name='frm_info_update' method='post'>
		<div class="label_group">
			<label>아이디</label>
			<input type='text' name='uId' id='uId' placeholder='6~12자 사이로 소문자영문과 숫자를 조합' readonly/><br/>
			<label>※아이디는 변경이 불가합니다.</label><br/>
			<span id="uIdValidation"></span>
		</div>
			
		<div class="label_group">
			<label>비밀번호</label>
			<input type='password' name='pwd' id='pwd' placeholder='8~16자 사이로 영문과 숫자를 조합'/><br/>
			<span id="pwdValidation"></span><br/>
			<label>비밀번호 확인</label>
			<input type='password' name='pwdCheck' id='pwdCheck' placeholder='비밀번호를 한 번 더 입력해주세요.'/><br/> <!-- 두 비밀번호가 일치하지 않으면 alert -->
			<span id="pwdCheckValidation"></span><!-- 비밀번호 암호화 -->
		</div>											 
		
		<div class="label_group">
			<label>이름</label>
			<input type='text' name='uName' id='uName' readonly/><br/>
			<label>※이름 변경이 필요하신 경우, 고객센터로 문의하여 주세요.</label><br/>
			<span id="uNameValidation"></span>
		</div>
		
		<div class="label_group">
			<label>이메일주소</label>
			<input type='text' name='email' id='email' placeholder='예) bookend@naver.com'/><br/>
			<span id="emailValidation"></span>
		</div>
		
		<div class="label_group">	
			<label>휴대폰번호</label>
			<input type='text' name='phone' id='phone' placeholder='- 를 제외한 숫자만 입력해주세요.'/><br/>
			<span id="phoneValidation"></span>
		</div>
		
		<div class="label_group">
			<label>우편번호</label>
			<input type='text' name='zipCode' id='zipCode'/>
			<button type='button' id='btnZipFind'>우편번호 찾기</button><br/>
			<label>주소</label>
			<input type='text' name='address' id='address' readonly/><br/>
			<label>상세주소</label>
			<input type='text' name='addressDetail'/><br/> <!-- DB엔 address와 addressDetail 합쳐서 들어가도록 -->
		</div>
		
		<div class="label_group">
			<label>성별</label>
			<label><input type='radio' name='gender' value='M'/>남자</label>
			<label><input type='radio' name='gender' value='F'/>여자</label><br/>
		</div>
		
		<div class="label_group">
			<label>생년월일</label>
			<input type='text' name='birth' id='birth' placeholder='예)19930919'/><br/>
			<span id="birthValidation"></span>
		</div>
			
			<label></label>
				<button type='button' id='btnSave'>저장</button>
				<button type='button' id='btnCancel'>취소</button><br/>
				<input type='hidden' name='findStr' value='${param.findStr}'/> <!-- 학생정보 조회 페이지의 검색창에 썼던 내용을 그대로 학생정보 입력 페이지에서도 보여지게끔 함. -->
				<input type='hidden' name='nowPage' value='${param.nowPage}'/>
		</form>
		<!-- 회원탈퇴 버튼도 아주아주 작게 만들지? -->
	</div>
	<script src='../../js/userMypage.js'></script>
</body>
</html>