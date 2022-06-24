/**
 *  SCRIPT FOR MY PAGE
 */

let mypage = {};

// job에 따라 관리자 페이지 바로가기 버튼 유무
mypage.init = function (uId, job){
	var IdCheck = document.getElementById('uId').value;
	var JobCheck = document.getElementById('job').value;
	
	if(IdCheck != "" && JobCheck == "a"){
		$('.button3').css('display', '');
	}else{
		$('.button3').css('display', 'none');
	}
}

// 모든 곳에 엔터치면 폼 submit하는 함수
function enterKey(b){
	if(window.event.keyCode == 13){
		b.click();
	}
}

// 주문내역 조회 화면으로
mypage.toPrevPage = function(){
	location.href = './user/mypage/user_mypage_orderList.jsp';
}

// 마이페이지 메인 화면으로
mypage.toMainPage = function(){
	location.href = './user/mypage/user_mypage_main.jsp';
}

// 홈화면(index)으로
mypage.toIndexPage = function(){
	location.href = '../../index_main.jsp';
}

// 관리자 페이지로
mypage.toAdminPage = function(frm){
	frm.action = '../../mypage.do?job=toAdminPage';
	frm.submit();
}

/*
// 회원정보 수정 페이지 들어가기 전 비밀번호 확인
var btnToUpdate = document.getElementById("btnToUpdate");
if(btnToUpdate != null){
	btnToUpdate.onclick = function(){
		let pwd = prompt("회원정보 수정 페이지 접속을 위해 회원님의 비밀번호를 입력해주시기 바랍니다."); // 치명적 단점: 입력 중에 암호가 화면에 보임..! 현업에서는 그런 이유로 이런 식으로 쓰지 않음.
		
		if(pwd == null){
			return;
		}
		
		let url = './student/student_modify_result.jsp';
		let frm = document.frm_student;
		frm.pwd.value = pwd;
		frm.action = url;
		frm.submit();
	}
}
*/


/* ----- 회원정보 수정 페이지 ----- */


// 마이페이지 메인화면에서 회원정보 수정 클릭시 id 넘겨서 값 받아오기
mypage.selectOneInfo = function(frm){
	frm.action = '../../mypage.do?job=selectOneInfo';
	frm.submit();
}

// 회원정보 수정 (수정 페이지에서 저장 버튼 누를 때)
mypage.updateInfo = function(frm){
	let email = frm.email.value;
	let phone = frm.phone.value;
	let birth = frm.birth.value;
	
	if(!isEmail(email)) {
		alert("이메일 확인 후 다시 입력해주세요.");
		return;
	} else if(!isPhone(phone)) {
		alert("휴대폰번호 확인 후 다시 입력해주세요.");
		return;
	} else if(!isBirth(birth)) {
		alert("생년월일 확인 후 다시 입력해주세요.");
		return;
	} else {
		alert("회원정보가 수정되었습니다.");
		let param = $(frm).serialize();
		$.post("./mypage.do?job=updateInfo", param, function(){
			location.href="./user/mypage/user_mypage_main.jsp";
		})
	}
}

// 우편번호 검색
var btnZipFind = document.getElementById('btnZipFind');
if(btnZipFind != null){	
	btnZipFind.onclick = function(){
		new daum.Postcode({
			oncomplete : function(data){
				let frm = document.frm_info_update;
				frm.zipCode.value = data.zonecode;
				frm.address1.value = data.address;
			}
		}).open();
	}
}

// 재입력 요청
$("#email").on("blur", function(){
	let email = $(this).val();
	
	if(!isEmail(email)){
		$("#emailValidation").text("이메일을 정확하게 입력해주세요.")
	} else{
		$("#emailValidation").text("")
	}
})
$("#phone").on("blur", function(){
	let phone = $(this).val();
	
	if(!isPhone(phone)){
		$("#phoneValidation").text("휴대폰 번호를 다시 확인해주세요.")
	} else{
		$("#phoneValidation").text("")
	}
})
$("#birth").on("blur", function(){
	let birth = $(this).val();
	
	if(!isBirth(birth)){
		$("#birthValidation").text("생년월일을 다시 확인해주세요.");
	} else {
		$("#birthValidation").text("");
	}
})

// 정규식으로 유효성 검사
function isEmail(email){
	let emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;	
	return emailRegExp.test(email)
}
function isPhone(phone){
	let phoneRegExp = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; 	
	return phoneRegExp.test(phone)
}

// 생년월일 검사
function isBirth(birth) {
	var year = Number(birth.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
	var month = Number(birth.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
	var day = Number(birth.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
	var today = new Date(); // 날짜 변수 선언
	var yearNow = today.getFullYear(); // 올해 연도 가져옴

	if (birth.length <=8) {
		if (1900 > year || year > yearNow){ // 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환
			return false;
		} else if (month < 1 || month > 12) {
			return false;
		} else if (day < 1 || day > 31) {
			return false;
		} else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
			return false;
		} else if (month == 2) {
			var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)); //윤년
			if (day>29 || (day==29 && !isleap)) {
				return false;
			} else {
				return true;
			} //end of if (day>29 || (day==29 && !isleap))
		} else {
			return true;
		}
	}
	else {
		return false; // 입력된 생년월일이 8자 초과
	}
}


