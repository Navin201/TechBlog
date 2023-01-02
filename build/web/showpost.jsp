
<%@page import="com.techblog.dao.UserDao"%>
<%@page import="com.techblog.entities.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.helper.Categories"%>
<%@page import="com.techblog.helper.Post"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="com.techblog.helper.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }

%>




<%    int post_id = Integer.parseInt(request.getParameter("post_id"));
    PostDao postdao = new PostDao(ConnectionProvider.getConnection());
    Post pt = postdao.getPostBypid(post_id);
%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=pt.getTitle()%></title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <style>
            body{
                background: url(images/blogbg.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark primary-navbar">
            <a class="navbar-brand" href="index.jsp">TechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming language</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">DSA</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"  href="#">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" data-target="#postModal" href="#"><span class="fa fa-pencil-square-o"></span>Post</a>
                    </li>

                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#profileModal"><span class="fa fa-user-circle"></span><%=user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Logout_Servlet"><span class="fa fa-user-circle"></span>Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

        <%
            Message msg = (Message) session.getAttribute("updateMessage");
            if (msg != null) {
        %>
        <div class="alert <%= msg.getBootClass()%>">
            <%=msg.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");
            }
        %>



        <!-- end of all post gird -->


        <!-- modal for post -->

        <div class="modal fade" id="postModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header text-center primary-navbar">
                        <h5 class="modal-title text-white" id="exampleModalLabel">Add a new post</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="Post_Servlet" id="postForm" method="POST">
                            <div class="form-group">
                                Select Category: <select name="postCategory" class="form-control">
                                    <option selected disabled>---select Category---</option>
                                    <%
                                        PostDao p = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Categories> l = p.getAllCategories();
                                        for (Categories c : l) {
                                    %>
                                    <option value="<%=c.getCid()%>"><%=c.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                Title: <input type="text" class="form-control" name="postTitle" placeholder="enter title here">
                            </div>
                            <div class="form-group">
                                Content: <textarea name="postContent" class="form-control" style="height:150px;"></textarea>
                            </div>
                            <div class="form-group">
                                Code: <textarea name="postCode" class="form-control" style="height:150px;" placeholder="enter code here"></textarea>
                            </div>
                            <div class="container text-center">
                                <button  type="submit" class="btn btn-primary">Add Post</button>
                            </div>
                        </form>
                    </div>


                </div>
            </div>
        </div>
        <!<!-- end of modal post -->


        <!-- Modal -->
        <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body text-center">
                        <div>
                            <h3><%= user.getName()%></h3>
                        </div>
                        <div id="user_details">
                            <table class="table">

                                <tbody>
                                    <tr>
                                        <th scope="row">User ID :</th>
                                        <td><%=user.getId()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">User Email :</th>
                                        <td><%=user.getEmail()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">User Gender :</th>
                                        <td><%= user.getGender()%></td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <form action="EditProfile_Servlet" method="POST">
                            <div id="user_edit" style="display:none" class="mt-2">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">User ID :</th>
                                            <td><%=user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">User Name :</th>
                                            <td><input type="text" class="form-control" name="editName" value="<%=user.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">User Email :</th>
                                            <td><input type="email"class="form-control" name="editEmail" value="<%=user.getEmail()%>"></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Password:</th>
                                            <td><input type="password" class="form-control" name="editPassword" value="<%= user.getPassword()%>"></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="container">
                                    <button type="submit" class="btn btn-info">Save</button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit_button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>


        <!--full post card start  -->
        <div class="container">
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header primary-navbar text-white">
                            <h3 style="font-weight:200;font-size: 30px;"><%= pt.getTitle()%></h3>
                        </div>
                        <div class="card-body">

                            <p style="font-weight:200;font-size: 20px;"><%= pt.getContent()%></p>
                            <br><!-- comment -->
                            <br>
                            <pre style="font-weight:50;font-size: 20px;"><%= pt.getCode()%></pre>
                            <br><!-- comment -->
                            <div class="posted-by">
                                <%
                                    UserDao ud = new UserDao(ConnectionProvider.getConnection());
                                    User ui = ud.getUserByuserid(pt.getUserid());


                                %>
                                <i>posted by: </i><a href="#"><%= ui.getName()%></a>
                            </div>

                        </div>
                        <div class="card-footer primary-navbar">
                            <%  
                                Post po = new Post();
                            
                            
                            %>
                            

                        </div>
                    </div>
                </div>
            </div>















            <!--<!-- javascript -->
            <script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script src="JS/myjs.js" type="text/javascript"></script>
            <script>
                $(document).ready(function () {
                    let btnToggle = false;
                    $('#edit_button').click(function () {

                        if (btnToggle === false) {
                            $("#user_details").hide();
                            $("#user_edit").show();
                            btnToggle = true;
                        } else {
                            $("#user_details").show();
                            $("#user_edit").hide();
                            btnToggle = false;
                        }

                    });
                });


            </script>
    </body>
</html>
