<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href='../../css/style.css'/>

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
 					 <input type="checkbox" class="form-check-input" id="exampleCheck1">
  					  <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div>
  <button type="submit" class="btn btn-primary btn-block">로그인</button>
  <button type="button" class="btn btn-primary btn-block" onclick="location.href='../user/form' ">회원가입</button>
</form>
		</section>
	</section>
</section>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
</body>
</html>
