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
    <link rel="stylesheet" type="text/css" href="/resources/css/login.css">
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
                <li class="open_menu"><a href="/sing/main">메인페이지</a></li>
                <li><a href="/sing/signup">회원가입</a></li>
                <li><a href="/sing/board">노래게시판</a></li>
            </ul>
        </nav><!-- gnb mo-->
        <div id="container">
        <div class="goHome">
        	<a href="/sing/main">Home</a>
        	->로그인
       	</div>
        <form action="/sing/loginOn" method="post" class="asideForm">
                    <ul class="aside_login">
                        <li class="aside_tag">
                            <h2>집콕노래방</h2>
                        </li>
                        <div class="log">
                            <ul class="logBox1">
                                <li>
                                    <label for="user_id" class="id_img">id</label>
                                    <input type="text" id="user_id" name="id" placeholder="아이디를 입력하세요" value="${session.id}">
                                </li>
                                <li>
                                    <label for="user_pw" class="pw_img">pw</label>
                                    <input type="password" name="password" id="user_pw" placeholder="비밀번호를 입력하세요" value="${session.password}">
                                </li>
                            </ul>
                            <div class="logBox2">
                            	<input type="submit" class="loginBtn" value="Login">
                            </div>
                        </div><!-- log -->
                    </ul><!-- aside_login -->
                  </form>
        </div><!-- container -->
        <footer id="footer">
        </footer>
    </div><!-- main -->
</div><!-- wrap -->
</body>
</html>