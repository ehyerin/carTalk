<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
#Mobilemenu{
    display: none;
    }

@media only screen and (min-device-width : 320px) and (max-device-width : 480px) {

    #menu {
    display:none;
    }
    #Mobilemenu{
    display: block;
    }
}

</style>

<div align="center" id="menu" >
<h4><a href="${initParam.root }trade_list.do"><img src="${initParam.root }img/Qna.png" ><br>중고거래</a></h4><br><br>
<h4><a href="${initParam.root }talk_list.do"><img src="${initParam.root }img/review.jpg" width="57" height="47" ><br>TALK</a></h4><br><br>
</div>
<div align="center" id="Mobilemenu">
<a href="${initParam.root }talk_list.do"><img src="${initParam.root }img/Qna.png" ></a>
<a href="${initParam.root }customercenter_review_list.do"><img src="${initParam.root }img/review.jpg" width="57" height="47" ></a>
</div>












