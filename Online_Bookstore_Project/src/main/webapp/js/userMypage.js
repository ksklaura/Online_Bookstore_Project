/**
 *  SCRIPT FOR MY PAGE
 */

/*mypage={};*/

/*mypage.loginFirst = function(){
	if(sessionID == null || sessionID == ''){
		alert('로그인 후에 공지사항을 작성하실 수 있습니다.');
		window.location = 'index.jsp?inc=./member/user_member_login.jsp'; // 로그인 화면으로 이동! // 로그인 페이지 경로 재확인 필요
	}else{
		// 고민중..
	}
}*/


(	
mypage = function(){ // 초기화면 동작할 수 있게끔
	
	let frm=$(".frm_order_list");
	frm.action='../../mypage.do';
	frm.submit();
	console.log("frm : ", frm);
}
)()

mypage.init=function(){
	console.log("init");
}
// 아이디, 비밀번호 입력 후 로그인 버튼 클릭이 아닌 엔터키를 눌렀을 경우
// 로그인 뿐 아니라 아이디 찾기, 비밀번호 찾기 등 모든 곳에 엔터만 치면 폼 submit하는 만능 함수!!
function enterKey(b){
	if(window.event.keyCode == 13){
		b.click();
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
				frm.address.value = data.address;
			}
		}).open();
	}
}


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