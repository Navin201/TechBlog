<%-- 
    Document   : allpost
    Created on : 16-Dec-2022, 7:53:44 pm
    Author     : NAVIN
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.helper.Post"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container row">
<% 
    PostDao pd = new PostDao(ConnectionProvider.getConnection());
    ArrayList<Post> pp = null;
    int catid = Integer.parseInt(request.getParameter("cid"));
    if(catid==0) {
        pp = pd.getAllPosts();
    }else{
        pp = pd.getPostById(catid);
    }
    for(Post ptemp:pp) {
    %>
    
    <div class="col-md-6">
        <div class="card">
            <div class="card-body">
                <h4><%=ptemp.getTitle()%></h4><br>
              <!-- comment -->
                
            </div>
            <div class="card-footer primary-navbar text-center">
                <a href="showpost.jsp?post_id=<%=ptemp.getPid()  %>" class="btn btn-outline-light btn-sm">Read more</a>
                
            </div>
                
    </div>
                <br>
    </div>
    
    <%
    
    }
        if(pp.size()==0) {
        out.println("<h3 class='display-3 text-center'>No posts in this category.</h3>");
}

%>
</div>

