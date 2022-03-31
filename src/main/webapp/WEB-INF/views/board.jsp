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





							</ul>
						</li>

						<!-- 게시판 페이징 영역 -->
						<li>
							<div id="divPaging">
								<div onclick="location.href='boardPage?num=${page[0] -1}'">>◀</div>
								<c:forEach var="i" begin="${page[0] }" end="${page[1] }">

									<c:choose>
										<c:when test="${num == i }">

											<div>
												<b>${i }</b>
											</div>

										</c:when>

										<c:otherwise>
											<div onclick="location.href='boardPage?num=${i}'">${i }</div>
										</c:otherwise>

									</c:choose>



								</c:forEach>

								<div onclick="location.href='boardPage?num=${page[1] +1}'">>▶</div>

							</div>
						</li>

						<input class="btn btn-primary btn-xl" id="submitButton"
							type="button" onclick="location.href='boardAddPage?num=${num}'" value="추가">


						<!-- 검색 폼 영역 -->
						<li id='liSearchOption'>
							<div>
								<select id='selSearchOption'>
									<option value='A'>제목+내용</option>
									<option value='T'>제목</option>
									<option value='C'>내용</option>
								</select> <input id='txtKeyWord' /> <input type='button' value='검색' />
							</div>

						</li>

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
