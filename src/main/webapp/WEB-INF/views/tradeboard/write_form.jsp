<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${initParam.root}resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#tradeWrite").click(function(){
			obj.getById["tradeContent"].exec("UPDATE_CONTENTS_FIELD", []);
			if($("#tradeTitle").val()==""){
				alert("제목을 입력하세요");
				return false;
			}
			$("#tradeWriteForm").submit();
		});
		$("#tradeCancel").click(function(){
			location.href = "${initParam.root }trade_list.do";
		});
	});
</script>

<form class="form-horizontal" method="post"
	action="${initParam.root }auth_trade_write.do" id="tradeWriteForm"  enctype="multipart/form-data">
	<fieldset>
		<legend>중고거래 작성 </legend>
		<div class="form-group">
			<label for="inputMemberId" class="col-lg-2 control-label">아이디</label>
			<div class="col-lg-10">
				<c:choose>
					<c:when test="${sessionScope.loginInfo != null}">
						<input type="text" class="form-control" id="memberId"
							name="memberId" value="${sessionScope.loginInfo.memberId }"
							readonly="readonly">
					</c:when>
					<c:when test="${sessionScope.admin != null}">
						<input type="text" class="form-control" id="memberId"
							name="memberId" value="${sessionScope.admin.memberId }"
							readonly="readonly">

					</c:when>
				</c:choose>
			</div>
		</div>
		<div class="form-group">
			<label for="inputTitle" class="col-lg-2 control-label">제목</label>
			<div class="col-lg-10">
				<input type="text" class="form-control" id="tradeTitle"
					name="tradeTitle" placeholder="제목을 입력하세요">
			</div>
		</div>
		<div class="form-group">
			<label for="inputContent" class="col-lg-2 control-label">내용</label>
			<div class="col-lg-10">				
				<textarea rows="24" style="width:100%;" id="tradeContent" name="tradeContent"></textarea><br>
			</div>
		</div>
	</fieldset>

</form>
<div class="form-group">
	<div class="col-lg-10 col-lg-offset-2">
		<button type="reset" class="btn btn-default" id="tradeCancel">취소</button>
		<button type="submit" class="btn btn-primary" id="tradeWrite" onclick="test()">작성</button>
	</div>
</div>
<script type="text/javascript">
    //전역변수
    var obj = [];               
    //스마트에디터 프레임생성
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: obj,
        elPlaceHolder:"tradeContent",
        sSkinURI: "resources/editor/SmartEditor2Skin.html", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, 
        }   
});

</script>  
