/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author NAVIN
 */
public class LikeDao {
    
    Connection con;
    
    public LikeDao(Connection con) {
        this.con = con;
    }
    
    public boolean insertLike(int pid, int uid) {
        String query = "insert into likes(pid,uid) values(?,?)";
        boolean f=false;
        
        try{
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            pstmt.executeUpdate();
            f=true;

        }catch(Exception e) {
            e.printStackTrace();
        }
  
        return f; 
    }
    
    
    public int likeCount(int pid) {
        String query = "select count(*)from likes where pid=?";
        int count = 0;
        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, pid);
            ResultSet set = ps.executeQuery();
            while(set.next()) {
                count = set.getInt("count(*)");
            }
            
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return count;
    }
    
    public boolean isLiked(int pid, int uid) {
        String query = "select * from likes where pid=? and uid=?";
        boolean f= false;
        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ResultSet set = ps.executeQuery();
            if(set.next()) {
                f=true;
            }
            
            
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    public boolean dislike(int pid, int uid) {
        String query = "delete from likes where pid=? and uid=?";
        boolean f = false;
        try{
             PreparedStatement ps = con.prepareStatement(query);
             ps.setInt(1, pid);
             ps.setInt(2, uid);
             ps.executeUpdate();
             f = true;
            
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
}
