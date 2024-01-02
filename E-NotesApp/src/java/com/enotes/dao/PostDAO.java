/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.enotes.dao;

import com.enotes.user.Post;
import com.enotes.user.UserDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pratik
 */
public class PostDAO {
    
    private Connection con;
    public PostDAO(Connection con){
        super();
        this.con = con;
    }
    
    public boolean addNotes(String title, String content, int uid){
        boolean f = false;
        
        try {
            String query = "insert into post(title, content, uid) values(?,?,?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, title);
            pst.setString(2, content);
            pst.setInt(3, uid);
            
            int i = pst.executeUpdate();
            if(i == 1){
                f=true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return f;
    }
    
    public List<Post> getData(int id){
        List<Post> list = new ArrayList<>();
        Post post = null;
        
        try {
            String query = "select * from post where uid=? order by id DESC";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, id);
            
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                post = new Post();
                post.setId(rs.getInt("id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setPdate(rs.getTimestamp("created_at"));
                list.add(post);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public Post getDataById(int noteId){
        Post post = null;
        try {
            String query = "select * from post where id=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, noteId);
            
            ResultSet rs = pst.executeQuery();
            
            if(rs.next()){
                post = new Post();
                post.setId(rs.getInt("id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return post;
    }
    
    public boolean postUpdate(int nid, String title, String content){
        boolean f = false;
        
        try {
            String query = "update post set title=?, content=? where id=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, title);
            pst.setString(2, content);
            pst.setInt(3, nid);
            int i = pst.executeUpdate();
            
            if(i==1){
                f = true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return f;
    }
    
    
    public boolean deleteNotes(int id){
        boolean f = false;
        
        try {
            String query = "delete from post where id=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, id);
            int i = pst.executeUpdate();
            
            if (i==1) {
                f=true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
}
