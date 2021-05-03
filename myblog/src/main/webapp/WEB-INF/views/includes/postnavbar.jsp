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
<link href="${pageContext.request.contextPath }/assets/css/navbar.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark"
		aria-label="Eighth navbar example">
		<div class="container">
			<c:choose>
				<c:when test="${empty authUser }">
					<a class="navbar-brand" href="${pageContext.request.contextPath }">My Blog</a>
				</c:when>
				<c:otherwise>
					<a class="navbar-brand" href="${pageContext.request.contextPath }/${authUser.id }">My Blog</a>
				</c:otherwise>
			</c:choose>
			

			<div class="collapse navbar-collapse" id="navbarsExample07">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<c:choose>
					<c:when test="${empty authUser }">
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/user/join">Join</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/user/login">Login</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/user/update">Edit Profile</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }">Another Blog</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/user/logout">Logout</a></li>
					</c:otherwise>
				</c:choose>
				</ul>
				<form action="${pageContext.request.contextPath }/${id}/post/search">
					<input class="form-control" type="text" name="keyword" placeholder="Search" aria-label="Search">
				</form>
			</div>
		</div>
	</nav>
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>