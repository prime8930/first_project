<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>mysite</title>
	<link href="${pageContext.request.contextPath }/assets/css/page.css" rel="stylesheet">
</head>
<body>
	<c:import url="/WEB-INF/views/includes/navbar.jsp" />

	<!-- Main jumbotron for a primary marketing message or call to action -->
	
	<div class="container">
		<div class="jumbotron p-3 p-md-5 text-white rounded bg-dark">
			<div class="col-md-6 px-0">
				<h1 class="display-4 font-italic">블로그 검색 결과</h1>
				<p class="lead my-3">총 ${searchCount }건</p>
			</div>
		</div>
		<br><br>
		<div class="row" >
			<c:forEach items="${blogVo }" var="vo" varStatus="status">
			<div class="col-xs-4 col-md-4" style="text-align: center">
				<div class="thumbnail">
					<img src="${pageContext.request.contextPath }/upload/${vo.t_logo }" >
					<div class="caption" style="margin-top: 20px;">
						<hr style="margin: auto;" width="300px">
						<h2>${vo.title }</h2>
						<p>${vo.intro }</p>
						<p>
							<a href="${pageContext.request.contextPath }/${vo.user_id }/post" class="btn btn-primary" role="button">블로그 들어가기</a>
						</p>
					</div>
				</div>
			</div>
			</c:forEach>
			<hr style="margin-top: 40px;">
			<div class="text-center">
				<div class="pagination_rounded">
					<c:choose>
						<c:when test="${pageVo.count > 0 }">
							<ul>
								<c:if test="${pageVo.curPage > pageVo.groupSize}">
									<li> <a href="${pageContext.request.contextPath }/blog/search?keyword=${keyword }&page=${pageVo.prevPage}" class="prev"> <i class="fa fa-angle-left" aria-hidden="true"></i> Prev </a> </li>
								</c:if>
								<c:choose>
									<c:when test="${pageVo.endNum < pageVo.endPage }">
										<c:forEach var="i" begin="${pageVo.startNum }" end="${pageVo.endNum}">
											<li><a href="${pageContext.request.contextPath }/blog/search?keyword=${keyword }&?page=${i }">${i}</a></li>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<c:forEach var="i" begin="${pageVo.startNum }" end="${pageVo.endPage}">
											<li><a href="${pageContext.request.contextPath }/blog/search?keyword=${keyword }&?page=${i }">${i}</a></li>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								<c:if test="${pageVo.endNum < pageVo.endPage }">
									<li><a href="${pageContext.request.contextPath }/blog/search?keyword=${keyword }&?page=${pageVo.nextPage}" class="next"> Next <i class="fa fa-angle-right" aria-hidden="true"></i></a> </li>
								</c:if>
							</ul>
						</c:when>
						<c:otherwise>
							<ul><li><a href="${pageContext.request.contextPath }/blog/search?keyword=${keyword }">${pageVo.curPage }</a></li></ul>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>


	<script src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.6.0.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
