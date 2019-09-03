<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.nav{
	background: #ff5555;
	width: 100%;
	text-align: center;
}
.menu{
	background: #ff5555;
	color: white;
	border: none;
	width: 10%;
	height: 50px;
}
.menu:hover{
	background: #dd3333;
}
</style>
</head>
<body>
<div class="nav">
	<button class="menu" onclick="location.href='index.jsp'">HOME</button>
	<button class="menu" onclick="location.href='appoint.jsp'">진료 예약</button>
	<button class="menu" onclick="location.href='select.jsp'">예약 확인</button>
	<button class="menu" onclick="location.href='update.jsp'">예약 수정</button>
	<button class="menu" onclick="location.href='delete.jsp'">예약 삭제</button>
	<button class="menu" onclick="location.href='join.jsp'">회원 등록</button>
</div>
</body>
</html>