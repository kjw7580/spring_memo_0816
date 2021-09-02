<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="d-flex align-items-center justify-content-between">
	<h2 class="ml-3">Memo</h2>
	<c:if test="${not empty userName }">
		<div class="mr-4"><i class="bi bi-person-fill"></i> ${userName }님 <a href="/user/sign_out">로그아웃</a> </div>
	</c:if>
</header>