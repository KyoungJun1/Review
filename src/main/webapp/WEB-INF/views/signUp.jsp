<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Creative - Start Bootstrap Theme</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
<!-- Bootstrap Icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
	rel="stylesheet" type="text/css" />
<!-- SimpleLightbox plugin CSS-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
</head>



<!-- Contact-->
<section class="page-section" id="contact">
	<div class="container px-4 px-lg-5">
		<div class="row gx-4 gx-lg-5 justify-content-center">
			<div class="col-lg-8 col-xl-6 text-center">
				<h2 class="mt-0">회원가입</h2>
				<hr class="divider" />
				<p class="text-muted mb-5"></p>
			</div>
		</div>
		<div class="row gx-4 gx-lg-5 justify-content-center mb-5">
			<div class="col-lg-6">
				<!-- * * * * * * * * * * * * * * *-->
				<!-- * * SB Forms Contact Form * *-->
				<!-- * * * * * * * * * * * * * * *-->
				<!-- This form is pre-integrated with SB Forms.-->
				<!-- To make this form functional, sign up at-->
				<!-- https://startbootstrap.com/solution/contact-forms-->
				<!-- to get an API token!-->
				<form action="createMember" id="contactForm" method="post"
					accept-charset="utf-8">
					<!-- Id input-->
					<div class="form-floating mb-3">
						<input class="form-control" id="id" name="id" type="text"
							placeholder="Enter your name..." data-sb-validations="required" />
						<label for="name">아이디</label>
						<div class="invalid-feedback" data-sb-feedback="name:required">빈칸
						</div>

						<div class="invalid-feedback" data-sb-feedback="name:required"
							id="idcheck">중복</div>
					</div>
					<!-- Password input-->
					<div class="form-floating mb-3">
						<input class="form-control" id="pw" name="pw" type="text"
							placeholder="Enter your name..." data-sb-validations="required" />
						<label for="name">비밀번호</label>
						<div class="invalid-feedback" data-sb-feedback="name:required">빈칸
						</div>
					</div>
					<!-- Na me input-->
					<div class="form-floating mb-3">
						<input class="form-control" id="name" name="name" type="text"
							placeholder="Enter your name..." data-sb-validations="required" />
						<label for="name">이름</label>
						<div class="invalid-feedback" data-sb-feedback="name:required">빈
							칸</div>
					</div>
					<!-- Email address input-->
					<div class="form-floating mb-3">
						<input class="form-control" id="email" name="email" type="email"
							placeholder="name@example.com"
							data-sb-validations="required,email" /> <label for="email">이메일</label>
						<div class="invalid-feedback" data-sb-feedback="email:required">빈칸</div>
						<div class="invalid-feedback" data-sb-feedback="email:email"
							id="emailcheck">중복</div>
					</div>
					<!-- Phone number input-->
					<div class="form-floating mb-3">
						<input class="form-control" id="phone" name="phone" type="tel"
							placeholder="(123) 456-7890" data-sb-validations="required" /> <label
							for="phone">휴대폰</label>
						<div class="invalid-feedback" data-sb-feedback="phone:required">빈
							칸</div>
					</div>

					<!-- Address input-->
					<div class="form-floating mb-3">
						<input class="form-control" id="address_kakao" name="address" 
							readonly type="text" placeholder="Enter your name..."
							data-sb-validations="required" /> <label for="name">주소(클릭)</label>
						<div class="invalid-feedback" data-sb-feedback="name:required">빈
							칸</div>
					</div>
					<!-- Address input-->
					<div class="form-floating mb-3">
						<input class="form-control" id="address2" name="address2"
							type="text" placeholder="Enter your name..."
							data-sb-validations="required" /> <label for="name">상세주소</label>
						<div class="invalid-feedback" data-sb-feedback="name:required">빈
							칸</div>
					</div>



					<!-- 주소찾기 스크립트 -->
					<script
						src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script>
						window.onload = function() {
							document
									.getElementById("address_kakao")
									.addEventListener(
											"click",
											function() { //주소입력칸을 클릭하면
												//카카오 지도 발생
												new daum.Postcode(
														{
															oncomplete : function(
																	data) { //선택시 입력값 세팅
																document
																		.getElementById("address_kakao").value = data.address; // 주소 넣기
																document
																		.querySelector(
																				"input[name=address_detail]")
																		.focus(); //상세입력 포커싱
															}
														}).open();
											});
						}
					</script>




					<!-- Submit Button-->
					<div class="d-grid">
						<input class="btn btn-primary btn-xl" id="submitButton"
							type="button" onclick="check();" value="회원가입" />
					</div>
				</form>


				<!-- 회원가입 ajax  -->
				<script>
					function check() {

						const id = $("#id").val();
						const email = $("#email").val();
						
						var id2 = document.getElementById("id").value;
						var pw = document.getElementById("pw").value;
						var name = document.getElementById("name").value;
						var phone = document.getElementById("phone").value;
						var email2 = document.getElementById("email").value;
						var address = document.getElementById("address_kakao").value;
						var address2 = document.getElementById("address2").value;
						if(!id || !pw || !name || !phone || !email || !email || !address || !address2){
							alert("빈 칸을 채워주세요!");
							return;
						}

						$.ajax({

							type : 'post',
							url : 'createMemberCheck',
							data : {
								id : id,
								email : email
							},
							success : function(data) {

								if (data[0] != null) {
									$("#idcheck").attr('class', 'remove');
								}
								if (data[1] != null) {
									$("#emailcheck").attr('class', 'remove');
								}
								if (data[0] == null && data[1] == null) {
									document.getElementById("contactForm")
											.submit();

								}

							},
							error : function() {
								alert("실패");
							}
						})

					}
				</script>
			</div>
		</div>
		<div class="row gx-4 gx-lg-5 justify-content-center">
			<div class="col-lg-4 text-center mb-5 mb-lg-0">
				<i class="bi-phone fs-2 mb-3 text-muted"></i>
				<div>+1 (555) 123-4567</div>
			</div>
		</div>
	</div>
</section>
<!-- Footer-->
<footer class="bg-light py-5">
	<div class="container px-4 px-lg-5">
		<div class="small text-center text-muted">Copyright &copy; 2021
			- Company Name</div>
	</div>
</footer>

<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- SimpleLightbox plugin JS-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
<!-- Core theme JS-->
<script src="resources/js/scripts.js"></script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<!-- 주소 찾기 API -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--  제이쿼리 cdn -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</body>
</html>
