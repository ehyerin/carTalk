<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 데이터 타임피커 -->
<link rel="stylesheet" href="//cdn.rawgit.com/xdan/datetimepicker/master/jquery.datetimepicker.css">
<script src="//cdn.rawgit.com/xdan/datetimepicker/master/jquery.datetimepicker.js"></script>
<!-- 구글맵 -->
<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script> 


<script type="text/javascript">

function initialize() {
	mapping('아주대학교','경기도 수원시','아주대학교');	
}

 function mapping(innName,innAddress,detailAddress){
	var geocoder = new google.maps.Geocoder();
	var addr = innAddress+" "+detailAddress;
	var lat = "";
	var lng = "";
	geocoder.geocode({
		'address' : addr
	},
	function(results, status) { 
		if (results != "") {
			var location = results[0].geometry.location;
			lat = location.lat();
			lng = location.lng();
			var latlng = new google.maps.LatLng(lat, lng);
			var myOptions = {
				zoom : 15,
				center : latlng,
				mapTypeControl : true,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(document
					.getElementById("map_canvas"), myOptions);		
			
			var marker = new google.maps.Marker({ 
				  position: latlng, 
				  map: map, 
				  title: "검색한 숙소"//마커에 올렸을때 나타나는 내용
				}); 
			
			google.maps.event.addListener(marker, 'mouseover', function() { 
				var infowindow = new google.maps.InfoWindow( 
				            { content: innName, 
				              size: new google.maps.Size(100,100) 
				            })
				infowindow.open(map, marker);
				});		
		}else
			$("#map_canvas").html("위도와 경도를 찾을 수 없습니다.");
	});
} 
 
	$(function(){
		
		$("#carpoolTime").datetimepicker({
			minDate: 0, 
			ang:'ko',
			format:'Y/m/d H:i',
			step: 10
		});
		
		
		$("#carpoolDestination").keyup(function(){		
			mapping('목적지',$("#carpoolDestination").val(),'');			
		});

	});
	
	 
	 $(document).ready(function(){

		 $("#carpoolSearchForm").submit(function(){
			if($("#carpoolDestination").val()==""||$("#map_canvas").html()=="위도와 경도를 찾을 수 없습니다.")
			{
				alert("지역을 입력하세요!");
				return false;
			}
			 else if($("#carpoolTime").val()==""){
					alert("시작시간을 입력하세요!");
					return false;
				}
			 else if($("#carpoolType").val()==""){
					alert("등하교를 선택하세요!");
					return false;
					}
			 else if($("#carpoolCompanion").val()==""){
					alert("인원을 선택하세요!");
					return false;
					}
		 
		 });
		 
		 $("#carpoolAllSearchBtn").click(function(){
			 location.href="carpool_allSearch.do"; 
		 });
		 
		
	 });
 
 	/*
 //동적으로 생성되는 아이콘의 이벤트 
 $("#resultViewSearch").on("mouseover",".mapIcon",function(){
 	//alert($(this).next().val());
 	var innName=$(this).next().val();
 	var innArea=$(this).next().next().val();
 	var innAddress=$(this).next().next().next().val();	    	
 	mapping(innName,innArea,innAddress);
 });  */
 
</script>


<body onload="initialize()"> 


<div class="section">
	<div class="container">
		<div class="row">
		  	<div class="col-md-4">
				<form class="form-horizontal" action="${initParam.root}carpool_search.do"  id="carpoolSearchForm">
					<fieldset>
						<legend>카풀찾기</legend>
					</fieldset>	  		
					<div class="form-group">
						<div class="col-sm-4 col-sm-offset-1">
							<label for="carpoolDestination" class="control-label">출발지/목적지</label>
						</div>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="carpoolDestination" name="searchCarpoolLoction" placeholder="지역">
						</div>
					</div>
					<span id="DestinationAddResult"></span>
					<div class="form-group">
						<div class="col-sm-3 col-sm-offset-2" >
							<label for="carpoolTime" class="control-label">시간</label>
						</div>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="carpoolTime" name="searchCarpoolTime" placeholder="YYYY/MM/DD HH:MM">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3 col-sm-offset-2">
							<label for="carpoolType" class="control-label">등하교</label>
						</div>
						<div class="col-sm-5">
							<select id="carpoolType" name="searchCarpoolType" class="form-control">
								<option value="등교">등교</option>
								<option value="하교">하교</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3 col-sm-offset-2">
							<label for="carpoolCompanion" class="control-label">인원</label>
						</div>
						<div class="col-sm-5">
							<select id="carpoolCompanion" name="searchCarpoolCompanion" class="form-control">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-7 col-sm-7">
							<button type="submit" class="btn btn-default" id="carpoolSearchBtn">검색</button>
							<button type="button" class="btn btn-default" id="carpoolAllSearchBtn">전체보기</button>
						</div>
					</div>
				
				</form>
			</div>
			<div class="col-md-4" align="center">
				<div id="map_canvas" style="width:500px;height:500px;"></div>
			</div>
		</div>
		
		</div>
</div>	
			

</body>