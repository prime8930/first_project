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
</head>
<body>
	<c:import url="/WEB-INF/views/includes/navbar.jsp" />
	<div class="container-fluid bg-light py-3">
		<div class="row">
			<div class="col-md-6 mx-auto">
				<div class="card card-body">
					<h3 class="text-center mb-4">포스트 작성</h3>
					<form id="add" name="add" method="post" action="${pageContext.request.contextPath }/${vo.id }/post/add" enctype="multipart/form-data">
						<fieldset>
							<div class="form-group">
								<input id="input-title" class="form-control input-lg" placeholder="제목" name="title" type="text">
							</div>
							<br/>
							<div class="form-group">
								<input class="form-control input-lg" placeholder="작성자" name="author" value="${vo.name }" type="text" readonly="readonly">
							</div>
							<br/>
							<div class="form-group">
								<textarea id="input-content" class="form-control input-lg" placeholder="내용" name="content" rows="5" cols="86" style="resize:none;"></textarea>
							</div>
							<br/>
							<div class="form-group">
								<input class="form-control input-lg" placeholder="아이디" name="blog_id" value="${vo.id }" type="text" readonly="readonly">
							</div>
							<br/>
							<div class="form-group">
								<input class="form-control input-lg" placeholder="첨부파일" name="file" type="file">
							</div>
							<br/>
							<input id="btn-submit" class="btn btn-lg btn-primary btn-block" value="작성하기" type="submit">
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.6.0.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		$('#btn-submit').click(function() {
			const title = $("#input-title").val();
			const content = $("#input-content").val();
	
			if (title == '' || content == '') {
				alert("필수항목 미입력 오류입니다.");
				return false;
			}
		});
	</script>
</body>
</html>