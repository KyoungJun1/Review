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
	<!-- Navigation-->

	<header class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">도서관</h1>
				<p class="lead fw-normal text-white-50 mb-0">${name }님방문을환영합니다.
					<br> <input class="btn btn-primary btn-xl" id="submitButton"
						type="button" onclick="location.href='main'" value="메인으로">
					<br> <br>
				<div class="col mb-5">

					<form action="libraryPage">
						<input id="name" name="name" /> <input type='submit' value='검색' />
					</form>
					<br> <input class="btn btn-primary btn-xl" id="submitButton"
						type="button" onclick="location.href='libraryPage'" value="전체조회">
				</div>


				</p>


			</div>
		</div>
	</header>
	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
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
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="detailsPage?page=${l.num }">자세히 보기</a>
								</div>
							</div>
						</div>
					</div>

				</c:forEach>



			</div>




		</div>

	</section>

	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2021</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scriptstwo.js"></script>
</body>
</html>
