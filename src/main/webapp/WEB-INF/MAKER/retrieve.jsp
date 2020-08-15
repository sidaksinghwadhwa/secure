
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



    <h1>Employees List</h1>
	<table border="2" width="70%" cellpadding="2">
	
    <c:forEach var="emp" items="${list}"> 
    
    
    <tr>
  	<th>Code    :</th>
 	 <td>${emp.customerCode}</td>
	</tr>
    <tr>
   <tr>
  	<th>Name    :</th>
 	 <td>${emp.customerName}</td>
	</tr>
   <tr>
  	<th>Address1    :</th>
 	 <td>${emp.address1}</td>
	</tr>
	<tr>
  	<th>Address2    :</th>
 	 <td>${emp.address2}</td>
	</tr>
	<tr>
  	<th>PinCode    :</th>
 	 <td>${emp.pinCode}</td>
	</tr>
	<tr>
  	<th>Contact    :</th>
 	 <td>${emp.contactNumber}</td>
	</tr>
	<tr>
  	<th>Person    :</th>
 	 <td>${emp.contactPerson}</td>
	</tr>
	<tr>
  	<th>RecordStatus    :</th>
 	 <td>${emp.recordStatus}</td>
	</tr>
	<tr>
  	<th>Flag    :</th>
 	 <td>${emp.flag}</td>
	</tr>
	<tr>
  	<th>CreateDate    :</th>
 	 <td>${emp.createDate}</td>
	</tr>
	<tr>
  	<th>CreatedBy   :</th>
 	 <td>${emp.createdBy}</td>
	</tr>
	
	
	<br>
	<br>
    </c:forEach>
   <form:form method="GET" action="Maker">  
   
   <tr>
    <td><input type="submit" value="Go Back!" /></td>    
         </tr>    
          
       </form:form>    
    </table>
    <br/>

</body>
</html>