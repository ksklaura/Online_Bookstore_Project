<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_mypage_orderList</title>
<link rel='stylesheet' href='../../css/user_mypage.css'>

</head>
<body>
	<div id='order_list'>
		<form name='frm_order_list' id='frm_order_list' class='frm_order_list' onsubmit='return false'>
			<input type='text' name='findStr' id='findStr' value='${param.findStr}' onkeypress='if(event.keyCode == 13){mypage.select(this.form);}'/>
			<button type='button' class='button' onclick='mypage.select(this.form)'>조회</button>
			<input type='hidden' name='nowPage' value='${param.nowPage}'/>
			<input type='hidden' name='orderNo'/>
		</form>
		<br/>
		
		<div class='titles'>
			<span class='no'>No.</span>
			<span class='orderNo'>주문번호</span>
			<span class='bookCode'>도서코드</span>
			<span class='bookTitle'>도서명</span>
			<span class='price'>판매가</span>
			<span class='ea'>수량</span>
			<span class='amt'>총 금액</span>
			<span class='bookImage'>도서 이미지</span>
			<span class='orderDate'>구매일자</span>
			<span class='paymentType'>결제방식</span>
			<span class='zipCode'>우편번호</span>
			<span class='address'>주소</span>
			<span class='phone'>전화번호</span>
			<!-- <span class='shippingStatus'>배송상황</span> -->
		</div>
		
		<div class='items'>
			<c:set var='i' value='${page.startNo+1}'/> <%-- 제로베이스라 +1이 필요함. --%>
			<c:set var='pos' value='0'/> <%-- 항상 0부터 시작 --%>
										 <%-- 굳이 순번 i를 쓰지 않고 pos를 생성한 이유: 순번은 페이지가 넘어가든 말든 제품의 갯수만큼 숫자가 늘어나는데, 
										      pos는 다음 페이지로 넘어가면 다시 0부터 시작함. 1페이지에 1~30까지라면 2페이지에서 31부터 시작이 아닌 0부터 시작 --%>
			<c:forEach var='vo' items='${list}'> <%-- 여기 list가 Servlet의 req.setAttribute("list", list); 에서 가져온 list임. requestScope.list를 줄여서 쓴 것 --%>
				<div class='item' onclick='mypage.view(${pos}, "${vo.orderNumber}")'> <%--큰따옴표가 붙는 건 vo로 가공완료된 값들이고 따옴표가 붙지 않는 건 여기 list 페이지에서 직접 만든 자체생산이라서로 추정됨. --%>
					<span class='no'>${i}</span> 
					<span class='orderNo'>${vo.orderNo}</span>
					<span class='uId'>${vo.uId}</span>
					<span class='receiver'>${vo.receiver}</span>
					<span class='bookCode'>${vo.bookCode}</span>
					<span class='bookTitle'>${vo.bookTitle}</span>
					<span class='price'>${vo.price}</span>
					<span class='ea'>${vo.ea}</span>
					<span class='amt'>${vo.amt}</span>
					<span class='bookImage'>${vo.bookImage}</span>
					<span class='orderDate'>${vo.orderDate}</span>
					<span class='paymentType'>${vo.paymentType}</span>
					<span class='zipCode'>${vo.zipCode}</span>
					<span class='address'>${vo.address}</span>
					<span class='phone'>${vo.phone}</span>
					<!-- <span class='shippingStatus'>${vo.shippingStatus}</span> -->
				</div>
				<c:set var='i' value='${i=i+1}'/>
				<c:set var='pos' value='${pos=pos+1}'/>
			</c:forEach>
		</div>
		
		<div class='paging'>
			<c:if test='${page.startPage>1}'>
				<button type='button' onclick='mypage.movePage(1)'>처음</button>
				<button type='button' onclick='mypage.movePage(${page.startPage-1})'>이전</button>
			</c:if>
			
			<c:forEach var='i' begin='${page.startPage}' end='${page.endPage}'>
				<button type='button' onclick='mypage.movePage(${i})'>${i}</button>
			</c:forEach>
			
			<c:if test='${page.totPage>page.endPage}'>
				<button type='button' onclick='mypage.movePage(${page.endPage+1})'>다음</button>
				<button type='button' id='btnLastPage' onclick='mypage.movePage(${page.totPage})'>끝</button>
			</c:if>
		</div>
		
		<c:if test='${not empty msg}'>
			<script>
				alert('${msg}');
			</script>
		</c:if>
	</div>
</body>
</html>