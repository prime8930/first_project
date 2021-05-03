<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath }/assets/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link href="${pageContext.request.contextPath }/assets/css/blog.css" rel="stylesheet">
</head>
<body>
	<c:import url="/WEB-INF/views/includes/postnavbar.jsp" />
	<main role="main" class="container">
		<div class="row">
			<div class="col-md-8 blog-main">
				<h1 class="pb-3 mb-4 font-italic border-bottom">${id } 블로그</h1>

				<div class="blog-post">
					<h3 class="blog-post-title">${vo.title }</h3>
					<hr style="width: 60%;">
					<p class="blog-post-meta">
						${vo.w_date } by <a href="#"> ${vo.author }</a>
					</p>
					<br/>
					<p>${fn:replace(vo.content, newLineChar, "<br/>")}</p>
				</div>
				<!-- /.blog-post -->
				<c:if test="${vo.origin_file != null}">
					<hr>
					<div class="like p-2 cursor action-collapse" data-toggle="collapse" href="#attach" role="button" aria-expanded="false" aria-controls="attach">
						첨부파일<span class="fas fa-caret-down" aria-hidden="true"></span> 
					</div>
					<div class="bg-light p-2 collapse" id="attach">
						[<a href="${pageContext.request.contextPath }/upload/${vo.stored_file}" download>${vo.origin_file}</a>]
					</div>
				</c:if>
				<hr>
				<div class="blog-post">
					<c:if test="${authUser.id eq id}">
						<button class="btn btn-danger" onclick="postDel(${no})" style="float: left;">삭제</button>
						<a class="btn btn-primary" href="${pageContext.request.contextPath }/${id}/post/view/${no}/update" role="button" style="float: right; margin-left: 5px; margin-right: 5px;">수정</a>
					</c:if>
					<a class="btn btn-primary" href="${pageContext.request.contextPath }/${id}/post" role="button" style="float: right; margin-left: 5px;">목록</a>
				</div>
				<br>
				<hr>

				<div class="blog-post">
					<div class="coment-bottom bg-white p-2 px-4">
						
						<!-- 댓글 폼 -->
						<form action="${pageContext.request.contextPath }/${id}/post/${no}/comment" method="post">
							<div class="d-flex flex-row add-comment-section mt-4 mb-4">
								<div style="margin-right: 10px;">
									<img class="img-fluid img-responsive rounded-circle mr-2" src="https://i.imgur.com/qdiP4DB.jpg" width="38">
								</div>
								<input name="writer" value="${authUser.id }" type="hidden">
								<textarea id="comment-content" class="form-control mt-8" name="content"  placeholder="댓글을 달아주세요." style="margin-right: 10px;"></textarea>
								<button id="btn-comment" class="btn btn-primary" type="submit" >등록</button>	
							</div>
						</form>
						
						<!-- 댓글 조회 -->
						<c:forEach items="${commentVo }" var="commentvo">
							<div class="commented-section mt-6">
								<div class="d-flex flex-row align-items-center commented-user">
									<h4 class="mr-2" style="margin-right: 10px;">${commentvo.writer }</h4>
									<span class="dot mb-1"></span> 
									<span class="mb-1 ml-2">${commentvo.w_date }</span>
									<c:if test="${authUser.id eq commentvo.writer }">
										<button class="btn btn-xs" onclick="delComment(${commentvo.no})">삭제</button>
									</c:if>
								</div>
								<hr style="width: 50%">
								<div class="comment-text-sm">
									<span>${commentvo.content }</span>
								</div>
								
								<!-- 댓글의 답글 -->
								<div class="like p-2 cursor action-collapse" data-toggle="collapse" href="#collapseReply-${commentvo.no }" role="button" aria-expanded="false" aria-controls="collapseReply-${vo.no }">
									Reply<span class="fas fa-caret-down" aria-hidden="true"></span> 
								</div>
								<div class="bg-light p-2 collapse" id="collapseReply-${commentvo.no }">
									
									<!-- 댓글의 답글 폼 -->
									<form action="${pageContext.request.contextPath }/${id}/post/${no}/comment/${commentvo.no}/reply" method="post">
										<div class="d-flex flex-row align-items-start">
					                    	<img class="rounded-circle" src="https://i.imgur.com/RpzrMR2.jpg" width="40" >
					                    	<input name="writer" value="${authUser.id }" type="hidden">
					                    	<textarea id="reply-content" class="form-control ml-1 shadow-none textarea" name="content" placeholder="답글을 달아주세요." style="margin-right: 10px;"></textarea>
					                    	<button id="btn-reply" class="btn btn-primary" type="submit" >등록</button>
				                    	</div>
									</form>
			                    	<!-- 댓글의 답글 폼 끝 -->
			                    	
			                    	<hr>
			                    	<c:forEach items="${replyVo }" var="replyvo">
			                    		<c:if test="${commentvo.no eq replyvo.comment_no}">
				                    		<div class="commented-section mt-6">
												<div class="d-flex flex-row align-items-center commented-user">
													<h5 class="mr-2" style="margin-right: 10px;">${replyvo.writer }</h5>
													<span class="dot mb-1"></span> 
													<span class="mb-1 ml-2">${replyvo.reg_date }</span>
													<c:if test="${authUser.id eq replyvo.writer }">
														<button class="btn btn-xs" onclick="delReply(${replyvo.no})">삭제</button>
													</c:if>
												</div>
												<div class="comment-text-sm">
													<span>${replyvo.content }</span>
												</div>
												<hr style="width: 37%">
											</div>
											
										</c:if>
			                    	</c:forEach>
								</div>
								<!-- 댓글의 답글 끝-->
							</div>
							<br/><br/>
						</c:forEach>
						
					</div>
				</div>

				<!-- Comment end -->

			</div>
			<!-- /.blog-main -->
			
			
			<aside class="col-md-4 blog-sidebar">
				<div class="p-3 mb-3 bg-light rounded">
					<h4 class="font-italic">About</h4>
					<p class="mb-0">
						Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras
						mattis consectetur purus sit amet fermentum. Aenean lacinia
						bibendum nulla sed consectetur.
					</p>
				</div>

				<div class="p-3">
					<h4 class="font-italic">Archives</h4>
					<ol class="list-unstyled mb-0">
						<li><a href="#">March 2021</a></li>
						<li><a href="#">February 2021</a></li>
						<li><a href="#">January 2021</a></li>
						<li><a href="#">December 2020</a></li>
						<li><a href="#">November 2020</a></li>
						<li><a href="#">October 2020</a></li>
						<li><a href="#">September 2020</a></li>
						<li><a href="#">August 2020</a></li>
						<li><a href="#">July 2020</a></li>
						<li><a href="#">June 2020</a></li>
						<li><a href="#">May 2020</a></li>
						<li><a href="#">April 2020</a></li>
					</ol>
				</div>

				<div class="p-3">
					<h4 class="font-italic">Elsewhere</h4>
					<ol class="list-unstyled">
						<li><a href="#">GitHub</a></li>
						<li><a href="#">Twitter</a></li>
						<li><a href="#">Facebook</a></li>
					</ol>
				</div>
			</aside>
			<!-- /.blog-sidebar -->

		</div>
		<!-- /.row -->

	</main>
	<!-- /.container -->
	<script src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.6.0.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function postDel(no) {
		    var chk = confirm("정말 삭제하시겠습니까?");
		    if (chk) {
		        location.href= no +'/delete/?result=true';
		    }
		}
	
		function delComment(no) {
		    var chk = confirm("정말 삭제하시겠습니까?");
		    if (chk) {
		        location.href='${no}/comment/delete/' + no + '?result=true';
		    }
		}
		
		function delReply(no) {
		    var chk = confirm("정말 삭제하시겠습니까?");
		    if (chk) {
		        location.href='${no}/reply/delete/' + no + '?result=true';
		    }
		}
		
		$('#btn-comment').click(function() {
			const content = $("#comment-content").val();
	
			if (content == '') {
				alert("댓글을 입력해주세요.");
				return false;
			}
		});
		
		
		$('#btn-reply').click(function() {
			const content = $("#reply-content").val();
	
			if (content == '') {
				alert("답글을 입력해주세요.");
				return false;
			}
		});
	</script>
</body>
</html>