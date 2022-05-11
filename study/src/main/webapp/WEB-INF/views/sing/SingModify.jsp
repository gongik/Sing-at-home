<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500&display=swap"
	rel="stylesheet">
<!-- 3-1. jQueryUI 연결(animate) -->
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js">
</script>
<script type="text/javascript" src="/resources/js/uploadAjax.js"></script>
<script src="/resources/js/attach.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/Modify.css">
<title>집콕노래방</title>
</head>
<body>
	<div id="wrap">
		<div class="main">
			<header id="header">
				<div id="headerIn">
					<h1 class="logo">
						<a href="/sing/main"> 로고</a>
					</h1>
				</div>
				<!-- headerIn -->
			</header>
			<!-- header -->
			<nav class="gnb1 mo">
				<ul>
					<c:if test="${session==null}">
						<li class="open_menu"><a href="/sing/login">로그인</a></li>
						<li><a href="/sing/signup">회원가입</a></li>
					</c:if>
					<c:if test="${session!=null}">
						<li class="open_menu"><a href="/sing/main">메인페이지</a></li>
						<li><a href="/sing/logout">로그아웃</a></li>
					</c:if>
					<li><a href="/sing/board">노래게시판</a></li>
				</ul>
			</nav>
			<!-- gnb mo-->
			<div id="container">
				<div class="goHome">
					<a href="/sing/main">Home</a> ->게시판 글수정
				</div>
				<div class="detailBox">
					<form role="form" action="/sing/modifyOn" method="post">
						<table border="1" class="detailTable">
							<tr>
								<th>글쓴이</th>
								<td>${Smodify.id}</td>
							</tr>
							<tr>
								<th>제목</th>
								<td><input type="text" id="title" name="title"
									value="${Smodify.title}"></td>
							</tr>
<!-- 							<tr> -->
<!-- 								<th>첨부파일</th> -->
<!-- 								<td><input type="file" name="uploadfile" multiple></td> -->
<!-- 							</tr> -->
							<tr>
								<th>첨부이미지</th>
								<td>
									<div id="uploadResult">
										<ul>
										</ul>
									</div> <!-- uploadResult -->
								</td>
							</tr>
							<tr>
								<th>글내용</th>
								<td><textarea id="cotent" name="content" cols="30" rows="10">${Smodify.content}</textarea></td>
							</tr>
							<tr>
								<td><input id="uploadBtn" type="submit" value="글수정"></td>
							</tr>
							<tr>
								<td><a class="deleteBtn"
									href="/sing/delete?bno=${Smodify.bno}">글삭제</a></td>
							</tr>
							<tr>
								<td><input id="bno" type="hidden" name="bno"
									value="${Smodify.bno}"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<!-- container -->
			<footer id="footer"> </footer>
		</div>
		<!-- main -->
	</div>
	<!-- wrap -->

</body>
</html>