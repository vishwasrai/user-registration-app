<%@ page import="com.captcha.botdetect.web.servlet.SimpleCaptcha"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="botDetect" uri="https://captcha.com/java/jsp/simple-api"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
    <style type="text/css">
        .error {
                padding: 15px;
                margin-bottom: 15px;
                margin-top: 15px;
                border: 1px solid transparent;
                color: #a94442;
                background-color: #f2dede;
                border-color: #ebccd1;
            }
            .msg {
                padding: 15px;
                margin-bottom: 15px;
                margin-top: 15px;
                border: 1px solid transparent;
                color: #31708f;
                background-color: #d9edf7;
                border-color: #bce8f1;
            }
            .validationDiv {
                padding: 0px 0px 5px 0px;
                margin: 8px 0px 0px 0px;
            }
            .validationError{
                 color: red; font-weight: bold;
            }
    </style>
	<form:form id="loginForm" modelAttribute="login" action="loginProcess" method="POST">
		<table align="center" bgcolor="#FFCA33">
			<tr>
				<td><form:label path="username">Username: </form:label></td>
				<td><form:input path="username" name="username" id="username" />
				<form:errors path="username" cssClass="validationError"/></td>
			</tr>
			<tr>
				<td><form:label path="password">Password:</form:label></td>
				<td><form:password path="password" name="password" id="password" />
				<form:errors path="password" cssClass="validationError"/></td>
			</tr>
			<tr>
				<td>
                    <!-- Adding BotDetect Captcha to the page -->
                    <botDetect:simpleCaptcha id="userSecurityCaptcha"/>

                    <div class="validationDiv">
                        <input type="text" id="captchaCode" name="captchaCode"/>
                    </div>

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <input type="hidden" name="type" value="loginForm" />
				</td>
				<td align="left"><form:button id="login" name="login">Login</form:button></td>
			</tr>
			<tr></tr>
			<tr>
				<td></td>
				<td><a href="/user-registration-app">Home</a></td>
			</tr>
		</table>
		<c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>
        <c:if test="${not empty msg}">
            <div class="msg">${msg}</div>
        </c:if>
	</form:form>
	<table align="center">
		<tr>
			<td style="font-style: italic; color: red;">${message}</td>
		</tr>
	</table>
</body>
</html>