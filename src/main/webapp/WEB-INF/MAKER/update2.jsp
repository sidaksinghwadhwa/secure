<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>



<h2>Customer Update Information</h2>



<script type="text/javascript">


function validate()
{ 
   if( document.myForm.CustomerCode.value == "" ||document.myForm.CustomerCode.value.length>10 || /^[a-zA-Z_0-9\\s]+$/.test(document.myForm.CustomerCode.value)!=true )
   {
  	 alert( "invalid customer code !" );
      
      document.myForm.CustomerCode.focus() ;
      return false;
   }
   
   else if( document.myForm.CustomerName.value.length>30 || /^[a-zA-Z_0-9\\s]+$/.test(document.myForm.CustomerName.value)!=true || document.myForm.CustomerName.value=="" )
   {
  	 alert( "invalid customer name !" );
       document.myForm.CustomerName.focus() ;
      return false;
   }
   
   else if( document.myForm.Address1.value.length>100 || document.myForm.Address1.value=="" )
   {
  	 alert( "invalid Address 1 !" );
       document.myForm.Address1.focus() ;
      return false;
   }
   else if( document.myForm.Address2.value.length>100 )
   {
      alert( "invalid Address 2 !" );
      document.myForm.Address2.focus() ;
      return false;
   }
   else if( document.myForm.PinCode.value.length!=6 || /^[0-9]+$/.test(document.myForm.PinCode.value)!=true)
   {
      alert( "invalid pincode !" );
      document.myForm.PinCode.focus() ;
      return false;
   }
   else if( document.myForm.Email.value.length>100 || /^[_A-Za-z_0-9-\.]+@[A-Za-z]+(\.)(com)$/.test(document.myForm.Email.value)!=true || document.myForm.Email.value=="")
   {
      alert( "invalid email Address !" );
      document.myForm.Email.focus() ;
      return false;
   }
   else if( document.myForm.ContactNumber.value.length>20 || /^([0-9]+||^$)$/.test(document.myForm.ContactNumber.value)!=true )
   {
      alert( "invalid Contact number !" );
      document.myForm.ContactNumber.focus() ;
      return false;
   }
   else if( document.myForm.ContactPerson.value.length>100 || document.myForm.ContactPerson.value=="" )
   {
      alert( "invalid Primary contact person !" );
      document.myForm.ContactPerson.focus() ;
      return false;
   }
   else if( document.myForm.RecordStatus.value == "-1" )
   {
      alert( "Please choose record status!" );
      return false;
   }
   else if( document.myForm.Flag.value == "-1" )
   {
      alert( "Please choose Active/Inactive flag!" );
      return false;
   }
   
  /*  else if(document.myForm.createby.value.length>30 || document.myForm.createby.value=="" )
  {
      alert( "invalid Created By !" );
      document.myForm.createby.focus() ;
      return false;
   }
   
   else if( document.myForm.modifyby.value.length>30 )
   {
      alert( "invalid Modified By !" );
      document.myForm.modifyby.focus() ;
      return false;
   }
   
   else if( document.myForm.authorizedby.value.length>30 )
   {
      alert( "invalid Authorized By !" );
      document.myForm.authorizedby.focus() ;
      return false;
   }
  	 
   */
  	return true ;
  	 
}





</script>

</head>
<form:form method="GET" action="update3" name="myForm" onsubmit="return validate();">
   <table>
    <tr>
        <td>Customer Code :</td>
        <td><form:label path="CustomerCode"></form:label></td>
        <td><form:input path="CustomerCode" /></td>
    </tr>
    <tr>
        <td>Customer Name :</td>
        <td><form:label path="CustomerName"></form:label></td>
        <td><form:input path="CustomerName" /></td>
    </tr>
     <tr>
        <td>Customer Address 1 :</td>
        <td><form:label path="Address1"></form:label></td>
        <td><form:input path="Address1" /></td>
    </tr>
     <tr>
        <td>Customer Address 2 :</td>
        <td><form:label path="Address2"></form:label></td>
        <td><form:input path="Address2" /></td>
    </tr>
     <tr>
        <td>Customer Pin Code :</td>
        <td><form:label path="PinCode"></form:label></td>
        <td><form:input path="PinCode" /></td>
    </tr>
     <tr>
        <td>E-mail address :</td>
        <td><form:label path="Email"></form:label></td>
        <td><form:input path="Email" /></td>
    </tr>
     <tr>
        <td>Contact Number :</td>
        <td><form:label path="ContactNumber"></form:label></td>
        <td><form:input path="ContactNumber" /></td>
    </tr>
     <tr>
        <td>Contact Person :</td>
        <td><form:label path="ContactPerson"></form:label></td>
        <td><form:input path="ContactPerson" /></td>
    </tr>
    <tr>
      <td>Record Status</td> 
           <td> <form:select path="RecordStatus">
	<form:option value="N">NEW</form:option>
	<form:option value="M">MODIFIED</form:option>
	<form:option value="D">DELETED</form:option>
	<form:option value="A">AUTHORIZED</form:option>
	<form:option value="R">REJECTED</form:option>
	</form:select>
	</td></tr>
	 <tr>
		<td>Active/Inactive Flag</td>
				<td><form:select path="Flag">
						<form:option value="A">Active</form:option>
						<form:option value="I">Inactive</form:option>
				</form:select>
				</td>
			</tr>
   
    <tr>
				<td><input type="submit" value="submit" name="addOptn" ></td>
			</tr>
		</table>
</form:form>
 
  

</body>
</html>

