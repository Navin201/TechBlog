/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.dao;

import com.techblog.helper.Categories;
import com.techblog.helper.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author NAVIN
 */
public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Categories> getAllCategories() {
        ArrayList<Categories> catList = new ArrayList<>();
        try {
            String q = "select*from category";
            Statement st = con.createStatement();
            ResultSet set = st.executeQuery(q);

            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Categories c = new Categories(cid, name, description);
                catList.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return catList;
    }

    public boolean addPost(Post p) {
        boolean f = false;

        try {
            String q = "insert into posts(title,content,code,cid,userid) values(?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1,p.getTitle());
            pstmt.setString(2, p.getContent());
            pstmt.setString(3, p.getCode());
            pstmt.setInt(4, p.getCid());
            pstmt.setInt(5, p.getUserid());
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
    
    
    public ArrayList<Post> getAllPosts() {
        ArrayList<Post> p = new ArrayList<>();
        
        try{
        PreparedStatement ps = con.prepareStatement("select*from posts");
        
        ResultSet st = ps.executeQuery();
        
        while(st.next()) {
            int pid = st.getInt("pid");
            String title = st.getString("title");
            String content = st.getString("content");
            String code = st.getString("code");
            Timestamp date = st.getTimestamp("date");
            int cid = st.getInt("cid");
            int userid = st.getInt("userid");
            Post post = new Post(pid,title,content,code, date,cid,userid);
            p.add(post);
        }
        
        }catch(Exception e) {
            e.printStackTrace();
        }   
        
        return p;
    }
    
    public ArrayList<Post> getPostById(int catid) {
        ArrayList<Post> p = new ArrayList<>();
        
        try{
        PreparedStatement ps = con.prepareStatement("select*from posts where cid=?");
        ps.setInt(1, catid);
        ResultSet st = ps.executeQuery();
        
        while(st.next()) {
            int pid = st.getInt("pid");
            String title = st.getString("title");
            String content = st.getString("content");
            String code = st.getString("code");
            Timestamp date = st.getTimestamp("date");
            int userid = st.getInt("userid");
            Post post = new Post(pid,title,content,code, date,catid,userid);
            p.add(post);
        }
        
        }catch(Exception e) {
            e.printStackTrace();
        }   
        
        return p;
        
    }
    
    
    public Post getPostBypid(int pid) {
        
        String query = "select * from posts where pid=?";
        Post p=null;
        
        try{
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, pid);
        ResultSet set = ps.executeQuery();
        
        while(set.next()) {
            String pTitle = set.getString("title");
            String pContent = set.getString("content");
            String pCode = set.getString("code");
            Timestamp ts = set.getTimestamp("date");
            int catId = set.getInt("cid");
            int uid = set.getInt("userid");
            p = new Post(pTitle, pContent, pCode, ts, catId, uid);
        }
        
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return p;
    }
}


