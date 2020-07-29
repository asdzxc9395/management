<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href='../../css/style.css'/>
<title>회원가입</title>
</head>
<body>
<section class="container-fluid bg">
	<section class="row justify-content-center">
		<section class="col-12 col-sm-6 col-md-3">
			<form class="form-container" action='add' method='post' method='post' enctype='multipart/form-data'>
  				<div class="form-group">
 				   <label for="exampleInputEmail1">Email</label>
 				   <input type="email" class="form-control" id="exampleInputEmail1" name='id' aria-describedby="emailHelp">
 				 </div>
 				 <div class="form-group">
 				   <label for="exampleInputPassword1">Password</label>
 				   <input type="password" class="form-control" name="password" id="exampleInputPassword1">
				  </div>
 				 <div class="form-group">
 				   <label for="exampleInputPassword1">Name</label>
 				   <input type="text" class="form-control" name="name" id="exampleInputPassword1">
				  </div>
 				 <div class="form-group">
 				   <label for="exampleInputPassword1">image</label>
 				   <input type="file" class="form-control" name="photoFile" id="exampleInputPassword1">
				  </div>
  				<button type="submit" class="btn btn-primary btn-block">로그인</button>
  				<button type="button" class="btn btn-primary btn-block" onclick="location.href='../auth/login' ">돌아가기</button>
</form>
		</section>
	</section>
</section>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
</form>
</body>
</html>
        <script>
    //const emailReg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    const emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

    const passwordReg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

    $('#completeBtn').click(function(event){
    	event.preventDefault();
        if($('#emailInput').val() == "" || $('#nameInput').val() == "" || $('#passwordInput') == "") {
        	$('#form-label').html("모든 정보를 입력해주세요.");
        } else {
            let email = $('#emailInput').val()
            let password = $('#passwordInput').val();
            let password2 = $('#passwordInput2').val();
            if(emailReg.test(String(email).toLowerCase()) == false) {
            	$('#emailInput').focus();
          		$('#form-label').html("올바른 이메일 형식을 입력해주세요.");
            } else if(passwordReg.test(password) == false) {
            	$('#passwordInput').focus();
	            $('#form-label').html("비밀번호는 8자 이상이어야 하며, 숫자/소문자/특수문자를 모두 포함해야 합니다.");
	          } else if(password != password2) {
	        	  $('#passwordInput2').focus();
            	$('#form-label').html("비밀번호와 재확인 비밀번호가 일치하지 않습니다.");
            } else if(emailReg.test(String(email).toLowerCase()) == true && passwordReg.test(password) == true) {
            	$.ajax({
            		url : 'signup',
            		method: 'POST',
            		data:{
            			email:$('#emailInput').val(),
            			name:$('#nameInput').val(),
            			password:$('#passwordInput').val()
            		},
            		beforeSend:function(){
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
                         + 'px; z-index:9999; background:#f0f0f0; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="/Team-project/images/loading.gif" style="width:50px; height:50px;"></div>');
                        }
            		},
            		complete: function () {
                  $("#div_ajax_load_image").hide();
                },
                statusCode:{
                	400:function(){
                		$('#form-label').html("이미 회원으로 가입된 이메일입니다.");
                	},
                	200:function(){
                	    Swal.fire({
                	            icon : 'success',
                	            title : '회원가입을 완료하기 위해 이메일을 인증해주세요!'
                	        }).then((result) => {
                                    if (result.value) {
                	        	           location.href="../auth/form";
                                    }
                          });
                  }
            	}//statusCode
	          }); // ajax
        }
      }//else      
    });//click
    
    $("input").keydown(function(key) {
        if (key.keyCode == 13) {
          $("#completeBtn").trigger("click");
        }
    });
    </script> 
    