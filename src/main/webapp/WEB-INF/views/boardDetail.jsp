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
<title>Fuck</title>
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

				<c:choose>
					<c:when test="${id eq board.id }">
						<form action="boardAdd" id="contactForm" method="post"
							accept-charset="utf-8">


							<!-- Id input-->
							<div class="form-floating mb-3">
								<input class="form-control" id="title" name="title" type="text"
									value="${board.title }" style=""
									placeholder="Enter your name..." data-sb-validations="required" />
								<label for="name">제목</label>
								<div class="invalid-feedback" data-sb-feedback="name:required"
									id="idcheck">A name is required.</div>

							</div>
							<div class="form-floating mb-3">
								<input class="form-control" id="title" name="title" type="text"
									value="${board.seePoint }" readonly style=""
									placeholder="Enter your name..." data-sb-validations="required" />
								<label for="name">조회수</label>
								<div class="invalid-feedback" data-sb-feedback="name:required"
									id="idcheck">A name is required.</div>

							</div>
							<div class="form-floating mb-3">
								<input class="form-control" id="title" name="title" type="text"
									value="${board.likePoint}" readonly style=""
									placeholder="Enter your name..." data-sb-validations="required" />
								<label for="name">좋아요</label>
								<div class="invalid-feedback" data-sb-feedback="name:required"
									id="idcheck">A name is required.</div>

							</div>

							<div class="form-floating mb-3">
								<textarea class="form-control" id="content" name="content"
									type="text" placeholder="Enter your name..."
									data-sb-validations="required" style="height: 400px">${board.content }</textarea>
								<label for="name">내용</label>
								<div class="invalid-feedback" data-sb-feedback="name:required">A
									name is required.</div>
							</div>
							<div class="d-grid">
								<input class="btn btn-primary btn-xl" id="submitButton"
									type="submit" value="수정" /> <br> <input
									class="btn btn-primary btn-xl" id="" type="button" value="삭제"
									onclick="location.href='boardDel?num=${board.num}'" />
							</div>

							<!-- Submit Button-->
			</div>

			</form>




		</div>

		</c:when>
		<c:otherwise>
			<form action="boardAdd" id="contactForm" method="post"
				accept-charset="utf-8">

				<!-- Id input-->
				<div class="form-floating mb-3">
					<input class="form-control" id="title" name="title" type="text"
						value="${board.title }" readonly style=""
						placeholder="Enter your name..." data-sb-validations="required" />
					<label for="name">제목</label>
					<div class="invalid-feedback" data-sb-feedback="name:required"
						id="idcheck">A name is required.</div>

				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="title" name="title" type="text"
						value="${board.seePoint }" readonly style=""
						placeholder="Enter your name..." data-sb-validations="required" />
					<label for="name">조회수</label>
					<div class="invalid-feedback" data-sb-feedback="name:required"
						id="idcheck">A name is required.</div>

				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="like" name="title" type="text"
						value="${board.likePoint }" readonly style=""
						placeholder="Enter your name..." data-sb-validations="required" />
					<label for="name">좋아요</label>
					<div class="invalid-feedback" data-sb-feedback="name:required"
						id="idcheck">A name is required.</div>

				</div>

				<div class="form-floating mb-3">
					<textarea class="form-control" id="content" name="content"
						type="text" placeholder="Enter your name..."
						data-sb-validations="required" style="height: 400px">${board.content }</textarea>
					<label for="name">내용</label>
					<div class="invalid-feedback" data-sb-feedback="name:required">A
						name is required.</div>
				</div>
				<c:choose>
					<c:when test="${empty id }">

					</c:when>

					<c:otherwise>
						<div class="d-grid">
							<input class="btn btn-primary btn-xl" id="submitButton"
								type="button" onclick="king(${board.num});" value="좋아요" />
						</div>
					</c:otherwise>

				</c:choose>

				</div>

			</form>





			</div>
		</c:otherwise>


		</c:choose>
	</section>
	<script>
		function king(a) {
			alert("클릭확인");
			
			$.ajax({

				url : "boardLike",
				data : {
					num : a
				},
				success : function(data) {

				 if(data[1]==0){
					 alert("좋아요!")
					 $('#like').val(data[0]);
				 }else{
					 alert("좋아요 취소!")
					 $('#like').val(data[1]);

				 }

				},
				error : function() {
					alert("에러 발생");
				}

			})

			
			
		}
	</script>



	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>


	<script src="resources/js/scriptstwo.js"></script>
</body>
</html>
