<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- 자동완성 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<!-- 데이트 타임피커 -->
<link rel="stylesheet" href="//cdn.rawgit.com/xdan/datetimepicker/master/jquery.datetimepicker.css"> 
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script> -->
<script src="//cdn.rawgit.com/xdan/datetimepicker/master/jquery.datetimepicker.js"></script> 
<script type="text/javascript">
$(document).ready(function(){
		$("#rentalDate").datetimepicker({
			 	minDate: 0, 
			 	ang:'ko',
			    format:'Y/m/d H:i',
			    step: 10 //시간 설정을 10분단위로 나눔
		    });
		
		$("#returnDate").datetimepicker({
		 	minDate: 0, 
		 	ang:'ko',
		    format:'Y/m/d H:i',
		    step: 10 //시간 설정을 10분단위로 나눔
	    });
		$("#carSearchBtn").click(function(){
			$("#searchForm").submit();
		});
});
/* 자동완성 */
$(function(){
	$("#uCarZoneName1").autocomplete({
		source:function(request,response){
			//alert(request.term);// 검색어 입력 정보가 출력 
			$.ajax({
				url:"searchUCarZone.do",
				dataType:"json",
				data:"term="+request.term,
				success:function(data){
					response(data);
				}
			});//ajax
		}//source
	});//autocomplete
});//ready
</script>
 <hr>
<div class="section"> 
	<div class="container"> 
		<div class="row"> 
			<!-- best consumer review -->
			<div class="col-md-4" align="center">
				<fieldset>
					<legend align="center">중고 거래</legend>
				</fieldset>
            	<!-- <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" class="img-responsive">
            	<h2>A Title</h2>
            	<p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
              	<br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
              	<br>Ut enim ad minim veniam, quis nostrud</p> -->
              	<div class="carousel slide" id="review_carousel" data-interval="3000" data-ride="carousel">
              		<!-- 오른쪽 위에 있으면 좋겠음 색도 바뀌면 좋겠음 -->
					<!-- <ol class="carousel-indicators" style="background-color: red; ">
						<li class="active" data-slide-to="0" data-target="#review_carousel"></li>
						<li data-slide-to="1" data-target="#review_carousel"></li>
						<li data-slide-to="2" data-target="#review_carousel"></li>
					</ol> -->					
					<div class="carousel-inner">
						<!-- slide image 1 -->
						<div class="active item" id="img_slide" align="center" >
								<div class = "col-md-8 col-md-offset-1" >									
									<c:choose>		
										<c:when test="${bestList[0].reviewFileVO !=null }">
											<a href="${initParam.root }review_showContent.do?reviewNo=${bestList[0].reviewNo }">	
											<img src="${bestList[0].reviewFileVO.filePath }" width="250" height="200"></a>		
										</c:when>
										<c:otherwise>
											<img src="${initParam.root }/img/trade.jpg" width="250" height="200">
										</c:otherwise>
									</c:choose>
									<h3>${bestList[0].reviewTitle }</h3>
									<p>작성자 : ${bestList[0].memberId} <br>댓글수 : ${bestList[0].reviewLikeCount}</p>				
								</div>
						</div>
						<!-- slide image 2 -->
						<div class="item" id="img_slide" align="center" >
						<div class = "col-md-8 col-md-offset-1" >
									<c:choose>
										<c:when test="${bestList[1].reviewFileVO !=null }">	
											<a href="${initParam.root }review_showContent.do?reviewNo=${bestList[1].reviewNo }">
											<img src="${bestList[1].reviewFileVO.filePath }" width="250" height="200"></a>
										</c:when>
										<c:otherwise>
											<img src="${initParam.root }/img/trade.jpg" width="250" height="200">
										</c:otherwise>
									</c:choose>
								<div class="caption">
									<h3>${bestList[1].reviewTitle }</h3>
									<p>작성자 : ${bestList[1].memberId} <br>댓글수 : ${bestList[1].reviewLikeCount}</p>
								</div>
							</div>
						</div>
						<!-- slide image 3 -->
						<div class="item" id="img_slide" align="center" >
						<div class = "col-md-8 col-md-offset-1" >
									<c:choose>
										<c:when test="${bestList[2].reviewFileVO !=null }">
										<a href="${initParam.root }review_showContent.do?reviewNo=${bestList[2].reviewNo }">
											<img src="${bestList[2].reviewFileVO.filePath }" width="250" height="200"></a>
										</c:when>
										<c:otherwise>
											<img src="${initParam.root }/img/trade.jpg"  width="250" height="200">
										</c:otherwise>
									</c:choose>
									<h3>${bestList[2].reviewTitle }</h3>
									<p>작성자 : ${bestList[2].memberId} <br>댓글수 : ${bestList[2].reviewLikeCount}</p>
							</div>
						</div>
					</div>			
				</div>
			</div>
			<!-- UCar garage -->
			<div class="col-md-4" align="center">
			<fieldset>
			<legend align="center">학교 정보</legend>
			</fieldset>
			<a href = "${initParam.root }info_info.do"><img src ="${initParam.root }img/Ajou_Univ_Ui.png"  width="300" height="200" ><br>
			<h5>도서관 / 스쿨버스 / 식당 정보 보러가기 </h5></a>
			</div>
			<!-- find car form -->
		<div class="col-md-4">
		<form class="form-horizontal" action="${initParam.root}carpool_search.do"  id="carpoolSearchForm">
				<div class="form-group">
				<legend align="center">카풀 검색</legend>
			  <br><br>
					<div class="col-sm-3">
				<label for="carpoolDestination" class="control-label">출발/목적지</label>
				</div>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="carpoolDestination" name="searchCarpoolLoction" placeholder="지역">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-3 col-sm-offset-1" >
						<label for="carpoolTime" class="control-label">시간</label>
				</div>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="carpoolTime" name="searchCarpoolTime" placeholder="YYYY/MM/DD HH:MM">
				</div>
			</div>
		 	<div class="form-group">
				<div class="col-sm-3 col-sm-offset-1">
					<label for="returnDate" class="control-label">기간</label>
				</div>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="returnDate" name="returnDate" placeholder="YYYY/MM/DD HH:MM">
				</div> 
			</div>
			<div class="form-group">
				<div class="col-sm-3 col-sm-offset-1">
							<label for="carpoolType" class="control-label">등하교</label>
				</div>
				<div class="col-sm-5">
					<select id="carpoolType" name="searchCarpoolType" class="form-control">
								<option value="">전체</option>
								<option value="등교">등교</option>
								<option value="하교">하교</option>
							</select>
				</div>
			</div>
				<div class="form-group">
				<div class="col-sm-3 col-sm-offset-1">
													<label for="carpoolCompanion" class="control-label">인원</label>
				</div>
				<div class="col-sm-5">
					<select id="carpoolCompanion" name="searchCarpoolCompanion" class="form-control">
								<option value="">전체</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-5">
					<button type="button" class="btn btn-default" id="carSearchBtn">검색하러가기</button>
				</div>
			</div>
			</form> 
	      </div>
		</div>
	</div>
</div>
