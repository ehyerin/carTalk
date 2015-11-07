<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var flag=confirm("회원가입이 완료되었습니다.");
	if(flag){
		location.href="${initParam.root }home.do";
	}
</script>