<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome admin</title>
</head>
<body>
    <form:form id="tutorialsForm" modelAttribute="user">
        <table>
            <tr><td>JAVA</td></tr>
            <tr><td>ASP.NET</td></tr>
            <tr><td>PYTHON</td></tr>
            <tr><td>C++</td></tr>
            <tr>
            </tr>
            <table align="right">
                <tr>
                    <td><a href="userportal">User Portal</a></td>
                    <td><a href="logout">Logout</a></td>
                </tr>
            </table>
        </table>
	</form:form>
</body>
</html>