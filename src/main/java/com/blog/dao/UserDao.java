package com.blog.dao;



import java.sql.*;
import com.blog.entities.*;
public class UserDao {

	private Connection con;
	
	public UserDao(Connection con) {
		this.con = con;
	}
	
	public boolean saveUser(User user) {
		boolean flag = false;
		
		try {
			String q = "insert into user(name, email, password, gender) values (?,?,?,?)";
			PreparedStatement st = con.prepareStatement(q);
			st.setString(1, user.getName());
			st.setString(2, user.getEmail());
			st.setString(3, user.getPassword());
			st.setString(4, user.getGender());
			
			st.executeUpdate();
			flag = true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	
	public User getUser(String email, String pass) {
		
		User user = null;
		
		try {
			String query = "select * from user where email = ? and password = ?";
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1, email);
			ps.setString(2, pass);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				
				int Id = (rs.getInt("id"));
				String Name = (rs.getString("name"));
				String Gender = (rs.getString("gender"));
				String email1 = (rs.getString("email"));
				String passw = rs.getString("password");
				user = new User(Id, Name, email1, passw, Gender);
			}
			
			
		}catch(Exception e) {
			System.out.println("error in getting user info for login");
			System.out.println(e);
		}
		
		return user;
	}
	
	
	
	public boolean updateUser(int id , String name, String email, String pass, String gender) {
		boolean flag = false;
		try {
			String q = "update user set name = ?, email = ?, password = ?, gender = ? where id = ?";
			PreparedStatement ps = con.prepareStatement(q);
			
			ps.setString(1,name);
			ps.setString(2, email);
			ps.setString(3, pass);
			ps.setString(4, gender);
			ps.setInt(5, id);
		
			ps.executeUpdate();
			 flag = true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	return flag;	
	}
}
