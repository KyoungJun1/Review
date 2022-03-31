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
				<input class="btn btn-primary btn-xl" id="submitButton"
					type="button" onclick="location.href='main'" value="메인으로">

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


				<div id="mainWrapper">

					<ul>
						<!-- 게시판 제목 -->

						<!-- 게시판 목록  -->
						<li>
							<ul id="ulTable">
								<li>
									<ul>
										<li>No</li>
										<li>제목</li>
										<li>작성일</li>
										<li>작성자</li>
										<li>좋아요</li>
										<li>조회수</li>


									</ul>
								</li>
								<!-- 게시물이 출력될 영역 -->
								<c:forEach var="i" items="${boardList}">
									<li onclick="location.href='boardDetails?num=${i.num}'">
										<ul>
											<li>${i.num }</li>
											<li class="left">${i.title }</li>
											<li>${i.date }</li>
											<li>${i.id }</li>
											<li>${i.likePoint }</li>
											<li>${i.seePoint }</li>

										</ul>
									</li>

								</c:forEach>

								<br>
								<div id="pagingArea">
									<input class="btn btn-primary btn-xl" id="submitButton"
										type="button"
										onclick="location.href='boardAddPage?num=${num}'" value="추가">
									<br>
									<ul class="pagination">
										<c:choose>
											<c:when test="${ pi.currentPage ne 1 }">
												<li class="page-item"><a class="page-link"
													href="boardPage?num=${ pi.currentPage-1 }">Previous</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item disabled"><a class="page-link"
													href="">Previous</a></li>
											</c:otherwise>
										</c:choose>

										<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }"
											var="p">
											<c:choose>
												<c:when test="${ pi.currentPage ne p }">
													<li class="page-item"><a class="page-link"
														href="boardPage?num=${ p }">${ p }</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item disabled"><a class="page-link"
														href="">${ p }</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>


										<c:choose>
											<c:when test="${ pi.currentPage ne pi.maxPage }">
												<li class="page-item"><a class="page-link"
													href="boardPage?num=${ pi.currentPage+1 }">Next</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item disabled"><a class="page-link"
													href="boardPage?num=${ pi.currentPage+1 }">Next</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>



							</ul>
						</li>

						<!-- 게시판 페이징 영역 -->
						<li></li>






					</ul>


				</div>

			</div>

		</div>
	</section>

	<c:choose>
		<c:when test="${check=='no' }">
			<script>
				alert("로그인 후 사용");
			</script>
		</c:when>

	</c:choose>


	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scriptstwo.js"></script>
</body>
</html>
