<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@ page import= "com.blog.entities.*" %>
<%@ page import = "com.blog.entities.*" %>
<%@ page import = "com.blog.dao.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.blog.helper.*" %>
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tech Blog</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
		integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
		crossorigin="anonymous"></script>

<%

if(session.getAttribute("user") != null){
	
	User user = (User) session.getAttribute("user");
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp"><span
				class="fa fa-coffee"> </span> Tech Blog</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active "
						aria-current="page" href="userPost.jsp">Post</a></li>
					<li class="nav-item"><a class="nav-link active "
						aria-current="page" href="createPost.jsp">Make new Post</a></li>
					

				</ul>
			</div>
			<a class="nav-link" href="editProfile.jsp" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle "></span> <%= user.getName().toUpperCase()%> </a>
			<a class="nav-link bg-success font-weight-light text-white" href = "Logout">Logout</a>
		</div>
	</nav>


<%

}else{
	


%>

<%@ include file = "nav.jsp" %>



<%

}
%>

<%

	int pid = Integer.parseInt(request.getParameter("pid"));
	
	PostDao pd = new PostDao(ConnectionProvider.getConnection());
	
	Post p = pd.getPostByPid(pid);
	
	if(p == null){
		return;
	}
	
	
		
	
	
%>

<div class = "container d-flex flex-row bd-highlight mb-3 ">
	<div class="col">
		<div class="row">
			<div class="card" style="width: 18rem; margin: 12px">
				<div class="card-body">
					<h5 class="card-title"><%= p.getPtitle() %></h5>
					<p class="card-text"><%= pd.getCategoryName(p.getCid()) %></p>
					<p class="card-text"><%= p.getPcontent() %></p>
					
					 </div>
			</div>
		</div>
	</div>
</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
</body>
</html>
