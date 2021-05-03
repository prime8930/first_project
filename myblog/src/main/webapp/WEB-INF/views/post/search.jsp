<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath }/assets/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/blog.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/page.css" rel="stylesheet">
</head>
<body>
	<c:import url="/WEB-INF/views/includes/postnavbar.jsp" />
	<div class="container">
		<div class="jumbotron p-3 p-md-5 text-white rounded bg-dark">
			<div class="col-md-6 px-0">
				<h1 class="display-4 font-italic">포스트 검색 결과</h1>
				<p class="lead my-3">총 ${searchCount }건</p>
			</div>
		</div>

		<div class="row-fluid" align="center" style="margin-top: 20px;">
			<c:forEach items="${postVo }" var="vo" varStatus="status">
				<div class="col-md-8">
					<div class="card flex-md-row mb-4 box-shadow h-md-250">
						<div class="card-body d-flex flex-column align-items-start">
							<div class="col-md-12" >
								<strong class="d-inline-block mb-2 text-primary" style="float:left;">Post</strong>
							</div>
							<h3 class="mb-0">
								<a class="text-dark" href="${pageContext.request.contextPath }/${vo.blog_id }/post/view/${vo.no }" style="text-decoration: underline;">${vo.title }</a>
							</h3>
							<div class="mb-1 text-muted">${vo.w_date }</div>
							<p style="white-space: nowrap; overflow: hidden; max-width: 800px; text-overflow: ellipsis; " class="card-text mb-auto">${vo.content }</p>
							<a href="${pageContext.request.contextPath }/${id }/post/view/${vo.no }">자세히 보기</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<hr style="margin-top: 40px;">
		<div class="text-center">
			<div class="pagination_rounded">
				<c:choose>
					<c:when test="${pageVo.count > 0 }">
						<ul>
							<c:if test="${pageVo.curPage > pageVo.groupSize}">
								<li> <a href="${pageContext.request.contextPath }/${id }/post/search?keyword=${keyword }&page=${pageVo.prevPage}" class="prev"> <i class="fa fa-angle-left" aria-hidden="true"></i> Prev </a> </li>
							</c:if>
							<c:choose>
								<c:when test="${pageVo.endNum < pageVo.endPage }">
									<c:forEach var="i" begin="${pageVo.startNum }" end="${pageVo.endNum}">
										<li><a href="${pageContext.request.contextPath }/${id }/post/search?keyword=${keyword }&page=${i }">${i}</a></li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach var="i" begin="${pageVo.startNum }" end="${pageVo.endPage}">
										<li><a href="${pageContext.request.contextPath }/${id }/post/search?keyword=${keyword }&page=${i }">${i}</a></li>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							<c:if test="${pageVo.endNum < pageVo.endPage }">
								<li><a href="${pageContext.request.contextPath }/${id }/post/search?keyword=${keyword }&page=${pageVo.nextPage}" class="next"> Next <i class="fa fa-angle-right" aria-hidden="true"></i></a> </li>
							</c:if>
						</ul>
					</c:when>
					<c:otherwise>
						<ul><li><a href="${pageContext.request.contextPath }/${id }/post/search?keyword=${keyword }">${pageVo.curPage }</a></li></ul>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.6.0.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.bundle.min.js"></script>

</body>
</html>