<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <script type="text/javascript">
	$(document).ready(function(){
		$("#tradeUpdateBtn").click(function(){
			if(	confirm("수정하시겠습니까?")){
				location.href="auth_update_trade_form.do?tradeNo=${requestScope.vo.tradeNo}";
			} else{
				return false;
			}
		});
		$("#tradeDelete").click(function(){
		if(	confirm("삭제하시겠습니까?")){
			location.href ="auth_trade_delete.do?tradeNo=${requestScope.vo.tradeNo}";
		} else{
			return false;
		}
		});
		$("#tradeList").click(function(){
			location.href ="${initParam.root }customercenter_trade_list.do";
		});
		
		$("#commentBtn").click(function(){
			if($("#tradeCommentContent").val()==""){
				alert("댓글 입력하세요!");
				return false;
			} else{
				$.ajax({
					type:"post",
					url:"${initParam.root }auth_tradeComment_writeComment.do",
					data:$("#commentForm").serialize(),
					success:function(data){
						if(data.flag=="ok"){
							var commentTable="<table class='table'>";
							commentTable+="<tbody>";
							$.each(data.commentList, function(index, comment){
								commentTable+="<tr>";
								commentTable+="<td>";
								commentTable+="<div class='col-md-1'>"
									+comment.tradeCommentMemberId+"</div>";
								commentTable+="<div class='col-md-8' id='"
									+comment.tradeCommentNo+"CommentContent'>"
									+comment.tradeCommentContent+"</div>";
								commentTable+="<div class='col-md-2'>"
									+comment.tradeCommentTimePosted+"</div>";
								if((comment.tradeCommentMemberId=="${sessionScope.loginInfo.memberId}") 
										|| ("${sessionScope.admin.memberId}"=="admin")){
									commentTable+="<div class='col-md-1'>";
									commentTable+="<button type='button' class='btn btn-xs' "
										+"name='editCommentFormBtn' value='"+comment.tradeCommentNo+"'>수정</button>";
									commentTable+="<button type='button' class='btn btn-xs' name='deleteCommentBtn' "
										+"value='"+comment.tradeCommentNo+"'>삭제</button>";
									commentTable+="</div>";
								}
								commentTable+="</td>";
								commentTable+="</tr>";
							});
							commentTable+="</tbody>";
							commentTable+="</table>";
							$("#ReviewCommentView").html(commentTable);
						} else{
							location.href="${initParam.root}member_login_form.do";
						}
					}
				});
			}
			$("#tradeCommentContent").val("");
		});
		$("#ReviewCommentView").on("click", ":input[name=editCommentFormBtn]", function(){
			var commentNo=$(this).val();
			var commentContent=$("#"+commentNo+"CommentContent").text();
			$.ajax({
				type:"post",
				url:"${initParam.root }tradeComment_editCommentForm.do",
				data:"tradeNo=${vo.tradeNo}",
				success:function(data){
					var commentTable="<table class='table'>";
					commentTable+="<tbody>";
					$.each(data, function(index, comment){
						commentTable+="<tr>";
						commentTable+="<td>";
						commentTable+="<div class='col-md-1'>"+comment.tradeCommentMemberId+"</div>";
						if(comment.tradeCommentNo==commentNo){
							commentTable+="<form id='"+commentNo+"editForm'>";
							commentTable+="<div class='col-md-10'><input class='form-control' type='text' id='"+commentNo+"CommentContent' name='tradeCommentContent' value='"+commentContent+"'></div>";
							commentTable+="<div class='col-md-1'>";
							commentTable+="<button type='button' class='btn btn-primary btn-xs' name='editCommentBtn' value='"+commentNo+"'>수정</button>";
							commentTable+="<input type='hidden' name='tradeCommentNo' value='"+commentNo+"'>";
							commentTable+="<input type='hidden' name='tradeNo' value='${vo.tradeNo}'>";
							commentTable+="</div></form>";
						} else{
							commentTable+="<div class='col-md-8' id='"+comment.tradeCommentNo+"CommentContent'>"+comment.tradeCommentContent+"</div>";
							commentTable+="<div class='col-md-2'>"+comment.tradeCommentTimePosted+"</div>";
							if((comment.tradeCommentMemberId=="${sessionScope.loginInfo.memberId}") || ("${sessionScope.admin.memberId}"=="admin")){
								commentTable+="<div class='col-md-1'>";
								commentTable+="<button type='button' class='btn btn-xs' name='editCommentFormBtn' value='"+comment.tradeCommentNo+"'>수정</button>";
								commentTable+="<button type='button' class='btn btn-xs' name='deleteCommentBtn' value='"+comment.tradeCommentNo+"'>삭제</button>";
								commentTable+="</div>";
							}
						}
						commentTable+="</td>";
						commentTable+="</tr>";
					});
					commentTable+="</tbody>";
					commentTable+="</table>";
					$("#ReviewCommentView").html(commentTable);
				}
			});
		});
		$("#ReviewCommentView").on("click", ":input[name=editCommentBtn]", function(){
			var commentNo=$(this).val();
			var commentContent=$("#"+commentNo+"CommentContent").val();
			if(commentContent==""){
				alert("댓글 입력하세요!");
				return false;
			} else{
				$.ajax({
					type:"post",
					url:"${initParam.root }auth_tradeComment_editComment.do",
					data:"tradeNo="+$("#tradeNo").val()+"&tradeCommentNo="+commentNo+"&tradeCommentContent="+commentContent,
					dataType: 'json',
					success:function(data){
						if(data.flag=="ok"){
							var commentTable="<table class='table'>";
							commentTable+="<tbody>";
							$.each(data.commentList, function(index, comment){
								commentTable+="<tr>";
								commentTable+="<td>";
								commentTable+="<div class='col-md-1'>"+comment.tradeCommentMemberId+"</div>";
								commentTable+="<div class='col-md-8' id='"+comment.tradeCommentNo+"CommentContent'>"+comment.tradeCommentContent+"</div>";
								commentTable+="<div class='col-md-2'>"+comment.tradeCommentTimePosted+"</div>";
								if(comment.tradeCommentMemberId=="${sessionScope.loginInfo.memberId}" || ("${sessionScope.admin.memberId}"=="admin")){
									commentTable+="<div class='col-md-1'>";
									commentTable+="<button type='button' class='btn btn-xs' name='editCommentFormBtn' value='"+comment.tradeCommentNo+"'>수정</button>";
									commentTable+="<button type='button' class='btn btn-xs' name='deleteCommentBtn' value='"+comment.tradeCommentNo+"'>삭제</button>";
									commentTable+="</div>";
								}
								commentTable+="</td>";
								commentTable+="</tr>";
							});
							commentTable+="</tbody>";
							commentTable+="</table>";
							$("#ReviewCommentView").html(commentTable);
						} else{
							location.href="${initParam.root}member_login_form.do";
						}
					}
				});
			}
		});
		$("#ReviewCommentView").on("click", ":input[name=deleteCommentBtn]", function(){
			var commentNo=$(this).val();
			if(confirm("삭제하시겠습니까?")){
				$.ajax({
					type:"post",
					url:"${initParam.root }auth_tradeComment_deleteComment.do",
					data:"tradeNo="+$("#tradeNo").val()+"&tradeCommentNo="+commentNo,
					dataType: 'json',
					success:function(data){
						if(data.flag=="ok"){
							var commentTable="<table class='table'>";
							commentTable+="<tbody>";
							$.each(data.commentList, function(index, comment){
								commentTable+="<tr>";
								commentTable+="<td>";
								commentTable+="<div class='col-md-1'>"+comment.tradeCommentMemberId+"</div>";
								commentTable+="<div class='col-md-8' id='"+comment.tradeCommentNo+"CommentContent'>"+comment.tradeCommentContent+"</div>";
								commentTable+="<div class='col-md-2'>"+comment.tradeCommentTimePosted+"</div>";
								if(comment.tradeCommentMemberId=="${sessionScope.loginInfo.memberId}" || ("${sessionScope.admin.memberId}"=="admin")){
									commentTable+="<div class='col-md-1'>";
									commentTable+="<button type='button' class='btn btn-xs' name='editCommentFormBtn' value='"+comment.tradeCommentNo+"'>수정</button>";
									commentTable+="<button type='button' class='btn btn-xs' name='deleteCommentBtn' value='"+comment.tradeCommentNo+"'>삭제</button>";
									commentTable+="</div>";
								}
								commentTable+="</td>";
								commentTable+="</tr>";
							});
							commentTable+="</tbody>";
							commentTable+="</table>";
							$("#ReviewCommentView").html(commentTable);
						} else if(data.flag=="empty"){
							$("#ReviewCommentView").html("");
						} else{
							location.href="${initParam.root}member_login_form.do";
						}
					}
				});
			}
		});
	});
