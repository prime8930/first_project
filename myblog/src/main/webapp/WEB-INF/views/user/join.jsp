<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.6.0.js" type="text/javascript"></script>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath }/assets/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<c:import url="/WEB-INF/views/includes/navbar.jsp" />
	<div class="container-fluid bg-light py-3">
		<div class="row">
			<div class="col-md-6 mx-auto">
				<div class="card card-body">
					<h3 class="text-center mb-4">회원 가입</h3>
					<form id="join" name="join" method="post" action="${pageContext.request.contextPath }/user/join">
						<fieldset>
							<div class="form-group">
								<input id="input-id" class="form-control input-lg" placeholder="아이디" name="id" type="text">
								<img id="img-check" src="${pageContext.request.contextPath}/assets/images/check.png" style="width:30px; display:none;"/>
								<input id="btn-check" type="button" value="중복체크">
							</div>
							<br/>
							<div class="form-group">
								<input id="input-password" class="form-control input-lg" placeholder="비밀번호" name="password" value="" type="password">
							</div>
							<br/>
							<div class="form-group">
								<input id="input-name" class="form-control input-lg" placeholder="이름" name="name" type="text">
							</div>
							<br/>
							<input id="btn-submit" class="btn btn-lg btn-primary btn-block" value="가입하기" type="submit">
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/user.valid.check.js"></script>
</body>
</html>
