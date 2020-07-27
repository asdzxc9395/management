<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<title>Expense</title>
<link rel="stylesheet" href='https://fonts.googleapis.com/css?family=Montserrat:400,800'/>
<link rel="stylesheet" href='../../css/style.css'/>
</head>
<body>
<div class="header">
<div class="inner_header">
<div class="logo_container">
<h1>MY<span>SITE</span></h1>
</div>
 <form action='search' method='get'>
<ul class="navigation">
<a><li>등록년월:
<input name='registrationDate' type='date' id="registrationDate">
</li></a>
<a><li>사용내역:
<select id="name" name="name">
		  		<option value="" selected> 선택</option>
    			<option value="식대(야근)">식대(야근)</option>
			    <option value="택시비(야근)">택시비(야근)</option>
			    <option value="택시비(회식)">택시비(회식)</option>
			    <option value="사무용품구매">사무용품구매</option>
    			<option value="교육비">교육비</option>
   			    <option value="접대비">접대비</option>
			</select>
</li></a>
<a><li>처리상태:
<select id="processStatus" name="processStatus">
		  		<option value="" selected> 선택</option>
			    <option value="접수">접수</option>
			    <option value="승인">승인</option>
			    <option value="지급완료">지급완료</option>
    			<option value="반려">반려</option>
			</select>
</li></a>
<a><li><button>검색</button></li></a>
<a href="../expense/list"><li>초기화</button></li></a>
<a href="../auth/logout"><li>로그아웃</button></li></a>
<a><li>
<c:if test="${not empty loginUser.image  && loginUser.image ne 'undefined'}">
              <span class="header__user__photo">
              <div id="headerUserName" data-toggle="modal" data-target="#userDetailModal" style="cursor: pointer;">
              <img class="img-thumbnail" style="border:0;" id="headerUserName"
                src='${pageContext.servletContext.contextPath}/upload/user/${loginUser.image}'></div>
                </span>
          </c:if>
          <c:if test="${empty loginUser.image || loginUser.image eq 'undefined'}">
            <i class="far fa-user" style="font-size: 1.5em; margin-right: 0.3em;"></i>
          </c:if>
</li></a>
</ul>
</form>
</div>
</div>
<div class="modal fade" id="userDetailModal" tabindex="-1" role="dialog" aria-labelledby="userDetailModalTitle"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="userDetailModalTitle">내 상세정보</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div id="modal-user-profile-div">
          <img id="modal-user-img" src='' style="border-radius: 100%; object-fit: cover;">
        </div>
        <form class="d-flex flex-column" id="modal-user-update" action='../user/update' method='post'
          enctype='multipart/form-data'>
          <input name='userNo' type='hidden'>
          <div class="form-group">
            <label>아이디</label><input class="form-control" name='id' type='email' readonly
              style="background-color: white;">
          </div>
          <div class="form-group">
            <label>이름</label><input class="form-control" name='name' type='text' maxlength="30">
          </div>
          <div class="form-group">
            <label>암호</label><input class="form-control" name='password' type='password'
              placeholder="변경하고자하는 비밀번호를 입력하세요.">
          </div>
          <div class="form-group">
            <label for='user-photo-input'>프로필 사진 업로드</label> <input name='photo' type='file'
              class="btn btn-light btn-sm">
          </div>
          <div class="d-flex">
            <button id="modal-user-delete-btn" type="button" class="btn btn-danger btn-sm">계정삭제</button>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="user-update-closeBtn">닫기</button>
        <button type="button" class="btn btn-primary" id="user-update-updateBtn">저장</button>
      </div>
    </div>
  </div>
</div>

<script>
var userJson;
$('#headerUserName').click(function () {
  let xhr = new XMLHttpRequest();
  console.log(${loginUser.userNo});
  xhr.open("GET", "../user/detail?userNo=${loginUser.userNo}", true);
  xhr.onreadystatechange = () => {
        if(xhr.readyState == 4) {
          if(xhr.status == 200) {
            userJson = JSON.parse(xhr.responseText);
            console.log(userJson);
            if(userJson.image != undefined && userJson.image != 'undefined') {
          document.getElementById('modal-user-img').setAttribute('src', '${pageContext.servletContext.contextPath}/upload/user/'+userJson.image);
            } else if(userJson.image != undefined && userJson.image != 'undefined' && userJson.loginMethod > 0) {
                document.getElementById('modal-user-img').setAttribute('src', userJson.image);
            } else {
                $('#modal-user-profile-div').html('<i class="far fa-user"></i>');
            }
        let userUpdateForm = document.getElementById('modal-user-update');
        userUpdateForm.userNo.value = userJson.userNo;
        userUpdateForm.id.value = userJson.id;
        userUpdateForm.name.value = userJson.name;
      }
    } 
 }
  xhr.send();
});

$('#user-update-updateBtn').click(()=>{
    $('#modal-user-update').submit();
   });

</script>
