package com.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.blog.entities.*;
import com.blog.dao.*;
import com.blog.helper.*;


@MultipartConfig
@WebServlet("/PostServlet")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public PostServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
	
	private void process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		
		
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		
		
		String ptitle = req.getParameter("post_title");
		String pcontent = req.getParameter("post_content");
		int cid = Integer.parseInt(req.getParameter("post_category"));
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		int uid = user.getId();
		
		System.out.println(ptitle + " " + pcontent + " " +  uid + " " +  cid);


		  PostDao pd = new PostDao(ConnectionProvider.getConnection());
		 
		Post post = new Post(ptitle, pcontent, uid, cid);
		
		boolean check = pd.savePost(post);
		
		if(check) {
			out.println("success");
		}else {
			out.println("fail");
		}

	}

}
