<%-- 
    Document   : error_page
    Created on : 13-Dec-2022, 1:59:42 pm
    Author     : NAVIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>error</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="container text-center">
            <img src="images/error.png" class="img-fluid">
            <h2>OOPS ! Something went wrong.</h2>
            <h4><%= exception%></h4>
            <a href="index.jsp" class="btn btn-primary">Home</a>
            
        </div>
    </body>
</html>
