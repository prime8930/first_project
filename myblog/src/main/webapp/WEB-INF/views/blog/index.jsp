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
</head>
<body>
	<c:import url="/WEB-INF/views/includes/navbar.jsp" />
	<div class="container">
		<div class="jumbotron p-3 p-md-5 text-white rounded bg-dark">
			<div class="col-md-6 px-0">
				<h1 class="display-4 font-italic">${blogVo.title }</h1>
				<p class="lead my-3">${blogVo.intro }</p>
			</div>
			<div class="col-md-12">
				<p style="text-align: right;"><a href="${pageContext.request.contextPath }/${id }/post/add">포스트 작성</a></p>
			</div>
		</div>

		<div class="row-fluid" align="center" style="margin-top: 20px;">
			<c:forEach items="${postVo }" var="vo" varStatus="status">
				<div class="col-md-8">
					<div class="card flex-md-row mb-4 box-shadow h-md-250">
						<div class="card-body d-flex flex-column align-items-start">
							<div class="col-md-12" >
								<strong class="d-inline-block mb-2 text-primary" style="float:left;">Post</strong>
								<button class="btn btn-xs" style="float:right;" onclick="postDel(${vo.no})">삭제</button>
							</div>
							<h3 class="mb-0">
								<a class="text-dark" href="${pageContext.request.contextPath }/${id }/post/view/${vo.no }">${vo.title }</a>
							</h3>
							<div class="mb-1 text-muted">${vo.w_date }</div>
							<p style="white-space: nowrap; overflow: hidden; max-width: 800px; text-overflow: ellipsis; " class="card-text mb-auto">${vo.content }</p>
							<a href="${pageContext.request.contextPath }/${id }/post/view/${vo.no }">자세히 보기</a>
						</div>
						<!-- <img class="card-img-right flex-auto d-none d-md-block" data-src="holder.js/200x250?theme=thumb" alt="Card image cap">  -->
					</div>
				</div>
			</c:forEach>
		</div>
		<hr>
		<button class="btn btn-danger" onclick="blogDel()">블로그 삭제</button>
		<a href="${pageContext.request.contextPath }/${authUser.id }/update" style="float: right;"><button class="btn btn-primary">블로그 수정</button></a>
	</div>
	<script src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.6.0.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		function postDel(no) {
		    var chk = confirm("정말 삭제하시겠습니까?");
		    if (chk) {
		        location.href='$}/${id}/delete/' + no + '?result=true';
		    }
		}
		
		function blogDel() {
		    var chk = confirm("정말 삭제하시겠습니까?");
		    if (chk) {
		        location.href='${authUser.id}/delete?result=true';
		    }
		}
	</script>
</body>
</html>