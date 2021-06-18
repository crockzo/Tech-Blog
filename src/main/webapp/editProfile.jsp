<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.blog.entities.User"%>


<%
if (session.getAttribute("user") == null) {
	response.sendRedirect("register.jsp");
	return;
}

User user = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>
<body>



<%@ include file = "AfterLoginNav.jsp" %>






	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card" style="width: 18rem; margin: 12px">


<!--  My profile Information : Edit unable -->

						<div id="editUnable">
							<div class="card d-flex justify-content-center"
								style="width: 18rem;">
								<img class="card-img-top"
									src="pics/default.jpg"
									alt="Card image cap">
								<div class="card-body">
									<h5 class="card-title"><%=user.getName().toUpperCase()%>
									</h5>
									<p class="card-text">Java developer : )</p>
								</div>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">Id : <%=user.getId()%>
									</li>
									<li class="list-group-item">Email : <%=user.getEmail().toUpperCase()%></li>
									<li class="list-group-item">Gender : <%=user.getGender().toUpperCase()%></li>
								</ul>
								<div class="card-body">
									<a href="profile.jsp" class="btn btn-primary ">Profile</a>
								</div>
							</div>
						</div>
						
<!--  My profile Information  : END -->



<!-- Edit section of the profile is Start here -->
						<div id="editEnable" style="display: none">
							<div class="card d-flex justify-content-center"
								style="width: 18rem;">
								<img class="card-img-top"
									src="pics/default.jpg"
									alt="Card image cap">
								<div class="card-body">
									<div id="error" class="container" style="display: none">
										<span id="error-message" class="bg-danger"></span>
									</div>
									<form id="edit-form" action="EditProfileDetail" method="POST">
										<table>

											<tr>
												<td>Id :</td>
												<td><%=user.getId()%></td>
											</tr>
											<tr>
												<td>Name :</td>
												<td><input name="user_name" type="text"
													placeholder="Enter your name."></td>
											</tr>
											<tr>
												<td>Email :</td>
												<td><input name="user_email" type="email"
													placeholder="Enter your email"></td>
											</tr>
											<tr>
												<td>Password :</td>
												<td><input name="user_password" type="password"
													placeholder="Enter your password."></td>
											</tr>
											<tr>
												<td>Gender :</td>
												<td><input name="user_gender" type="text"
													placeholder="Enter your Gender."></td>
											</tr>
										</table>


										<button type="submit" class="btn btn-primary">Update</button>
									</form>

								</div>

								<div class="card-body">
									<a href="profile.jsp" class="btn btn-primary text-center ">Profile</a>
								</div>
							</div>
						
					</div>
					
<!-- Edit section of the profile is END here -->
<button id="editButton"
							class="btn btn-primary card-link d-flex justify-content-center">Edit</button>
				</div>
			</div>
		</div>
	</div>



	<!-- S C R I P T -->

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
		integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			$("#editButton").click(function() {

				$("#editUnable").hide();
				$("#editEnable").show();
			});
			
			
			
			$("#edit-form").on("submit", function(event){
				
				event.preventDefault();
				let form = new FormData(this);
				
				$.ajax({
					
					url : "EditProfileDetail",
					type : "POST",
					data : form,
					
					success : function(data, textStatus, jqXHR){
						if(data.trim() === "success"){
							swal("Edit successfully..We are going to redirect to Profile page")
		                     .then((value) => {
		                         window.location = "profile.jsp"
		                     });
						}else{
							$("#error").show();
							$("#error-message").text("Please fill the details again");
						}
					},
					
					error : function(jqXHR, textStatus, errorThrown){
						
					},
					
					processData : false,
					contentType : false
						
				});
				
			});

		});
	</script>




</body>
</html>