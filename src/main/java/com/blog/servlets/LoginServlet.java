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

import com.blog.dao.UserDao;
import com.blog.helper.ConnectionProvider;
import com.blog.entities.User;


@MultipartConfig
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoginServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
	private void process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		
		
		String email = req.getParameter("user_email");
		String pass = req.getParameter("user_pass");
		
		UserDao ud = new UserDao(ConnectionProvider.getConnection());
		User user = ud.getUser(email, pass);
		
		
		if(user == null) {
			out.print("fail");
			
			
		}else {
			
			HttpSession session = req.getSession();
			session.setAttribute("user", user);
			out.print("great");
			//res.sendRedirect("profile.jsp");
		}
		System.out.println(req.getParameter("user_remember") + " " + email + " " + pass);
	}
}
