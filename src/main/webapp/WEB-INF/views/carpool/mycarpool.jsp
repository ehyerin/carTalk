<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

   <script  type="text/javascript">
	function deleteItem(carpoolNo){
		if(confirm("해당 게시물을 삭제하시겠습니까?")){
			location.href="carpool_delete.do?carpoolNo="+carpoolNo;
		}
	}
</script>

<div class="container">
	<div class="col-lg-2">
		<h3>등록카풀</h3>
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-10">
				<table class="table">
					<thead>
						<tr>
							<th>출발지/목적지</th>
							<th>시작시간</th>
							<th>마감시간</th>
							<th>등하교</th>
							<th>인원</th>
							<th>가격</th>
							<th>삭제</th>
		
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${requestScope.carpool}">
							<tr>

								<td>${vo.carpoolDestination}</td>
								<td>${vo.carpoolstartTime}</td>
								<td>${vo.carpoolendTime }</td>
								<td>${vo.carpoolType }</td>
								<td>${vo.carpoolCompanion }</td>
								<td>${vo.carpoolPrice }</td>							
								<td>
								<input type='button' class='btn btn-primary btn-xs'
								 id='DeleteBtn' value='삭제' onclick="deleteItem('${vo.carpoolNo}')">
								</td>
						
						
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
				
				
				
				