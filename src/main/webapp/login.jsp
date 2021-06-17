

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import = "com.blog.entities.User" %>

<%


if(session.getAttribute("user") != null){
	response.sendRedirect("profile.jsp");
}


%>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>
<body>

<%@ include file = "nav.jsp" %>
	<main>
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card" style="width: 18rem; margin: 12px">
						<div class = "card-header bg-dark text-white">
						<span class = "fa fa-hand-peace-o"></span><p> Login Form : </p>
						</div>
						<div class="card-body">
						
						<div class = "container bg-danger" id = "error-message"  >
							<span class = "font-weight-bold">Try again Password or email may be wrong</span>
						</div>
							<form action = "LoginServlet" method = "POST">
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label> 
										<input name = "user_email" type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp">
									<div id="emailHelp" class="form-text">We'll never share
										your email with anyone else.</div>
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input name = "user_pass" type="password" class="form-control"
										id="exampleInputPassword1">
								</div>
								<div class="mb-3 form-check">
									<input name = "user_remember" type="checkbox" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">Check me out</label>
								</div>
								<button id="submitLogin" type="submit" class="btn btn-primary">Submit</button>
							</form>
						</div>
						
						
					</div>
				</div>
			</div>
		</div>
	</main>


	
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">

	$(document).ready(function(){

		$("#submitLogin").click(function(event){

			
			event.preventDefault();
			let form = new FormData(this);

			$.ajax({
			
			url : "LoginServlet",
			type : "POST",
			data : form,
			
			success : function(data, textStatus, jqXHR){
				console.log("i am here success blick")
				if(data.equals("fail")){
					$("#error-message").show();
				}else{
					console.log(data);
				}
			},
			
			error : function(jqXHR, textStatus, errorThrown){
				console.log("i am here error blick")
			},
			
			processData : false,
			contentType : false
			
			});
		});
	});
	
</script>




</body>
</html>