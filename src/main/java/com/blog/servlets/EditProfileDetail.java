package com.blog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.dao.UserDao;
import com.blog.entities.*;
import com.blog.helper.ConnectionProvider;
import com.blog.dao.*;

@WebServlet("/EditProfileDetail")
public class EditProfileDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public EditProfileDetail() {
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

	protected void process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		
		HttpSession session = req.getSession();
		User user =(User) session.getAttribute("user");
		
		int id = user.getId();
		String name = req.getParameter("user_name");
		String email = req.getParameter("user_email");
		String pass = req.getParameter("user_password");
		String gender = req.getParameter("user_gender");
		
		UserDao ud = new UserDao(ConnectionProvider.getConnection());
		boolean complete = ud.updateUser(id, name, email, pass, gender);
		
		if(complete) {
			res.sendRedirect("profile.jsp");
		}else {
			System.out.println("error encounter");
		}
		
	}

}