/* ----- 비밀번호 변경 ----- */


// 마이페이지 메인화면에서 비밀번호 변경 클릭시 id 넘겨서 비밀번호 값 받아오기
mypage.selectOnePwd = function(frm){
	frm.action = '../../mypage.do?job=selectOnePwd';
	frm.submit();
}

// 비밀번호 변경 (변경 페이지에서 저장 버튼 누를 때)
mypage.updatePwd = function(frm){
	let pwd = frm.newPwd.value;
	if(!isPwd(pwd)) {
		alert("비밀번호 확인 후 다시 입력해주세요.");
		return;
	} else if(isPwd(pwd)){
		alert("회원정보가 수정되었습니다.");
		let param = $(frm).serialize();
		$.post("./mypage.do?job=updatePwd", param, function(){
			location.href="./user/mypage/user_mypage_main.jsp";
		})
	}
}

// 기존 비밀번호 확인
$("#oldPwd").on("keyup", function(pwd){
	
	var PwdCheck = document.getElementById("realOldPwd").value;
	
	if($("#oldPwd").val() == PwdCheck) { // == $("#realOldPwd").val())
		$("#checkOldPwd").text("비밀번호가 일치합니다. 하단에 새 비밀번호를 입력해주세요.");
		$("#checkOldPwd").css("color", "#00B700");
		$("#oldPwd").css("border", "1px solid #00B700");
		$("#oldPwd").css("box-shadow", "0 0 2px #00B700");
		$("#newPwd").attr("readonly",false);
		$("#pwdCheck").attr("readonly",false);
		$("#newPwd").css("background-color", "#fff");
		$("#pwdCheck").css("background-color", "#fff");
		$("#newPwd").css("color", "#000");
		$("#pwdCheck").css("color", "#000");
	} else if ($("#oldPwd").val() != PwdCheck) { // != $("#realOldPwd").val())
		$("#checkOldPwd").text("비밀번호가 일치하지 않습니다. 비밀번호를 변경하실 수 없습니다.");
		$("#checkOldPwd").css("color", "#dd3115");
		$("#oldPwd").css("border", "1px solid #dd3115");
		$("#oldPwd").css("box-shadow", "0 0 2px #dd3115");
		$("#newPwd").attr("readonly",true);
		$("#pwdCheck").attr("readonly",true);
		$("#newPwd").css("background-color", "#fec156");
		$("#newPwd").css("color", "#fff");
		$("#pwdCheck").css("background-color", "#fec156");
		$("#pwdCheck").css("color", "#fff");
	} else{
		$("#checkOldPwd").text("");
	}
})

// 정규식으로 유효성 검사
function isPwd(pwd){
	let pwdRegExp = /^[A-Za-z0-9]{8,16}$/; 	// 대소문자 영어,숫자 8~16자리
	return pwdRegExp.test(pwd);
}

// 새 비밀번호 재입력 요청
$("#newPwd").on("blur", function(){
	let pwd = $(this).val();
	
	if(!isPwd(pwd)){
		$("#pwdValidation").text("대소문자 영어, 숫자를 사용하여 8~16자리로 입력해주세요.")
	} else{
		$("#pwdValidation").text("")
	}
})

// 새 비밀번호 재입력 요청
$("#pwdCheck").on("keyup", function(){
	if($("#newPwd").val() != $("#pwdCheck").val()){
		$("#pwdCheckValidation").text("입력하신 비밀번호와 다릅니다. 비밀번호를 확인 후 다시 입력해주세요.");
		document.getElementById('btnUpdatePwd').disabled=true;
		$('#btnUpdatePwd').css('cursor','not-allowed');
	}else if($("#newPwd").val() == $("#pwdCheck").val()){
		$("#pwdCheckValidation").text("");
		document.getElementById('btnUpdatePwd').disabled=false;
		$('#btnUpdatePwd').css('cursor','pointer');
	}else {
		$("#pwdCheckValidation").text("");
		document.getElementById('btnUpdatePwd').disabled=false;
		$('#btnUpdatePwd').css('cursor','pointer');
	}
})


/* ----- 주문정보 조회 ----- */


// 마이페이지 메인화면에서 주문정보 조회 클릭시 id 넘겨서 값 받아오기
mypage.selectOrder = function(frm){
	let uId = frm.uId.value;
	frm.uId.value = uId;
	frm.action = '../../mypage.do?job=selectOrder';
	frm.submit();
}

// 조회
mypage.select = function(frm){
	frm.action = './mypage.do?job=selectOrder'; 
	frm.submit();
}

// 주문내역 상세보기 페이지로 이동
mypage.viewOrderDetail = function(index){
	let frm = $('.frm_order_list')[0];
	//let orderNo = frm.orderNo.value;
	let orderNumbers = document.querySelectorAll(".orderNo1");
	frm.orderNum.value = orderNumbers[index].value;
	frm.action = './mypage.do?job=viewOrderDetail';
	frm.submit();
}

// 페이지 이동
mypage.movePage = function(page){
	let frm = $('.frm_order_list')[0]; 
	frm.nowPage.value = page;
	frm.action = './mypage.do?job=selectOrder';
	frm.submit();
}