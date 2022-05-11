<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
 	<link rel="stylesheet" type="text/css" href="/resources/css/sing.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500&display=swap" rel="stylesheet">
    <title>집콕노래방</title>
</head>
<body>
    <div id="wrap">
        <div class="aside pc">
            <div class="asideIn">
            <c:if test="${session ==null }">
                <form action="/sing/loginOn" method="post" class="asideForm">
                    <ul class="aside_login">
                        <li class="aside_tag">
                            <h2>집콕노래방</h2>
                        </li>
                        <div class="log">
                            <ul class="logBox1">
                                <li>
                                    <label for="user_id" class="id_img">id</label>
                                    <input type="text" id="user_id" name="id" placeholder="아이디를 입력하세요">
                                </li>
                                <li>
                                    <label for="user_pw" class="pw_img">pw</label>
                                    <input type="password" name="password" id="user_pw" placeholder="비밀번호를 입력하세요">
                                </li>
                            </ul>
                            <div class="logBox2">
                            	<input type="submit" class="loginBtn" value="Login">
                            </div>
                        </div><!-- log -->
                    </ul><!-- aside_login -->
                    <ul class="aside_logBottom">
                        <li class="join"><button><a href="/sing/signup">가입하기</a></button></li>
                        <li class="board"><button><a href="/sing/board">노래게시판</a></button></li>
                    </ul>
                </form>
                </c:if>
                <c:if test="${session != null}">
                 <form action="/sing/login" method="post" class="asideForm">
                    <ul class="aside_login">
                        <li class="aside_tag">
                            <h2>집콕노래방</h2>
                        </li>
                        <div class="log">
                            <ul class="logBox1">
                                <li>
                                    <label for="user_id" class="id_img">id</label>
                                    <p class="seName">${session.name}님 환영합니다</p>
                                    <input type="hidden" id="id" value="${session.id}">
                                </li>
                                <li>
                                    <label for="user_pw" class="pw_img">pw</label>
                                    <p class="seName">${session.email}</p>
                                </li>
                            </ul>
                            <div class="logBox2">
                                <button type="button" class="logoutBtn"><a href="/sing/logout">Logout</a></button>
                            </div>
                        </div><!-- log -->
                    </ul><!-- aside_login -->
                    <ul class="aside_logBottom">
                        <li class="singBoard"><a href="/sing/board">노래게시판</a></li>
                    </ul>
                </form>
                </c:if>
                <c:if test="${session != null}">
