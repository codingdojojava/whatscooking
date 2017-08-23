<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration Page</title>
</head>
<body>
	<fieldset>
	<legend>Login</legend>
		<form method="POST" action="/">
	        <p>
	            <label for="username">Email:</label>
	            <input type="text" id="username" name="username"/>
	        </p>
	        <p>
	            <label for="password">Password</label>
	            <input type="password" id="password" name="password"/>
	        </p>
	        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	        <input type="submit" value="Login!"/>
	    </form>
	</fieldset>
	
	<fieldset>
	<legend>Register</legend>
    		<p><form:errors path="userInfo.*"/></p>
	    <form:form method="POST" action="/register" modelAttribute="userInfo">
	        <p>
	            <form:label path="username">Email:</form:label>
	            <form:input path="username"/>
	        </p>
	        <p>
	            <form:label path="firstname">First Name:</form:label>
	            <form:input path="firstname"/>
	        </p>
	        <p>
	            <form:label path="lastname">Last Name:</form:label>
	            <form:input path="lastname"/>
	        </p>
	        <p>
	            <form:label path="password">Password:</form:label>
	            <form:password path="password"/>
	        </p>
	        <p>
	            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
	            <form:password path="passwordConfirmation"/>
	        </p>
	        <p>
	        		<form:hidden path="diets"/>
	        		<form:hidden path="allergies"/> 
	        		<label>Diets:</label>
	        		<c:forEach var="diet" items="${diets}">
	        			<div>
	        				<form:checkbox path="diets" value="${diet}"/><label>${diet.name}</label>
	        			</div>
	        		</c:forEach>
	        </p>
	        <p>
	        		
	        		<label>Allergies:</label>
	        		<c:forEach var="allergy" items="${allergies}">
	        			<div>
	        				<form:checkbox path="allergies" value="${allergy}"/><label>${allergy.name}</label>
	        			</div>
	        		</c:forEach>
	        </p>
	        <input type="submit" value="Register!"/>
	    </form:form>
	</fieldset>
	 
</body>
</html>