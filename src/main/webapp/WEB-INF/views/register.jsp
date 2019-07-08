<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<script>
      function resetTexts() {
          document.getElementById("name").value="";
          document.getElementById("email").value="";
          document.getElementById("username").value="";
          document.getElementById("password").value="";
          return false;
        }
</script>
</head>
<body>
<style>
    .validationError{
         color: red; font-weight: bold;
    }
    </style>
	<form:form id="regForm" modelAttribute="user" action="registerProcess"
		method="post">

		<table align="center" bgcolor="#FFCA33">
		    <tr>
                <td><form:label path="name">Name</form:label></td>
                <td><form:input path="name" name="name" id="name" /><form:errors path="name" cssClass="validationError"/></td>
            </tr>
            <tr>
                <td><form:label path="email">Email</form:label></td>
                <td><form:input path="email" name="email" id="email" /><form:errors path="email" cssClass="validationError"/></td>
            </tr>
			<tr>
				<td><form:label path="username">Username</form:label></td>
				<td><form:input path="username" name="username" id="username" /><form:errors path="username" cssClass="validationError"/></td>
			</tr>
			<tr>
				<td><form:label path="password">Password</form:label></td>
				<td><form:password path="password" name="password" id="password" /><form:errors path="password" cssClass="validationError"/></td>
			</tr>
			<tr>
				<td></td>
				<td><form:button id="register" name="register">Register</form:button>&nbsp;&nbsp;
				<input type="button" onclick="resetTexts()" value="Reset"/>
			</tr></tr>
			<tr>
				<td></td>
				<td><a href="/user-registration-app">Home</a></td>
			</tr>
		</table>
	</form:form>

</body>
</html>