<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <script  type="text/javascript">
  
  
  $(document).ready(function(){
 	 
 	 $("#carpoolAllSearchBtn").click(function(){
 		location.href="carpool_allSearch.do";
 	 });
 	 
 	$("#carpoolSearchBtn").click(function(){
 		location.href="carpool_search_form.do";
 	 });
 	
 	$("#searchCarpoolType").change(function(){
 		//ajax나 컨트롤러 가서 등하교 대로 가져오기 //실패
 		location.href="carpool_allSearch.do?carpooltype="+$("#searchCarpoolType option:selected").val();
 		
 	 });
 	
  });

</script>
<div class="container">
	<div class="col-lg-2">
		<h3>${requestScope.searchCarpoolType} 검색결과</h3>
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-10">
			<c:if test="${requestScope.searchCarpoolType=='전체'}">
			<div class="col-sm-2">
			<select id="searchCarpoolType" class="form-control ">
								 <option value="${requestScope.selectedType}">${requestScope.selectedType}</option>
								<option value="${requestScope.unselectedType}">${requestScope.unselectedType}</option>
			
			</select>
			</div>
			</c:if>
				<table class="table">
					<thead>
						<tr>
							<th>등록자</th>
							<th>출발지/목적지</th>
							<th>시작시간</th>
							<th>마감시간</th>
							<th>인원</th>
							<th>가격</th>
							<th>연락처</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="vo" items="${requestScope.searchList}">
							<tr>
								<td>${vo.carpoolMemberId}</td>
								<td>${vo.carpoolDestination}</td>
								<td>${vo.carpoolstartTime }</td>
								<td>${vo.carpoolendTime }</td>
								<td>${vo.carpoolCompanion }</td>
								<td>${vo.carpoolPrice }</td>	
								<td>${vo.carpoolphone }</td>									
							</tr>
						</c:forEach>
					</tbody>
				</table>
					<div class="form-group">
						<div class="col-sm-offset-7 col-sm-7">
<!-- 							<button type="button" class="btn btn-default" id="carpoolAllSearchBtn">전체보기</button> -->
							<button type="button" class="btn btn-default" id="carpoolSearchBtn">카풀찾기</button>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>