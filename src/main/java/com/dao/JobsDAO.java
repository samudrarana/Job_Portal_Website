package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Jobs;

public class JobsDAO {
	
	private Connection conn;

	public JobsDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	//Add New Jobs
	public boolean addJobs(Jobs j) {
		 boolean f=false;
		try {
			String sql="insert into jobs(title,description,category,status,location) values(?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	//view Jobs for Admin
	public List<Jobs> getAllJobs(){
		List<Jobs> list=new ArrayList<Jobs>();
		Jobs j=null;
		try {
			String sql="select * from jobs order by id desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPublishDate(rs.getTimestamp(7)+"");
				list.add(j);
				
				
				
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	
		return list;
	}
	
	//view jobs for users (only active ones)
	
	public List<Jobs> getAllJobsForUser (){
		List<Jobs> list=new ArrayList<Jobs>();
		Jobs j=null;
		try {
			String sql="select * from jobs where status=? order by id desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString( 1,"Active");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPublishDate(rs.getTimestamp(7)+"");
				list.add(j);
				
				
				
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	
		return list;
	}
	
	
	
	/*Edit jobs-For showing given information on the edit page.
	 * Also used for "view more" functionality at user page.
	 * */
	 
	public Jobs getJobById(int id){
		
		Jobs j=null;
		try {
			String sql="select * from jobs where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPublishDate(rs.getTimestamp(7)+"");
				
				
				
				
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	
		return j;
	}
	
	//Update Job
	public boolean updateJob(Jobs j) {
		
		 boolean f=false;
			try {
				String sql="update jobs set title=?,description=?,category=?,status=?,location=? where id=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, j.getTitle());
				ps.setString(2, j.getDescription());
				ps.setString(3, j.getCategory());
				ps.setString(4, j.getStatus());
				ps.setString(5, j.getLocation());
				ps.setInt(6, j.getId());
				
				int i=ps.executeUpdate();
				
				if(i==1) {
					f=true;
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return f;
	}
	//Delete Job
	public boolean deleteJobs(int id) {
		boolean f=false;
		try {
			String sql="delete from jobs where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	//For Filtering Job when out of location and category ,only one is chosen.
	public List<Jobs>getJobsCategoryOrLocation(String category,String location){
		List<Jobs>list=new ArrayList<Jobs>();
		Jobs j=null;
		try {
			String sql="select * from jobs where category=? or location=? order by id desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, category);
			ps.setString(2, location);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPublishDate(rs.getTimestamp(7)+"");
				list.add(j);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	//Filter: when both location and category are chosen. 
	public List<Jobs>getJobsCategoryAndLocation(String category,String location){
		List<Jobs>list=new ArrayList<Jobs>();
		Jobs j=null;
		try {
			String sql="select * from jobs where category=? and location=? order by id desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, category);
			ps.setString(2, location);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPublishDate(rs.getTimestamp(7)+"");
				list.add(j);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
