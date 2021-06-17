package com.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.blog.dao.*;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;

@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public RegisterServlet() {
    	super();
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
		String name = req.getParameter("user_name");
		String email = req.getParameter("user_email");
		String pass = req.getParameter("user_password");
		String gender = req.getParameter("user_gender");
		
		out.print("<h1> " + name + " " + email + " " + "</h1>");
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
		String check  = req.getParameter("check");
		if(check == null) {

			out.println("fail");
			//out.println("Please check term and condition : ");
		}else {
			String name = req.getParameter("user_name");
			String email = req.getParameter("user_email");
			String pass = req.getParameter("user_password");
			String gender = req.getParameter("user_gender");
			
			
			User user = new User(name, email, pass, gender);
			
			UserDao ud = new UserDao(ConnectionProvider.getConnection());
			if(ud.saveUser(user)) {
				out.println("done");
			}else {
				out.println("fail");
			}
		}
	}

}
