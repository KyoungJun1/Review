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
<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3"
		id="mainNav">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="#page-top">Review</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">

				<c:choose>
					<c:when test="${empty name }">

						<ul class="navbar-nav ms-auto my-2 my-lg-0">
							<li class="nav-item"><a class="nav-link" href=""
								onclick="check();">게시판</a></li>
							<li class="nav-item"><a class="nav-link" href=""
								onclick="check();">도서관</a></li>
							<li class="nav-item"><a class="nav-link" href=""
								onclick="check();">마이페이지</a></li>
						</ul>

					</c:when>

					<c:otherwise>
						<ul class="navbar-nav ms-auto my-2 my-lg-0">
							<li class="nav-item"><a class="nav-link"
								href="boardPage?num=1">게시판</a></li>
							<li class="nav-item"><a class="nav-link" href="libraryPage">도서관</a></li>
							<li class="nav-item"><a class="nav-link" href="myPage">마이페이지</a></li>
						</ul>

					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</nav>


	<script>
		function check() {

			alert("로그인 후 이용가능");
		}
	</script>




	<!-- Masthead-->
	<header class="masthead">
		<div class="container px-4 px-lg-5 h-100">
			<div
				class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
				<div class="col-lg-8 align-self-end">
					<h1 class="text-white font-weight-bold">
						<c:choose>
							<c:when test="${empty name}">
								Review			
        					 </c:when>
							<c:otherwise>
       							${name } 님의 복습
    				          </c:otherwise>
						</c:choose>


					</h1>
					<hr class="divider" />
				</div>
				<div class="col-lg-8 align-self-baseline">
					<p class="text-white-75 mb-5">복습하기</p>

					<c:choose>
						<c:when test="${empty name}">
							<a class="btn btn-primary btn-xl" href="loginPage">로그인</a> &nbsp;
         </c:when>

						<c:otherwise>
							<a class="btn btn-primary btn-xl" href="logout">로그아웃</a> &nbsp;
    				    
         </c:otherwise>
					</c:choose>
					<button class="btn btn-primary btn-xl" id="submitButton"
						type="button" onclick="location.href='master'">관리자 페이지</button>
					<br>



				</div>
			</div>
		</div>
	</header>


	<!-- Bootstrap core JS-->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>


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
</body>
</html>
