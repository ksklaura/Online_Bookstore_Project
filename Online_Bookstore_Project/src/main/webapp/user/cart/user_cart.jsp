<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_cart</title>
</head>
<body>
	<div id='cart'>
		<h2>장바구니</h2>
		
		<div class="container" style="text-align: center;">

			<h3>Cart List</h3>
			<table class="table cart_table n-cart-table">
				<colgroup>
					<col width="5%">
					<col width="4%">
					<col width="20%">
					<col width="5%">
					<col width="16%">
					<col width="7%">
					<col width="9%">
					<col width="12%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col" style="cursor: pointer"><input type="checkbox" class="chk_all" id="chk_all" checked=""></th>
						<th scope="col">상품명(옵션)</th>
						<th scope="col">판매가</th>
						<th scope="col">수량</th>
						<th scope="col">주문금액<br></th>
						<th scope="col">주문관리</th>
						<th scope="col">배송</th>
					</tr>
				</thead>
				<tbody>

					<tr class="cart-group has_gift">
						<td colspan="9" class="cart_cont">
							<table class="table_basic cart_table">
								<colgroup>
									<col width="5%">
									<col width="4%">
									<col width="8%">
									<col width="20%">
									<col width="5%">
									<col width="16%">
									<col width="7%">
									<col width="9%">
									<col width="12%">
								</colgroup>
								<tbody>
									<c:forEach items="${cart_list}" var="cvo">
										<tr class="cart_list_no">
											<td>1</td>
											<td><input type="checkbox" class="checked_cart" name="cart_no" value="${cvo.cart_number}" checked="checked"></td>
											<td>
												<div class="connect_img">
													<a href=# class="img-block"> <img src="//image.msscdn.net/images/goods_img/20200820/1557658/1557658_2_62.jpg"
														alt="디스이즈네버댓(THISISNEVERTHAT) INTL. Logo Crewneck Black">
													</a>
												</div>
											</td>
											<td>
												<div class="article_info connect_info">
													<p class="txt_brand"></p>
													<p class="list_info ">
														<a href="/app/goods/1557658/0"> [디스이즈네버댓] INTL. Logo Crewneck Black </a>
													</p>
													<p class="txt_option">옵션: M
												</div>
											</td>
											<td class="td_price">${cvo.cart_price}</td>
											<td>
												<!-- 수량 -->
												<div class="n-input-amount">
													<div class="form-group">
														<select class="form-control" id="exampleSelect1">
															<option>1</option>
															<option>2</option>
															<option>3</option>
															<option>4</option>
															<option>5</option>
														</select>
													</div>
												</div>
											</td>
											<td>44,400<br>
											</td>
											<td><a href=# class="plain-btn btn">삭제하기</a></td>
											<td>택배 배송<br>
												<p>2,500</p>
											</td>
										</tr>
										<tr class="cart_list_no">
											<td>2</td>
											<td><input type="checkbox" class="checked_cart" name="cart_no" value="521779327" checked="checked"></td>
											<td>
												<div class="connect_img">
													<a href=# class="img-block"> <img src="//image.msscdn.net/images/goods_img/20200820/1557658/1557658_2_62.jpg"
														alt="디스이즈네버댓(THISISNEVERTHAT) INTL. Logo Crewneck Black">
													</a>
												</div>
											</td>
											<td>
												<div class="article_info connect_info">
													<p class="txt_brand"></p>
													<p class="list_info ">
														<a href="/app/goods/1557658/0"> [디스이즈네버댓] INTL. Logo Crewneck Black </a>
													</p>
													<p class="txt_option">옵션: M
												</div>
											</td>
											<td class="td_price">44,400</td>
											<td>
												<!-- 수량 -->
												<div class="n-input-amount">
													<div class="form-group">
														<select class="form-control" id="exampleSelect1">
															<option>1</option>
															<option>2</option>
															<option>3</option>
															<option>4</option>
															<option>5</option>
														</select>
													</div>
												</div>
											</td>
											<td>44,400<br>
											</td>
											<td><a href="#" class="plain-btn btn">삭제하기</a></td>
											<td>택배 배송<br>
												<p>2,500</p>
											</td>
										</tr>
										</c:forEach>
								</tbody>

							</table>
						</td>
					</tr>
					<tr class="gift-division">
						<td colspan="9"></td>
					</tr>
					
				</tbody>
			</table>
			<button type="button" class="btn btn-primary"> <!-- 여기도 비회원 주문확인페이지랑 회원 주문확인 페이지 각각 연결 -->
				<a class="order-bnt" onclick="location.href='${pageContext.request.contextPath}/ej/order' ">주문하기</a>
			</button>
		</div>
		
	</div>
</body>
</html>