</script>
<form class="form-horizontal" method="post" id="tradeForm">
	<fieldset>
		<legend>중고거래 내용</legend>
		<div class="form-group">
			<label for="inputMemberId" class="col-lg-2 control-label">아이디</label>
			<div class="col-lg-9">
				<input type="text" class="form-control" id="memberId"
					name="memberId" value="${requestScope.vo.memberId }"
					readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label for="inputMemberId" class="col-lg-2 control-label">조회수</label>
			<div class="col-lg-9">
				<input type="text" class="form-control" id="tradeHit"
					name="tradeHit" value="${requestScope.vo.tradeHit }"
					readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label for="inputTitle" class="col-lg-2 control-label">제목</label>
			<div class="col-lg-9">
				<input type="text" class="form-control" id="tradeTitle"
					name="tradeTitle" value="${requestScope.vo.tradeTitle }"
					readonly="readonly">
			</div>
		</div>

		<div class="form-group">
			<label for="inputContent" class="col-lg-2 control-label">내용</label>
			<div class="col-lg-9">
				<div class="well">
				${requestScope.vo.tradeContent }
				</div>
			</div>
		</div>
		<c:choose>
			<c:when test="${sessionScope.admin != null}">
				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button type="submit" class="btn btn-primary" id="tradeUpdateBtn">수정</button>
						<button type="reset" class="btn btn-default" id="tradeDelete">삭제</button>
						<button type="reset" class="btn btn-default" id="tradeList">목록보기</button>
					</div>
				</div>
			</c:when>
			<c:when
				test="${sessionScope.loginInfo.memberId==requestScope.vo.memberId}">
				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button type="button" class="btn btn-primary" id="tradeUpdateBtn">수정</button>
						<button type="button" class="btn btn-default" id="tradeDelete">삭제</button>
						<button type="button" class="btn btn-default" id="tradeList">목록보기</button>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button type="button" class="btn btn-default" id="tradeList">목록보기</button>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</fieldset>
