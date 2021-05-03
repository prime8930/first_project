<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<h3 class="text-center mb-4">블로그 정보 수정</h3>
					<form id="update" name="update" method="post" action="${pageContext.request.contextPath }/${id }/update" enctype="multipart/form-data">
						<fieldset>
							<div class="form-group">
								<input type="hidden" name="no" value="${blogVo.no }">
								<input class="form-control input-lg" placeholder="아이디" name="user_id" type="text" value="${id }" readonly="readonly">
							</div>
							<br/>
							<div class="form-group">
								<input id="input-title" class="form-control input-lg" placeholder="블로그 제목" name="title" type="text" value="${blogVo.title }">
							</div>
							<br/>
							<div class="form-group">
								<input class="form-control input-lg" name="file" type="file">
								<img src="${pageContext.request.contextPath }/upload/${blogVo.t_logo }" align="middle">
							</div>
							<br/>
							<div class="form-group">
								<textarea class="form-control input-lg" placeholder="블로그 소개" name="intro"  rows="5" cols="86" style="resize:none;">${blogVo.intro }</textarea>
							</div>
							<br/>
							<input id="btn-submit" class="btn btn-lg btn-primary btn-block" value="수정" type="submit">
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
	
			if (title == '') {
				alert("필수항목 미입력 오류입니다.");
				return false;
			}
	
			alert("수정이 완료되었습니다.");
		});
	</script>
</body>
</html>