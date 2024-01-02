/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.enotes.dao;

import com.enotes.user.UserDetails;
import java.sql.*;

public class UserDAO {
    
    private Connection con;
    public UserDAO(Connection con){
        super();
        this.con = con;
    }
    
    public boolean addUser(UserDetails user){
        boolean f = false;
        try {
            String query = "insert into user(name, email, password) values(?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getPassword());
            int i = pst.executeUpdate();
            
            if(i==1) f=true;
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return f;
    }
    public UserDetails loginUser(UserDetails us){
        
        UserDetails user = null;
        try {
            String query = "select * from user where email=? and password=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, us.getEmail());
            pst.setString(2, us.getPassword());
            ResultSet rs = pst.executeQuery();
            
            if(rs.next()){
                user = new UserDetails();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return user;
    }
    
    
}
