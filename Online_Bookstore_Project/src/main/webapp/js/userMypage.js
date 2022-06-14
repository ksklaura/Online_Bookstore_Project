/**
 *  SCRIPT FOR MY PAGE
 */


/*mypage.loginFirst = function(){
	if(sessionID == null || sessionID == ''){
		alert('로그인 후에 공지사항을 작성하실 수 있습니다.');
		window.location = 'index.jsp?inc=./member/user_member_login.jsp'; // 로그인 화면으로 이동! // 로그인 페이지 경로 재확인 필요
	}else{
		// 고민중..
	}
}*/

// 우편번호 검색
var btnZipFind = document.getElementById('btnZipFind');
if(btnZipFind != null){	
	btnZipFind.onclick = function(){
		new daum.Postcode({
			oncomplete : function(data){
				let frm = document.frm_student;
				frm.zipcode.value = data.zonecode;
				frm.address.value = data.address;
			}
		}).open();
	}
}


mypage.select=function(){
	frm.action = 'mypage.do?job=select';
	frm.submit();
}

// 페이지 이동
mypage.movePage = function(page){ // paging 처리하는 function
	let frm = $('.frm_order_list')[0]; 
	frm.nowPage.value = page;
	frm.action = 'mypage.do?job=select';
	frm.submit();
}