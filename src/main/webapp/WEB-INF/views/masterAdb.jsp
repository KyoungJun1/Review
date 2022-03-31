<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
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



<section class="page-section" id="contact">
	<div class="container px-4 px-lg-5">
		<div class="row gx-4 gx-lg-5 justify-content-center">
			<div class="col-lg-8 col-xl-6 text-center">
				<h2 class="mt-0">관리자 도서관</h2>
				<input class="btn btn-primary btn-xl" id="submitButton"
							type="button" onclick="location.href='main'" value="메인으로">
				
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

				<c:forEach items="${libList }" var="l">

					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top"
								src="resources/assets/img/library/${l.picture }" alt="..."
								style="width: 268px; height: 250px;" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">${l.name }</h5>
									<!-- Product price-->

									${l.state }
								</div>
							</div>



							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">

								<c:if test="${l.state eq '대여가능'}">

									<div class="text-center">
										<a class="btn btn-outline-dark mt-auto"
											onclick="controll(this.id);" id="${l.num }">대여 처리</a>

									</div>
								</c:if>
								<c:if test="${l.state eq '대여중'}">


									<div class="text-center">
										<a class="btn btn-outline-dark mt-auto"
											href="bookb?num=${l.num }">반납 처리</a>

									</div>
								</c:if>
								<c:if test="${l.state eq '예약중'}">
									<div class="text-center">
										<a class="btn btn-outline-dark mt-auto"
											href="bookc?num=${l.num }">예약 취소</a>

									</div>
								</c:if>

							</div>
						</div>
					</div>

				</c:forEach>




				<form action="bookAdd" method="post" id="contactForm"></form>
			</div>
		</div>

		<!--예약 스크립트-->
		<script>
			function controll(a) {

				console.log(a);
				var input = prompt('대여할 아이디를 입력하세요');

				$.ajax({

					url : "booka",
					data : {
						id : input
					},
					success : function(data) {

						if (data === "false") {
							alert("아이디가 존재하지 않습니다.");
						} else {
							alert("대여 신청 완료");

							location.replace('bookaa?num=' + a + '&input='
									+ input);

						}

					},
					error : function() {
						alert("에러 발생")
					}

				})

			}

			function res() {

				alert("a");

			}
		</script>

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
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>

		</body>
</html>
