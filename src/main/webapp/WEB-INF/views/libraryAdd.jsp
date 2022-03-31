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
<title>Blog Home - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body>

	<!-- Header-->
	<header class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">도서관</h1>
				<input class="btn btn-primary btn-xl" id="submitButton"
							type="button" onclick="location.href='main'" value="메인으로">
				

				</p>
			</div>
		</div>
	</header>
	<!-- Page content-->
	<div class="container">
		<div class="row">
			<!-- Blog entries-->
			<div class="col-lg-8">
				<!-- Featured blog post-->
				<br>
				<div class="card mb-4">
					<a href="#!"><img class="card-img-top"
						src="resources/assets/img/library/${book.picture }" alt="..." style="width: 850px; height: 600px;" /></a>
					<div class="card-body">
						<div class="small text-muted">${book.date }</div>
						<h2 class="card-title">${book.name }</h2>
						<div class="small text-muted">${book.state }</div>
					</div>
				</div>
				<!-- Nested row for non-featured blog posts-->
				<br> <br> <br> <br> <br> <br> <br>

				<!-- Pagination-->

			</div>
			<!-- Side widgets-->
			<div class="col-lg-4">

				<!--예약 스크립트-->
				<script>
					function res() {

					
						
						if (!confirm("확인(예) 또는 취소(아니오)를 선택해주세요.")) {
					        // 취소(아니오) 버튼 클릭 시 이벤트
					    } else {
								
					    	   location.replace('reservation?num='+${book.num});


					    }	
						
					}
				</script>
				<!-- Side widget-->
				<br>
				<div class="card mb-4">
					<div class="card-header">예약</div>
					<div class="card-body">
						<a class="btn btn-primary" href="#!">장바구니 담기(추가예정)</a>
						<c:if test="${book.state =='대여가능'}">
							<a class="btn btn-primary" onclick="res();">즉시 예약</a>

						</c:if>



					</div>
				</div>
				<!-- Side widget-->
				<div class="card mb-4">
					<div class="card-header">상세 설명</div>

					<div class="card-body">책을 설명란 (패스)</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2021</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
</body>
</html>

