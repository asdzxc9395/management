<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<h1>회원 상세정보(JSP + EL + JSTL)</h1>
<c:if test="${not empty member}">
<form action='update' method='post' enctype='multipart/form-data'>
<img src='${pageContext.servletContext.contextPath}/upload/user/${user.image}' height='80'><br>
번호: <input name='no' type='text' readonly value='${user.userNo}'><br>
이름: <input name='name' type='text' value='${user.name}'><br>
이메일: <input name='email' type='email' value='${user.id}'><br>
암호: <input name='password' type='password'><br>
사진: <input name='photoFile' type='file'><br>
<p><button>변경</button>
<a href='delete?no=${user.no}'>삭제</a></p>
</form>
</c:if>

<c:if test="${empty member}">
<p>해당 회원이 없습니다.</p>
</c:if>
    