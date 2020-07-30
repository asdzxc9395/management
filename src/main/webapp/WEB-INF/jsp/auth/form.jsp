<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<html>
<head>
<link rel="stylesheet" href="../../css/style.css" />

<!-- sweet alert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://kit.fontawesome.com/764f0503e3.js" crossorigin="anonymous"></script>
<!-- 부트스트랩 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</head>
<body>
<section class="container-fluid bg">
	<section class="row justify-content-center">
		<section class="col-12 col-sm-6 col-md-3">
			<form class="form-container" action='login' method='post'>
  				<div class="form-group">
 				   <label for="exampleInputEmail1">Email</label>
 				   <input type="email" class="form-control" id="exampleInputEmail1" name='id' aria-describedby="emailHelp">
 				   <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
 				 </div>
 				 <div class="form-group">
 				   <label for="exampleInputPassword1">Password</label>
 				   <input type="password" class="form-control" name="password" id="exampleInputPassword1">
				  </div>
				  <div class="form-group form-check">
 					 <input type="checkbox" class="form-check-input" id="exampleCheck1" name="saveId">
  					  <label class="form-check-label" for="exampleCheck1">Check me out</label>
 					<div data-toggle="modal" data-target="#findPasswordModal" class="mt-3 text-muted" style="cursor:pointer;">
  							<small>비밀번호를 잊으셨나요?</small>
  				 	</div>
  				 </div>
  				 
  <button type="submit" class="btn btn-primary btn-block">로그인</button>
  <button type="button" class="btn btn-primary btn-block" onclick="location.href='../user/form' ">회원가입</button>
</form>
		</section>
	</section>
</section>

<div class="modal fade" id="findPasswordModal" tabindex="-1" role="dialog" aria-labelledby="findPasswordLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="findPasswordLabel">비밀번호 찾기</h5>
        <button id="memberAddModalClose" type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form id='findPasswordForm' action='findPassword' method='post' class="inputGroup">
      <div class="modal-body">
          <input class="form-control" type="email" name="id" id="emailInput" placeholder="이메일을 입력하세요." />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="findPasswordBtn">임시비밀번호 발급</button>
      </div>
      </form>
    </div>
  </div>
</div>
<script>
//비밀번호 찾기
$('#findPasswordBtn').click(function() {
   $.ajax({
       url: "findPassword",
      method:"GET",
      data:{
	      id:$('#emailInput').val()
      },
      beforeSend:function() {
	  var width = 0;
          var height = 0;
          var left = 0;
          var top = 0;
          width = 50;
          height = 50;
          top = ( $(window).height() - height ) / 2 + $(window).scrollTop();
          left = ( $(window).width() - width ) / 2 + $(window).scrollLeft();
          if($("#div_ajax_load_image").length != 0) {
                 $("#div_ajax_load_image").css({
                        "top": top+"px",
                        "left": left+"px"
                 });
                 $("#div_ajax_load_image").show();
          }
          else {
                 $('body').append('<div id="div_ajax_load_image" style="position:absolute; top:' 
                 + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height 
                 + 'px; z-index:9999; background:#f0f0f0; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="/management/images/loading.gif" style="width:50px; height:50px;"></div>');
                }
      },
      complete:function() {
	      $("#div_ajax_load_image").hide();
      },
      statusCode:{
	      200:function() {
  		    Swal.fire({
  		        icon : 'success',
  		        title : '이메일로 임시비밀번호를 발급했습니다.'
  		    });
	      },
	      400:function() {
		        Swal.fire({
	              icon : 'error',
	              title : '유효하지 않는 이메일입니다.'
	          });
	      }
      }
   }); 
});
</script>
</body>
</html>
