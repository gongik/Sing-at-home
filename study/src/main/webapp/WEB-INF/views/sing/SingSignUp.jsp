<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500&display=swap" rel="stylesheet">
    <!-- 3-1. jQueryUI 연결(animate) -->
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- sweet alert -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="text/javascript" src="/resources/js/singsign.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/signup.css">
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
            </div><!-- headerIn -->
        </header><!-- header -->
        <nav class="gnb1 mo">
            <ul>
           		<c:if test="${session==null}">
                <li class="open_menu"><a href="/sing/login">로그인</a></li>
               	</c:if>
               	<c:if test="${session!=null}">
                   <li class="open_menu"><a href="/sing/main">메인페이지</a></li>
               	</c:if>
                <li><a href="/sing/signup">회원가입</a></li>
                <li><a href="/sing/board">노래게시판</a></li>
            </ul>
        </nav><!-- gnb mo-->
        <div id="container">
         <div class="goHome">
        	<a href="/sing/main">Home</a>
        	->회원가입
       	</div>
            <div class="signUpBox">
                <form id="signForm" action="/sing/signupOn" method="post">
                    <input type="text" id="id" class="id sg" name="id" placeholder="아이디를 입력하세요">
                    <div class="check_font" id="id_check"></div>
                    <input type="hidden" class="idDuplication" value="">
                    <input type="password" id="password" class ="password sg" name="password" placeholder="비밀번호를 입력하세요">
                    <input type="text" id="passwordConfirm" class="passwordConfirm sg" placeholder="비밀번호를 확인하세요">
                    <input type="text" id="name" class="name sg" name="name" placeholder="이름을입력하세요">
                    <input type="email" id="email" class="email sg" name="email" placeholder="이메일을 입력하세요">
                    <div class="button">    
                        <input type="button" id="signUp" value="가입하기" class="sign">
                    </div>
                </form>
            </div>
        </div><!-- container -->
        <footer id="footer">

        </footer>
    </div><!-- main -->
</div><!-- wrap -->

</body>
</html>