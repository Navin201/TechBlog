<%-- 
    Document   : index
    Created on : 10-Dec-2022, 1:21:37 pm
    Author     : NAVIN
--%>

<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
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
                        <a class="nav-link" href="login_page.jsp"><span class="fa fa-user-circle"></span>Login</a>
                    </li>
                     <li class="nav-item">
                         <a class="nav-link" href="register_page.jsp"><span class="fa fa-user-plus"></span>Signup</a>
                    </li>
                </ul>
                
            </div>
        </nav>

        <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary-navbar text-white">
                <div class="container">
                    <h1 class="display-3">Welcome to Techblog</h1>
                    <h5>Technology is best when it brings people together.</h5>
                    <h5>Become a part of tech community, Learn for free !</h5>
                    <br>
                    <a href="register_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle"></span>Register</a>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle"></span>Login</a>

                </div>
            </div>    
        </div>

        <!<!-- Cards -->
        <div class="container mb-2">
            <div class="row">
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Learn latest technologies related to Java environment for free</p>
                            <a href="register_page.jsp" class="btn btn-primary">learn more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Python</h5>
                            <p class="card-text">Hot trend! learn Data Science and AI through python </p>
                            <a href="register_page.jsp" class="btn btn-primary">learn more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Web Technologies</h5>
                            <p class="card-text">Be the best web developer by learning new web skills for free</p>
                            <a href="register_page.jsp" class="btn btn-primary">learn more</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!--cards2-->
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Android development</h5>
                            <p class="card-text">Learn android development and make trending android apps </p>
                            <a href="register_page.jsp" class="btn btn-primary">learn more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Database Technologies</h5>
                            <p class="card-text">Data is required everywhere, learn and start earning</p>
                            <a href="register_page.jsp" class="btn btn-primary">learn more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">UI development</h5>
                            <p class="card-text">Make beautiful ui by learning latest technologies</p>
                            <a href="register_page.jsp" class="btn btn-primary">learn more</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


    </body>

</html>
