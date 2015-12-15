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
 
 $(document).ready(function(){
	 
	 $("#carpoolRegisterForm").submit(function(){
		 if($("#Destinationlist").html()==""){
			alert("지역을 추가하세요!");
			return false;
		} 
		 else if($("#carpoolstartTime").val()==""){
			alert("시작시간을 입력하세요!");
			return false;
		}
		 else if($("#carpoolendTime").val()==""){
			alert("마감시간을 입력하세요!");
			return false;
			}
		 else if($("#carpoolCompanion").val()=="all"){
			alert("인원을 선택하세요!");
			return false;
			}
		 else if($("#carpoolPrice").val()==""){
				alert("가격을 입력하세요!");
				return false;
				}
		 else if(isNaN($("#carpoolPrice").val())==true){
				alert("가격을 숫자로 입력하세요!");
				return false;
				}
		 else if($("#carpoolPhone").val()==""){
				alert("연락처를 입력하세요!");
				return false;
				}
		 
	 });
	 
	 	var destination= "";
		var destinationlist="";
		var count=0;
		
		$("#carpoolstartTime").datetimepicker({
			minDate: 0, 
			ang:'ko',
			format:'Y/m/d H:i',
			step: 10
		});
		
		$("#carpoolendTime").datetimepicker({
			minDate: 0, 
			ang:'ko',
			format:'Y/m/d H:i',
			step: 10
		});
		
		$("#DestinationAddBtn").click(function(){
			
			if($("#carpoolDestination").val()==""||$("#map_canvas").html()=="위도와 경도를 찾을 수 없습니다.")
			{
				alert("지역을 찾을 수 없습니다");
			}
			 else if(destination.indexOf($("#carpoolDestination").val())>-1){
				alert("이미 등록하신 지역입니다.");
			} 
			 else if(count>2){
				 alert("지역은 3군데 까지 가능합니다.");
			 }
				else{
					count++;
					//지역 추가시 3군데 이상 입력시 제한 
			
			if(destination=="")
			destination += $("#carpoolDestination").val();
			else
			destination += ", "+ $("#carpoolDestination").val();
			destinationlist+="<input type='hidden' name='carpoolDestination' value="+ $("#carpoolDestination").val()+">";
			$("#DestinationAddResult").html(destination+" <input type='button' class='btn btn-primary btn-xs' id='DestinationDeleteBtn' value='전체삭제'><br><br>");
			$("#Destinationlist").html(destinationlist);
			$("#carpoolDestination").val("");
			
				}
		});
		
		$("#DestinationAddResult").on("click","#DestinationDeleteBtn",function(){
			count=0;
			destination="";
			destinationlist="";
			$("#DestinationAddResult").html("");
			$("#Destinationlist").html("");
		});
		
		$("#carpoolDestination").keyup(function(){		
			mapping('목적지',$("#carpoolDestination").val(),'');			
		});
		
	});

 
</script>


<body onload="initialize()"> 

<div class="section">
	<div class="container">
		<div class="row">
		  	<div class="col-md-4">
				<form class="form-horizontal" action="${initParam.root}carpool_register.do" id="carpoolRegisterForm" >
					<fieldset>
						<legend>카풀등록</legend>
					</fieldset>	  		
					<div class="form-group">
						<div class="col-sm-4 col-sm-offset-1">
							<label for="carpoolDestination" class="control-label">출발지/목적지</label>
						</div>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="carpoolDestination" placeholder="지역(3군데)">
						</div>
						<div class="col-sm-1">
							<button type="button" class="btn btn-primary btn-sm" id="DestinationAddBtn">추가</button>
						</div>
					</div>
					<div align="center" id="DestinationAddResult"></div>
					<div id="Destinationlist"></div>
					<div class="form-group">
						<div class="col-sm-3 col-sm-offset-2" >
							<label for="carpoolstartTime" class="control-label">시작시간</label>
						</div>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="carpoolstartTime" name="carpoolstartTime" placeholder="YYYY/MM/DD HH:MM">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3 col-sm-offset-2" >
							<label for="carpoolendTime" class="control-label">마감시간</label>
						</div>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="carpoolendTime" name="carpoolendTime" placeholder="YYYY/MM/DD HH:MM">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3 col-sm-offset-2">
							<label for="carpoolType" class="control-label">등하교</label>
						</div>
						<div class="col-sm-5">
							<select id="carpoolType" name="carpoolType" class="form-control">
								<option value="등교">등교</option>
								<option value="하교">하교</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3 col-sm-offset-2">
							<label for="carpoolCompanion" class="control-label">최대인원</label>
						</div>
						<div class="col-sm-5">
							<select id="carpoolCompanion" name="carpoolCompanion" class="form-control">
								<option value="all">인원</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3 col-sm-offset-2">
							<label for="carpoolPrice" class="control-label">가격</label>
						</div>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="carpoolPrice" name="carpoolPrice" placeholder="가격">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3 col-sm-offset-2">
							<label for="carpoolPhone" class="control-label">연락처</label>
						</div>
						<div class="col-sm-5">
							<input type="number" class="form-control" id="carpoolphone" name="carpoolphone" placeholder="-없이 입력하세요">
						</div>
					</div>
					 <div class="form-group">
						<div class="col-sm-offset-7 col-sm-7">
						 <button type="submit" class="btn btn-default" id="carpoolRegisterBtn">등록</button>
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
