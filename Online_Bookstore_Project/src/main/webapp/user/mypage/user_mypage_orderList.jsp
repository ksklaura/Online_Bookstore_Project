<%@page import="bean.Page"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_mypage_orderList</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel='stylesheet' href='./css/user_mypage.css'>
<script defer src='./js/userMypage.js'></script>

</head>
<body>
	<div id='order_list'>
		<h2>주문내역 조회</h2>
		<form name='frm_order_list' id='frm_order_list' class='frm_order_list' method="post" onsubmit='return false'>
			<input type='text' name='findStr' id='findStr' value='${param.findStr}' onkeypress='if(event.keyCode == 13){mypage.select(this.form);}'/>
			<button type='button' class='button' onclick='mypage.select(this.form)'>조회</button>
			<input type='hidden' name='nowPage' value='${param.nowPage}'/>
			<input type='hidden' name='uId' id='uId' value='${vo.uId}'/>
			<br/>
			<br/>
			<div id='lists'>
				<div class='titles'>
					<span class='no'>No.</span>
					<span class='orderNo'>주문번호</span>
					<span class='code'>도서코드</span>
					<span class='codeName'>도서명</span>
					<span class='price'>판매가</span>
					<span class='orderEa'>수량</span>
					<span class='amt'>총 금액</span>
					<span class='img'>도서 이미지</span>
					<span class='orderDate'>구매일자</span>
					<span class='paymentType'>결제방식</span>
					<span class='rName'>수령인</span>
					<span class='rZipcode'>우편번호</span>
					<span class='rAddress'>주소</span>
					<span class='rPhone'>전화번호</span>
				</div>
				
				<div class='items'>
					<c:set var='i' value='${page.startNo+1}'/> 				<%-- 제로베이스라 +1이 필요함. --%>
					<c:forEach var='vo' items='${list}' varStatus='sts'> 	<%-- 여기 list가 Servlet의 req.setAttribute("list", list); 에서 가져온 list임. requestScope.list를 줄여서 쓴 것 --%>
						<div class='item'>									<!-- onclick='mypage.viewOrderDetail(${vo.orderNo})' -->
							<span class='no'>${i}</span> 
							<span class='orderNo'>${vo.orderNo}</span>
							<span class='code'>${vo.code}</span>
							<span class='codeName'>${vo.codeName}</span>
							<span class='price'><fmt:formatNumber>${vo.price}</fmt:formatNumber></span>
							<span class='orderEa'><fmt:formatNumber>${vo.orderEa}</fmt:formatNumber></span>
							<span class='amt'><fmt:formatNumber>${vo.amt}</fmt:formatNumber></span>
							<span class='img'><img src="${vo.img}" width="100px"/></span>
							<span class='orderDate'>${vo.orderDate}</span>
							<span class='paymentType'>${vo.paymentType}</span>
							<span class='rName'>${vo.rName}</span>
							<span class='rZipcode'>${vo.rZipcode}</span>
							<span class='rAddress'>${vo.rAddress}</span>
							<span class='rPhone'>${vo.rPhone}</span>
						</div>
						<c:set var='i' value='${i=i+1}'/>
					</c:forEach>
					
				</div>
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
			<button type='button' class='btnToMain' onclick='mypage.toMainPage()'>이전 페이지</button>
			
			<c:if test='${not empty msg}'>
				<script>
					alert('${msg}');
				</script>
			</c:if>
		</form>
	</div>
	
</body>
</html>