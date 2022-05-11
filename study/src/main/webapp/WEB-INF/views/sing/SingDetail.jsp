<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap Core CSS -->
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="/resources/css/metisMenu.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/resources/css/sb-admin-2.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="/resources/css/font-awesome.css" rel="stylesheet"
	type="text/css">
<!-- jQuery 선언 -->
<script src="/resources/js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/resources/js/bootstrap.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="/resources/js/metisMenu.js"></script>
<!-- Custom Theme JavaScript -->
<script src="/resources/js/sb-admin-2.js"></script>
<!-- 경고창 js -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="/resources/js/singRefly.js"></script>
<script src="/resources/js/attach.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/Detail.css">
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
					<a href="/sing/main">Home</a> ->게시판 글보기
				</div>
				<hr>
				<div class="detailBox">
					<div class="detailTop">
						<ul>
							<li><input id="sid" type="hidden" value="${session.id}"></li>
							<li><input id="id" type="hidden" value="${Sdetail.id}"></li>
							<li><p>Title : ${Sdetail.title}</p></li>
							<li class="writer"><p>: ${Sdetail.writer}</p></li>
							<c:if test="${session.id==Sdetail.id}">
								<li><a class="modifyBtn"
									href="/sing/modify?bno=${Sdetail.bno}">글수정</a></li>
							</c:if>
						</ul>
							<div class="likeBox">
							<img src="/resources/img/heart.png" id="btn_like"
								align="left" style="cursor: pointer; width: 40px;">
							<img src="/resources/img/hearton.png" id="btn_likeOn"
								align="left" style="cursor: pointer; width: 40px;">
								<p class="like_count">${Sdetail.like_count}</p>
							</div>
					</div>
					<div id="uploadResult">
						<ul>
						</ul>
					</div>
					<!-- uploadResult -->
					<div class="textarea">
						<p>${Sdetail.content}</p>
					</div>
					<!-- textarea -->
				</div>
				<!-- detailBox -->
			
				<div class="replyBox">
					<div class="replyListBox">
						<p>댓글</p>
						<hr>
						<ul class="replyList">
						</ul>
					</div>
					<!-- replyListBox -->
					<div class="col-lg-6">
						<div class="panel panel-default">
							<div class="panel-heading">댓글창</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<!-- Button trigger modal -->
								<c:if test="${session.id!=null}">
									<button id="addReply" class="btn btn-primary btn-lg"
										data-toggle="modal" data-target="#myModal">댓글쓰기</button>
								</c:if>
								<!-- Modal -->
								<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="myModalLabel">댓글창</h4>
											</div>
											<div class="modal-body">
												<div class="form-group">
													<label>댓글</label> <input id="reply" class="form-control"
														type="text"> <input id="rno" class="form-control"
														type="hidden"> <input id="bno"
														class="form-control" type="hidden" value="${Sdetail.bno}">
													<input id="idConfirm" class="form-control" type="hidden"
														value="${session.id}">
												</div>
												<div class="form-group">
													<label>작성자</label> <input id="replyer" class="form-control"
														type="text" value="${session.id}" readonly>
												</div>
												<div class="form-group" id="replydateDiv">
													<label>ReplyDate</label> <input id="replydate"
														class="form-control" type="text">
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" id="modalModBtn"
													class="btn btn-primary">댓글 수정</button>
												<button type="button" id="modalRemoveBtn"
													class="btn btn-primary">댓글 삭제</button>
												<button type="button" id="modalWriteBtn"
													class="btn btn-primary">댓글 쓰기</button>
												<button type="button" id="modalCloseBtn"
													class="btn btn-default" data-dismiss="modal">닫기</button>
											</div>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
								</div>
								<!-- /.modal -->
							</div>
							<!-- .panel-body -->
						</div>
						<!-- /.panel -->
					</div>
					<!-- /.col-lg-6 -->
				</div>
				<!-- replyBox -->
			</div>
			<!-- container -->
			<footer id="footer"> </footer>
		</div>
		<!-- main -->
	</div>
	<!-- wrap -->
</body>

</html>