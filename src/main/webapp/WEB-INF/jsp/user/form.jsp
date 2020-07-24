<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>


<h1>회원 입력(JSP)</h1>
<form action='add' method='post' enctype='multipart/form-data'>
아이디: <input name='id' type='email'><br>
암호: <input name='password' type='password'><br>
이름: <input name='name' type='text'><br>
사진: <input name='photoFile' type='file'><br>
<button>제출</button>
</form>

    