/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.helper;

import java.sql.Timestamp;

/**
 *
 * @author NAVIN
 */
public class Post {
    private int pid;
    private String title;
    private String content;
    private String code;
    private Timestamp date;
    private int cid;
    private int userid;
    
    public Post() {
        
    }

    public Post(int pid, String title, String content, String code, Timestamp date, int cid, int userid) {
        this.pid = pid;
        this.title = title;
        this.content = content;
        this.code = code;
        this.date = date;
        this.cid = cid;
        this.userid = userid;
    }

    public Post(String title, String content, String code, Timestamp date, int cid, int userid) {
        this.title = title;
        this.content = content;
        this.code = code;
        this.date = date;
        this.cid = cid;
        this.userid = userid;
        
    }

    public Post(String title, String content, Timestamp date, int cid) {
        this.title = title;
        this.content = content;
        this.date = date;
        this.cid = cid;
    }

    public Post(int pid, String title, String content, Timestamp date, int cid) {
        this.pid = pid;
        this.title = title;
        this.content = content;
        this.date = date;
        this.cid = cid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }
    
    
}
