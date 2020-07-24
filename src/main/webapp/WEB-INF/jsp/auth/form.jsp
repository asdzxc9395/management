<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<h1>로그인(JSP + EL + JSTL)</h1>
<form action='login' method='post'>
이메일: <input name='id' type='email' value='${cookie.id.value}'>
<input type='checkbox' name='saveEmail'> 이메일 저장해두기<br>
암호: <input name='password' type='password'><br>
<button>로그인</button>
<button type="button" onclick="location.href='../user/form' ">회원가입</button>
<!-- <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button> -->
</form>

