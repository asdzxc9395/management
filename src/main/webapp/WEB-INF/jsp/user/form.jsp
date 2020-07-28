<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    

<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
<h1>회원 입력(JSP)</h1>
<form action='add' method='post' enctype='multipart/form-data'>
아이디: <input name='id' type='email'><br>
암호: <input name='password' type='password'><br>
이름: <input name='name' type='text'><br>
사진: <input name='photoFile' type='file'><br>
<button>제출</button>
</form>
</body>
</html>
<!--         <script>
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
    </script> -->
    