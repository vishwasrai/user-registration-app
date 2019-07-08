<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<script>
      function validate() {
         var password = document.getElementById("password").value;
         var repeatpassword = document.getElementById("repeatpassword").value;
         if(password !== repeatpassword){
            alert("'Password' and 'Re-Enter Password' should match");
            return false;
         }
      }
      function resetTexts() {
        document.getElementById("name").value="";
        document.getElementById("email").value="";
        document.getElementById("password").value="";
        document.getElementById("repeatpassword").value="";
        return false;
      }
</script>
</head>
<body>
	<form:form id="updateForm" modelAttribute="user" action="updateProcess" method="post" onsubmit="return validate()">
		<table align="center" bgcolor="#FFCA33">
		    <tr>
                <td><form:label path="name">Name</form:label></td>
                <td><form:input path="name" name="name" id="name" /></td>
            </tr>
            <tr>
                <td><form:label path="email">Email</form:label></td>
                <td><form:input path="email" name="email" id="email" /></td>
            </tr>
			<tr>
				<td><form:label path="username">Username</form:label></td>
				<td><form:input path="username" name="username" id="username" readonly="true"/></td>
			</tr>
			<tr>
				<td><form:label path="password">Password</form:label></td>
				<td><form:password path="password" name="password" id="password" /></td>
			</tr>
			<tr>
                <td>Re-Enter Password</td>
                <td><input type="textbox" name="repeatpassword" id="repeatpassword" /></td>
            </tr>
			<tr>
				<td></td>
				<td><form:button id="register" name="register">Register</form:button>&nbsp;&nbsp;
				<input type="button" onclick="resetTexts()" value="Reset"/>
			</tr></tr>
			<tr>
				<td></td>
				<td><a href="userportal">User Portal</a></td>
			</tr>
		</table>
	</form:form>
</body>
</html>