<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/main.css">
    <title>로그인</title>
</head>
<body>
    <div class="login-wrap">
        <div class="login-html">
          <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab" style="cursor: pointer;">로그인</label>
          <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab" style="cursor: pointer;">회원가입</label>
          
          <div class="login-form">
          
          <form action="/user/login" method="post">
            <div class="sign-in-htm">
              <div class="group">
                <label for="user" class="label">아이디</label>
                <input id="user" type="text" class="input" name="user_email">
              </div>
              <div class="group">
                <label for="pass" class="label">비밀번호</label>
                <input id="pass" type="password" class="input" data-type="password" name="user_pwd">
              </div>
              <br>
              <div class="group">
                <a href=""><input id="login"type="submit" class="button" value="로그인" style="cursor: pointer;"> </a>
              </div>
              </form>
              <div class="hr"></div>
              <div class="foot-lnk">
              </div>
            </div>
            
            
            <form action="register" method="post">
            <div class="sign-up-htm">
              <div class="group">
                <label for="user" class="label">아이디(이메일형식)</label>
                <input id="user" type="text" class="input" name="user_email">
              </div>
              <div class="group">
                <label for="pass" class="label">비밀번호</label>
                <input id="pass" type="password" class="input" data-type="password" name="user_pwd">
              </div>
              <div class="group">
                <label for="pass" class="label">이름</label>
                <input id="user_name" type="text" class="input" name="user_name">
              </div>
              <div class="group">
                <a href=""><input type="submit" class="button" value="회원가입" style="cursor: pointer;"></a>
              </div>
             </form>
              <div class="hr"></div>
              <div class="foot-lnk">
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <script>
        <% if (session.getAttribute("loginFailed") != null) { %>
        	alert("아이디 또는 비밀번호가 일치하지 않습니다.");
		<% session.removeAttribute("loginFailed"); } %>
        
        <% if(request.getAttribute("registerFailed") != null) { %>
        	alert("이메일이 이미 등록되어 있습니다.");
    	<% } %>
      </script>
</body>
</html>