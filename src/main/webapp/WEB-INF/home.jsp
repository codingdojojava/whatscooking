<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>What's cooking, ${current.firstname}?</h1>
	<h2>Current plan</h2>
	<div id="week">
		<div class="monday">
			 <c:forEach var="recipe" items="${current.weeks[0].monRecipes}">
			 	${recipe.name}
			 </c:forEach>
		</div>
		<div class="tuesday">
			<c:forEach var="recipe" items="${current.weeks[0].tueRecipes}">
			 	${recipe.name}
			 </c:forEach>
		</div>
		<div class="wednesday">
			<c:forEach var="recipe" items="${current.weeks[0].wedRecipes}">
			 	${recipe.name}
			 </c:forEach>
		</div>
		<div class="thursday">
			<c:forEach var="recipe" items="${current.weeks[0].thurRecipes}">
			 	${recipe.name}
			 </c:forEach>
		</div>
		<div class="friday">
			<c:forEach var="recipe" items="${current.weeks[0].friRecipes}">
			 	${recipe.name}
			 </c:forEach>
		</div>
		<div class="saturday">
			<c:forEach var="recipe" items="${current.weeks[0].satRecipes}">
			 	${recipe.name}
			 </c:forEach>
		</div>
		<div class="sunday">
			<c:forEach var="recipe" items="${current.weeks[0].sunRecipes}">
			 	${recipe.name}
			 </c:forEach>
		</div>
	</div>
</body>
</html>