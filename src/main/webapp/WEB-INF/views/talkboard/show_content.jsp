<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${initParam.root}css/board.css" type="text/css">
<script type="text/javascript">
function sendList(){
	location.href="${initParam.root}index.jsp";
}
function deleteBoard(){
	if(confirm("게시글을 삭제하시겠습니까?")){
		location.href="DispatcherServlet?command=delete&no=${requestScope.bvo.no }";
	}
}
function updateBoard(){
	if(confirm("게시글을 수정하시겠습니까?")){
		location.href="DispatcherServlet?command=update&no=${requestScope.bvo.no }";
	}
}
</script>
</head>
<body>
	<c:import url="/template/header.jsp"></c:import>
	<table class="content">
		<tr>
			<td>NO : ${requestScope.bvo.no } </td>
			<td colspan="2">${requestScope.bvo.title} </td>
		</tr>
		<tr>
			<td>작성자 :  ${requestScope.bvo.memberVO.name }</td>
			<td> ${requestScope.bvo.timePosted }</td>
			<td>조회수 : ${requestScope.bvo.hits }</td>
		</tr>
		<tr>
			<td colspan="3">
			<pre>${requestScope.bvo.content}</pre>
			</td>
		</tr>
		<tr>
			<td valign="middle" align="center" colspan="3">
			 <img class="action" src="${initParam.root}img/list_btn.jpg" onclick="sendList()" >
			 <c:if test="${requestScope.bvo.memberVO.id==sessionScope.mvo.id}">
			 <img class="action"  onclick="deleteBoard()" src="${initParam.root}img/delete_btn.jpg" > 
			 <img class="action"  onclick="updateBoard()" src="${initParam.root}img/modify_btn.jpg" >
			 </c:if>
			 <br><br>			
			 </td>
		</tr>
	</table>
</body>
</html>