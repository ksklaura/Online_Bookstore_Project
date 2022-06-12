<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_mypage_orderList</title>
</head>
<body>
	<div id='mypage_orderList'>
		<h2>구매내역 조회</h2>
		
		<hr style="padding: 15px 0px 0px 0px">
						
						<div class="row">
							<table id="product" class="table">
								<thead>
							   		<tr class="table-secondary">
							   			<th colspan="2" scope="row" style="text-align: center; padding-left: 0px; padding-right: 15px;">
							   				<h4>상품정보</h4>
							   				<br>
							   			</th>
							   			<th style="text-align: center; padding-left: 0px; padding-right: 25px;">
							   				<h4>주문일</h4>
							   				<button class="btn btn-secondary btn-sm" onclick="sortTD ( 0 )" style="padding: 0px 5px 0px 5px; margin: 0px;">▲</button>
							   				<button class="btn btn-secondary btn-sm" onclick="reverseTD ( 0 )" style="padding: 0px 5px 0px 5px; margin: 0px;">▼</button>
							   			</th>
							   			<th style="overflow: auto; text-align: center; padding-left: 0px; padding-right: 0px;">
							   				<h4>주문번호</h4>
							   				<button class="btn btn-secondary btn-sm" onclick="sortTD ( 1 )" style="padding: 0px 5px 0px 5px; margin: 0px;">▲</button>
							   				<button class="btn btn-secondary btn-sm" onclick="reverseTD ( 1 )" style="padding: 0px 5px 0px 5px; margin: 0px;">▼</button>
							   			</th>
							   			<th style="text-align: center; padding-left: 15px; padding-right: 15px;">
							   				<h4>금액</h4>
							   				<button class="btn btn-secondary btn-sm" onclick="sortTD ( 2 )" style="padding: 0px 5px 0px 5px; margin: 0px;">▲</button>
							   				<button class="btn btn-secondary btn-sm" onclick="reverseTD ( 2 )" style="padding: 0px 5px 0px 5px; margin: 0px;">▼</button>
							   			</th>
							   			<th style="text-align: center; padding-left: 15px; padding-right: 15px;">
							   				<h4>상태</h4>
							   				<br>
							   			</th>
							   		</tr>
							   	</thead>
							   	<tbody>
							   		<c:forEach items="${order_list}" var="order" varStatus="status">
								   	<tr class="table-secondary">
								   		<%-- 상품정보 --%>
								   		<td style="text-align: center; padding: 15px 0px 0px 0px;">
											<%-- <a href="${pageContext.request.contextPath}/prdct/${order.prdct_id}"> --%><img src="/prdct_img/prdct_thumbnail/${order.prdct_thumbnail}" onerror="this.src='/prdct_img/prdct_thumbnail/none-thumbnail.png'" width="100px" height="120px"></a>
										</td>
								   		<td style="text-align: left; padding-left: 0px; padding-right: 0px;">
								   			<h4 style="padding-bottom: 5px;"><%-- ${order.brand_id} --%></h4>
											<h6 style="max-width: 180px; padding-bottom: 5px;"><%-- ${order.prdct_name} --%></h6>
											<h6>
												${order.order_color}&nbsp;
												(${order.order_size})
											</h6>
								   		</td>
								   		<%-- 주문일(정렬대상) --%>
								   		<td style="text-align: left; padding: 60px 0px 0px 0px;">
								   			<h6>${order.order_date}</h6>
								   		</td>
								   		<%-- 주문번호(정렬대상) --%>
								   		<td style="text-align: center; padding: 60px 0px 0px 0px;">
								   			<h6>${order.order_number}</h6>
								   		</td>
								   		<%-- 주문금액(정렬대상) --%>
								   		<td style="text-align: center; padding: 60px 0px 0px 0px;">
								   			<h6>${order.order_price}원</h6>
								   		</td>
								   		<%-- 상태 --%>
								   		<td style="text-align: center; padding-left: 0px; padding-right: 0px;">
								   			<!-- 배송조회페이지 URI 설정할것 -->
											<c:choose>
												<c:when test="${order.order_state_number eq 1}">
													<h6>결제대기</h6>
													<h6><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#mdal">배송조회</button></h6>
													<h6><button type="button" class="btn btn-danger btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button></h6>
												</c:when>
												<c:when test="${order.order_state_number eq 2}">
													<h6>결제완료</h6>
													<h6><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#mdal">배송조회</button></h6>
													<h6><button type="button" class="btn btn-danger btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button></h6>
												</c:when>
												<c:when test="${order.order_state_number eq 3}">
													<h6>주문요청</h6>
													<h6><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#mdal">배송조회</button></h6>
													<h6><button type="button" class="btn btn-danger btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button></h6>
												</c:when>
												<c:when test="${order.order_state_number eq 4}">
													<h6>배송대기</h6>
													<h6><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#mdal">배송조회</button></h6>
													<h6><button type="button" class="btn btn-danger btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button></h6>
												</c:when>
												<c:when test="${order.order_state_number eq 5}">
													<h6>배송중&nbsp;</h6>
													<h6><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#mdal">배송조회</button></h6>
													<h6><button type="button" class="btn btn-danger btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button></h6>
												</c:when>
												<c:when test="${order.order_state_number eq 6}">
													<h6>배송완료</h6>
													<span class="order_num" style="display: none;">${order.order_number}</span>
													<span class="order_stat" style="display: none;">${order.order_state_number}</span>
													<h6><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#mdal">배송조회</button></h6>
													<h6><button type="button" class="btn btn-success btn-sm prdconfirm${order.order_number}" data-rno="${order.order_number}">주문확정</button></h6>
													<h6><button type="button" class="btn btn-danger btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">교환요청</button></h6>
													<h6><button type="button" class="btn btn-danger btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">환불요청</button></h6>
													<!-- 주문확정 버튼을 누르면 배송완료에서 주문확정 상태로 변한다 -->
													<script type="text/javascript">
													$(document).ready(function (){
														$('.prdconfirm${order.order_number}').click(function(event){
															event.preventDefault();
															
															if (confirm("주문확정 하시겠습니까?")) {
																// FormData 객체 생성
																var formData = new FormData();
																
																// button의 data-rno 값을 가져온다
																var order_number = $(this).attr("data-rno");		
														     	console.log("order_number: " + order_number);
													     		
												     			// formData에 해당 데이터를 append한다
												     			var form = {
												     				  order_number: order_number
													            };
													     		console.log("form: " + form);
													 
																$.ajax({
																	type : 'POST', 
																	url : $(this).attr("href"), 
																	cache : false, 
																	contentType:'application/json; charset=utf-8',
													                processData: false, 
													                data: JSON.stringify(form), 
													                beforeSend : function(xhr) {
																		xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
													             	},
																	success: function(result) {
																		console.log(result);
																		console.log("PRDCT_STATE_CHANGED!");
																		$(location).attr('href', '${pageContext.request.contextPath}/member/mypage/order');
																	},
																	error:function(e) {		
																		console.log(e);
																		alert("주문확정 하실 수 없습니다");
																		location.reload();
																	}
																})
															} else {
																location.reload();
															}
														});	
													});	
													</script>
												</c:when>
												<c:when test="${order.order_state_number eq 7}">
													<h6>주문확정</h6>
													<h6><button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='${pageContext.request.contextPath}/member/mypage/review/${order.prdct_id}/write'">리뷰쓰기</button></h6>
													<h6><button type="button" class="btn btn-danger btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">교환요청</button></h6>
													<h6><button type="button" class="btn btn-danger btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">환불요청</button></h6>
												</c:when>
												<c:when test="${order.order_state_number eq 8}">
													<h6>주문취소</h6>
													<h6><button type="button" class="btn btn-primary btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">주문취소조회</button></h6>
												</c:when>
												<c:when test="${order.order_state_number eq 9}">
													<h6>교환요청</h6>
													<h6><button type="button" class="btn btn-primary btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">교환조회</button></h6>
												</c:when>
												<c:when test="${order.order_state_number eq 10}">
													<h6>환불요청</h6>
													<h6><button type="button" class="btn btn-primary btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">환불조회</button></h6>
												</c:when>
												<c:otherwise>
													<h6>환불완료</h6>
												</c:otherwise>
											</c:choose>
											<%-- 모달 영역 --%> 
											<div class="modal fade myModal" id="mdal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&#88;</span></button>
														</div>
														<div class="modal-body">
															<div class="form-group" align="center">
																<label id="tekbeCompnayName">택배회사명</label>
																<select id="tekbeCompnayList" class="form-control" name="tekbeCompnayList"></select>
															</div>
															<div>
																<label id="tekbeCompnayName" align="center">운송장번호</label>
																<input type="text" id="invoiceNumberText" class="form-control"  name="invoiceNumberText"><br/><br/>
															</div>
															<button id="myButton1" class="btn btn-primary">택배 조회하기 </button><br/><br/>
															<div>
																<table id="myPtag"></table>
															</div>
															<br/>
															<div>
																<table id="myPtag2"></table>
															</div>
														</div>
														<div class="modal-footer">
															<div align="left">
															</div>
														</div>
													</div>
												</div>
											</div>	
								   		</td>
								   	</tr>
								   	</c:forEach>
							   	</tbody>
							</table>
					</div>
					
					<!-- 페이징 -->	
					<div class="container">
						<ul class="pagination justify-content-center">
							<c:choose>
								<c:when test="${pageMaker.prev}">
									<li class="page-item"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item disabled"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
								</c:otherwise>
							</c:choose>
		
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
								<li class="page-item ${pageMaker.cri.pageNum == idx ? 'active' : '' }"><a class="page-link" href="${pageMaker.makeQuery(idx)}">${idx}</a></li>
							</c:forEach>
		
							<c:choose>
								<c:when test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="page-item disabled"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
				
				
					<!-- <span style="border-left: 1px solid rgba(0, 0, 0, .1); width: 922px;">
						<h3 style="margin-top: 5px; margin-left: 15px; padding-bottom: 16px; border-bottom: 1px solid rgba(0, 0, 0, .1);">
							<strong style="margin: 10px;">주문내역 조회</strong>
						</h3>
	
						<div style="margin-bottom: 20px; margin-top: 20px;">
							<span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">ㄱㄴㄷ순</button></span> <span style="margin-left: 30px;"><button
									class="btn btn-primary btn-sm">abc순</button></span> <span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">날짜별순</button></span> <span
								style="margin-left: 30px;"><button class="btn btn-primary btn-sm">최근구매순</button></span>
						</div>
						
						<table class="table">
							<thead style="text-align: center;">
								<tr>
									<th colspan="2"><h5>상품정보</h5></th>
									<th><h5>주문일</h5></th>
									<th><h5>주문번호</h5></th>
									<th><h5>주문금액</h5></th>
									<th><h5>상태</h5></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="padding-left: 5px; padding-right: 5px;"><img src="/img/6.jpg" style="width: 120px; height: 120px;"></td>
									<td style="padding-left: 5px; padding-right: 5px; position: relative; top: 24px; border-top-width: 0px">
										<h6>Covernat</h6>
										<h6>럭비 맨투맨 네이비</h6>
										<h6>네이비 (M)</h6>
									</td>
									<td><h6 style="position: relative; top: 34px;">2021.03.19</h6></td>
									<td><h6 style="position: relative; top: 34px;">2021031111550001</h6></td>
									<td><h6 style="position: relative; top: 34px; text-align: center;">29,900₩</h6></td>
									<td>
										<h6 style="position: relative; top: 22px; margin-left: 14px;">배송시작</h6>
										<h6 style="position: relative; top: 24px; margin-left: 10px;">
											<button class="btn btn-primary btn-sm">배송조회</button>
										</h6>
									</td>
								</tr>
	
								<tr>
									<td style="padding-left: 5px; padding-right: 5px;"><img src="/img/6.jpg" style="width: 120px; height: 120px;"></td>
									<td style="padding-left: 5px; padding-right: 5px; position: relative; top: 24px; border-top-width: 0px">
										<h6>Covernat</h6>
										<h6>럭비 맨투맨 네이비</h6>
										<h6>네이비 (M)</h6>
									</td>
									<td><h6 style="position: relative; top: 34px;">2021.03.19</h6></td>
									<td><h6 style="position: relative; top: 34px;">2021031111550001</h6></td>
									<td><h6 style="position: relative; top: 34px; text-align: center;">29,900₩</h6></td>
									<td>
										<h6 style="position: relative; top: 22px; margin-left: 14px;">배송시작</h6>
										<h6 style="position: relative; top: 24px; margin-left: 10px;">
											<button class="btn btn-primary btn-sm">배송조회</button>
										</h6>
									</td>
								</tr>
	
								<tr>
									<td style="padding-left: 5px; padding-right: 5px;"><img src="/img/6.jpg" style="width: 120px; height: 120px;"></td>
									<td style="padding-left: 5px; padding-right: 5px; position: relative; top: 24px; border-top-width: 0px">
										<h6>Covernat</h6>
										<h6>럭비 맨투맨 네이비</h6>
										<h6>네이비 (M)</h6>
									</td>
									<td><h6 style="position: relative; top: 34px;">2021.03.19</h6></td>
									<td><h6 style="position: relative; top: 34px;">2021031111550001</h6></td>
									<td><h6 style="position: relative; top: 34px; text-align: center;">29,900₩</h6></td>
									<td>
										<h6 style="position: relative; top: 22px; margin-left: 14px;">배송시작</h6>
										<h6 style="position: relative; top: 24px; margin-left: 10px;">
											<button class="btn btn-primary btn-sm">배송조회</button>
										</h6>
									</td>
								</tr>
	
								<tr>
									<td style="padding-left: 5px; padding-right: 5px;"><img src="/img/6.jpg" style="width: 120px; height: 120px;"></td>
									<td style="padding-left: 5px; padding-right: 5px; position: relative; top: 24px; border-top-width: 0px">
										<h6>Covernat</h6>
										<h6>럭비 맨투맨 네이비</h6>
										<h6>네이비 (M)</h6>
									</td>
									<td><h6 style="position: relative; top: 34px;">2021.03.19</h6></td>
									<td><h6 style="position: relative; top: 34px;">2021031111550001</h6></td>
									<td><h6 style="position: relative; top: 34px; text-align: center;">29,900₩</h6></td>
									<td>
										<h6 style="position: relative; top: 22px; margin-left: 14px;">배송시작</h6>
										<h6 style="position: relative; top: 24px; margin-left: 10px;">
											<button class="btn btn-primary btn-sm">배송조회</button>
										</h6>
									</td>
								</tr>
	
								<tr>
									<td style="padding-left: 5px; padding-right: 5px;"><img src="/img/6.jpg" style="width: 120px; height: 120px;"></td>
									<td style="padding-left: 5px; padding-right: 5px; position: relative; top: 24px; border-top-width: 0px">
										<h6>Covernat</h6>
										<h6>럭비 맨투맨 네이비</h6>
										<h6>네이비 (M)</h6>
									</td>
									<td><h6 style="position: relative; top: 34px;">2021.03.19</h6></td>
									<td><h6 style="position: relative; top: 34px;">2021031111550001</h6></td>
									<td><h6 style="position: relative; top: 34px; text-align: center;">29,900₩</h6></td>
									<td>
										<h6 style="position: relative; top: 22px; margin-left: 14px;">배송시작</h6>
										<h6 style="position: relative; top: 24px; margin-left: 10px;">
											<button class="btn btn-primary btn-sm">배송조회</button>
										</h6>
									</td>
								</tr>
	
	
	
							</tbody>
						</table> -->
	
					</div>
			</div>
		</div>
		
	</div>
</body>
</html>