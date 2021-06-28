<%@page import="com.javaProject.helper.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 86%, 65% 100%, 29% 89%, 0 100%, 0 0);
            }
        </style>
    </head>
    <body>
<!--        <h1>Hello World!</h1>
        < % 
        Connection con=ConnectionProvider.getConnection();
        
        %>
        <h1>< %= con %></h1>
        -->
        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>
        
        <!--banner-->
        <div class="container-fluid p-0 m-0">
            
            <div class="jumbotron primary-background-cl text-white p-5 banner-background">
            
                <div class="container">
                
                    <h1 class="display-3">Welcome !!</h1>
                    <p>A programming language is a formal language comprising a set of strings that produce various kinds of machine code output. Programming languages are used in computer programming to implement algorithms.</p>
                    <br>
                    <button class="btn btn-outline-light btn-lg"><span class="fa fa-external-link"></span>Start, its Free</button>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span>Login</a>
               
                    <br>
                </div>
            </div>
        </div>
        <br>
        <!--card-->
        <div class="container">
            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card">
                        
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn primary-background-cl text-white">Read more</a>
                        </div>
                      </div>
                    
                </div>
                <div class="col-md-4">
                    <div class="card">
                        
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn primary-background-cl text-white">Read more</a>
                        </div>
                      </div>
                    
                </div>
                <div class="col-md-4">
                    <div class="card">
                        
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn primary-background-cl text-white">Read more</a>
                        </div>
                      </div>
                    
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn primary-background-cl text-white">Read more</a>
                        </div>
                      </div>
                    
                </div>
                <div class="col-md-4">
                    <div class="card">
                        
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn primary-background-cl text-white">Read more</a>
                        </div>
                      </div>
                    
                </div>
                <div class="col-md-4">
                    <div class="card">
                        
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn primary-background-cl text-white">Read more</a>
                        </div>
                      </div>
                    
                </div>
            </div>
            
        </div>
        <!--javascripts-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
//            $(document).ready(function(){
//                alert("document loaded")
//            })
        </script>
    </body>
</html>
