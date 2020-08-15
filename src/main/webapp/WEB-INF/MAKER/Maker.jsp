 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<!DOCTYPE html>
<html lang="en">
<head>
<title>Sidak FINAL BRD</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:100px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none;
    }
  }
  
  .item-active
  {
  
  overflow:hidden;
    background-size: cover;
  }
  </style>
  

<script>
function counterForImage(){
	
	updateImage();
	setInterval(function () {
	        updateImage();
	    },20000);
} 

function updateImage() {
	
    $.get('getImage', function(responseText) {
    	console.log(responseText);
    	$('#imageDiv').css('background-image', "url("+responseText+")");
  		
    });
}
counterForImage();
</script> 

 



<script>
(function update() {
	  $.ajax({
			contentType : 'application/json; charset=utf-8',
			type : 'POST',
			url : 'retrieveAll',
			success : function(callback) {
				var json=$.parseJSON(callback);
				var tdata='<table cellspacing="2" width=70% cellpadding="2" border="1"><tr><th>Code</th><th>Name</th><th>Address1</th><th>Address2</th><th>Pin</th><th>Email</th><th>Phone</th><th>Primary_Contact</th><th>Record_Status</th><th>Flag</th><th>Create_Date</th><th>Create_By</th>';
				$.each(json,function(index,value){
					tdata+='<tr><td>'+value.CustomerCode+'</td><td>'+value.CustomerName+'</td><td>'+value.Address1+'</td><td>'+value.Address2+'</td><td>'+value.PinCode+'</td><td>'+value.Email+'</td><td>'+value.ContactNumber+'</td><td>'+value.ContactPerson+'</td><td>'+value.RecordStatus+'</td><td>'+value.Flag+'</td><td>'+value.CreateDate+'</td><td>'+value.CreatedBy+'</td><td></tr>';
				});
				tdata+='</table>';
				$("#RelodThis").html(tdata);
			},
			error : function() {
				alert("error");
			}
		}).then(function() {           // on completion, restart
	       setTimeout(update, 20000);  // function refers to itself
	    });
	  })();


</script>


</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="Maker">Home</a></li>
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="<c:url value="j_spring_security_logout" />"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item-active" id="imageDiv" style="width:500px;height:500px;overflow:hidden;background:cover;">
<H1>Hello</H1>

<h2>Author : ${author}</h2>	
        <div class="carousel-caption">
          <h3>The Last BRD !!</h3>
         
          <p>Sidak</p>
        </div>
      </div>
   
     

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>



<div class="container" id="container">
  <div class="row">
    <div class="col-sm-6">
        
        
         <%
     HttpSession sessio =request.getSession(false);
      
       String s=(String)sessio.getAttribute("page");
       session.removeAttribute("page");
      if(s!=null){
       System.out.println("session"+s);
		 if ("create1".equals(s)){ 
       %>
        
       <div id="crud">
       
       <jsp:include page="create.jsp" /> 
      
       </div>
       
       
       <%} else if("code".equals(s)) {%>
       <div id="crud" >
       
       <jsp:include page="codeExist.jsp" /> 
      
       </div>
       
       
       <%} else if("search1".equals(s)) {%>
       <div id="crud">
       
       <jsp:include page="retrieve.jsp" /> 
      
       </div>
       
       
       
        <%} else if("problem".equals(s)) {%>
       <div id="crud" >
       
       <jsp:include page="NoSuchCodeExist.jsp" /> 
      
       </div>
       
       
       
       <%} else if("update1".equals(s)) {%>
       <div id="crud" >
       
       <jsp:include page="update.jsp" /> 
      
       </div>
       
       <%} else if("update2".equals(s)) {%>
       <div id="crud" >
       
       <jsp:include page="update2.jsp" /> 
      
       </div>
       
       
 
   <%} else if("delete1".equals(s)) {%>
       <div id="crud" >
       
       <jsp:include page="delete.jsp" /> 
      
       </div>
 
       <%}} else {%>
          <div id="crud" >
       
       <jsp:include page="crud.jsp" /> 
       </div>
     <%}s=null;%>
        
        
        
        
        
        
    </div>
    <div class="col-sm-6" id="RelodThis" style="height:300px; width:500px; overflow-x:scroll;">
      
    

               </div> 
     
     
      
      
    </div>
    
  </div>
</div>

    
     
      


<footer class="container-fluid text-center">
  <p>Sidak PROJECT FINAL</p>
</footer>




</body>
</html>

