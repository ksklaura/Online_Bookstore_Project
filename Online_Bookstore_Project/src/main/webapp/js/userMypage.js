/**
 *  SCRIPT FOR MY PAGE
 */

mypage = {};

/*
	// 로그인 후 마이페이지 접속 가능
	mypage.loginFirst = function(){
		if(sessionID == null || sessionID == ''){
			alert('로그인 후에 마이페이지를 확인하실 수 있습니다.');
			window.location = 'index.jsp?inc=./member/user_member_login.jsp'; // 로그인 화면으로 이동! // 로그인 페이지 경로 재확인 필요
		}else{
			// 고민중..
		}
}*/


/*(	
mypage = function(frm){ // 초기화면 동작할 수 있게끔
	
	/*let frm=$(".frm_order_list");
	frm.action='../../mypage.do';
	frm.submit();
	console.log("frm : ", frm);*/
	
	/*$('.frm_order_list').load('../../mypage.do');*/
	
	/*$.post('mypage.do?job=select');*/
	
	/*let orderNo = frm.orderNo.value;
	let bookCode = frm.bookCode.value;
	let bookTitle = frm.bookTitle.value;
	let price = frm.price.value;
	let ea = frm.ea.value;
	let amt = frm.amt.value;
	let bookImage = frm.bookImage.value;
	let orderDate = frm.orderDate.value;
	let paymentType = frm.paymentType.value;
	let zipCode = frm.zipCode.value;
	let address = frm.address.value;
	let phone = frm.phone.value;
	
	let param = $(frm).serialize();
	$.post("../../mypage.do?job=select", param)
}
)()*/

/*mypage.init=function(){
	console.log("init");
}*/

// 모든 곳에 엔터만 치면 폼 submit하는 만능 함수
function enterKey(b){
	if(window.event.keyCode == 13){
		b.click();
	}
}

// 마이페이지 메인 화면으로
mypage.toMainPage = function(){
	location.href = 'user_mypage_main.jsp';
}


/* ----- 회원정보 수정 페이지 ----- */


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

$("#pwd").on("blur", function(){
	let pwd = $(this).val();
	
	if(!isPwd(pwd)){
		$("#pwdValidation").text("대소문자 영어, 숫자를 사용하여 8~16자리로 입력해주세요.")
	} else{
		$("#pwdValidation").text("")
	}
})

$("#email").on("blur", function(){
	let email = $(this).val();
	
	if(!isEmail(email)){
		$("#emailValidation").text("이메일을 정확하게 입력해주세요.")
	} else{
		$("#emailValidation").text("")
		// 중복 테스트
		$("#emailValidation").load("../../mypage.do?job=memberEmailValidation", "email="+email);
	}
})

$("#phone").on("blur", function(){
	let phone = $(this).val();
	
	if(!isPhone(phone)){
		$("#phoneValidation").text("휴대폰 번호를 다시 확인해주세요.")
	} else{
		$("#phoneValidation").text("")
		// 중복 테스트
		$("#phoneValidation").load("../../mypage.do?job=memberPhoneValidation", "phone="+phone);
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

$("#pwdCheck").on("keyup", function(){
	if($("#pwd").val() != $("#pwdCheck").val()){
		$("#pwdCheckValidation").text("비밀번호를 확인해주세요.");
	} else{
		$("#pwdCheckValidation").text("");
	}
})

// 정규식으로 유효성 검사

function isPwd(pwd){
	let pwdRegExp = /^[A-Za-z0-9]{8,16}$/; 	// 대소문자 영어,숫자 8~16자리
	return pwdRegExp.test(pwd);
}

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

// 회원정보 수정 (수정 페이지에서 저장 버튼 누를 때)

mypage.updateInfo = function(frm){
	let uId = frm.uId.value;
	let pwd = frm.pwd.value;
	let uName = frm.uName.value;
	let email = frm.email.value;
	let phone = frm.phone.value;
	let birth = frm.birth.value;
		
	
	if(!isPwd(pwd)) {
		alert("비밀번호 확인 후 다시 입력해주세요.");
		return
	} else if(!isEmail(email)) {
		alert("이메일 확인 후 다시 입력해주세요.");
		return
	} else if(!isPhone(phone)) {
		alert("휴대폰번호 확인 후 다시 입력해주세요.");
		return
	} else if(!isBirth(birth)) {
		alert("생년월일 확인 후 다시 입력해주세요.");
		return
	} else {
		let param = $(frm).serialize();
		$.post("../../mypage.do?job=update", param, function(){
			location.href = "user_mypage_main.jsp"
			alert("회원정보가 수정되었습니다.");
		});
	}
}


/* ----- 주문정보 조회 ----- */

mypage.select=function(){
	let frm = $('.frm_order_list')[0]; 					// frm값들을 배열로 만들고 배열의 0번째 행에 frm을 넣는 것.
	frm.nowPage.value=1;			   					// 0번째 행에 들어간 frm 값들 중 nowPage 값은 1임.
	// var param = $('.frm_order_list').serializeArray();  // param이라는 변수 값을 만들어 그 안에 frm값을 배열형태로 집어넣음.
	// $.post('mypage.do?job=select', param);	   			// (findStr값과 nowPage값을 서블릿으로 넘김.) servlet으로 고고하여 servlet으로부터 다시 전달받은 값을 load
	$.post('mypage.do?job=select');
	
	/*
	frm.action = 'mypage.do?job=select';
	frm.submit();
	*/
}

// 페이지 이동
mypage.movePage = function(page){ // paging 처리하는 function
	let frm = $('.frm_order_list')[0]; 
	frm.nowPage.value = page;
	frm.action = 'mypage.do?job=select';
	frm.submit();
}