<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <style>
    	nav {
    		height: 55px;
    	}
        #header{
            background-color: whitesmoke;
            text-align: center;
        }
        table{
            margin-top: 100px;
        }
        #lostline{
            text-align: center;
            color: white;
            margin: 0;
        }
        #lostdiv{
            background-color: black; height: 100px; display: flex; align-items: center; justify-content: center;
        }
        .navbar{
            background-color: rgb(142, 144, 130);
        }
    </style>
</head>
<body>
	<nav class="navbar">
	  <div class="container-fluid">
        <a  class="navbar-brand" href="mapleTable"><img style="margin-bottom: 8px;margin-right: 5px"width="25px"src="/resources/img/메이플.png"><b>메이플스토리</b></a>
        <a style="color: blue;" class="navbar-brand" href="lostTable"><img style="margin-bottom: 8px;margin-right: 5px"width="25px"src="/resources/img/로스트아크.jpg"><b>로스트아크</b></a>
        <a class="navbar-brand" href="lolTable"><img style="margin-bottom: 8px;margin-right: 5px"width="25px"src="/resources/img/롤.png"><b>리그 오브 레전드</b></a>
	    <form class="d-flex">
            <p style="margin-right: 10px; margin-top: 7px;"><b>${sessionScope.userData.user_name}님 안녕하세요!</p>
	      <button class="btn btn-danger" type="button" id="logout" style="height: 40px;">로그아웃</button>
	    </form>
	  </div>
	</nav>
	
	<div>
        <img src="/resources/img/로아배너.png" width="100%"alt="">
    </div>
	

    <div id="lostdiv">
        <a href="https://lostark.game.onstove.com/Main" target="_blank" style="text-decoration: none;"><h1 id="lostline">로스트아크 바로가기</h1></a>
    </div>
	
	
	
    <div class="container text-right"> 
        <table class="table table-hover">
            <thead>
                <tr class="table-dark">
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>날짜</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="board" items="${list}">
			    <tr onclick="window.location='/board/get?bno=<c:out value="${board.bno}"/>'" style="cursor: pointer;">
			        <th><c:out value="${board.bno}"/></th>
			        <th><c:out value="${board.title}"/></th>
			        <th><c:out value="${board.writer}"/></th>
			        <th><c:out value="${board.regdate}"/></th>
			        <th><c:out value="${board.views}"/></th>
			    </tr>
			</c:forEach>
            </tbody>
        </table>
        <div class="d-flex">
       		<a href="writing" class="btn btn-primary ms-auto" id="btn" style="margin-bottom: 200px;">작성</a>
        </div>
    </div> 

	
	<footer>
        <img src="/resources/img/로아푸터.png" width="100%" alt="">
    </footer>
    
     <script>
        const logoutButton = document.getElementById("logout");
        logoutButton.onclick = function () {
        alert("로그아웃 되었습니다.");
        window.location.href = 'logout';
        };
    </script>
    
</body>
</html>
