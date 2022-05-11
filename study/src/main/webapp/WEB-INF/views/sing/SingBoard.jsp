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
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/singBoard.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/Board.css">
<title>집콕노래방</title>
</head>
<body>
	<div id="wrap">
		<div class="main">
			<header id="header">
				<div id="headerIn">
					<h1 class="logo">
						<a href="/sing/main">로고</a>
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
					<li><a href="#">노래게시판</a></li>
				</ul>
			</nav>
			<!-- gnb mo-->
			<div id="container">
				<div class="goHome">
					<a href="/sing/main">Home</a> ->노래게시판
				</div>
				<div class="boardBox">
					<div class="boardOption">
						<form id="searchForm" action="/sing/board" method="get">
							<select name="type" id="type">
								<option value="">전체</option>
								<option value="t">${pageMaker.cri.type eq 't'?'selected':'' }제목</option>
								<option value="w">${pageMaker.cri.type eq 'w'?'selected':'' }글내용</option>
								<option value="tw">${pageMaker.cri.type eq 'tw'?'selected':'' }제목+글내용</option>
							</select> <input type="text" id="keyword" name="keyword"
								placeholder="검색내용을 입력하세요"> <input type="hidden"
								id="pagenum" name="pagenum" value="${pageMaker.cri.pagenum}">
							<input type="hidden" name="amount"
								value="${pageMaker.cri.amount}"> <input type="button"
								id="searchbtn" value="검색">
							<c:if test="${session != null}">
								<button class="writeBtn">
									<a href="/sing/write">글쓰기</a>
								</button>
							</c:if>
						</form>
					</div>
					<!-- boardOption -->
					<table class="boardTable" border="1">
						<tr class="boardTop">
							<td>번호</td>
							<td>제목</td>
							<td>글쓴이</td>
							<td>날짜</td>
							<td>조회수</td>
						</tr>
						<c:forEach items="${Slist}" var="Sboard">
							<tr>
								<td class="boardcontent">${Sboard.bno}</td>
								<td class="boardTitle"><a href="/sing/detail?bno=${Sboard.bno}">${Sboard.title}</a></td>
								<td class="boardcontent">${Sboard.writer}</td>
								<td class="boardcontent">${Sboard.regdate}</td>
								<td class="boardcontent">${Sboard.count}</td>
							</tr>
						</c:forEach>
					</table>

					<div class="paging">
						<c:if test="${pageMaker.prev}">
							<a class="prev"
								href="/sing/board?pagenum=${pageMaker.startPage-1}&amount=${pageMaker.cri.amount}">Prev</a>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<a class="pageNo" href="${num}">${num}</a>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<a class="next"
								href="/sing/board?pagenum=${pageMaker.endPage+1}&amount=${pageMaker.cri.amount}">Next</a>
						</c:if>
					</div>
					<!-- boardPaging -->
				</div>
				<!-- boardBox -->
			</div>
			<!-- container -->
			<footer id="footer"> </footer>
		</div>
		<!-- main -->
	</div>
	<!-- wrap -->
</body>
</html>