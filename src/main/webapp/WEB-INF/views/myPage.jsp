<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Homepage - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="resources/assets/favicontwo.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/stylestwo.css" rel="stylesheet" />
</head>
<body>
	
	<!-- Header-->
	<header class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">마이수정</h1>
				<p class="lead fw-normal text-white-50 mb-0">${m.name}님</p>
				<br>
					<button class="btn btn-primary btn-xl" id="submitButton"
							type="button" onclick="location.href='myBooks'">마이 도서 이동</button>
							<br><br>
							<input class="btn btn-primary btn-xl" id="submitButton"
							type="button" onclick="location.href='main'" value="메인으로">
				
			</div>
		</div>
	</header>
	<!-- Section-->
	<section class="py-5">

		<div class="container px-4 px-lg-5 mt-5">

			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">


				<form action="reMember" id="contactForm" method="post" id="reMember"
					accept-charset="utf-8">
					<!-- Id input-->
					<div class="form-floating mb-3">
					
						 <input class="form-control" id="id" name="id" id="id"
							type="text" value="${m.id }" readonly
							placeholder="Enter your name..." data-sb-validations="required" />
						<label for="name">아이디</label>
						<div class="invalid-feedback" data-sb-feedback="name:required"
							id="idcheck">A name is required.</div>
					</div>
					<!-- Password input-->
					<div class="form-floating mb-3">
						<input class="form-control" id="pw" name="pw" type="text"
							placeholder="Enter your name..." data-sb-validations="required" />
						<label for="name">비밀번호</label>
						<div class="invalid-feedback" data-sb-feedback="name:required">A
							name is required.</div>
					</div>
					<!-- Na me input-->
					<div class="form-floating mb-3">
						<input class="form-control" id="name" type="text" readonly
							value="${m.name }" placeholder="Enter your name..."
							data-sb-validations="required" /> <label for="name">이름</label>
						<div class="invalid-feedback" data-sb-feedback="name:required">A
							name is required.</div>
					</div>
					<!-- Email address input-->
					<div class="form-floating mb-3">
						<input class="form-control" id="email" " type="emil" readonly
							value="${m.email }" placeholder="name@example.com"
							data-sb-validations="required,email" /> <label for="email">이메일</label>
						<div class="invalid-feedback" data-sb-feedback="email:required">An
							email is required.</div>
						<div class="invalid-feedback" data-sb-feedback="email:email"
							id="emailcheck">Email is not valid.</div>
					</div>
					<!-- Phone number input-->
					<div class="form-floating mb-3">
						<input class="form-control" id="phone" name="phone" type="tel"
							placeholder="(123) 456-7890" data-sb-validations="required" value="${m.phone }"/> <label
							for="phone">휴대폰</label>
						<div class="invalid-feedback" data-sb-feedback="phone:required">A
							phone number is required.</div>
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
							type="submit" value="수정" />
					</div>
				</form>

				<script>
					
				</script>



			</div>
		</div>
	</section>



	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scriptstwo.js"></script>
</body>
</html>
