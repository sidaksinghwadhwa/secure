<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Login Page For Security</title>
<style>
.errorblock {
	color: #ff0000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
<style>
input[type=text], select {
    width: 110%;
    padding: 10px 15px;
    margin: 8px 0;
    display: inline-block;
    border: 2px solid #black;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=password], select {
    width: 110%;
    padding: 10px 15px;
    margin: 8px 0;
    display: inline-block;
    border: 2px solid #black;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=submit] {
    width: 95%;
    background-color: #4CAF50;
    color: white;
    padding: 10px 15px;
    margin: 8px 65px;
    border:  2px solid #black;
    border-radius: 4px;
    cursor: pointer;
}
input[type=reset] {
    width: 95%;
    background-color: #4CAF50;
    color: white;
    padding: 10px 15px;
    margin: 8px 65px;
    border:  2px solid #black;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

div {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}
fieldset {
    display: block;
    width:350px;
    margin-left: 2px;
    
    padding-top: 0.35em;
    padding-bottom: 0.625em;
    padding-left: 0.75em;
    padding-right: 0.75em;
    border: 2px groove (internal value);
}



</style>
<body>




</head>
<body onload='document.f.j_username.focus();'>
	<h3 style="color:blue;">Login with Username and Password (Custom Login Page)</h3>
 
	<c:if test="${not empty error}">
		<div class="errorblock">
			Wrong Username Password !!!<br /> Please Re-Enter!
		</div>
	</c:if>
 
	<form name='f' action="<c:url value='j_spring_security_check' />"
		method='POST'>
 	 <fieldset>
  <legend>Login:</legend>
		<table>
			<tr>
				<td>User:</td>
				<td><input type='text' name='j_username' value=''>
				</td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type='password' name='j_password' />
				</td>
			</tr>
			<tr>
				<td colspan='2'><input name="submit" type="submit"
					 />
				</td>
			</tr>
			<tr>
				<td colspan='2'><input name="reset" type="reset" />
				</td>
			</tr>
		</table>
 </fieldset>
	</form>
</body>
</html>