
     <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<center>
     <form:form action="create" >
           <br><br><input type="submit" VALUE="CREATE"/>
     </form:form>
</center>
<center>
      </center>
 <center>
    <form:form action="retrieve2" >
       <br>
       <input type="submit" VALUE="SEARCH">
       <br>
       <input path="CustomerCode" placeholder="ENTER CODE" name="CustomerCode" style="color:Brown; "></input>
     </form:form>
    </center>
    <center>
     <form:form action="update" >
      <br>
      <hr>
       <input type="submit" VALUE="UPDATE">
     </form:form>
     </center>
    <center>
     <form:form action="delete" >
      <br>
      <input type="submit" VALUE="DELETE">
      
      </form:form>
      </center>


</body>
</html>