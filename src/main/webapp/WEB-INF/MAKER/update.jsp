<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<html>
<head>


<h1>Update Customer </h1>  
Select Customer Code:  


<form:form method="get" action="update2">    
 <label>Enter customer code to be displayed:</label>
         
        
         <select  name="customerCode">
         <c:forEach var="emp" items="${list}"> 
               <option value="${emp.customerCode}">${emp.customerCode}</option>
                </c:forEach>
         </select>
         <input type="submit" value="Update ">
        
</form:form>