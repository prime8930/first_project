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
					<h3 class="text-center mb-4">블로그 생성</h3>
					<form id="join" name="join" method="post" action="${pageContext.request.contextPath }/${user_id }/join" enctype="multipart/form-data">
						<fieldset>
							<div class="form-group">
								<input class="form-control input-lg" placeholder="아이디" name="user_id" type="text" value="${user_id }" readonly="readonly">
							</div>
							<br/>
							<div class="form-group">
								<input id="input-title" class="form-control input-lg" placeholder="블로그 제목" name="title" type="text">
							</div>
							<br/>
							<div class="form-group">
								<input id="b_file_up" class="form-control input-lg" placeholder="블로그 로고" name="file" type="file">
							</div>
							<br/>
							<div class="form-group">
								<textarea class="form-control input-lg" placeholder="블로그 소개" name="intro" rows="5" cols="86" style="resize:none;"></textarea>
							</div>
							<br/>
							<input id="btn-submit" class="btn btn-lg btn-primary btn-block" value="입력 완료" type="submit">
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
			const ext = $('#b_file_up').val().split('.').pop().toLowerCase();
	
			if (title == '') {
				alert("필수항목 미입력 오류입니다.");
				return false;
			}
			
			if($.inArray(ext, ['png','jpg','jpeg']) == -1) {
			  alert('등록 할수 없는 파일입니다.');
			  $("#b_file_up").val(""); 
			  return false;
			}
	
			alert(${user_id} + "님 블로그가 생성되었습니다.");
		});
	</script>
</body>
</html>