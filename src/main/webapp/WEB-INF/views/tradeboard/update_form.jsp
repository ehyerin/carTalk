<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${initParam.root}resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#tradeUpdate").click(function(){
			obj.getById["tradeContent"].exec("UPDATE_CONTENTS_FIELD", []);
			if($("#tradeTitle").val()==""){
				alert("제목을 입력하세요!");
				return false;
			}else if($("#tradeContent").val()==""){
				alert("내용을 입력하세요!");
				return false;
			}
			$("#tradeUpdateForm").submit();
		});
		$("#tradeCancel").click(function(){
			location.href = "${initParam.root }customercenter_trade_list.do";
		});
	});
</script>

<form class="form-horizontal" method="post" action="${initParam.root }trade_update.do" id="tradeUpdateForm">
   <fieldset>
    <legend>이용후기 수정</legend>
    <div class="form-group">
      <label for="inputMemberId" class="col-lg-2 control-label">아이디</label>
      <div class="col-lg-5">
        <input type="text" class="form-control" id="memberId" name="memberId" value="${requestScope.vo.memberId }" readonly="readonly">
      </div>
    </div>
    <div class="form-group">
      <label for="inputTitle" class="col-lg-2 control-label">제목</label>
      <div class="col-lg-5">
        <input type="text" class="form-control" id="tradeTitle" name="tradeTitle" value="${requestScope.vo.tradeTitle}">
      </div>
    </div>
    <div class="form-group">
      <label for="inputContent" class="col-lg-2 control-label">내용</label>
      <div class="col-lg-10">
       <textarea rows="24" style="width:100%;" id="tradeContent" name="tradeContent">${requestScope.vo.tradeContent}</textarea><br>
      </div>
    </div>
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
         <button type="reset" class="btn btn-default"  id = "tradeCancel">취소</button>
        <button type="submit" class="btn btn-primary" id ="tradeUpdate">수정</button>
     
      </div>
    </div>
  </fieldset>
  <input type="hidden" name="tradeNo"
		value="${requestScope.vo.tradeNo }">
</form>
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
