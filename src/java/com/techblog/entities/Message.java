/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.entities;

/**
 *
 * @author NAVIN
 */
public class Message {
    private String content;
    private String type;
    private String bootClass;
    
    public Message(){
        
    }

   public Message(String content, String type, String bootClass) {
       this.content = content;
       this.type = type;
       this.bootClass = bootClass;
   }

    public String getContent() {
        return content;
    }

    public String getType() {
        return type;
    }

    public String getBootClass() {
        return bootClass;
    }
    
   public void setContent(String content) {
       this.content = content;
   }
   
   public void setType(String type) {
       this.type = type;
   }
   
   public void setBootClass(String bootClass) {
       this.bootClass = bootClass;
   }
    
}