</form>
<div class="col-md-12">
   <form id="commentForm">
      <div class="col-md-1">댓글</div>
      <div class="col-md-9">
         <input type="hidden" id="tradeNo" name="tradeNo" value="${requestScope.vo.tradeNo }">
         <c:choose>
         	<c:when test="${sessionScope.admin!=null }">
         		<input type="hidden" name="tradeCommentMemberId" id="tradeCommentMemberId" value="${sessionScope.admin.memberId }">
         	</c:when>
         	<c:when test="${sessionScope.loginInfo!=null }">
         		<input type="hidden" name="tradeCommentMemberId" id="tradeCommentMemberId" value="${sessionScope.loginInfo.memberId }">
         	</c:when>
         </c:choose>         
         <input class="form-control" type="text" name="tradeCommentContent" id="tradeCommentContent">
      </div>
      <div class="col-md-2">
         <button type="button" class="btn btn-primary" id="commentBtn">작성</button>
      </div>
   </form>
</div>
<br><br><br>
<div class="col-md-12" id='ReviewCommentView'>
	<c:if test="${fn:length(commentList)!=0 }">
		<table class="table">
			<tbody>
				<c:forEach items="${commentList }" var="comment">
					<tr>
						<td>
							<div class="col-md-1">${comment.tradeCommentMemberId }</div>
							<div class="col-md-8" id="${comment.tradeCommentNo }CommentContent">
								<p>${comment.tradeCommentContent }</p>
							</div>
							<div class="col-md-2">${comment.tradeCommentTimePosted }</div>
							<c:if test="${(comment.tradeCommentMemberId==sessionScope.loginInfo.memberId) || sessionScope.admin != null }">
								<div class="col-md-1">
									<button type="button" class="btn btn-xs" name="editCommentFormBtn" value="${comment.tradeCommentNo }">수정</button><br>
									<button type="button" class="btn btn-xs" name="deleteCommentBtn" value="${comment.tradeCommentNo }">삭제</button>
								</div>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>  
	</c:if>
</div>