<!--                 pc 마이페이지 -->
                <nav class="s_gnb">
                    <h2>마이페이지</h2>
                    <ul class="s_gnbul">
                        <li class="d1">
                            <p class="m1">나만의 플레이리스트</p>
                            <div class="sub">
                                <ul>
                                </ul>
                            </div>
                        </li><!-- 1번 메뉴끝 -->
                        <li class="d1">
                            <p class="m1">회원정보 관리</p>
                            <div class="sub">
                                   <a class="inf" href="/sing/signup">회원 가입</a>
                                   <a class="inf" href="/sing/signModify?id=${session.id}">회원정보 수정</a>
                            </div>
                        </li><!-- 2번 메뉴끝 -->
                    </ul><!-- s_gnbul -->
                </nav><!-- s_gnb -->
                </c:if>
            </div><!-- asideIn -->
        </div><!-- aside -->
        <div class="main">
            <header id="header">
                <div id="headerIn">
                    <h1 class="logo">
                       <a href="/sing/main"> 로고</a>
                    </h1>
                </div><!-- headerIn -->
            </header><!-- header -->
            <nav class="gnb1 mo">
                <ul>
                	<c:if test="${session==null}">
                    <li class="open_menu"><a href="/sing/login">로그인</a></li>
	                <li><a href="/sing/signup">회원가입</a></li>
                	</c:if>
                	<c:if test="${session!=null}">
                    <li class="open_menu"><a href="#">마이페이지</a></li>
	                <li><a href="/sing/logout">로그아웃</a></li>
                	</c:if>
                    <li><a href="/sing/board">노래게시판</a></li>
                </ul>
            </nav><!-- gnb mo-->
            <div id="container">
                <section class="main1">
                    <div class="mainBox1">
                        <div class="mBTop">
                            <div class="songSearch">
                                <p>노래검색</p>
                            </div>
                	      <a class="searchBtn">검색</a>
                            <input type="search" name="" id="search" placeholder="노래제목을 검색하세요">
                            <input type="hidden" id="playText" value="2002">
                        </div><!-- mBTop -->
                        <div class="mBDown">
                            <ul>
                                <li><a href="#">인기차트</a></li>
                                <li><a href="#">최신</a></li>
                                <li><a href="#">어쿠스틱</a></li>
                                <li><a href="#">발라드</a></li>
                                <li><a href="#">힙합</a></li>
                                <li><a href="#">댄스</a></li>
                                <li><a href="#">트로트</a></li>
                                <li><a href="#">동요</a></li>
                            </ul>
                        </div>
                    </div><!-- mainBox1 -->
                </section><!-- main1 -->
                <section class="main11">
	                <div class="searchTitle">
	                </div>
	                <ul class="searchBox">
	                </ul>
                </section><!-- main1.5 -->
                <section class="main2">
                    <div class="youtube">
                    	<iframe class="singto" width="100%" height="650" src="https://www.youtube.com/embed/t-9Ks0gyvtc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>
                        <c:if test="${session!=null}">
                        <div class="playList">플레이 리스트 추가</div>
                        </c:if>
                    </div><!-- youtube -->
                </section><!-- main2 -->
                <section class="main3">
                    <div id="slideShow">
                        <div class="slides">
                            <p class="slide" id="slide_1"></p>
                            <p class="slide" id="slide_2"></p>
                            <p class="slide" id="slide_3"></p>
                            <p class="slide" id="slide_4"></p>
                        </div>
                        <div class="pager pc">
                        </div>
                    </div><!-- slideShow -->
                </section><!-- main3 -->
            </div><!-- container -->
            <footer id="footer">
                <div class="footerIn">
                    <p class="fLeft">상호 : (주) 집콕노래방<span class="bar"></span>대표자명 : 김상화 <br>
                    사업자등록번호: 000-00-00000<br>통신판매업신고번호 : 0000-서울마포-0000 <br>
                    팩스 : 02-1234-5678
                    </p>
                    <div class="fRight">
                        <div class="fRightUp">
                        <p>이메일 문의 <br>gshee@naver.com</p>
                        </div><!-- f_right_up -->  
                        <div class="fRigthDown">
                        <p>이용약관<span class="bar"></span>개인정보처리방침<span class="bar"></span>
                            Copyrightⓒ 집콕노래방
                        </p>
                        </div><!-- fRightDown -->
                    </div><!-- fRight -->
                </div><!-- footerIn -->
            </footer><!-- footer -->
        </div><!-- main -->
    </div><!-- wrap -->

    <div id="side">
        <div class="s_login">
            <a href="#">마이페이지</a>
        </div>
        <nav class="s_gnb">
            <ul>
                <li class="d1">
                    <p class="m1">나만의 플레이리스트</p>
                    <div class="sub">
                        <ul>
                        </ul>
                    </div>
                </li><!-- 1번 메뉴끝 -->
                <li class="d1">
                    <p class="m1">회원정보 관리</p>
                    <div class="sub">
                       		<a class="inf" href="/sing/signup">회원 가입</a>
                            <a class="inf" href="/sing/signModify?id=${session.id}">회원정보 수정</a>
                    </div>
                </li><!-- 2번 메뉴끝 -->
            </ul>
        </nav><!-- s_gnb -->
        <div class="s_close">
            <a href="#">사이드 닫기</a>
        </div>
    </div><!-- side -->
    
</body>
<!-- sweet alert -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- 3-1. jQueryUI 연결(animate) -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="/resources/js/sing.js">


</script>
</html>