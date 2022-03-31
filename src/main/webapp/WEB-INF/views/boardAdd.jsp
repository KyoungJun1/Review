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
<link href="resources/css/stylesthree.css" rel="stylesheet" />
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light"></nav>
	<!-- Header-->
	<header class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">게시판</h1>
				<p class="lead fw-normal text-white-50 mb-0"></p>
				<br>

			</div>
		</div>
	</header>
	<!-- Section-->
	<section class="py-5">

		<div class="container px-4 px-lg-5 mt-5">

			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<form action="boardAdd" id="contactForm" method="post"
					accept-charset="utf-8">
					<!-- Id input-->
					<div class="form-floating mb-3">
						<input class="form-control" id="title" name="title" type="text"
							placeholder="Enter your name..." data-sb-validations="required" />
						<label for="name">제목</label>
						<div class="invalid-feedback" data-sb-feedback="name:required"
							id="idcheck">A name is required.</div>
					</div>










					<!-- Submit Button-->
			</div>
			<div class="form-floating mb-3">
				<textarea class="form-control" id="content" name="content" type="text"
					placeholder="Enter your name..." data-sb-validations="required"
					style="height: 400px"></textarea>
				<label for="name">내용</label>
				<div class="invalid-feedback" data-sb-feedback="name:required">A
					name is required.</div>
			</div>
			<div class="d-grid">
				<input class="btn btn-primary btn-xl" id="submitButton"
					type="submit" value="작성" />
			</div>
			</form>

		</div>
	</section>



	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scriptstwo.js"></script>
</body>
</html>
