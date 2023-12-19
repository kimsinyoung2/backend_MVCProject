<%@page import="cs.dit.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value='${board.title}'/></title>
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
        th{
            color: gray;
        }
        #btn{
            margin-right: 10px;
        }
        input{
            border-collapse:separate;
            border-radius: 5px;
        }
        #submit{
            margin-top: 20px;
        }
        #commentForm{
            border: 1px solid gray;
        }
        body {
		    margin: 0;
		    padding: 0;
		    background-image: url(/resources/img/테스트.gif);
		    background-size: cover;
		    background-position: center;
		    background-repeat: no-repeat;
		    min-height: 100vh;
		}
		#whiteline{
            border-bottom: 2px solid white;
            margin-bottom: 0; 
            padding-bottom: 50px;
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
    
    <div class="container" style="width: 60%; margin-top: 50px;">
        <div class="row row1">
         <table class="table" style>
           <tr>
            <th class="text-center table-secondary">번호</th>
            <td  class="text-center"><c:out value='${board.bno}'/></td>
            <th  class="text-center table-secondary">작성일</th>
            <td  class="text-center"><c:out value='${board.regdate}'/></td>
           </tr>
           <tr>
            <th  class="text-center table-secondary">이름</th>
            <td  class="text-center"><c:out value='${board.writer}'/></td>
            <th  class="text-center table-secondary">조회수</th>
            <td  class="text-center"><c:out value='${board.views}'/></td>
           </tr>
           <tr>
            <th  class="text-center table-secondary">제목</th>
            <td colspan="3"><c:out value='${board.title}'/></td>
           </tr>
           <tr>
             <td colspan="4" class="text-left" valign="top" height="200">
              <pre style="white-space: pre-wrap;border:none;background-color: white;"><c:out value='${board.content}'/></pre>
             </td>
           </tr>
           <tr>
        </table>
        
        <div id="whiteline"class="d-flex justify-content-end" style="board-bottom: 2px solid while; margin-bottom: 0; padding-bottom: 50px;"> <!-- Add justify-content-end here -->
            <button type="button" class="btn btn-light" id="btn" onclick="location.href='mapleTable'">목록</button>
            <c:if test="${sessionScope.userData.user_name eq board.writer}">   
            <button type="button" class="btn btn-warning" id="btn" onclick="location.href='update?bno=<c:out value="${board.bno}"/>'">수정</button>
            <button type="button" class="btn btn-danger" id="btn" onclick="location.href='delete?bno=${board.bno}'">삭제</button>
          </c:if>
        </div>
        </div>
      </div>
    
  <div class="container text-right" style="margin-top: 50px; width: 60%";>
     <h4 class="text-left">댓글</h4>
      <form action="commentInsert" method="post" style="margin-bottom: 40px;">  
      	
             <input style="display:none;"  class="form-control" type="text" size="100px" name="bno" value="${board.bno}">
             <input style="display:none;"  class="form-control" type="text" size="100px" name="writer" value="${sessionScope.userData.user_name}">
        <div class="row">
            <form class="col-md-12">
				<div class="input-group mb-3">
				  <input name="content"  type="text" class="form-control" placeholder="댓글을 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
				  <button class="btn btn-info" type="submit" id="button-addon2" >작성</button>
	 		 </form>
				</div>
            </form>
    
    	</div>
   <div class="container" style="margin-bottom: 150px;">
    <div class="card">
    	<c:forEach var="comment" items = "${comments}">
            <div class="card-header d-flex justify-content-between" style="font-size: 16px;">
            
                <p class="text-start"><c:out value="${comment.writer}"/></p>
                <div class="text-end d-flex">
                    
                    <p style="margin-right: 10px;"><c:out value="${comment.regdate} ${comment.time} "/> </p>
                  <c:if test="${sessionScope.userData.user_name eq comment.writer}">   
                     <a href="commentUpdate?cno=${comment.cno}"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16" style="margin-right: 10px; color:rgb(211, 211, 4);">
                        <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
                      </svg></a>
                    <a href="commentDelete?cno=${comment.cno}"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16" style="color: red;">
                        <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/>
                      </svg></a>
                  </c:if>    
                </div>
            </div>
	            <ul id="reply--box" class="list-group">
	                <li id="reply--1" class="list-group-item d-flex justify-content-between">
	                    <div><c:out value="${comment.content}"/></div>
	                </li>
	    
	            </ul>
            </c:forEach>
     </div>
	</div>
	

<script>
    // Assuming you have jQuery loaded based on your included scripts
    $(document).ready(function () {
        $('.comment-update-button').click(function () {
            var cno = $(this).data('cno');
            location.href = 'commentUpdate?cno=' + cno;
        });
    });
</script>
</body>
</html>
