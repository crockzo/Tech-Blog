package com.blog.dao;

import java.sql.*;
import java.util.ArrayList;

import com.blog.entities.*;

public class PostDao {

	private Connection con;
	
	public PostDao(Connection connect) {
		this.con = connect;
	}
	
	public boolean savePost(Post post) {
		boolean flag = false;
		
		try {
			
			String q = "insert into post ( ptitle, pcontent, uid, cid) values (?,?,?,?)";
			
			PreparedStatement ps = con.prepareStatement(q);
			
			ps.setString(1, post.getPtitle());
			ps.setString(2, post.getPcontent());
			ps.setInt(3, post.getUid());
			ps.setInt(4, post.getCid());
			
			ps.executeUpdate();
			
			flag = true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return flag;
	}
	
	public ArrayList<Post> getAllPost(){
		ArrayList<Post> ll = new ArrayList<Post>();
		
		try {
			String q = "select * from post order by pid DESC";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(q);
			
			while(rs.next()) {
				int pid = rs.getInt("pid");
				String ptitle = rs.getString("ptitle");
				String pcontent = rs.getString("pcontent");
				int uid = rs.getInt("uid");
				int cid = rs.getInt("cid");
				
				Post post = new Post(pid, ptitle, pcontent, uid, cid);
				ll.add(post);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return ll;
	}
	
	public ArrayList<Post> getPostByCategory(int cid){
		ArrayList<Post> ll = new ArrayList<Post>();
		
		try {
			String q = "select * from post where cid = ? order by pid DESC";
			PreparedStatement pst = con.prepareStatement(q);
			pst.setInt(1, cid);
			ResultSet rs = pst.executeQuery(q);
			
			while(rs.next()) {
				int pid = rs.getInt("pid");
				String ptitle = rs.getString("ptitle");
				String pcontent = rs.getString("pcontent");
				int uid = rs.getInt("uid");
				
				//int cid = rs.getInt("cid");
				
				Post post = new Post(pid, ptitle, pcontent, uid, cid);
				ll.add(post);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return ll;
	}

	public ArrayList<Post> getPostByUser(int uid){
		ArrayList<Post> ll = new ArrayList<Post>();
		
		try {
			String q = "select * from post where uid = ? order by pid DESC";
			PreparedStatement pst = con.prepareStatement(q);
			pst.setInt(1, uid);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				
				int pid = rs.getInt("pid");
				String ptitle = rs.getString("ptitle");
				String pcontent = rs.getString("pcontent");
				//int uid = rs.getInt("uid");
				int cid = rs.getInt("cid");
				
				Post post = new Post(pid, ptitle, pcontent, uid, cid);
				ll.add(post);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return ll;
	}

	public ArrayList<Category> getCategory(){
		ArrayList<Category> ll = new ArrayList<Category>();
		
		try {
			String q = "Select * from category";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(q);
			
			while(rs.next()) {
				
				int cid = rs.getInt("cid");
				String categ = rs.getString("cname");
				Category cat = new Category( categ, cid);
				ll.add(cat);
			}
			
		}catch (Exception e) {

		}
		
		
		return ll;
	}

	public String getCategoryName(int cid){
		String name = "notfound";
		try {
			String q = "Select * from category where cid = ?";
			PreparedStatement st = con.prepareStatement(q);
			st.setInt(1, cid);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				name = rs.getString("cname");
				System.out.println(name + " i am post dao");
				break;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return name;
	}
	
	
	
	
	public Post getPostByPid(int pid){
		Post post = null;
		try {
			String q = "select * from post where pid = ?";
			PreparedStatement st = con.prepareStatement(q);
			st.setInt(1, pid);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				
				String ptitle = rs.getString("ptitle");
				String pcontent = rs.getString("pcontent");
				int uid = rs.getInt("uid");
				int cid = rs.getInt("cid");
				
				post = new Post(pid, ptitle, pcontent, uid, cid);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return post;
	}
	
}
