<%-- 
    Document   : register_page
    Created on : 11-Dec-2022, 2:37:18 pm
    Author     : NAVIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
    </head>
    <body class="primary-navbar">
        <%@include file="navbar.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="card col-md-4 offset-4" >
                    <div class="card-header text-center text-white primary-navbar">
                        <h2><span class="fa fa-user-plus"></span><br>Register</h2>
                    </div>
                    <div class="card-body">
                        <form id="register_form" action="Register_Servlet" method="POST">     
                            <div class="form-group"> 
                                <label for="username">User Name</label>
                                <input type="text" name="user_name" class="form-control" id="exampleInputUserName" aria-describedby="userName" placeholder="User name" required>

                            </div>

                            <div class="form-group"> 
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                            </div>

                            <div class="form-group">
                                <label for="gender">Gender</label><br>
                                <input type="radio" name="user_gender" value="male">male
                                <input type="radio" name="user_gender" value="female" >female
                            </div>

                            <div class="form-check">
                                <input type="checkbox" name="check_box" class="form-check-input" id="exampleCheck1">
                                <small> <label class="form-check-label" for="exampleCheck1">agree terms & conditons</label></small>
                            </div>
                            <button id="submit_btn" type="submit" class="btn btn-primary mt-2">Submit</button>
                            <h4 id="reg_success" style="color: green;display:none">Successfully Registered !</h4>
                            <a id="login_page_btn" class="btn btn-primary" style="display:none;" href="login_page.jsp">go to Login Page</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            $(document).ready(function(){
                console.log("loaded");
                $('#register_form').on('submit',function(event){
                    event.preventDefault();
                    let form = new FormData(this);
                    $.ajax({
                        url: "Register_Servlet",
                        type: 'POST',
                        data: form,
                        success:function(data,textStatus,jqXHR) {
                           
                           if(data.trim()==="success") {
                              swal("Successfully registered", "redirecting to login page").then((value)=>{window.location="login_page.jsp"});
                           }else{
                               alert(data);
                           }
                        },
                        error:function(jqXHR,textStatus,errorThrown) {
                            alert(jqXHR);
                        },
                        processData:false,
                        contentType:false
                    });
                        
                    
                });
            });
        </script>
            
    </body>
</html>
