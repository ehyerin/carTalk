<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(document).ready(function(){
	$("#talkWriteForm").submit(function(){
		if($("#talkContents").val()==""){
			alert("내용을 입력하세요!");
			return false;
		}
	});
});
</script>
<div class="container">
	<div class="col-lg-2">
		<h4> talk</h4>
	</div>
</div>
<div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-9">
            <table class="table">
              <thead>
                <tr>
                  <th>글쓴이</th>
                  <th>내용</th>
                  <th>작성일</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach var="bvo" items="${requestScope.lvo.list}">      
				          <tr>
				             <td>${bvo.talkMemberId}</td>
				             <td>${bvo.talkContents}</td>  
				            <td>${bvo.talkTimePosted}</td>
				            <td>
				            <c:if test="${bvo.talkMemberId==sessionScope.loginInfo.memberId||sessionScope.admin!=null}">			            
				           <a href="${initParam.root}talk_delete_board.do?talkNo=${bvo.talkNo}"><input type="button" class="form-control" value="삭제"></a>
				            </c:if>
				            
				            </td>
			       		  </tr>      
        		 </c:forEach>
              </tbody>
            </table>
            <br>
            <br>

				
<c:if test="${sessionScope.loginInfo!=null||sessionScope.admin!=null}">	
<form class="form-inline" action="${initParam.root}talk_write.do" id="talkWriteForm">
   <div class="form-group">
    <label for="exampleInputName2">Name</label>   
 <c:choose>
  <c:when test="${sessionScope.loginInfo!=null}">	
    <input type="button" class="form-control" value="${sessionScope.loginInfo.memberName}">
 	<input type="hidden" name="talkMemberId" value="${sessionScope.loginInfo.memberId}"> 
  </c:when>
  <c:otherwise>
  	<input type="button" class="form-control" value="${sessionScope.admin.memberName}">
  	<input type="hidden" name="talkMemberId" value="${sessionScope.admin.memberId}">
  </c:otherwise>
  </c:choose>
  </div>
  <div class="form-group">
    <label for="exampleInputEmail2">Contents</label>
    <textarea class="form-control" rows="2" cols="60" id="talkContents" name="talkContents" placeholder="내용을 입력하세요"></textarea>
  </div>
  <button type="submit" class="btn btn-default">Send</button>
</form>
	</c:if>    

			<br></br> 
			<br><br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <div class="col-md-12">
            <ul class="pager">
              <li>
                <c:if test="${requestScope.lvo.pagingBean.previousPageGroup}">
					 <a href=
					 "${initParam.root}customercenter_home_notice.do?pageNo=${requestScope.lvo.pagingBean.
					 startPageOfPageGroup-1}">Prev</a>
				 </c:if>
				 &nbsp;&nbsp;
              </li>
              <li>
				    <c:forEach var="i" 
						begin="${requestScope.lvo.pagingBean.startPageOfPageGroup}"
							 end="${requestScope.lvo.pagingBean.endPageOfPageGroup}">
							 <c:choose>
							 <c:when test="${requestScope.lvo.pagingBean.nowPage!=i}">
							 <a href="${initParam.root}customercenter_home_notice.do?pageNo=${i}">${i}</a>
							 </c:when>
							 <c:otherwise>
							${i}
						</c:otherwise>
						</c:choose>
					</c:forEach>	 
					&nbsp;&nbsp;
              </li>
              <li>
                <c:if test="${requestScope.lvo.pagingBean.nextPageGroup}">
	 			<a href=
	 			"${initParam.root}customercenter_home_notice.do?pageNo=${requestScope.lvo.pagingBean.
	 			endPageOfPageGroup+1}">
					 Next
	 				</a>
	 			</c:if>	
              </li>
            </ul>
          </div>
          </div>
        </div>
      </div>
    </div>
