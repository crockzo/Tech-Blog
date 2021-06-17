

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.sql.*" %>
    <%@ page import = "com.blog.helper.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tech Blog</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body>
<%@ include file = "nav.jsp" %>


	<div class="row">
		<div class="col-md-4">
			<div class="card" style="width: 18rem; margin: 12px">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
					<a href="#" id="slideBtn" class="btn btn-primary bg-dark">Go somewhere</a>
				</div>
			</div>
		</div>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){
		
		$("#slideBtn").click(function(){
			
			$(".card").slideUp(100);
			
		});
		
	
		
	});
	
	</script>
</body>
</html>