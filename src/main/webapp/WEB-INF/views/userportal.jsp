<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
    <form:form id="portalForm" modelAttribute="user">
        <table>
            <tr>
                <td>Welcome ${username}</td>
            </tr>
            <tr>
            </tr>
            <table align="right">
                <tr>
                    <td><a href="tutorials">Tutorials</a></td>
                    <td><a href="admin">Admin</a></td>
                    <td><a href="update">Account Update</a></td>
                    <td><a href="logout">Logout</a></td>
                </tr>
            </table>
        </table>
	</form:form>
</body>
</html>