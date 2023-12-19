<%@page import="cs.dit.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="en">  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>글 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <style>
    	  body {
			    margin: 0;
			    padding: 0;
			    background-image: url(/resources/img/bg.gif);
			    background-size: cover;
			    background-position: center;
			    background-repeat: no-repeat;
			    height: 100vh;
		    }
		    th{
		        color: white;
		    }
    </style>
  </head>

  <body>
  
<nav class="navbar navbar-light bg-light">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="mapleTable"><img style="margin-bottom: 8px;margin-right: 5px"width="25px"src="/resources/img/메이플.png"><b>메이플스토리</b></a>
        <a class="navbar-brand" href="lostTable"><img style="margin-bottom: 8px;margin-right: 5px"width="25px"src="/resources/img/로스트아크.jpg"><b>로스트아크</b></a>
        <a class="navbar-brand" href="lolTable"><img style="margin-bottom: 8px;margin-right: 5px"width="25px"src="/resources/img/롤.png"><b>리그 오브 레전드</b></a>
	    <form class="d-flex">
            <p style="margin-right: 10px; margin-top: 7px;"><b>${sessionScope.userData.user_name}님 안녕하세요!</p>
	    </form>
	  </div>
	</nav>
	
	<div class="container"> 
        <form action="insert" method="post">
            <table>
                <tr>
                    <th>카테고리</th>
                    <td><select name="kategorie">
                        <option value="1">메이플스토리</option>
                        <option value="2">로스트아크</option>
                        <option value="3">리그오브레전드</option>
                       </select>
                    </td>
                </tr>
                <br>
                <tr>
                    <th>작성자</th>
                    <td><input class="form-control" type="text" size="100px" name="writer" value="${sessionScope.userData.user_name}"
                           readonly></td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td><input class="form-control" type="text" size="100px" name="title"></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea class="form-control" id="contents" cols="145" rows="15" name="content"></textarea>
                    </td>
                </tr>
            </table>
            <div class="d-flex justify-content-end" style="margin-right:126px; margin-top:30px">
                <button type="submit" class="btn btn-success me-2">작성</button>
                <button type="button" class="btn btn-secondary" onclick="location.href='mapleTable'">취소</button>
            </div>
        </form>
    	
    </div>  
  

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  </body>
</html>