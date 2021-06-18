<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ page import="com.blog.entities.*"%>
<%@ page import="com.blog.dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.blog.helper.*"%>


<%
      
		if(session.getAttribute("user") == null){
			response.sendRedirect("login.jsp");	
			return;
		}
		
		User user = (User) session.getAttribute("user"); 
System.out.print( " ------- " + user.getEmail() + " ------- ");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

</head>
<body>

	<%@ include file="AfterLoginNav.jsp"%>
	
	<div class="container">
		<form id="post-form" action="PostServlet" method="POST">
			<div class="form-group">
				<label for="exampleFormControlInput1">Email address</label> <input
					type="text" class="form-control" id="post_title" name="post_title"
					placeholder="Enter the Title of your post.">
			</div>
			<div class="form-group">
				<label for="exampleFormControlSelect1">Choose Category</label> <select
					name="post_category" class="form-control"
					id="exampleFormControlSelect1">
					<option disabled="disabled">--Select any of the Category--</option>


<%
    	PostDao pd = new PostDao(ConnectionProvider.getConnection());
    	ArrayList<Category> ll = pd.getCategory();
    		
    		if(ll.size() == 0){
    			out.print("<h3>No Category Is Found</h3>");
    			return;
    		}else{	
    			for(Category c : ll){
    			
%>
					<option value=<%= c.getCid() %>><%= c.getCname() %></option>
<%   		
				}
    		}
%>


				</select>
			</div>


			<div class="form-group">
				<label for="exampleFormControlTextarea1">Write Your Post...</label>
				<textarea name="post_content" class="form-control"
					id="exampleFormControlTextarea1" rows="3"></textarea>
			</div>

			<div class="form-group text-center mt-8 ">
				<button type="submit" class="bg-info font-weight-bold">Post</button>
			</div>

		</form>


	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
		integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		
	$(document).ready(function() {

			
			
			$("#post-form").on("submit", function(event){
				
				event.preventDefault();
				let form = new FormData(this);
				
				$.ajax({
					
					url : "PostServlet",
					type : "POST",
					data : form,
					
					success : function(data, textStatus, jqXHR){
						if(data.trim() === "success"){
							swal("Post successfully saved..").then((value) => {
		                         window.location = "profile.jsp"
		                     });
							
						}else{
							swal("Post Un-successfully .. Please try again");
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