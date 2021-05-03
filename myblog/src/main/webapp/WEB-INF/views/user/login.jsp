<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath }/assets/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/assets/css/signin.css" rel="stylesheet">
</head>

<body class="text-center">
	<main class="form-signin">
		<form id="login" name="login" method="post" action="${pageContext.request.contextPath }/user/auth">
			<img class="mb-4" src="${pageContext.request.contextPath }/assets/images/saltlux.png" alt="" width="200" height="60">
			<h2 class="h3 mb-3 fw-normal">블로그 로그인</h2>

			<div class="form-floating" style="margin-bottom: 5px;">
				<input type="text" class="form-control" id="floatingInput" name="id" placeholder="ID"> <label for="floatingInput">ID</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password"> <label for="floatingPassword">Password</label>
			</div>
			
			<c:if test="${'fail' == param.result }">
				<p>
					로그인을 실패 하였습니다.
				</p>
			</c:if>
<!-- 
			<div class="checkbox mb-3">
				<label> <input type="checkbox" value="remember-me"> Remember me </label>
			</div>
 -->
			<button class="w-100 btn btn-lg btn-primary" type="submit">입장하기</button>
			<p class="mt-3 mb-1 text-muted"><a href="${pageContext.request.contextPath }">돌아가기</a></p>
			<p class="mt-3 mb-1 text-muted">&copy; 2021</p>
		</form>
	</main>
</body>
</html>