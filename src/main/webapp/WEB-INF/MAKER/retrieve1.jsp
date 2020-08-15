<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<html>
<head>


<h1>Retrieve Customer </h1>  
Select Customer Code:  


<form:form method="get" action="retrieve2">    
 <label>Enter customer code to be displayed:</label>
         
        
         <select  name="CustomerCode">
         <c:forEach var="emp" items="${list}"> 
               <option value="${emp.customerCode}">${emp.customerCode}</option>
                </c:forEach>
         </select>
         <input type="submit" value="Retrieve ">
        
</form:form>