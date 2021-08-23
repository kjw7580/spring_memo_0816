<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 - 글쓰기</title>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="d-flex justify-content-center">
			<div class="w-75 m-5">
				<h1 class="text-center">메모 입력</h1>
				
				<!-- 제목, 내용, 파일 업로드 -->
				<div class="d-flex align-items-center">
					<label>제목 : </label>
					<input type="text" class="form-control col-11 ml-3" id="titleInput">
				</div>
				
				<textarea class="form-control mt-3" rows="5" id="contentInput"></textarea>
				<!-- MIME -->
				<input type="file" accept="image/*" id="fileInput" multiple>
				<div class="d-flex justify-content-between mt-3">
					<a href="/post/list_view" class="btn btn-info">목록으로</a>
					<button type="button" class="btn btn-success" id="saveBtn">저장</button>
				</div>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			$("#saveBtn").on("click", function() {
				var title = $("#titleInput").val().trim();
				var content = $("#contentInput").val().trim();
				
				if(title == null || title == "") {
					alert("제목을 입력하세요.");
					return;
				}
				
				if(content == null || content == "") {
					alert("내용을 입력하세요.");
					return;
				}
				
				var formData = new FormData();
				formData.append("title", title);
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					enctype:"multipart/form-data",	// 파일 업로드 필수
					type:"post",
					url:"/post/create",
					processData:false,	// 파일 업로드 필수
					contentType:false,	// 파일 업로드 필수
					data:formData,
					success:function(data) {
						if(data.result == "success") {
							// location.href="";
							alert("글 쓰기 성공");
						} else {
							alert("글 쓰기에 실패했습니다!");
						}
					},
					error(e) {
						alert("error");
					}
						
				});
			});
		});
	</script>
</body>
</html>