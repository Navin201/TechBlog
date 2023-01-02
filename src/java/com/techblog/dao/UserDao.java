/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.dao;

import com.techblog.helper.User;
import java.sql.*;

public class UserDao {

    private Connection con;
    boolean f = false;

    public UserDao(Connection con) {
        this.con = con;
    }

    public boolean saveUser(User user) {
        try {
            String query = "insert into user(name,email,password,gender) values(?,?,?,?);";

            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public User getUserEmailAndPassword(String email, String password) {
        User user=null;
        
        try{
            
            String query = "select * from user where email=? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet set = pstmt.executeQuery();
            
            if(set.next()) {
                user = new User();
                String name = set.getString("name");
                user.setName(name);
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setDatetime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
                
            }  
        }catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    
    public boolean UpdateUser(User user) {
        boolean flag = false;
        try {
        String q = "update user set name=?, email=?, password=? where id=?";
        PreparedStatement p = con.prepareStatement(q);
        p.setString(1, user.getName());
        p.setString(2, user.getEmail());
        p.setString(3, user.getPassword());
        p.setInt(4, user.getId());
           p.executeUpdate();
        flag = true;
        
        }catch(Exception e){
            e.printStackTrace();
        }
      return flag;
    }
    
    public User getUserByuserid(int uid) {
        User user = null;
        String query = "select*from user where id=?";
        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, uid);
            ResultSet set = ps.executeQuery();
            
            while(set.next()) {
                user = new User();
                String name = set.getString("name");
                user.setName(name);
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setDatetime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }
            
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        
        
        return user;
    }
    
}
