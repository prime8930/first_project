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
					<h3 class="text-center mb-4">회원정보 수정</h3>
					<form id="update" name="update" method="post" action="${pageContext.request.contextPath }/user/update">
						<fieldset>
							<div class="form-group">
								<label class="block-label" for="id">아이디</label>
								<input name="id" name="id" type="text" value="${userVo.id }" readonly="readonly">
							</div>
							<br/>
							<div class="form-group">
								<label class="block-label">패스워드</label>
								<input id="input-password" name="password" type="password" value="">
							</div>
							<br/>
							<div class="form-group">
								<label class="block-label" for="name">이름</label>
								<input id="input-name" name="name" type="text" value="${userVo.name }">
							</div>
							<br/>
							<input id="btn-submit" class="btn btn-lg btn-primary btn-block" value="수정하기" type="submit">
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
			const name = $("#input-name").val();
	
			if (name == '') {
				alert("필수항목 미입력 오류입니다.");
				return false;
			}
	
			alert("수정이 완료되었습니다.");
		});
	</script>
</body>
</html>

